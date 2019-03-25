# 1. Write a query to display the first day of the month (in datetime format) three months before the current month. Sample current date : 2014-09-03; Expected result : 2014-06-01.
SELECT CURDATE() - INTERVAL 3 MONTH - INTERVAL DAY(CURDATE()) - 1 DAY;

SELECT DATE((PERIOD_ADD(EXTRACT(YEAR_MONTH FROM CURDATE()), -3)*100)+1);

# 2. Write a query to display the last day of the month (in datetime format) three months before the current month.
SELECT CURDATE() - INTERVAL 2 MONTH - INTERVAL DAY(CURDATE()) DAY;

SELECT SUBDATE(ADDDATE(CURDATE(), INTERVAL -3 MONTH), INTERVAL DAY(CURDATE()) DAY);

# 3. Write a query to get the distinct Mondays from hire_date in employees tables.
SELECT hire_date
FROM employees
WHERE DAYOFWEEK(hire_date) = 2;

SELECT DAYNAME(hire_date)
FROM employees
WHERE DAYNAME(hire_date) = "Monday";

# 4. Write a query to get the first day of the current year.
SELECT MAKEDATE(YEAR(CURDATE()), 1);

SELECT DATE((((YEAR(CURDATE())*100)+1)*100)+1);

# 5. Write a query to get the last day of the current year.
SELECT CURDATE() + INTERVAL 1 YEAR - INTERVAL MONTH(CURDATE()) - 1 MONTH - INTERVAL DAY(CURDATE()) DAY;

SELECT CURDATE()-INTERVAL DAYOFYEAR(CURDATE()) DAY + INTERVAL 1 YEAR;

# 6. Write a query to calculate the age in year.

SELECT YEAR(CURDATE()) - YEAR("1991-11-25") - (RIGHT(CURDATE(), 5) < RIGHT("1991-11-25", 5)) AS Age;

# 7. Write a query to get the current date in the following format. Sample date : 2014-09-04; Output : September 4, 2014
SELECT CONCAT(MONTHNAME(CURDATE())," ", DAY(CURDATE()),", ", YEAR(CURDATE()));

SELECT DATE_FORMAT(CURDATE(), "%M %e, %Y");

# 8. Write a query to get the current date in Thursday September 2014 format. Thursday September 2014

SELECT DATE_FORMAT(CURDATE(), "%W %M %Y");

# 9. Write a query to extract the year from the current date.
SELECT YEAR(CURDATE());

SELECT EXTRACT(YEAR FROM  NOW());

# 10. Write a query to get the DATE value from a given day (number in N). Sample days: 730677; Output : 2000-07-11

SELECT FROM_DAYS(730677);

# 11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'

SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1987-06-01' AND '1987-07-30';

# 12. Write a query to display the current date in the following format. Sample output: Thursday 4th September 2014 00:00:00

SELECT DATE_FORMAT(CURDATE(), "%W %D %M %Y %T"); #"%W %D %M %Y %H:%i:%s"

# 13. Write a query to display the current date in the following format. Sample output: 05/09/2014
SELECT DATE_FORMAT(CURDATE(), "%d/%m/%Y");

# 14. Write a query to display the current date in the following format. Sample output: 12:00 AM Sep 5, 2014
SELECT DATE_FORMAT(CURDATE(), "%l:%i %p %b %e, %Y"); #"%r %b %d %e, %Y"

# 15. Write a query to get the firstname, lastname who joined in the month of June.
SELECT first_name, last_name
FROM employees
WHERE MONTHNAME(hire_date) = "June";

# 16. Write a query to get the years in which more than 10 employees joined.
SELECT DISTINCT YEAR(hire_date)
FROM employees
GROUP BY YEAR(hire_date)
HAVING COUNT(EMPLOYEE_ID) > 10;

# 17. Write a query to get first name of employees who joined in 1987.

SELECT first_name
FROM employees
WHERE YEAR(hire_date) = "1987";

# 18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
SELECT DISTINCT department_name, e.first_name, e.last_name, e.salary, YEAR(CURDATE()) - YEAR(e.hire_date) - (RIGHT(CURDATE(), 5) < RIGHT(e.hire_date, 5)) Experience
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE (YEAR(CURDATE()) - YEAR(e.hire_date) - (RIGHT(CURDATE(), 5) < RIGHT(e.hire_date, 5))) > 5;

SELECT DISTINCT department_name, e.first_name, e.last_name, e.salary, YEAR(CURDATE()) - YEAR(e.hire_date) - (RIGHT(CURDATE(), 5) < RIGHT(e.hire_date, 5)) Experience
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE TIMESTAMPDIFF(YEAR, e.hire_date, CURDATE()) > 5; #DATEDIFF(CURDATE(), e.hire_date) > 5

# 19. Write a query to get employee ID, last name, and date of first salary of the employees.
SELECT employee_id, last_name, hire_date, LAST_DAY(hire_date)
FROM employees;

# 20. Write a query to get first name, hire date and experience of the employees.
SELECT first_name, hire_date, YEAR(CURDATE()) - YEAR(hire_date) - (RIGHT(CURDATE(), 5) < RIGHT(hire_date, 5)) Experience
FROM employees;

# 21. Write a query to get the department ID, year, and number of employees joined.
SELECT department_id, YEAR(hire_date), COUNT(employee_id)
FROM employees
GROUP BY department_id, YEAR(hire_date)
ORDER BY department_id