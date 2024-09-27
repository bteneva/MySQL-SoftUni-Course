-- Majors Table (parent of Students)
CREATE TABLE `majors` (
	`major_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50) NOT NULL
);

-- Students Table (parent of Agenda and Payments)
CREATE TABLE `students` (
	`student_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `student_number` VARCHAR(12) NOT NULL,
    `student_name` VARCHAR(50) NOT NULL,
    `major_id` INT NOT NULL,
    CONSTRAINT fk_majors FOREIGN KEY (`major_id`)
    REFERENCES `majors`(`major_id`)
);

-- Subjects Table (parent of Agenda)
CREATE TABLE `subjects` (
	`subject_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `subject_name` VARCHAR(50) NOT NULL
);

-- Agenda Table (student-course enrollment)
CREATE TABLE `agenda` (
	`student_id` INT NOT NULL,
    `subject_id` INT NOT NULL,
    PRIMARY KEY (`student_id`, `subject_id`),
    CONSTRAINT fk_students_agenda FOREIGN KEY (`student_id`)
    REFERENCES `students`(`student_id`),
    CONSTRAINT fk_subjects_agenda FOREIGN KEY (`subject_id`)
    REFERENCES `subjects`(`subject_id`)
);

-- Payments Table (student payments)
CREATE TABLE `payments` (
	`payment_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `payment_date` DATE NOT NULL,
    `payment_amount` DECIMAL(8,2) NOT NULL,
    `student_id` INT NOT NULL,
    CONSTRAINT fk_students_payments FOREIGN KEY (`student_id`)
    REFERENCES `students`(`student_id`)
);
