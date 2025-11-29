-- LEFT JOIN
SELECT 
p.plant_id,
p.plant_name,
p.type,
pc.water_schedule,
pc.sunlight
FROM plants p
LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id

--RIGHT JOIN
SELECT 
p.plant_id,
p.plant_name,
p.type,
pc.water_schedule,
pc.sunlight
FROM plants p
RIGHT JOIN plant_care pc ON p.plant_id = pc.plant_id
-- see the notes in the localhost duckdb for more details

--FULL JOIN
SELECT 
p.plant_id,
p.plant_name,
p.type,
pc.water_schedule,
pc.sunlight
FROM plants p
FULL JOIN plant_care pc ON p.plant_id = pc.plant_id 

--Cross join
SELECT 
p.plant_id,
p.plant_name,
p.type,
pc.water_schedule,
pc.sunlight
FROM plants p
CROSS JOIN plant_care pc;

