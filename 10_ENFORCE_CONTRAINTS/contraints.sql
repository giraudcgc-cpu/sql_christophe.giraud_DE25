CREATE TABLE IF NOT EXISTS students (name VARCHAR UNIQUE, age UINT8);

--INSERT INTO students (name, age)
--VALUES 
--('Test', 9),
--('Test2', 5);

--INSERT INTO students (name, age)
--VALUES 
--('Test', 12);

DROP TABLE students;

-- CREATE TABLE students(
   -- name VARCHAR UNIQUE,
    --age UINT8 CHECK (AGE>=18)
--);

--INSERT INTO students (name, age)
--VALUES 
--('Test', 18);

-- CREATE TABLE students (name VARCHAR UNIQUE, school_year INTEGER DEFAULT 2025);
-- INSERT INTO students (name) VALUES ('Edith'), ('Gabi');

CREATE TABLE students (name VARCHAR, age INTEGER);
-- INSERT INTO students (name) VALUES ('Edith'),('Gabi');

ALTER TABLE students
-- ALTER COLUMN age SET DEFAULT 10;
ALTER COLUMN age DROP DEFAULT;
INSERT INTO students (name)
VALUES ('Edith');
from students;