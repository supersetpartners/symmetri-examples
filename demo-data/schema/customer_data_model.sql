DROP TABLE IF EXISTS DATA_PROVIDER_USER_SEGMENT_MAP;
DROP TABLE IF EXISTS DATA_PROVIDER_SEGMENTS;
DROP TABLE IF EXISTS DATA_PROVIDERS;
DROP TABLE IF EXISTS WEBSITE_EVENTS;
DROP TABLE IF EXISTS SALES_LINE_ITEMS;
DROP TABLE IF EXISTS SALES_TRANSACTIONS;
DROP TABLE IF EXISTS CRM_USERS;

-- Create CRM_USERS table
CREATE OR REPLACE TABLE CRM_USERS (
    user_email_sha256 STRING PRIMARY KEY,
    registration_date TIMESTAMP_NTZ(9),
    first_name STRING,
    last_name STRING,
    birth_date DATE,
    gender STRING,
    country STRING,
    city STRING,
    postal_code STRING,
    marketing_consent BOOLEAN,
    loyalty_tier STRING,
    loyalty_points INTEGER,
    email_engagement_score DECIMAL(10,2),
    last_login_date TIMESTAMP_NTZ(9)
);

-- Create SALES_TRANSACTIONS table
CREATE OR REPLACE TABLE SALES_TRANSACTIONS (
    transaction_id INT NOT NULL PRIMARY KEY,
    user_email_sha256 STRING,
    transaction_timestamp TIMESTAMP_NTZ(9),
    total_amount DECIMAL(18,2),
    currency STRING,
    payment_method STRING,
    store_id STRING,
    channel STRING
);

-- Create SALES_LINE_ITEMS table
CREATE OR REPLACE TABLE SALES_LINE_ITEMS (
    line_item_id INT NOT NULL PRIMARY KEY,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    product_brand STRING,
    product_category STRING,
    product_type STRING,
    product_name STRING,
    quantity INTEGER,
    unit_price DECIMAL(18,2),
    discount_amount DECIMAL(18,2),
    total_line_amount DECIMAL(18,2)
);

CREATE OR REPLACE TABLE WEBSITE_PAGE_VIEWS (
    user_email_sha256 STRING,
    event_timestamp TIMESTAMP_NTZ(9),
    website STRING,
    page_category STRING,
    page_url STRING,
    device_type STRING,
    browser STRING,
    time_on_page INTEGER
);

CREATE OR REPLACE TABLE THIRD_PARTY_SEGMENTS (
    id INT NOT NULL PRIMARY KEY,
    segment_type STRING,
    segment_category STRING,
    segment_name STRING
);

CREATE OR REPLACE TABLE THIRD_PARTY_USER_SEGMENT_MAP (
    segment_id INT NOT NULL,
    user_email_sha256 STRING,
    PRIMARY KEY (segment_id, user_email_sha256)
);
