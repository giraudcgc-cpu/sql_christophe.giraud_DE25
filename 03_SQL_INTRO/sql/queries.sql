-- checking that it works
SELECT * FROM funny_jokes;

/* acending order */
SELECT * FROM funny_jokes ORDER BY rating;

/* descending order */
SELECT * FROM funny_jokes ORDER BY rating DESC; 

SELECT * FROM funny_jokes WHERE id = 7;

-- shortcut to do SELECT * and this is duckdb specific!
FROM funny_jokes;