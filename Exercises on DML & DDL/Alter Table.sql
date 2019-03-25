# 1. Write a SQL statement to rename the table countries to country_new. 
RENAME TABLE countries TO country_new;

ALTER TABLE countries RENAME country_new;

# 2. Write a SQL statement to add a column region_id to the table locations.
ALTER TABLE locations
ADD region_id INT;

# 3. Write a SQL statement to add a columns ID as the first column of the table locations.
ALTER TABLE locations
ADD ID INT FIRST;

# 4. Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE locations
ADD region_id INT 
AFTER state_province;

# 5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE locations
MODIFY COLUMN country_id INT;

# 6. Write a SQL statement to drop the column city from the table locations.
ALTER TABLE locations
DROP COLUMN city;

# 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same. 
ALTER TABLE locations
CHANGE STATE_PROVINCE STATE varchar(25);

# 8. Write a SQL statement to add a primary key for the columns location_id in the locations table. 
ALTER TABLE locations
ADD PRIMARY KEY(location_id);

# 9. Write a SQL statement to add a primary key for a combination of columns location_id and country_id. 
ALTER TABLE locations
ADD PRIMARY KEY(location_id, country_id);

# 10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
ALTER TABLE locations
DROP PRIMARY KEY;

# 11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
ALTER TABLE job_history
ADD FOREIGN KEY(job_id) REFERENCES jobs(job_id);

# 12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table. 
ALTER TABLE job_history
ADD CONSTRAINT fk_job_id FOREIGN KEY(job_id)
REFERENCES jobs(job_id);

# 13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
ALTER TABLE job_history
DROP FOREIGN KEY fk_job_history;

# 14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
ALTER TABLE job_history
ADD INDEX indx_job_id(job_id);

# 15. Write a SQL statement to drop the index indx_job_id from job_history table.
ALTER TABLE job_history
DROP INDEX indx_job_id;
