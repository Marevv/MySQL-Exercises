# 1.Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id.
CREATE TABLE IF NOT EXISTS Countries (
country_id int, 
country_name varchar(255), 
region_id int);

# 2.Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.
CREATE TABLE IF NOT EXISTS Countries(
country_id int,
country_name varchar(255),
region_id int);

# 3.Write a SQL statement to create the structure of a table dup_countries similar to countries. 
CREATE TABLE IF NOT EXISTS dup_countries
LIKE Countries;

# 4.Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.
CREATE TABLE IF NOT EXISTS dup_countries AS
SELECT * FROM countries;

# 5.Write a SQL statement to create a table countries set a constraint NOT NULL. 
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL,
country_name varchar(255) NOT NULL,
region_id int NOT NULL);

# 6.Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000. 
CREATE TABLE IF NOT EXISTS jobs (
job_id int NOT NULL,
job_tittle varchar(255) NOT NULL,
min_salary decimal(6,0),
max_salary decimal(6,0)
CHECK (max_salary<=25000));

# 7.Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE IF NOT EXISTS countries(
country_id int NOT NULL,
country_name varchar(255) NOT NULL CHECK (country_name IN('Italy', 'India', 'China')),
region_id int NOT NULL);

# 8.Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
CREATE TABLE IF NOT EXISTS job_history (
employee_id int NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL CHECK (end_date LIKE('--/--/----')),
job_id int NOT NULL,
department_id int NOT NULL);

# 9.Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL,
country_name varchar(255) NOT NULL,
region_id int NOT NULL,
UNIQUE(country_id));

# 10.Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE IF NOT EXISTS jobs (
job_id int NOT NULL UNIQUE PRIMARY KEY,
job_title varchar(255) NOT NULL DEFAULT ' ',
min_salary decimal(6,0) DEFAULT 8000,
max_slaray decimal(6,0) DEFAULT NULL);

# 11.Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL UNIQUE PRIMARY KEY,
country_name varchar(255) NOT NULL,
region_id int NOT NULL);

# 12.Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value. 
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
country_name varchar(255) NOT NULL,
region_id int NOT NULL);

# 13.Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.
CREATE TABLE IF NOT EXISTS countries (
country_id int NOT NULL UNIQUE DEFAULT '',
country_name varchar(255) NOT NULL,
region_id int NOT NULL,
PRIMARY KEY(country_id, region_id));

/* 14.Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, 
the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table. */
CREATE TABLE IF NOT EXISTS job_history (
employee_id int NOT NULL PRIMARY KEY,
start_date date NOT NULL,
end_date date NOT NULL,
job_id int NOT NULL,
department_id int DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id));

/* 15.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id 
and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only 
those unique combination values, which combinations are exists in the departments table. */
CREATE TABLE IF NOT EXISTS departments(
department_id decimal(4,0) NOT NULL,
department_name varchar(30) DEFAULT NULL,
manager_id decimal (6,0) NOT NULL,
location_id decimal (4,0) DEFAULT NULL,
PRIMARY KEY(department_id, manager_id));

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
email varchar(255) NOT NULL,
phone_number varchar(20) DEFAULT NULL,
hire_date date NOT NULL,
job_id decimal(4,0) NOT NULL,
salary varchar(255) NOT NULL,
commission varchar(255) NOT NULL,
manager_id decimal (6,0) NOT NULL,
department_id decimal(4,0) NOT NULL,
FOREIGN KEY (department_id, manager_id) REFERENCES departments(department_id, manager_id));

/* 16.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id 
and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, 
can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, 
can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. */

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) DEFAULT NULL,
last_name varchar(255) NOT NULL,
email varchar(255) NOT NULL,
phone_number varchar(20) DEFAULT NULL,
hire_date date NOT NULL,
job_id int NOT NULL,
salary varchar(255) DEFAULT NULL,
commission varchar(255) DEFAULT NULL,
manager_id decimal (6,0) DEFAULT NULL,
department_id decimal(4,0) DEFAULT NULL,
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
)ENGINE=InnoDB;

/* 17.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column 
does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only 
those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON UPDATE CASCADE action 
allows you to perform cross-table update and ON DELETE RESTRICT action reject the deletion. The default action is ON DELETE RESTRICT. */

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) DEFAULT NULL,
last_name varchar(255) NOT NULL,
job_id int NOT NULL,
salary int DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

/* 18.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain 
any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 
The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that 
refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.*/

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) DEFAULT NULL,
last_name varchar(255) NOT NULL,
job_id int NOT NULL,
salary int DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
ON DELETE CASCADE ON UPDATE RESTRICT
)ENGINE=InnoDB;

/* 19.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not 
contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are 
exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key 
column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must 
accept NULL values and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.*/

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) DEFAULT NULL,
last_name varchar(255) NOT NULL,
job_id int,
salary int DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
ON DELETE SET NULL
ON UPDATE SET NULL
)ENGINE=InnoDB;

/* 20.Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain 
any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 
The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.*/

CREATE TABLE IF NOT EXISTS employees (
employee_id int NOT NULL PRIMARY KEY,
first_name varchar(255) DEFAULT NULL,
last_name varchar(255) NOT NULL,
job_id int NOT NULL,
salary int DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
)ENGINE=InnoDB;

DROP TABLE countries;
DROP TABLE dup_countries;
DROP TABLE jobs;
DROP TABLE job_history;
DROP TABLE employees;
DROP TABLE departments;