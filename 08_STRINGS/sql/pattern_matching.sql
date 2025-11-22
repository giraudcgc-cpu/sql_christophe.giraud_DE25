-- with the LIKE operator in WHERE clause
-- LIke can be used with wildcards to search for a pattern

SELECT 
example,
lower(trim(eample)) as cleaned_example
FROM staging.sql_glossary;

-- search for select
SELECT 
example,
lower(trim(example)) as cleaned_example
FROM staging.sql_glossary
WHERE
cleaned_example LIKE '%select%' -- wildcard % matches 0 or more charcaters

-- wildcard _ represents 1 character
SELECT 
example,
trim(example) as cleaned_example
FROM staging.sql_glossary
WHERE
cleaned_example LIKE 'S_LECT%';  
-- Point is no matter what is the character matching _ returns it, then we can see: SeLECT and SELECT

-- regular expression regex
SELECT 
lower(trim(description)) as cleaned_description
FROM staging.sql_glossary
WHERE regexp_matches(cleaned_description, '^c');

-- all strating with C or S
SELECT 
trim(description)) as cleaned_description
FROM staging.sql_glossary
WHERE regexp_matches(cleaned_description, '^[CS]');


-- with \b makes it match exaclty select word and NOT selects
SELECT 
lower(description) as cleaned_description
FROM staging.sql_glossary
WHERE regexp_matches(cleaned_description, 'select\b');

-- match range of characters lie [a-f]
-- ^[a-f] matches staring with characters a to f
SELECT 
lower(trim(description)) as cleaned_description
FROM staging.sql_glossary
WHERE regexp_matches(cleaned_description, '^[a-f]');

--!: while [^a-f] means NOT matching a character from a to f
--!!: and ^[^a-f] means strating with charcaters NOT in range a to f

-- replace
SELECT 
description,
regexp_replace(description, ' +', ' ', 'g') AS cleaned_description
FROM staging.sql_glossary;
-- now removing leading and trailing spaces
SELECT 
description,
regexp_replace(trim(description), ' +', ' ','g') AS cleaned_description
FROM staging.sql_glossary;