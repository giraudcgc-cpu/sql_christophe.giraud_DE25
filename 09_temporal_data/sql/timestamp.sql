DESC staging.train_schedules;

FROM staging.train_schedules;

-- see time diff
SELECT  
scheduled_arrival,
actual_arrival,
delay_minutes,
age(actual_arrival, scheduled_arrival) as delay_interval,
typeof(delay_interval)
FROM staging.train_schedules;
-- Under delay_minutes column we see that the delayed time has been converted
-- using age from 01:43:00 to 103 minutes
-- The age() function is used to calculate the diff between two dates or timestamps

-- current timestamp, actually works!
SELECT  current_localtimestamp();

-- truncating the time, for fun
SELECT current_localtimestamp() as current_time,
date_trunc('second', current_time) as second;

-- truncate (delete in some aspects) a timestamp to specific precision
SELECT 
scheduled_arrival,
date_trunc ('hour', scheduled_arrival) AS scheduled_arrival_trunc
FROM staging.train_schedules;

-- extract subfield of timestamp
-- show arrival hour in text
SELECT 
scheduled_arrival,
'kl.' || extract('hour'
FROM scheduled_arrival) AS scheduled_arrival_hour
FROM staging.train_schedules;








