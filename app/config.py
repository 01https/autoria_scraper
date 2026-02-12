from dataclasses import dataclass
from dotenv import load_dotenv
import os

load_dotenv()

@dataclass
class Settings:
    DATABASE_URL: str = os.getenv("DATABASE_URL")
    START_URL: str = os.getenv("START_URL")
    SCRAPE_TIME: str = os.getenv("SCRAPE_TIME", "12:00")
    DUMP_TIME: str = os.getenv("DUMP_TIME", "12:05")
    CONCURRENT_REQUESTS: int = int(os.getenv("CONCURRENT_REQUESTS", 30))
    BATCH_SIZE: int = int(os.getenv("BATCH_SIZE", 10))

settings = Settings()