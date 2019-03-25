# 1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT DISTINCT d.department_id, d.department_name, l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM departments d 
JOIN locations l  ON d.location_id = l.location_id 
JOIN countries c ON l.country_id = c.country_id;

# 2.Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;

# 3.Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e 
JOIN departments d ON e.department_id=d.department_id 
JOIN locations l ON  d.location_id=l.location_id
WHERE l.city="London";

# 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT e.employee_id, e.last_name, e.manager_id, m.last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id=m.employee_id;

# 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees jones ON jones.last_name = "Jones"
WHERE jones.hire_date < e.hire_date;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = "Jones");

# 6. Write a query to get the department name and number of employees in the department.
SELECT d.department_name, COUNT(*) "Number of employees"
FROM departments d
JOIN employees e ON e.department_id=d.department_id
GROUP BY d.department_name
ORDER BY department_name;

# 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
SELECT jh.employee_id, j.job_title, DATEDIFF(jh.end_date, jh.start_date) "Days"
FROM job_history jh
JOIN jobs j ON jh.job_id=j.job_id
WHERE jh.department_id = 90;

# 8. Write a query to display the department ID and name and first name of manager.
SELECT d.department_id, d.department_name, e.first_name
FROM departments d
JOIN employees e ON d.manager_id=e.employee_id;

# 9. Write a query to display the department name, manager name, and city.
SELECT d.department_name, CONCAT(e.first_name, " ", e.last_name) name, l.city
FROM departments d
JOIN employees e ON d.manager_id=e.employee_id
JOIN locations l ON d.location_id=l.location_id;

# 10. Write a query to display the job title and average salary of employees.
SELECT j.job_title, ROUND(AVG(e.salary)) "Average salary"
FROM jobs j
JOIN employees e USING (job_id)
GROUP BY j.job_title;

# 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT job_title, CONCAT(first_name, " ", last_name) name, salary - min_salary
FROM employees
NATURAL JOIN jobs;

# 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT  jh.*
FROM job_history jh
JOIN employees e ON jh.employee_id = e.employee_id
WHERE e.salary > 10000;

# 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT department_name, CONCAT(e.first_name, " ", e.last_name) Name, e.hire_date, e.salary, ROUND(DATEDIFF(NOW(), e.hire_date)/365) Years
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE DATEDIFF(NOW(), e.hire_date)/365 > 15;
