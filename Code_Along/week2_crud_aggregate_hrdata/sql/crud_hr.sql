/* DDL - CREATE */

-- create schemam idempoent

CREATE SCHEMA IF NOT EXISTS staging;

-- create a sequence to generate values for employee_ik colum later
CREATE SEQUENCE IF NOT EXISTS id_sequence START 1;

-- create table
CREATE TABLE IF NOT EXISTS staging.employees (
    employee_id INTEGER DEFAULT nextval('id_sequence'),
    department VARCHAR,
    employment_year INTEGER
)

 -- CRUD - CREATE
 INSERT INTO staging.employees (
-- inserting for 2 columns
department, employment_year)
VALUES 
('Sales', 2001),
('Logistics', 2002),
('IT', 2022);

-- something wrong above, somewhere--

-- insert with read_csv() function

INSERT INTO staging.employees (department, employment_year)
SELECT * FROM read_csv('data/employees.csv');

-- CRUD - Read
SELECT * FROM staging.employees;
--limit 10; 
-- OFFEST 10;
-- ses diff between them

--CRUD - Update
-- modifying existing data
UPDATE staging.employees
SET employment_year = 2023
WHERE employee_id IN (98, 99);
-- alternatively we can do: WHERE employee_id = 98 OR employee_id = 99;
-- IN is better, cleaner as we could have more than 2 employee ids

-- ! ALTER (a DDL)
-- we want to add a colum to the table
ALTER TABLE staging.employees
ADD COLUMN pension_plan VARCHAR DEFAULT 'plan 1'

-- CRUD - Update
UPDATE staging.employees
SET pension_plan = 'plan 2'
WHERE employment_year > 2015;

-- CRUD - Delete
-- always select the rows that we want to delete FIRST
SELECT *
FROM staging.employees
WHERE employee_id = 1; 

DELETE 
FROM staging.employees
WHERE employee_id = 1;

-- task 6
