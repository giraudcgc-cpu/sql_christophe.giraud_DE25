
-- we do select first to see the concerned rows/data. We want to change the experience labels
SELECT CASE
WHEN experience_level = 'SE' THEN 'Senior level'
WHEN experience_level = 'MI' THEN 'Mid level'
WHEN experience_level = 'EN' THEN 'Entry level'
WHEN experience_level = 'EX' THEN 'Expert level'
END AS experience_level,
-- the comma just above after level says that all from the beg to the comma is one column
-- then we exclude the rest, meaning we have created NEW experience levels
* EXCLUDE(experience_level)
FROM data_jobs;

-- Now we want to persist the changes
UPDATE data_jobs SET experience_level = CASE
WHEN experience_level = 'SE' THEN 'Senior level'
WHEN experience_level = 'MI' THEN 'Mid level'
WHEN experience_level = 'EN' THEN 'Entry level'
WHEN experience_level = 'EX' THEN 'Expert level'
END;

-- to check we can do:
SELECT DISTINCT experience_level FROM data_jobs;

