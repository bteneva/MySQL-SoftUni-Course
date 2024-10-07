#1.Find all information about department
SELECT * FROM `departments` 
ORDER BY `department_id`;

#2. Find all department names
SELECT `name` FROM `departments`
ORDER BY `department_id`;

#3. Find salary of Each Employee 
SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id`;

#4. Find Full Name of Each Employee 
SELECT `first_name`, `middle_name`, `last_name` FROM `employees`
ORDER BY `employee_id`;

#5. Find Email Address of Each Employee 
# e-mail: {first_name}.{last_name}@softuni.bg
SELECT CONCAT(`first_name`,'.', `last_name`, "@softuni.bg" )
AS full_email_address
FROM `employees`;

#6. Find All Different Employee's Salaries
SELECT DISTINCT `salary` FROM `employees`;

#7. Find all Information About Employees 
SELECT * FROM `employees`
WHERE `job_title` = "Sales Representative"
ORDER BY `employee_id`;

#8. Find Names of All Employees by salary in Range 
SELECT `first_name`, `last_name`, `job_title` FROM `employees`
WHERE (`salary` >= 20000) and (`salary` <=30000)
ORDER BY `employee_id`;

#9.  Find Names of All Employees  
#Full name = {first name}" "{middle name}" "{last name}
SELECT CONCAT(`first_name`, " ", `middle_name`, " ", `last_name`)
AS `Full name`
FROM `employees`
WHERE `salary` IN (25000, 14000, 12500, 23600);

#10. Find All Employees Without Manager 
SELECT `first_name`, `last_name` FROM `employees`
WHERE `manager_id` IS NULL;

#11. Find All Employees with salary More Than 50000 
SELECT  `first_name`, `last_name`, `salary` FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

#12. Find 5 Best Paid Employees 
SELECT `first_name`, `last_name` FROM `employees`
ORDER BY `salary` DESC
LIMIT 5;

#13. Find All Employees Except Marketing 
SELECT `first_name`, `last_name` FROM `employees`
WHERE `department_id` <> 4;

#14. Sort Employees Table 
# • First by salary in decreasing order 
# • Then by first name alphabetically 
# • Then by last name descending 
# • Then by middle name alphabetically 


#15. Create View Employees with Salaries 
CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`, `last_name`, `salary`
FROM `employees`;

#16. Create View Employees with Job Titles 
#Write a SQL query to create view v_employees_job_titles with full employee name and job title. When middle name is NULL replace it with empty string (''). 
#Submit your query statements as Run skeleton, run queries & check DB. 

#CONCAT WS
CREATE VIEW `v_employees_job_titles` AS
SELECT CONCAT_WS(" ",`first_name`, `middle_name`, `last_name`) AS `full name`, `job_title`
FROM `employees`;

#17.  Distinct Job Titles 
#Write a SQL query to find all distinct job titles. Sort the result by job title alphabetically.

SELECT distinct `job_title` FROM `employees`
ORDER BY `job_title`;

#18. Find First 10 Started Projects 
#Write a SQL query to find first 10 started projects. Select all
#information about them and sort them by start date, then by name. Sort the information by id.  

SELECT * FROM `projects`
ORDER BY `start_date`, `name`
LIMIT 10;

#19.  Last 7 Hired Employees 
#Write a SQL query to find last 7 hired employees. Select their first, last name and their hire date.

SELECT `first_name`, `last_name`, `hire_date` FROM `employees` 
ORDER BY `hire_date` DESC
LIMIT 7;

#20. Increase Salaries 
#Write a SQL query to increase salaries of all employees that are in the Engineering, Tool Design, Marketing or Information Services department by 12%. Then select Salaries column from the Employees table. 
UPDATE `employees`
SET `salary` = `salary` * 1.12
WHERE `department_id` IN (1, 2, 4, 11);
SELECT `salary` FROM `employees`;
