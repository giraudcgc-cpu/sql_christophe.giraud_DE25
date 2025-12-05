-- Debbie's corection - task2
-- find wrong email address
SELECT * FROM staging.old
WHERE NOT email LIKE '%@%.%';

--using regex for badmail@com..
SELECT * FROM staging.new
WHERE NOT regexp_matches(email,'[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]+'); 
--here we define the pattern. \ is important

-- combine all three conditions: region, email, status
SELECT * FROM staging.old
WHERE NOT regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') OR
      NOT region IN ('EU', 'US') OR
      NOT status IN ('active', 'inactive');

SELECT * FROM staging.new
WHERE NOT regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') OR
      NOT region IN ('EU', 'US') OR
      NOT status IN ('active', 'inactive');

-- task 3
CREATE SCHEMA IF NOT EXISTS constrained;

--below need to say where the table is created, can be several schemas, here it is in the main
CREATE TABLE IF NOT EXISTS constrained.crm_old (
    customer_id INTEGER UNIQUE, 
    name VARCHAR NOT NULL,
    email VARCHAR CHECK(email LIKE '%@%.%'),
    region VARCHAR CHECK(region in ('EU', 'US')),
    status VARCHAR CHECK(status IN ('active', 'inactive'))
);

-- for new
CREATE TABLE IF NOT EXISTS constrained.new (
    customer_id INTEGER UNIQUE, 
    name VARCHAR NOT NULL,
    email VARCHAR CHECK(regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')),
    region VARCHAR CHECK(region in ('EU', 'US')),
    status VARCHAR CHECK(status IN ('active', 'inactive'))
);

-- insert
INSERT INTO constrained.old
SELECT * FROM staging.old
WHERE regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')
    AND region IN ('EU', 'US') 
    AND status IN ('active', 'inactive');

INSERT INTO constrained.new
SELECT * FROM staging.new
WHERE regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')
    AND region IN ('EU', 'US') 
    AND status IN ('active', 'inactive');

-- task4 
-- task 4
-- How many cust are only in the old crm system?
SELECT customer_id
FROM staging."old"  
EXCEPT 
SELECT customer_id
FROM staging.new
-- answer is 7

-- cust are only in the new crm system?
SELECT customer_id
FROM staging.new  
EXCEPT 
SELECT customer_id
FROM staging.old
-- answer is 6

-- intersect, 7 cust in both crm systems
SELECT customer_id
FROM staging.new  
INTERSECT  
SELECT customer_id
FROM staging.old

-- task 5, can use a subquery 
--task 5 
-- subquery 1: customers only in the old crm system
()
UNION
-- subquery 2: cust only in the new crm system
()
UNION
-- subquery 3: cust violating consgtraints in old crm system
()
UNION
-- subq 4: for cust violating constraints in new crm syst
()