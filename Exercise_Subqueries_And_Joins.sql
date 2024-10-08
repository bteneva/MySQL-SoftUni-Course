
SELECT `employee_id`, `job_title`, e.`address_id`, a.`address_text`
FROM `employees` as e 
JOIN addresses as a ON a.`address_id` = e.`address_id`
ORDER BY address_id;

SELECT e.first_name, e.last_name, t.`name` as town, a.address_text
FROM employees as e
JOIN addresses as a ON a.address_id = e.address_id
JOIN towns as t ON t.town_id = a.town_id
ORDER BY first_name, last_name
Limit 5;

SELECT employee_id, first_name, last_name, d.`name` as department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.`name` = "Sales"
ORDER BY employee_id DESC;

SELECT employee_id, first_name, salary, d.`name` as department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

SELECT e.employee_id, e.first_name
FROM employees e
LEFT JOIN employees_projects as ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC;

SELECT first_name, last_name, DATE_FORMAT(hire_date, '%Y-%m-%d %H:%i:%s') AS hire_date, d.`name` as dept_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE hire_date > '1999-01-01'
AND (d.`name` = "Finance" OR d.`name` = "Sales")
ORDER BY hire_date;


SELECT e.employee_id, e.first_name, p.`name`
FROM employees e
JOIN employees_projects ep ON ep.employee_id = e.employee_id
JOIN projects p ON p.project_id = ep.project_id
WHERE ep.project_id IS NOT NULL
AND p.start_date > '2002-08-13' -- Corrected date format
AND p.end_date IS NULL
ORDER BY e.first_name, p.`name`;

SELECT e.employee_id, e.first_name, e.manager_id, m.first_name as manager_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.manager_id = 3 OR e.manager_id = 7
ORDER BY e.first_name;


SELECT e.employee_id, concat(e.first_name, " ", e.last_name) as employee_name,
concat(m.first_name, " ", m.last_name) as manager_name, d.`name` as department_name
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.employee_id
LIMIT 5;

SELECT AVG(e.salary) as average_salary
FROM employees as e
group by e.department_id
order by average_salary
Limit 1;

-- USE geography;

SELECT  c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
JOIN mountains m ON mc.mountain_id = m.id
JOIN peaks p ON m.id = p.mountain_id
WHERE c.country_code = "BG"
AND p.elevation > 2835
ORDER BY p.elevation DESC;

SELECT c.country_code, COUNT(mc.mountain_id) AS mountain_range_count
FROM countries c
JOIN mountains_countries mc ON c.country_code = mc.country_code
GROUP BY c.country_code
HAVING c.country_code IN ('BG', 'RU', 'US')
ORDER BY mountain_range_count DESC;


SELECT c.country_name, r.river_name
FROM countries c 
LEFT JOIN countries_rivers cr ON c.country_code = cr.country_code
LEFT JOIN rivers r ON cr.river_id= r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name 
LIMIT 5;

SELECT 
    continent_code, currency_code, COUNT(*) AS currency_usage
FROM
    countries AS c
GROUP BY continent_code , currency_code
HAVING currency_usage > 1
    AND currency_usage = (SELECT 
        COUNT(*) AS count
    FROM
        countries AS c2
    WHERE
        c2.continent_code = c.continent_code
    GROUP BY c2.currency_code
    ORDER BY count DESC
    LIMIT 1)
ORDER BY c.continent_code , c.continent_code;


SELECT count(c.country_code) as country_count
FROM countries c
LEFT JOIN mountains_countries ms ON c.country_code = ms.country_code
WHERE ms.country_code is null;

SELECT c.country_name, max(p.elevation) as highest_peak_elevation, 
MAX(r.length) AS 'longest_river_length'
FROM countries AS c
        LEFT JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
        LEFT JOIN
    peaks AS p ON mc.mountain_id = p.mountain_id
        LEFT JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
        LEFT JOIN
    rivers AS r ON cr.river_id = r.id
group by c.country_name
ORDER BY highest_peak_elevation DESC , longest_river_length DESC , c.country_name
LIMIT 5;












