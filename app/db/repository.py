async def save_cars(pool, cars: list[dict]):
    async with pool.acquire() as conn:
        await conn.executemany(
            """
            INSERT INTO info_cars (
                url, title, price_usd, odometer, username,
                phone_number, image_url, images_count,
                car_number, car_vin
            ) VALUES (
                $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
            )
            ON CONFLICT (url) DO NOTHING
            """,
            [
                (
                    c["url"],
                    c["title"],
                    c["price_usd"],
                    c["odometer"],
                    c["username"],
                    c["phone_number"],
                    c["image_url"],
                    c["images_count"],
                    c["car_number"],
                    c["car_vin"]
                )
                for c in cars
            ]
        )
