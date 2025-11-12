SELECT DISTINCT salary_currency AS unique_currency FROM data_jobs;
-- it can be a space between salary_currecny and unique_currency instead of AS 
-- that would produce the same effect but more readable with AS

--to count the distinct salaries / COUNT is many to one relationship or many to one mapping
SELECT COUNT(DISTINCT salary_currency) AS number_currency FROM data_jobs;

-- this add an id to each row
SELECT ROW_NUMBER() OVER () AS id, * FROM data_jobs;


