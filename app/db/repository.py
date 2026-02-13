async def save_cars(pool, cars: list[dict]) -> int:
    if not cars:
        return 0

    urls = []
    titles = []
    prices = []
    odometers = []
    usernames = []
    phones = []
    image_urls = []
    images_counts = []
    car_numbers = []
    car_vins = []

    for car in cars:
        urls.append(car.get("url"))
        titles.append(car.get("title"))
        prices.append(car.get("price_usd"))
        odometers.append(car.get("odometer"))
        usernames.append(car.get("username"))
        phones.append(car.get("phone_number"))
        image_urls.append(car.get("image_url"))
        images_counts.append(car.get("images_count"))
        car_numbers.append(car.get("car_number"))
        car_vins.append(car.get("car_vin"))

    async with pool.acquire() as conn:
        result = await conn.fetch(
            """
            INSERT INTO info_cars (
                url, title, price_usd, odometer, username,
                phone_number, image_url, images_count,
                car_number, car_vin
            )
            SELECT * FROM UNNEST(
                $1::text[],
                $2::text[],
                $3::float8[],
                $4::int[],
                $5::text[],
                $6::bigint[],
                $7::text[],
                $8::int[],
                $9::text[],
                $10::text[]
            )
            ON CONFLICT (url) DO NOTHING
            RETURNING url
            """,
            urls,
            titles,
            prices,
            odometers,
            usernames,
            phones,
            image_urls,
            images_counts,
            car_numbers,
            car_vins,
        )

    return len(result)
