CREATE TABLE IF NOT EXISTS info_cars (
    id  SERIAL PRIMARY KEY,
    url TEXT UNIQUE NOT NULL,
    title TEXT,
    price_usd DECIMAL,
    odometer INTEGER,
    username TEXT,
    phone_number BIGINT,
    image_url TEXT,
    images_count INTEGER,
    car_number TEXT,
    car_vin TEXT,
    datetime_found TIMESTAMP DEFAULT NOW()
);