#1. Find Names of All Employees by First Name
#Write a SQL query to find first and last names of all employees whose first name starts with "Sa" (case insensitively).
# Order the information by id


SELECT `first_name`, `last_name` FROM `employees`
WHERE `first_name` LIKE 'Sa%'
ORDER by `employee_id`;

#2. Find Names of All Employees by Last Name
# Write a SQL query to find first and last names of all employees whose last name contains "ei" (case insensitively). Order the information by id. 
SELECT `first_name`, `last_name` FROM `employees`
WHERE `last_name` LIKE '%ei%'
ORDER BY `employee_id`;

#    3. Find First Names of All Employees
#Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusively. Order the information by id. 
SELECT `first_name` FROM `employees`
WHERE `department_id` in (3,10)
AND 
YEAR (`hire_date`) BETWEEN 1995 and 2005
ORDER BY `employee_id`;

#    4. Find All Employees Except Engineers
# Write a SQL query to find the first and last names of all employees whose job titles does not contain "engineer". Order the information by id. 
SELECT `first_name`, `last_name` FROM `employees`
WHERE `job_title` NOT LIKE "%engineer%"
ORDER BY `employee_id`;

#5. Find Towns with Name Length
# Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name.
SELECT `name` from `towns`
WHERE char_length(`name`) = 5 OR char_length(`name`) = 6
ORDER BY `name`;

#6. Find Towns Starting With
# Write a SQL query to find all towns that start with letters M, K, B or E (case insensitively). 
# Order them alphabetically by town name.
SELECT * FROM `towns`
WHERE 
`name` LIKE 'M%' 
OR `name` LIKE 'K%' 
OR `name` LIKE 'B%' 
OR `name` LIKE 'E%'
ORDER BY `name`;
#7.     7.  Find Towns Not Starting With
#Write a SQL query to find all towns that do not start with letters R, B or D (case insensitively). Order them alphabetically by name.
SELECT * FROM `towns`
WHERE 
	`name` NOT LIKE 'r%'
    AND `name` NOT LIKE 'b%'
    AND`name` NOT LIKE 'd%'
    ORDER BY `name`;
    
#8. Create View Employees Hired After 2000 Year
# Write a SQL query to create view v_employees_hired_after_2000 with the first and the last name of all
# employees hired after 2000 year. Select all from the created view. 
CREATE VIEW v_employees_hired_after_2000 AS 
SELECT `first_name`, `last_name` FROM `employees`
WHERE YEAR(`hire_date`) > 2000;
SELECT * FROM v_employees_hired_after_2000;

# 9. Length of Last Name
# Write a SQL query to find the first and last names of all employees whose last name is exactly 5 characters long.
SELECT `first_name`, `last_name` FROM `employees`
WHERE char_length(`last_name`) = 5;
