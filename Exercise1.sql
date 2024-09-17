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