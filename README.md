# AutoRia Scraper

Async daily scraper for used cars from [auto.ria.com](https://auto.ria.com/uk/car/used/).  
Stores results in PostgreSQL, creates daily DB dumps, runs in Docker.

## Features

- Async scraping with `aiohttp` + `asyncio` (configurable concurrency)
- Phone number retrieval via AutoRia internal BFF API
- Deduplication via `ON CONFLICT (url) DO NOTHING`
- Daily schedule via `APScheduler` (no system cron needed)
- Daily `pg_dump` to `./dumps/`
- Full Docker Compose deployment

## Collected fields

| Field | Description |
|---|---|
| `url` | Car page URL (unique) |
| `title` | Car title (e.g. Ford Fusion 2019) |
| `price_usd` | Price in USD |
| `odometer` | Mileage in km |
| `username` | Seller name |
| `phone_number` | Seller phone (BIGINT, e.g. 380632134411) |
| `image_url` | Main photo URL |
| `images_count` | Total number of photos |
| `car_number` | License plate |
| `car_vin` | VIN code |
| `datetime_found` | Timestamp when first scraped |

## Quick start

```bash
# 1. Clone and configure
cp .env.example .env
# Edit .env if needed (times are UTC)

# 2. Run
docker compose up --build -d

# 3. View logs
docker compose logs -f scraper
```

## Configuration (.env)

| Variable | Default | Description |
|---|---|---|
| `START_URL` | `https://auto.ria.com/uk/car/used/` | Listing page to start from |
| `SCRAPE_TIME` | `12:00` | Daily scrape time (UTC, HH:MM) |
| `DUMP_TIME` | `12:00` | Daily dump time (UTC, HH:MM) |
| `CONCURRENT_REQUESTS` | `30` | Max parallel HTTP requests |
| `BATCH_SIZE` | `10` | Cars processed per DB batch |
| `DATABASE_URL` | `postgresql://...` | PostgreSQL connection string |

## DB dumps

Dumps are saved to `./dumps/autoria_YYYY-MM-DD_HH-MM-SS.sql`.  
The `dumps/` directory is mounted as a Docker volume — files persist on the host.

## Development (local Python)

```bash
# Start only the DB
docker compose up db -d

# Set local DATABASE_URL
export DATABASE_URL=postgresql://postgres:secret@localhost:5432/autoria

# Install deps and run
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
cd app && python main.py
```