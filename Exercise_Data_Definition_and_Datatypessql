CREATE DATABASE `minions`;

USE `minions`;
CREATE TABLE `minions`(
id INT primary key auto_increment,
name varchar(255),
age INT
);
CREATE TABLE `towns` (
town_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255)
);

ALTER TABLE `towns`
RENAME COLUMN `town_id` TO `id`;

ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`);

INSERT INTO `towns` (`id`, `name`)
VALUES (1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna');

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUE (1, 'Kevin', 22, 1), (2, 'Bob', 15, 3), (3, "Steward", NULL, 2);
USE minions;

TRUNCATE TABLE `minions`;

DROP TABLE `minions`;
DROP TABLE `towns`;
DROP DATABASE minions;
CREATE DATABASE `exercise`;
USE `exercise`;
CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL, #REQUIRED
`picture` BLOB, 
`hight` DOUBLE(10, 2),
`weight` DOUBLE(10, 2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES 
	("Boris", 'm', DATE(NOW())),
    ("Alexander", 'm', DATE(NOW())),
    ("Dancho", 'm', DATE(NOW())),
    ("Peter", 'm', DATE(NOW())),
    ("DESI", 'f', DATE(NOW()));
    
CREATE TABLE `users`(
	`id` INT PRIMARY KEY auto_increment,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    last_login_time TIME,
    is_deleted BOOLEAN

);

INSERT INTO `users` (`username`, `password`)
VALUES
('PESHO1', "1234"),
("IVAN2", "TEST1"),
("TEST", "TEST2"),
("test1", "test1"),
("test2", "test2");

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY pk_users(`id`, `username`);

ALTER TABLE `users`
MODIFY COLUMN last_login_time DATETIME DEFAULT NOW();

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users` (`id`),
MODIFY `username` VARCHAR(30) unique;

CREATE DATABASE `Movies`;
CREATE TABLE `directors`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`director_name` VARCHAR(255) NOT NULL,
`notes` VARCHAR(255)
);


INSERT INTO `directors` (`director_name`, `notes`)
VALUES 
	("PESHO", "Oscar"),
    ("Guncho", "old movies"),
    ("Kunchev", "bad movies"),
    ("OhoBoho", "hh"),
    ("Mi ne znam", "dskds");
    

CREATE TABLE `genres`(
`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
`genre_name` VARCHAR(255) NOT NULL,
`notes` VARCHAR(255)
);

INSERT INTO `genres` (`genre_name`, `notes`)
VALUES 
	("Thriller", "scary"),
    ("Romance", "lovely"),
    ("Sport", "history"),
    ("Documentary", "history"),
    ("Comedy", "funny");

CREATE TABLE `categories`(
`id` INT PRIMARY KEY auto_increment NOT NULL,
`category_name` VARCHAR(255) NOT NULL,
`notes` VARCHAR(255)
);

INSERT INTO `categories` (`category_name`, `notes`)
VALUES
	("name1", ""),
    ("name2", "dsds"),
    ("name3", "dsf"),
    ("name4", "test4"),
    ("name5", "test5");
    
CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`title` VARCHAR(255) NOT NULL,
`director_id` INT NOT NULL,
`copyright_year` INT,
`length` double,
`genre_id` INT NOT NULL,
`category_id` INT NOT NULL,
`rating` double,
`notes` VARCHAR(255)
);

INSERT INTO `movies` (`title`, `director_id`, `genre_id`, `category_id`)
VALUES
	("Harry Potter", 1, 1, 1),
    ("Tumba lumba", 2, 3, 2),
    ("Oho boho", 2, 3, 4),
    ("Ne znam", 3, 4, 4),
    ("Ah moreto", 1, 1, 1);
    
--  12. Car Rental Database
-- Using SQL queries create car_rental database with the following entities:
--     • categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
--     • cars (id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
--     • employees (id, first_name, last_name, title, notes)
--     • customers (id, driver_licence_number, full_name, address, city, zip_code, notes)
--     • rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, 
-- kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
-- Set most appropriate data types for each column. Set primary key to each table. 
-- Populate each table with 3 records. Make sure the columns that are present in 2 tables would be of the same data type. 
-- Consider which fields are always required and which are optional. 
-- Submit your CREATE TABLE and INSERT statements as Run queries & check DB.

CREATE DATABASE `car_rental`;
USE `car_rental`;
CREATE TABLE categories (
	id INT PRIMARY KEY auto_increment NOT NULL,
    category VARCHAR(50) NOT NULL,
    daily_rate DOUBLE, 
    weekly_rate DOUBLE, 
    monthly_rate DOUBLE, 
    weekend_rate DOUBLE
);

INSERT INTO `categories` (`category`)
VALUES 
('TestName1'),
('TestName2'),
('TestName3');

CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    plate_number VARCHAR(20),
    make VARCHAR(20) DEFAULT NULL, 
    model VARCHAR(30) DEFAULT NULL, 
    car_year INT DEFAULT NULL,
    category_id INT DEFAULT NULL,
    doors INT DEFAULT NULL,
    picture BLOB DEFAULT NULL,
    car_condition VARCHAR(30) DEFAULT 'Unknown',
    available BOOLEAN DEFAULT TRUE
);


INSERT INTO `cars` (`plate_number`)
VALUES 
('TestName1'),
('TestName2'),
('TestName3');

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `title` VARCHAR(50),
    `notes` TEXT
);

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES 
('TestName1', 'TestName1'),
('TestName2', 'TestName2'),
('TestName3', 'TestName3');

CREATE TABLE `customers` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_license` VARCHAR(20),
	`full_name` VARCHAR(50),
	`address` VARCHAR(50),
	`city` VARCHAR(10),
	`zip_code` VARCHAR(10),
	`notes` TEXT
);

