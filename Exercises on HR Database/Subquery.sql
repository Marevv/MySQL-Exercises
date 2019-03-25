# 1.Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name="Bull");

# 2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = "IT");

# 3. Write a query to find the name (first_name, last_name) of the employees who are a manager and worked in a USA based department.
SELECT first_name, last_name 
FROM employees 
WHERE manager_id 
IN (SELECT employee_id FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (SELECT location_id FROM locations WHERE country_id='US')));

# 4. Write a query to find the name (first_name, last_name) of the employees who are managers.
SELECT first_name, last_name
FROM employees
WHERE employee_id IN (SELECT manager_id FROM employees);

# 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

# 6. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.
SELECT first_name, last_name, salary, job_id
FROM employees
WHERE salary 
IN (SELECT min_salary FROM jobs WHERE employees.job_id = jobs.job_id);

# 7. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM departments WHERE department_name LIKE "IT%");

# 8. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = "Bell");

# 9. Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

# 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > ALL(SELECT AVG(salary) FROM employees GROUP BY department_id);

# 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest.
SELECT first_name, last_name, salary
FROM employees
WHERE salary > ALL(SELECT salary FROM employees WHERE job_id="SH_CLERK")
ORDER BY salary;

# 12. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.
SELECT first_name, last_name
FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id FROM employees);

SELECT b.first_name,b.last_name 
FROM employees b 
WHERE NOT EXISTS (SELECT 'X' FROM employees a WHERE a.manager_id = b.employee_id);

# 13. Write a query to display the employee ID, first name, last name, and department names of all employees.
SELECT e.employee_id, e.first_name, e.last_name, (SELECT d.department_name FROM departments d WHERE e.department_id = d.department_id) department
FROM employees e;

# 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary >
(SELECT AVG(e2.salary) FROM employees e2 WHERE e2.department_id = e.department_id GROUP BY e2.department_id);

# 15. Write a query to fetch even numbered records from employees table.
SET @i = 0;
SELECT i, employee_id
FROM (SELECT @i := @i + 1 AS i, employee_id FROM employees) as a
WHERE MOD(a.i, 2) = 0;

# 16. Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 4,1;

SELECT DISTINCT salary 
FROM employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) 
FROM employees  e2 
WHERE e2.salary >= e1.salary);

# 17. Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT salary
FROM employees
ORDER BY salary
LIMIT 3,1;

SELECT DISTINCT salary
FROM employees e1
WHERE 4 = (SELECT COUNT(DISTINCT salary) FROM employees e2 WHERE e2.salary <= e1.salary);

# 18. Write a query to select last 10 records from a table.
SELECT *
FROM employees
ORDER BY employee_id DESC
LIMIT 10;

# 19. Write a query to list the department ID and name of all the departments where no employee is working.
SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (SELECT DISTINCT department_id FROM employees);

# 20. Write a query to get 3 maximum salaries.
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT DISTINCT salary 
FROM employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) 
FROM employees b 
WHERE b.salary >= a.salary) 
ORDER BY a.salary DESC;

# 21. Write a query to get 3 minimum salaries.

SELECT DISTINCT salary
FROM employees
ORDER BY salary
LIMIT 3;

SELECT DISTINCT salary 
FROM employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) 
FROM employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;

# 22. Write a query to get nth max salaries of employees.
SET @n = 5;
SELECT DISTINCT salary
FROM employees emp1
WHERE (@n) = (
SELECT COUNT(DISTINCT(emp2.salary))
FROM employees emp2
WHERE emp2.salary > emp1.salary);