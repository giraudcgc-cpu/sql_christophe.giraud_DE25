/* ==============
   Query the data
==============*/

-- overview of data
DESC;

DESC staging.joined_table;

--select all or some columns
SELECT * FROM staging.joined_tables;

SELECT 
    order_date,
    customer_first_name,
    customer_last_name,
    product_name
FROM staging.joined_table

-- filter rows with WHERE clause
SELECT 
    order_date,
    customer_first_name,
    customer_last_name,
    product_name
FROM staging.joined_table
WHERE customer_first_name = 'Marvin';

-- create a new table to show order status
CREATE TABLE IF NOT EXISTS staging.status (
    order_status INTEGER, 
    order_status_description VARCHAR
);

SELECT * FROM staging.status;


INSERT INTO 
    staging.status
VALUES
    (1, 'Pending'), 
    (2, 'Processing'), 
    (3, 'Rejected'), 
    (4, 'Completed');

-- sort the rows by order_satus
-- ORDER BY ...ASC or DESC

SELECT
  j.order_id,
  j.order_status,
  s.order_status_description
FROM staging.joined_table j
-- now joinging with picking up left and right columns
JOIN staging.status s ON j.order_status = s.order_status
-- ORDER BY j.order_status DESC;
ORDER BY j.order_status ASC;

/* ============================
   investigate unique customers
 ==============================*/

--DISTINCT
SELECT DISTINCT order_id
FROM staging.joined_table
ORDER BY order_id ASC;

--find unique cust
SELECT DISTINCT customer_id
FROM staging.joined_table
ORDER BY customer_id ASC;

--- finding a cust, one way

SELECT 
customer_id,
customer_first_name,
customer_last_name,
customer_city
FROM staging.joined_table
WHERE customer_first_name = 'Justina' AND customer_last_name = 'Jenkins';

/*============================
  Introduction to aggregation
  ============================ */

-- aggregate over rows
-- there are diff ways of aggregation 

-- here we do the summa and round the result
SELECT 
ROUND(SUM(quantity*list_price)) AS total_revenue
FROM staging.joined_table;

-- try out rother aggreagte functions
SELECT
ROUND(MIN(quantity+list_price)) AS min_revenue,
ROUND(MAX(quantity+list_price)) AS max_revenue
FROM staging.joined_table;

/*===============
  CASE... WHEN
==================*/

-- similar to if..else in other languages
-- we can replaec the order_status column to some descriptions

SELECT 
order_id,
product_name,
-- below we write CASE...END
CASE order_status
  WHEN 1 THEN 'Pending'
  WHEN 2 THEN 'Porcessing'
  WHEN 3 THEN 'Rejected'
  WHEN 4 THEN 'Completed'
END AS order_status_description
FROM staging.joined_table;


