import asyncio
import logging
import sys
from zoneinfo import ZoneInfo

from apscheduler.schedulers.asyncio import AsyncIOScheduler
from apscheduler.triggers.cron import CronTrigger

from config import settings
from db.database import create_pool, init_db
from scheduler.jobs import scrape_job, dump_job

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    handlers=[logging.StreamHandler(sys.stdout)],
)
logger = logging.getLogger(__name__)


def _parse_time(time_str: str) -> tuple[int, int]:
    parts = time_str.strip().split(":")
    return int(parts[0]), int(parts[1])


async def main() -> None:
    logger.info("AutoRia scraper starting...")
    logger.info("Scrape time: %s | Dump time: %s", settings.SCRAPE_TIME, settings.DUMP_TIME)

    pool = await create_pool()
    await init_db(pool)

    logger.info("Database initialized.")

    scrape_hour, scrape_minute = _parse_time(settings.SCRAPE_TIME)
    dump_hour, dump_minute = _parse_time(settings.DUMP_TIME)

    scheduler = AsyncIOScheduler(timezone=ZoneInfo("Europe/Kyiv"))

    scheduler.add_job(
        scrape_job,
        trigger=CronTrigger(
            hour=scrape_hour,
            minute=scrape_minute,
            timezone=ZoneInfo("Europe/Kyiv")
            ),
        args=[pool],
        id="scrape",
        name="Daily AutoRia scrape",
        replace_existing=True,
    )

    scheduler.add_job(
        dump_job,
        trigger=CronTrigger(
            hour=dump_hour,
            minute=dump_minute,
            timezone=ZoneInfo("Europe/Kyiv")
            ),
        id="dump",
        name="Daily DB dump",
        replace_existing=True,
    )

    scheduler.start()
    logger.info(
        "Scheduler started. Scrape at %02d:%02d, dump at %02d:%02d (Europe/Kyiv).",
        scrape_hour, scrape_minute, dump_hour, dump_minute,
    )

    try:
        await asyncio.Event().wait()
    except (KeyboardInterrupt, SystemExit):
        logger.info("Shutting down...")
        scheduler.shutdown()
        await pool.close()


if __name__ == "__main__":
    asyncio.run(main())
