
-- QUESTIONS
-- 1. What is the gender breakdown of employees in the company?
SET SESSION sql_mode = '';   -- This disables strict checking for the current session, allowing zero dates.

SELECT gender, COUNT(*) AS gender_breakdown
FROM hr
WHERE age>= 18 AND termdate = '0000-00-00'  -- This condition is necessary because some ages are negative and some termination dates are set in the future(active employee)
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(*) AS count_race_breakdown
FROM hr
WHERE age>= 18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count_race_breakdown DESC;

-- 3. What is the age distribution of employees in the company?
SELECT min(age) as youngest,max(age) as eldest from hr where age >18 and termdate ='0000-00-00';

SELECT 
  CASE 
  WHEN age>= 18 AND age <= 25 THEN '18-25'
  WHEN age>= 26 AND age <= 35 THEN '26-35'
  WHEN age>= 36 AND age <= 45 THEN '36-45'
  WHEN age>= 46 AND age <= 55 THEN '46-55'
  WHEN age>= 56 AND age <= 64 THEN '56-64'
  ELSE '65+'
  END AS age_group,
  COUNT(*) AS age_count
FROM hr
WHERE age>= 18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

-- Let include the gender to it just incase
SELECT 
  CASE 
  WHEN age>= 18 AND age <= 25 THEN '18-25'
  WHEN age>= 26 AND age <= 35 THEN '26-35'
  WHEN age>= 36 AND age <= 45 THEN '36-45'
  WHEN age>= 46 AND age <= 55 THEN '46-55'
  WHEN age>= 56 AND age <= 64 THEN '56-64'
  ELSE '65+'
  END AS age_group, gender,
  COUNT(*) AS age_count
FROM hr
WHERE age>= 18 AND termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

-- 4. How many employees work at headquarters versus remote locations?
SELECT location, count(*) employee_location
FROM hr
WHERE age >=18 AND termdate ='0000-00-00'
GROUP BY location;

-- 5. What is the average length of employment for employees who have been terminated?
SELECT
  ROUND(AVG(DATEDIFF(termdate, hire_date) /365), 0) AS avg_length_employment
FROM hr
WHERE termdate <= curdate() AND termdate != '0000-00-00' AND age >=18;

-- 6. How does the gender distribution vary across departments and job titles?
SELECT gender, department, jobtitle, COUNT(*) AS COUNT
FROM hr
WHERE age>= 18 AND termdate = '0000-00-00'
GROUP BY department,gender
ORDER BY department;

-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS job_count
FROM hr
WHERE age >=18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle;

-- 8. Which department has the highest turnover rate?
SELECT department, total_count,terminated_count, (terminated_count/total_count) AS termination_rate
FROM(
  SELECT department, COUNT(*) AS total_count, SUM(CASE WHEN termdate != '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminated_count
  FROM hr
  WHERE age>=18
  GROUP BY department
  ) AS subquery
ORDER BY termination_rate DESC;

-- 9. What is the distribution of employees across locations by city and state?
SELECT location_city,location_state, COUNT(*) AS employee_count
FROM hr
WHERE age>=18 AND termdate = '0000-00-00'
GROUP BY location_city,location_state
ORDER BY employee_count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
