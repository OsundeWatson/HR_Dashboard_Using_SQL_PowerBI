USE human_resource;
SELECT *
FROM hr;
-- change column heading
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

-- changing birthdate from text(string) to date data type
SELECT birthdate
FROM hr;

UPDATE hr
SET birthdate = CASE
  WHEN birthdate LIKE '%-%-%' AND CHAR_LENGTH(birthdate) = 10 THEN STR_TO_DATE(birthdate, '%Y-%m-%d')
  WHEN birthdate LIKE '%-%-%' THEN STR_TO_DATE(birthdate, '%m-%d-%Y')
  WHEN birthdate LIKE '%/%/%' THEN STR_TO_DATE(birthdate, '%m/%d/%Y')
  ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

DESCRIBE hr;

-- changing hire_date from text(string) to date data type
UPDATE hr
SET hire_date = CASE
  WHEN hire_date LIKE '%-%-%' AND CHAR_LENGTH(hire_date) = 10 THEN STR_TO_DATE(hire_date, '%Y-%m-%d')
  WHEN hire_date LIKE '%-%-%' THEN STR_TO_DATE(hire_date, '%m-%d-%Y')
  WHEN hire_date LIKE '%/%/%' THEN STR_TO_DATE(hire_date, '%m/%d/%Y')
  ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT hire_date
FROM hr;
-- Changing the termdate from string to date type
UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;
SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate from hr;

-- Adding new column to the table(age column)
ALTER TABLE hr
ADD COLUMN age INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT DISTINCT age from hr ORDER BY age;

SELECT COUNT(*)
FROM hr
WHERE age < 18;




















