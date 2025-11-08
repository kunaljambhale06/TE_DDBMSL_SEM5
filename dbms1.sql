-- Problem Statement: Design and Develop SQL DDL statements on Schema given. 
-- Schema: 
-- employee_master (emp_id,first name,middle,last name,department,manager id.) 
-- branch_master (branch id ,branch name) 
-- 1. Insert records in branch_master 
-- 2. Insert records in employee_master. 
-- 3. Create index on emp_name column of employee_master. 
-- 4. Create a view containing employee details 




-- 1. Insert records in branch_master
CREATE TABLE branch_master(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(20)
);

INSERT INTO branch_master VALUES (1, 'Pune'), (2, 'Mumbai');

-- 2. Insert records in employee_master
CREATE TABLE employee_master(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    middle VARCHAR(20),
    last_name VARCHAR(20),
    department VARCHAR(20),
    manager_id INT
);

INSERT INTO employee_master VALUES
(101, 'Amit', 'K', 'Patil', 'IT', 201),
(102, 'Neha', 'S', 'Shah', 'HR', 202);

-- 3. Create index
CREATE INDEX emp_name_index ON employee_master(first_name);

-- 4. Create view
CREATE VIEW emp_view AS
SELECT emp_id, first_name, last_name, department FROM employee_master;
