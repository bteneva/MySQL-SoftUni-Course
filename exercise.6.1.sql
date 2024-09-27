SELECT * FROM `employees`;

# 1. Employee Address
SELECT e.`employee_id`, e.`job_title`, e.`address_id` , a.`address_text`
FROM `employees` AS e
INNER JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
ORDER BY `address_id`
LIMIT 5;

#2. Addresses with Towns

SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
FROM `employees` AS e
INNER JOIN `addresses` AS a ON e.`address_id` = a.`address_id`
INNER JOIN `towns` AS t on a.`town_id` = t. `town_id`
ORDER BY `first_name`, `last_name`
LIMIT 5;

#3. Sales Employee
SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name`
FROM `employees` AS e
INNER JOIN `departments` as d ON d.`department_id` = e.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY `employee_id` DESC;

#4. Employee Departments
SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name` AS `department_name`
FROM `employees` AS e
INNER JOIN `departments` AS d ON e.`department_id`= d.`department_id`
WHERE e.`salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

#5. Employees Without Project
SELECT e.`employee_id`, e.`first_name`
FROM `employees` as e
LEFT JOIN `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
WHERE ep.`project_id` IS null
ORDER BY e.`employee_id` DESC
LIMIT 3;

# 6.Employees Hired After
SELECT e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` AS 'dept_name'
FROM `employees` AS e
INNER JOIN `departments` AS d ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01 00:00:00' AND d.`name` in ("Sales", "Finance")
ORDER BY e.`hire_date`;

#7. Employees with Project
SELECT e.`employee_id`, e.`first_name`, p.`name` AS 'project_name'
FROM `employees` AS e
LEFT JOIN `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE DATE(p.`start_date`) > '2002-08-13 00:00:00' AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name`
LIMIT 5;

#8. Employee 24

SELECT e.`employee_id`, e.`first_name`, IF (YEAR(p.`start_date`) >= 2005, NULL, p.`name`) AS 'project_name'
FROM `employees` AS e
LEFT JOIN `employees_projects` AS ep ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name`;