INSERT INTO `customers` (`driver_license`, `full_name`)
VALUES 
('TestName1', 'TestName1'),
('TestName2', 'TestName2'),
('TestName3', 'TestName3');

CREATE TABLE `rental_orders` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` VARCHAR(50),
    `tank_level` VARCHAR(20),
	`kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE, 
    `end_date` DATE, 
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` VARCHAR(20),
    `notes` TEXT
);
INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES 
(1, 2),
(2, 3),
(3, 1);

-- 13. Basic Insert
-- Now create bigger database called soft_uni. You will use database in the future tasks. It should hold information about
--     • towns (id, name)
--     • addresses (id, address_text, town_id)
--     • departments (id, name)
--     • employees (id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)
-- Id columns are auto incremented starting from 1 and increased by 1 (1, 2, 3, 4…). Make sure you use appropriate data types for each column. Add primary and foreign keys as constraints for each table. Use only SQL queries. Consider which fields are always required and which are optional.
-- Do not submit creation of database only the insert statements.

CREATE TABLE `towns`(
	id INT PRIMARY KEY  AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL  
);

CREATE TABLE `addresses` (
	id INT PRIMARY KEY AUTO_INCREMENT,
    address_text VARCHAR(255) NOT NULL,
    `town_id` INT NOT NULL
);
CREATE TABLE `departments` (
 id INT AUTO_INCREMENT PRIMARY KEY,
 `name` VARCHAR(255)
);

CREATE TABLE `employees` (
 id INT PRIMARY KEY auto_increment,
 first_name VARCHAR(255) NOT NULL, 
 middle_name VARCHAR(255)  NOT NULL, 
 last_name VARCHAR(255)  NOT NULL, 
 job_title VARCHAR(255)  NOT NULL,
 department_id INT  NOT NULL,
 hire_date DATE,
 salary DECIMAL, 
 address_id INT  NOT NULL
);

INSERT INTO `towns` (`name`)
VALUES
   ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");
   
INSERT INTO `departments` (`name`)
VALUES
	("Engineering"), ("Sales"), ("Marketing"), ("Software"), ("Development"), ("Quality Assurance");
    
INSERT INTO `towns` (`name`)
VALUES
   ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");
   
INSERT INTO `departments` (`name`)
VALUES
	("Engineering"), ("Sales"), ("Marketing"), ("Software Development"), ("Quality Assurance");
    
INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
	('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
	('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
	('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
	('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
	('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);
    
-- 14. Basic Select All Fields
-- Use the soft_uni database and first select all records from the towns, then from departments and finally from employees table.
--  Use SQL queries and submit them to Judge at once. Submit your query statements as Prepare DB & Run queries.

SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- 15. Basic Select All Fields and Order Them
-- 		Modify queries from previous problem by sorting:
--     • towns - alphabetically by name
--     • departments - alphabetically by name
--     • employees - descending by salary

SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

    -- 16. Basic Select Some Fields
-- Modify queries from previous problem to show only some of the columns. For table:
--     • towns – name
--     • departments – name
--     • employees – first_name, last_name, job_title, salary

SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

--  17. Increase Employees Salary
-- Use softuni database and increase the salary of all employees by 10%. 
-- Then select only salary column from the employees table. Submit your query statements as Prepare DB & Run queries.


UPDATE `employees`
SET `salary` = `salary` * 1.1;
SELECT `salary` FROM `employees`



 
