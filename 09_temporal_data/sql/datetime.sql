DESC staging.sweden_holidays;

FROM staging.sweden_holidays;
-- we cannot just do FROM holidays because it is in the staging schema.

-- addition and substraction
SELECT 
date,
date + interval 5 days AS plus_5_days,
typeof(plus_5_days) AS plus_5_days_type,
date + interval 5 days AS minus_5_days
FROM staging.sweden_holidays;
-- Here we see that the type changed to TIMESTAMP after adding +5 days

-- DATE functions
SELECT today();

-- the week days
-- -- the week days
SELECT date,
dayname (date) as weekday
FROM staging.sweden_holidays;

-- find the later day between dates
SELECT
*, 
today() as today,
greatest(date, today) as later_day
FROM staging.sweden_holidays;

-- convert date to string
SELECT
date,
strftime(date, '%d/%m/%Y') as date_string,
typeof(date_string)
FROM staging.sweden_holidays;

-- Now from string to date
-- Above it is strftime
-- Below it is striptime
-- BELOW we see TIMESTAMP date-type
SELECT
date,
strftime (date, '%d/%m/%Y') as date_string,
strftime(date_string, '%d/%m/%Y') as new_date,
typeof(new_date)
FROM staging.sweden_holidays;

-- Follow up of above, if I want it to be a date I need to add :: 
-- to have it converted back to date-type
SELECT
date,
strftime (date, '%d/%m/%Y') as date_string,
strptime(date_string, '%d/%m/%Y'):: DATE as new_date,
typeof(new_date)
FROM staging.sweden_holidays;

