import asyncpg

from config import settings


async def create_pool():
    return await asyncpg.create_pool(settings.DATABASE_URL)


async def init_db(pool):
    with open("db/schema.sql") as t:
        schema = t.read()
    async with pool.acquire() as conn:
        await conn.execute(schema)
