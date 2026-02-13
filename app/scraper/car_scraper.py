import re
import logging
from bs4 import BeautifulSoup
import aiohttp

logger = logging.getLogger(__name__)

PHONE_API_URL = "https://auto.ria.com/bff/final-page/public/auto/popUp/"

HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) "
        "Chrome/120.0.0.0 Safari/537.36"
    ),
    "Accept": "application/json, text/plain, */*",
    "Accept-Language": "uk-UA,uk;q=0.9",
    "Referer": "https://auto.ria.com/",
}


def _extract_auto_id(url: str) -> int | None:
    match = re.search(r"_(\d+)\.html", url)
    return int(match.group(1)) if match else None


def _extract_phone_params(html: str) -> tuple[str | None, str | None]:
    match = re.search(
        r'\["userId","(\d+)"\].*?\["phoneId","(\d+)"\]', html
    )
    if match:
        return match.group(1), match.group(2)

    uid = re.search(r'"userId"\s*[":,]+\s*"?(\d+)"?', html)
    pid = re.search(r'"phoneId"\s*[":,]+\s*"?(\d+)"?', html)
    if uid and pid:
        return uid.group(1), pid.group(1)

    return None, None


def _parse_title(soup: BeautifulSoup) -> str | None:
    tag = soup.select_one("h1")
    return tag.get_text(strip=True) if tag else None


def _parse_price(soup: BeautifulSoup) -> float | None:
    for tag in soup.select("strong"):
        text = tag.get_text(strip=True)
        if "$" in text:
            digits = re.sub(r"[^\d.]", "", text.replace("\xa0", ""))
            try:
                return float(digits)
            except ValueError:
                pass
    return None


def _parse_odometer(soup: BeautifulSoup) -> int | None:
    for tag in soup.select("span"):
        text = tag.get_text(strip=True)
        match = re.match(r"(\d+)\s*тис\.\s*км", text)
        if match:
            return int(match.group(1)) * 1000
        match = re.match(r"(\d[\d\s]+)\s*км$", text)
        if match:
            digits = re.sub(r"\s+", "", match.group(1))
            return int(digits)
    return None


def _parse_username(html: str) -> str | None:
    match = re.search(r'\["userName","([^"]+)"\]', html)
    return match.group(1) if match else None


def _parse_image_url(soup: BeautifulSoup) -> str | None:
    for tag in soup.select("picture img"):
        src = tag.get("src") or tag.get("data-src") or ""
        if "photosnew" in src:
            return src
    return None


def _parse_images_count(html: str, soup: BeautifulSoup) -> int | None:
    tag = soup.select_one(
        "span.common-badge.alpha.medium span:nth-of-type(2)"
    )

    if not tag:
        return None

    text = tag.get_text(strip=True)

    digits = re.sub(r"\D", "", text)
    return int(digits) if digits else None


def _parse_car_number(soup: BeautifulSoup) -> str | None:
    for tag in soup.select("span"):
        text = tag.get_text(strip=True)
        if re.match(r"^[A-ZА-ЯІ]{2}\s*\d{4}\s*[A-ZА-ЯІ]{2}$", text):
            return text
    return None


def _parse_car_vin(soup: BeautifulSoup) -> str | None:
    tag = soup.select_one("span[class*='badge']")
    if tag:
        text = tag.get_text(strip=True)
        if re.match(r"^[A-HJ-NPR-Z0-9]{17}$", text, re.IGNORECASE):
            return text

    for tag in soup.select("span"):
        text = tag.get_text(strip=True)
        if re.match(r"^[A-HJ-NPR-Z0-9]{17}$", text, re.IGNORECASE):
            return text
    return None


async def fetch_phone(
    session: aiohttp.ClientSession,
    auto_id: int,
    user_id: str,
    phone_id: str,
) -> int | None:
    payload = {
        "autoId": auto_id,
        "blockId": "autoPhone",
        "popUpId": "autoPhone",
        "langId": 4,
        "device": "phone-web",
        "params": {
            "userId": user_id,
            "phoneId": phone_id,
        },
    }
    try:
        async with session.post(
            PHONE_API_URL, json=payload, headers=HEADERS, timeout=aiohttp.ClientTimeout(total=10)
        ) as resp:
            if resp.status != 200:
                logger.warning("Phone API returned %s for autoId=%s", resp.status, auto_id)
                return None
            data = await resp.json(content_type=None)

        phone_str = (data.get("additionalParams") or {}).get("phoneStr", "")
        if phone_str:
            digits = re.sub(r"\D", "", phone_str)

            if digits.startswith("380") and len(digits) == 12:
                pass
            elif digits.startswith("0") and len(digits) == 10:
                digits = "38" + digits
            elif len(digits) == 9:
                digits = "380" + digits
            else:
                return None

            if len(digits) != 12:
                return None

            return int(digits)

        for template in data.get("templates", []):
            params = (template.get("actionData") or {}).get("params") or {}
            if "phone" in params:
                digits = re.sub(r"\D", "", str(params["phone"]))
                if len(digits) == 9:
                    digits = "38" + digits
                return int(digits) if digits else None

    except Exception as e:
        logger.warning("Failed to fetch phone for autoId=%s: %s", auto_id, e)
    return None


async def parse_car(
    session: aiohttp.ClientSession,
    url: str,
    html: str,
) -> dict | None:
    soup = BeautifulSoup(html, "lxml")

    auto_id = _extract_auto_id(url)
    if not auto_id:
        logger.warning("Could not extract autoId from URL: %s", url)
        return None

    user_id, phone_id = _extract_phone_params(html)
    phone_number = None
    if user_id and phone_id:
        phone_number = await fetch_phone(session, auto_id, user_id, phone_id)
    else:
        logger.warning("Missing userId/phoneId for %s", url)

    return {
        "url": url,
        "title": _parse_title(soup),
        "price_usd": _parse_price(soup),
        "odometer": _parse_odometer(soup),
        "username": _parse_username(html),
        "phone_number": phone_number,
        "image_url": _parse_image_url(soup),
        "images_count": _parse_images_count(html, soup),
        "car_number": _parse_car_number(soup),
        "car_vin": _parse_car_vin(soup),
    }
