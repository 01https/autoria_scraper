import asyncio
import logging
import os
from datetime import datetime

logger = logging.getLogger(__name__)

DUMPS_DIR = "dumps"


async def make_dump(database_url: str) -> None:
    """Create a PostgreSQL dump file using pg_dump."""
    os.makedirs(DUMPS_DIR, exist_ok=True)

    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = f"{DUMPS_DIR}/autoria_{timestamp}.sql"

    import urllib.parse
    parsed = urllib.parse.urlparse(database_url)

    env = os.environ.copy()
    env["PGPASSWORD"] = parsed.password or ""

    cmd = [
        "pg_dump",
        "-h", parsed.hostname,
        "-p", str(parsed.port or 5432),
        "-U", parsed.username,
        "-d", parsed.path.lstrip("/"),
        "-f", filename,
        "--no-owner",
        "--no-acl",
    ]

    logger.info("Starting DB dump to %s", filename)

    proc = await asyncio.create_subprocess_exec(
        *cmd,
        env=env,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE,
    )
    stdout, stderr = await proc.communicate()

    if proc.returncode != 0:
        logger.error(
            "pg_dump failed (code %d): %s",
            proc.returncode,
            stderr.decode().strip(),
        )
    else:
        logger.info("DB dump saved to %s", filename)
