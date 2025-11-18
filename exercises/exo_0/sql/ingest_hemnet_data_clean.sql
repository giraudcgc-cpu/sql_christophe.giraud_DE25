CREATE TABLE IF NOT EXISTS data_hemnet AS (
    SELECT
        *
    FROM read_csv_auto('data/hemnet_data_clean.csv')
);

