# 12.	 Employees Minimum Salaries
# That's it! You no longer work for Mr. Bodrog. You have decided to find a proper job as an analyst in SoftUni. 
# It's not a surprise that you will use the soft_uni database. 
# Select the minimum salary from the employees for departments with ID (2,5,7) but only for those who are hired after 01/01/2000. Sort result by department_id in ascending order.
# Your query should return:
# •	department_id

SELECT `department_id`, MIN(`salary`) AS "minimum salary" FROM `employees`
WHERE `hire_date` > '2000-01-01'
GROUP BY `department_id`
HAVING `department_id` IN (2, 5, 7)
ORDER BY `department_id`;

#13.	Employees Average Salaries
# Select all high paid employees who earn more than 30000 into a new table.
#  Then delete all high paid employees who have manager_id = 42 from the new table. 
# Then increase the salaries of all high paid employees with department_id = 1 with 5000 in the new table. 
# Finally, select the average salaries in each department from the new table. Sort result by department_id in increasing order


CREATE TABLE `high paid employees` AS
SELECT * FROM `employees`
WHERE `salary` > 30000;

DELETE FROM `high paid employees` 
WHERE `manager_id` = 42;

UPDATE `high paid employees`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT `department_id`, AVG(`salary`) FROM `high paid employees`
GROUP BY `department_id`
ORDER BY `department_id`;

-- 14. Employees Maximum Salaries
-- Find the max salary for each department. Filter those which have max salaries not in the range 30000 and 70000. 
-- Sort result by department_id in increasing order.

SELECT `department_id`, MAX(`salary`) AS `max_salary` FROM `employees`
GROUP BY `department_id`
HAVING `max_salary` < 30000 OR `max_salary` > 70000
ORDER BY `department_id`;

-- 15.	Employees Count Salaries
-- Count the salaries of all employees who don't have a manager.	
SELECT COUNT(*) FROM `employees`
WHERE `manager_id` IS NULL;

-- 16.	3rd Highest Salary*
-- Find the third highest salary in each department if there is such. Sort result by department_id in increasing order.

-- SELECT `department_id`, `salary` FROM `employees`
-- ORDER BY `department_id`

-- 17.	 Salary Challenge**
-- Write a query that returns:
-- •	first_name
-- •	last_name
-- •	department_id
-- for all employees who have salary higher than the average salary of their respective departments.
-- Select only the first 10 rows. Order by department_id, employee_id.

SELECT `first_name`, `last_name`, `department_id` FROM `employees` AS current_employee
WHERE `salary` > ( SELECT AVG(`salary`) FROM `employees` other_employees
					WHERE current_employee.`department_id` = other_employees.`department_id`)
ORDER BY `department_id`, `employee_id`
LIMIT 10;  

-- 18.	Departments Total Salaries
-- Create a query which shows the total sum of salaries for each department. Order by department_id.
-- Your query should return:	
-- •	department_id   
SELECT `department_id`, SUM(`salary`) as 'total_salary' FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;

               




