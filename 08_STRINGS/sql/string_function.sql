-- remove leading and trailing spaces for the values in the column sql_word

SELECT trim(sql_word, ' ') as trimmed_word
FROM staging.sql_glossary;

-- Now we integrate the first and last characters
-- it is just an example
SELECT 
trim(sql_word, ' ') as trimmed_word,
trimmed_word(1) as first_character,
trimmed_word(-1) as last_character,
FROM 
staging.sql_glossary;

-- Now transform all in uppcases
SELECT 
upper(trim(sql_word, ' ')) as sql_term,
sql_term[1] as first_character,
sql_term[-1] as last_character,
FROM 
staging.sql_glossary;

-- By doing FROM staging.sql_glossary we can see the spaces in between words
-- sometimes they are more than 1 space
-- replacing 2 spaces with 1
-- ! will use regex and pattern matching in a diff script

SELECT description,
replace(description, '  ', ' ') as cleaned_description
FROM staging.sql_glossary;

-- concatenat strings
SELECT
concat(upper(trim(sql_word, ' ')), ' command') as sql_command,
FROM 
staging.sql_glossary;

-- Can also do it with 2 ||
SELECT
upper(trim(sql_word, ' ')) || ' command' as sql_command,
FROM staging.sql_glossary;

-- extract substring
SELECT 
trim(sql_word) as trimmed_word,
-- below we use substring
substring(trim(sql_word), 1,5) as first_five_chars
FROM staging.sql_glossary;
-- will get 5 characters under the column first_five_chars if words contains 5 or more. if not, we get 4 and a space

-- Now with the slicer
SELECT 
trim(sql_word) as trimmed_word,
substring(trim(sql_word), 1,5) as first_five_chars,
trimmer_word[1:5] as sliced_five_chars,
FROM staging.sql_glossary;

-- reverse characters
SELECT 
reverse(trim(sql_word)) as reversed_word
FROM staging.sql_glossary;

-- find position of 1rst occurence of a substring
-- and return 0 if substring is not found
SELECT
description,
-- below we want to see if the substring 'select' is in the string and its position
INSTR(description, 'select') as selected_position,
--select_position != 0 as about_select
FROM staging.sql_glossary;

-- example
SELECT 'fun' || ' joke'