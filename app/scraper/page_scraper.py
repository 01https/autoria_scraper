from bs4 import BeautifulSoup


def parse_car_urls(html: str) -> list[str]:
    soup = BeautifulSoup(html, "lxml")
    urls = []

    for a in soup.select("a[href]"):
        href = a["href"]
        if "/auto_" in href and href.endswith(".html"):
            if href.startswith("/"):
                href = "https://auto.ria.com" + href
            if href not in urls:
                urls.append(href)

    return urls


def parse_next_page(html: str, current_url: str) -> str | None:
    soup = BeautifulSoup(html, "lxml")

    next_link = soup.select_one('a[rel="next"]')
    if next_link and next_link.get("href"):
        href = next_link["href"]
        if href.startswith("/"):
            return "https://auto.ria.com" + href
        return href

    pagination = soup.select("a.page-link, a[class*='pagination']")
    found_active = False
    for link in pagination:
        if "active" in link.get("class", []) or link.get("aria-current"):
            found_active = True
            continue
        if found_active:
            href = link.get("href", "")
            if href.startswith("/"):
                return "https://auto.ria.com" + href
            if href:
                return href

    return None
