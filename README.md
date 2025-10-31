# HR_Dashboard_Using_SQL_PowerBI
Analyzing Employee Data and Reporting Using SQL queries and PowerBI Dashboards.

## 🧭 Project Objectives
This project focuses on **HR Data Analysis** to uncover meaningful insights about the company’s workforce. *Using SQL for data cleaning, transformation, and querying, and Power BI for interactive visualization, the analysis explores various aspects of employee demographics, job distribution, and trends*.

The goal of this project is to help the HR department make data-driven decisions by understanding patterns in employee demographics, retention, and organizational structure.
The project answers key business questions such as workforce diversity, departmental turnover, and changes in employee count over time.

## 🎯 Project Objectives
- To analyze the company’s workforce demographics, including gender, age, race/ethnicity, and job distribution.
- To identify trends in employee turnover and determine which departments or job roles are most affected.
- To examine employee distribution across locations and job titles.
- To evaluate historical hiring and termination patterns to understand workforce growth over time.
- To provide interactive and visual insights through Power BI dashboards that support strategic HR planning and decision-making.

## ❓HR Data Key Questions
1.  What is the gender breakdown of employees in the company?
2.  What is the race/ethnicity breakdown of employees in the company?
3.  What is the age distribution of employees in the company?
4.  How many employees work at headquarters versus remote locations?
5.  What is the average length of employment for employees who have been terminated?
6.  How does the gender distribution vary across departments and job titles?
7.  What is the distribution of job titles across the company?
8.  Which department has the highest turnover rate?
9.  What is the distribution of employees across locations by state?
10.  How has the company's employee count changed over time based on hire and term dates?
11.  What is the tenure distribution for each department?

## 🧰 Tools used
- **SQL** – for data cleaning, transformation, and querying
- **Power BI** – for data visualization and reporting
- **Excel/CSV** – as the data source

## 🗂️ Data Source and Structure
### **Name of Data:** 
- HR_Resources_Dataset  [HR_resources_Dataset](https://github.com/OsundeWatson/HR_Dashboard_Using_SQL_PowerBI/blob/7cf731e6ef8761385c017cd1f2be93045fe4c9b9/Human_Resources_Dataset.csv)
### **Source Type:** 
- Excel/CSV file
### **Description:** 
- This dataset contains employee information from an organization. It includes demographic details, job-related information, department, and employment history
### **How It Was Used:** 
- Imported into MySQL Workbench for data cleaning, querying, and analysis.
- Connected to Power BI for creating dashboards and visual reports on employee demographics, turnover, and department performance.

### **Approximate Data Volume:**
- HR Data with over 22000 rows from the year 2000 to 2020.

## 🧹Data Preparation (SQL)
  ### SQL Queries used for cleaning and transformation
changing birthdate from text(string) to date data type
```
UPDATE hr
SET birthdate = CASE
  WHEN birthdate LIKE '%-%-%' AND CHAR_LENGTH(birthdate) = 10 THEN STR_TO_DATE(birthdate, '%Y-%m-%d')
  WHEN birthdate LIKE '%-%-%' THEN STR_TO_DATE(birthdate, '%m-%d-%Y')
  WHEN birthdate LIKE '%/%/%' THEN STR_TO_DATE(birthdate, '%m/%d/%Y')
  ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
```
The below file is the data cleaning process using MyQSL benchwork
[hr_cleaning_scripts](https://github.com/OsundeWatson/HR_Dashboard_Using_SQL_PowerBI/blob/562ace07395fb8a63e07009ba2f2e5f97d23cc2f/hr_cleaning_data_scripts.sql)

## 📊 Exploratory Data Analysis (SQL)
- The company’s team has a slightly higher number of men than women and represents a mix of different racial and ethnic backgrounds. Most employees are in their **(35 and 45)**.
- 5 age groups were created (18-25, 25-35, 35-45, 45-55, 55-64). A large number of employees were between 35-45 followed by 56-64 while the smallest group was 55-64.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- While most people work from the headquarters in Ohio, remote work is becoming more common across the organization.
- On average, employees who leave the company tend to stay for about six years, which suggests a fairly stable workforce.
- The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.
- The gender balance follows a familiar pattern — technical areas like Engineering are mostly men, while roles in HR and Accounting are mainly filled by women.
- Most people in the company work as Developers, Business Analysts, or Service Technicians.
- Employees in Sales and Service roles tend to leave more often, while those in Engineering and Accounting usually stay with the company the longest.

### The Screenshot below shows the script SQL Queries for answers number 1 to 3. 
![sql_scripts to answer 1 to 3](/images/answers_1_to_3.png)

All data preparation and transformation steps were performed using SQL.  
The complete set of SQL scripts can be found here:
 ### [View SQL Queries Repository]()







  










