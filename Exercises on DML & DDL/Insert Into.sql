# 1. Write a SQL statement to insert a record with your own value into the table countries against each columns.
SELECT * FROM countries;

INSERT INTO countries
VALUES ("PL", "Poland", 1);

# 2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.
SELECT * FROM countries;

INSERT INTO countries (country_id, country_name)
VALUES ("RU", "Russia");

# 3. Write a SQL statement to create duplicate of countries table named country_new with all structure and data.
CREATE TABLE IF NOT EXISTS country_new AS
SELECT * FROM countries;

SELECT * FROM country_new;

# 4. Write a SQL statement to insert NULL values against region_id column for a row of countries table. 
INSERT INTO countries(country_id, country_name, region_id)
VALUES ("CZ", "Czechia", null);

SELECT * FROM countries;

# 5. Write a SQL statement to insert 3 rows by a single insert statement. 
INSERT INTO countries
VALUES ("C1", "Country1", null), ("C2", "Country2", null), ("C3", "Country3", null);

SELECT * FROM countries;

# 6. Write a SQL statement insert rows from country_new table to countries table.
INSERT INTO countries 
SELECT * FROM country_new;

# 7. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
CREATE TABLE IF NOT EXISTS jobs2 ( 
JOB_ID integer NOT NULL UNIQUE , 
JOB_TITLE varchar(35) NOT NULL, 
MIN_SALARY decimal(6,0)
);

INSERT INTO jobs2 VALUES(1001,'OFFICER',8000);

SELECT * FROM jobs2;

# 8. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.
CREATE TABLE IF NOT EXISTS countries2 ( 
COUNTRY_ID integer NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID)
);

INSERT INTO countries2 VALUES(501,'India',185);

# 9. Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.
CREATE TABLE IF NOT EXISTS countries3 ( 
COUNTRY_ID integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL
);

INSERT INTO countries3 (country_name, region_id)
VALUES("Country1", 1);

SELECT * FROM countries3;

# 10. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be 
#     automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.
CREATE TABLE IF NOT EXISTS countries4 ( 
COUNTRY_ID integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL DEFAULT "N/A",
REGION_ID integer NOT NULL
);
INSERT INTO countries4 (region_id)
VALUES (1);

SELECT * FROM countries4;

# 11. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.
CREATE TABLE IF NOT EXISTS jobs3 ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT 20000
);

INSERT INTO jobs3(JOB_ID,JOB_TITLE) VALUES(1001,'OFFICER');
INSERT INTO jobs3(JOB_ID,JOB_TITLE) VALUES(1002,'CLERK');

CREATE TABLE job_history2 ( 
EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
JOB_ID integer NOT NULL, 
DEPARTMENT_ID integer DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs3(job_id)
);

INSERT INTO job_history2
VALUES (111, 1001, 2);