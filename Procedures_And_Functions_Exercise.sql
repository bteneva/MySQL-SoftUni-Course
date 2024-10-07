
-- ---1     1. Employees with Salary Above 35000
-- Create stored procedure usp_get_employees_salary_above_35000 that returns all employees
-- first and last names for whose salary is above 35000. The result should be sorted by 
-- first_name then by last_name alphabetically, and id ascending. 

DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT `first_name`, `last_name` 
	FROM `employees`
	WHERE `salary` > 35000
	ORDER BY `first_name`, `last_name`, `employee_id`;
END$$

DELIMITER ;

CALL usp_get_employees_salary_above_35000;

-- 2. Employees with Salary Above Number
-- Create stored procedure usp_get_employees_salary_above that accept a decimal number (with precision,
--  4 digits after the decimal point) as parameter and return all employee's first and last names whose salary
--  is above or equal to the given number. The result should be sorted by first_name then by last_name alphabetically and id ascending. 


DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above(salary_limit DOUBLE(19,4))
BEGIN
	SELECT `first_name`, `last_name` 
	FROM `employees`
	WHERE `salary` >= salary_limit
	ORDER BY `first_name`, `last_name`, `employee_id`;
END$$

DELIMITER ;

--  3. Town Names Starting With
-- Write a stored procedure usp_get_towns_starting_with that accept string as parameter and returns all 
-- town names starting with that string. The result should be sorted by town_name alphabetically. 

DELIMITER $$

CREATE PROCEDURE usp_get_towns_starting_with(str_start VARCHAR(10))
BEGIN
	SELECT `name` FROM `towns`
	WHERE `name` LIKE CONCAT(str_start, '%')
	ORDER BY `name`;
END$$

DELIMITER ;

-- 4.    Employees from Town
-- Write a stored procedure usp_get_employees_from_town that accepts town_name as parameter and return the employees' 
-- first and last name that live in the given town. The result should be sorted by first_name then by last_name alphabetically 
-- and id ascending. 

DELIMITER $$

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN
	SELECT e.first_name, e.last_name 
	FROM employees AS e
	JOIN addresses AS a ON e.address_id = a.address_id
	JOIN towns AS t ON t.town_id = a.town_id
	WHERE t.name = town_name
	ORDER BY e.first_name, e.last_name, e.employee_id;
END$$

DELIMITER ;

CALL usp_get_employees_from_town('Sofia');

-- FUNCTIONS

-- 5. Salary Level Function
-- Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
--     • If salary is < 30000 return "Low"
--     • If salary is between 30000 and 50000 (inclusive) return "Average"
--     • If salary is > 50000 return "High"

DELIMITER $$

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19,4))
RETURNS VARCHAR(7)
DETERMINISTIC
BEGIN
	RETURN (
		CASE 
			WHEN salary < 30000 THEN 'Low'
			WHEN salary <= 50000 THEN 'Average'
			ELSE 'High'
		END
	);
END$$

DELIMITER ;

SELECT ufn_get_salary_level(60000);

--  6. Employees by Salary Level

-- Write a stored procedure usp_get_employees_by_salary_level that receive as parameter level of salary 
-- (low, average or high) and print the names of all employees that have given level of salary. 
-- The result should be sorted by first_name then by last_name both in descending order.

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(level VARCHAR(7))
BEGIN
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE ufn_get_salary_level(`salary`) = level
    ORDER BY `first_name` DESC, `last_name` DESC;
END$$
DELIMITER ;

CALL  usp_get_employees_by_salary_level('high');

-- 7. Define Function
-- Define a function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))  that returns 1 or 0 depending on that if
--  the word is a comprised of the given set of letters. 

CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
RETURN word REGEXP (concat('^[', set_of_letters, ']+$'));


-- 8. Find Full Name
-- You are given a database schema with tables:
--     • account_holders(id (PK), first_name, last_name, ssn) 
-- and 
--     • accounts(id (PK), account_holder_id (FK), balance).
-- Write a stored procedure usp_get_holders_full_name that selects the full names of all people. The result should be sorted by full_name alphabetically and id ascending.




