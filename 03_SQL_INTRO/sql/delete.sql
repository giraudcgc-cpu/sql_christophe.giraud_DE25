/* want to delete bad jokes but first want to identify them 
so we make a SELECT first to double check the rows */
SELECT * FROM funny_jokes 
WHERE rating < 5;

-- now we delete them
DELETE FROM funny_jokes
WHERE rating < 5; 