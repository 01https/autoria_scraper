import asyncio
import logging
import aiohttp
import asyncpg
import random

from config import settings
from .page_scraper import parse_car_urls, parse_next_page
from .car_scraper import parse_car, HEADERS
from db.repository import save_cars

logger = logging.getLogger(__name__)


async def fetch_html(
    session: aiohttp.ClientSession,
    url: str,
    semaphore: asyncio.Semaphore,
    retries: int = 3
) -> str | None:
    """Fetch a URL and return HTML, respecting the semaphore."""
    async with semaphore:
        for attempt in range(1, retries + 1):
            try:
                async with session.get(
                    url,
                    headers=HEADERS,
                    timeout=aiohttp.ClientTimeout(total=15),
                ) as resp:

                    if resp.status == 200:
                        raw = await resp.read()
                        return raw.decode("utf-8", errors="ignore")

                    if resp.status == 429:
                        wait_time = (2 ** attempt) + random.uniform(0.3, 1.0)
                        logger.warning(
                            "429 Too Many Requests for %s. Retry %s/%s in %.2fs",
                            url, attempt, retries, wait_time
                        )
                        await asyncio.sleep(wait_time)
                        continue

                    logger.warning(
                        "HTTP %s for %s (attempt %s/%s)",
                        resp.status, url, attempt, retries
                    )

            except asyncio.TimeoutError:
                logger.warning(
                    "Timeout fetching %s (attempt %s/%s)",
                    url, attempt, retries
                )

            except Exception as e:
                logger.warning(
                    "Error fetching %s (attempt %s/%s): %s",
                    url, attempt, retries, e
                )

            wait_time = (2 ** attempt) + random.uniform(0.2, 0.8)
            await asyncio.sleep(wait_time)

        logger.error("Failed to fetch %s after %s attempts", url, retries)
        return None


async def scrape_cars_batch(
    session: aiohttp.ClientSession,
    urls: list[str],
    semaphore: asyncio.Semaphore,
) -> list[dict]:
    async def process_one(url: str) -> dict | None:
        html = await fetch_html(session, url, semaphore)
        if not html:
            return None
        return await parse_car(session, url, html)

    results = await asyncio.gather(*[process_one(url) for url in urls], return_exceptions=True)

    cars = []
    for r in results:
        if isinstance(r, Exception):
            logger.error("Unexpected error during car scrape: %s", r)
        elif r is not None:
            cars.append(r)
    return cars


async def run_scraper(pool: asyncpg.Pool) -> None:
    semaphore = asyncio.Semaphore(settings.CONCURRENT_REQUESTS)
    total_saved = 0
    current_url = settings.START_URL

    connector = aiohttp.TCPConnector(limit=settings.CONCURRENT_REQUESTS)
    async with aiohttp.ClientSession(connector=connector) as session:

        page_num = 1
        while current_url:
            logger.info("Scraping listing page %d: %s", page_num, current_url)

            html = await fetch_html(session, current_url, semaphore)
            if not html:
                logger.error("Failed to fetch listing page %d, stopping.", page_num)
                break

            car_urls = parse_car_urls(html)
            logger.info("Found %d car URLs on page %d", len(car_urls), page_num)

            if not car_urls:
                logger.warning("No car URLs found on page %d, stopping.", page_num)
                break

            for i in range(0, len(car_urls), settings.BATCH_SIZE):
                batch = car_urls[i:i + settings.BATCH_SIZE]
                cars = await scrape_cars_batch(session, batch, semaphore)
                if cars:
                    saved = await save_cars(pool, cars)
                    total_saved += saved
                    logger.info(
                        "Batch %d-%d: scraped %d, saved %d new",
                        i + 1, i + len(batch), len(cars), saved,
                    )

            next_url = parse_next_page(html, current_url)
            if next_url == current_url:
                logger.warning("Next page same as current, stopping to avoid loop.")
                break
            current_url = next_url
            page_num += 1

    logger.info("Scrape complete. Total new records saved: %d", total_saved)
