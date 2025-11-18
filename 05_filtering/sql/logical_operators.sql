-- We use WHERE to filter
-- I want to convert the above in sek, 1 dollar = 9.44 sek
SELECT 
job_title, 
experience_level, 
ROUND((9.44 * salary_in_usd)/12) AS salary_sek_month 
FROM data_jobs
WHERE (salary_sek_month > 200000) AND
(salary_sek_month < 300000);
ORDER BY salary_sek_month DESC;
-- ! The SELECT statement goes 1rst and them we filter with WHERE


-- BETWEEN...AND
SELECT 
job_title, 
experience_level, 
ROUND((9.44 * salary_in_usd)/12) AS salary_sek_month 
FROM data_jobs
WHERE salary_sek_month  BETWEEN 200000 AND 300000
ORDER BY salary_sek_month DESC;

-- OR 
SELECT COUNT(*) 
FROM data_jobs 
WHERE experience_level = 'Senior level' OR experience_level = 'Expert level'


-- NOT if I wnat ecxntry and mid levels
SELECT COUNT(*) 
FROM data_jobs 
WHERE NOT experience_level = 'Senior level' OR experience_level = 'Expert level'