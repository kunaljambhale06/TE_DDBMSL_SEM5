-- Create a view named EMP_SALARY_VIEW that displays the employee name, department name, 
-- and annual salary (12 × monthly salary) of all employees. 
-- Then, write a query to display employees whose annual salary is greater than 500,000. 
-- Must use a Join between EMP and Dept tables then calculate the annual salary in view.

CREATE TABLE DEPT (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE EMP (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    dept_id INT,
    monthly_salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES DEPT(dept_id)
);


-- Department table
INSERT INTO DEPT VALUES
(10, 'SALES'),
(20, 'HR'),
(30, 'IT'),
(40, 'MARKETING');

-- Employee table
INSERT INTO EMP VALUES
(101, 'Amit', 10, 45000),
(102, 'Riya', 20, 38000),
(103, 'Karan', 30, 52000),
(104, 'Sneha', 10, 60000),
(105, 'Neha', 40, 30000);


CREATE VIEW EMP_SALARY_VIEW AS
SELECT 
    e.emp_name AS Employee_Name,
    d.dept_name AS Department,
    (e.monthly_salary * 12) AS Annual_Salary
FROM EMP e
JOIN DEPT d
ON e.dept_id = d.dept_id;


SELECT * FROM EMP_SALARY_VIEW;


SELECT * 
FROM EMP_SALARY_VIEW
WHERE Annual_Salary > 500000;
