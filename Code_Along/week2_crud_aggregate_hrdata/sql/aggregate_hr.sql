-- create teh new table
CREATE TABLE IF NOT EXISTS sating.more_employees AS (
    SELECT * FROM read_csv_auto('data/more_employees.csv')
-- with auto we let sql find it
);

-- count distinct department
SELECT COUNT(DISTINCT department)
FROM staging.more_employees;

-- analyze salary
SELECT department,
ROUND(AVG(monthly_salary_sek)) AS average_salary_sek
ROUND(MEDIAN(monthly_salary_sek)) AS median_salary_sek
ROUND(MIN(monthly_salary_sek)) AS mini_salary_sek
ROUND(MAX(monthly_salary_sek)) AS max_salary_sek
FROM staging.more_employees
GROUP BY department;

