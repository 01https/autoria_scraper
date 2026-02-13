import logging
import asyncpg

from scraper.scraper import run_scraper
from .dump import make_dump
from config import settings

logger = logging.getLogger(__name__)


async def scrape_job(pool: asyncpg.Pool) -> None:
    """APScheduler job: run the full scraper."""
    logger.info("=== Starting scheduled scrape job ===")
    try:
        await run_scraper(pool)
    except Exception as e:
        logger.exception("Scrape job failed: %s", e)
    logger.info("=== Scrape job finished ===")


async def dump_job() -> None:
    """APScheduler job: dump the database."""
    logger.info("=== Starting scheduled dump job ===")
    try:
        await make_dump(settings.DATABASE_URL)
    except Exception as e:
        logger.exception("Dump job failed: %s", e)
    logger.info("=== Dump job finished ===")
