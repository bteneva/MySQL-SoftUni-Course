INSERT INTO students (first_name, last_name, age, phone_number)
SELECT 
    LOWER(REVERSE(first_name)) AS first_name, 
    LOWER(REVERSE(last_name)) AS last_name,
    age + CAST(SUBSTRING(phone_number, 1, 1) AS UNSIGNED) AS age, 
    CONCAT('1+', phone_number) AS phone_number
FROM students
where age < 20;

-- UPDATE-- 

UPDATE driving_schools ds
JOIN cities c ON ds.city_id = c.id
SET ds.average_lesson_price = ds.average_lesson_price + 30
where c.`name`= 'London' and night_time_driving = 1;

DELETE FROM driving_schools
where night_time_driving = 0;

SELECT concat(first_name," ", last_name) as full_name, age
from students
where first_name like '%a%'
order by age, id
limit 3;

SELECT ds.id, ds.`name`, c.brand
from driving_schools ds
join cars c ON ds.car_id = c.id
left join instructors_driving_schools ids on ds.id = ids.driving_school_id
 -- JOIN instructors i ON ids.instructor_id = i.id
 where ids.instructor_id is NULL
 order by c.brand, ds.id
 LIMIT 5;
 
SELECT 
    i.first_name, 
    i.last_name, 
    count(s.id) as students_count,
    c.name AS city
FROM 
    instructors i
JOIN 
    instructors_students ins ON i.id = ins.instructor_id
JOIN 
    students s ON ins.student_id = s.id
JOIN 
    instructors_driving_schools ids ON ins.instructor_id = ids.instructor_id
JOIN 
    driving_schools ds ON ids.driving_school_id = ds.id
JOIN 
    cities c ON ds.city_id = c.id
GROUP BY 
    i.id, c.name
HAVING count(s.id) > 1
ORDER BY students_count DESC, i.first_name ;

SELECT c.`name`, count(i.id) as instructors_count from cities c
join driving_schools ds on ds.city_id = c.id
join instructors_driving_schools ids ON ds.id = ids.driving_school_id
join instructors i on ids.instructor_id = i.id
GROUP BY c.`name`
HAVING instructors_count > 0
ORDER BY instructors_count desc;

SELECT 
    CONCAT(first_name, " ", last_name) AS full_name,
    (
        CASE
            WHEN YEAR(has_a_license_from) >= 1980 and  YEAR(has_a_license_from) < 1990 THEN "Specialist"
            WHEN YEAR(has_a_license_from) < 2000 THEN "Advanced"
            WHEN YEAR(has_a_license_from) < 2008 THEN "Experienced"
			WHEN YEAR(has_a_license_from) < 2015 THEN "Qualified"
			WHEN YEAR(has_a_license_from) < 2020 then "Provisional"
            ELSE "Trainee"
        END
    ) AS level 
FROM 
    instructors
order by year(has_a_license_from), first_name;


SELECT c.`name`, round(avg(ds.average_lesson_price), 2) as average_lesson_price 
from cities c
join driving_schools ds ON c.id = ds.city_id
where c.`name` = 'London';

DELIMITER $$

CREATE FUNCTION udf_average_lesson_price_by_city(city_name VARCHAR(40))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE average_price DECIMAL(10, 2);
    SELECT ROUND(AVG(ds.average_lesson_price), 2)
    INTO average_price
    FROM cities c
    JOIN driving_schools ds ON c.id = ds.city_id
    WHERE c.`name` = city_name;
    RETURN average_price;
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE udp_find_school_by_car(IN brand VARCHAR(20))
BEGIN
    SELECT ds.`name`, ds.average_lesson_price
    FROM driving_schools ds
    JOIN cars c ON ds.car_id = c.id
    WHERE c.brand = brand
    ORDER BY ds.average_lesson_price DESC;
END$$

DELIMITER ;


