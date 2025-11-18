SELECT MEDIAN (salary_in_usd) AS median_salary_usd,
AVG(salary_in_usd) AS mean_salary_usd
FROM data_jobs
WHERE experience_level = 'MI'