-- checkmark for glossaries which we have learnt
SELECT * FROM database.duckdb
WHERE id IN (1,2,3);

UPDATE database.duckdbSET learnt = TRUE
WHERE id IN (1,2,3);