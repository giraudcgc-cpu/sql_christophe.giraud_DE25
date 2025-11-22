-- will divide into schema here
CREATE SCHEMA IF NOT EXISTS staging;
-- staging is the landing zone of the data
-- Then we will have a refined layer where we do the transformation of the data

-- Below is the landing zone
CREATE TABLE IF NOT EXISTS staging.sql_glossary AS
SELECT * FROM read_csv_auto('data/sql_terms.csv')