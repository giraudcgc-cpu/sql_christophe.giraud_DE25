
-- task 1
CREATE TABLE IF NOT EXISTS staging.squad AS (
SELECT 
	*
FROM read_csv_auto('data/squad.csv'));

-- task 2: FInd rows taht do not contain the title column value in the context column value
SELECT title, context
FROM staging.squad
WHERE NOT regexp_matches(context, title);  -- require 2 arguments, are string and substring

--better with INSTR(chaine, sous_chaine [, position_depart [, occurrence]])
SELECT 
title, 
context,
INSTR(context, title)
FROM staging.squad
WHERE NOT regexp_matches(context, title);

--task 3: Find rows taht start with tile column value in the context column value
-- use LIKE operator with wildcard %
SELECT 
*
FROM staging.squad
WHERE context LIKE CONCAT(title, '%');

-- if you use a regular expression, underscore _ will be litteral character.
-- use of a pattern between '' 
SELECT * FROM staging.squad
WHERE regexp_matches(context, CONCAT('^', title));

-- task 4: Create a new column (show a new column) which is the first answer of the AI model. Do not use pattern matching in your query.
SELECT 
answers[18:], -- slicing
answers[18], -- indexing
CASE
WHEN answers[18] =  ',' THEN NULL
ELSE answers[18:] 
END AS striped_answers,
INSTR(striped_answers, '''') AS first_quotation_index,  -- cotation " " doesn t work, need to use single cotations twice like ''x''
striped_answers[:first_quotation_index-1] AS first_answer,
answers
FROM staging.squad;

-- task 5
-- we need cotation marks for the pattern
SELECT 
-- don't allow single quotation inside ' and ',
regexp_extract(answers,'''([^'']+),'',') AS first_answer,
-- allow upper and lower case letters, digits, space, comma
regexp_extract(answers,'''([A-Za-z0-9 ,]+),'',') AS first_answer,
-- use the grouping optional argument in regexp_extract function
answers
FROM staging.squad;