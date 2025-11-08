--Emp( empId int ,empName varchar(10),empSal int ,empDeptId int) Dept(deptId int, deptName varchar(10)) 
-- 1. Insert few Record. 
-- 2. List employees belonging to department 30, 40, or 10 
-- 3. List the employee details whose salary is between 10000 to 30000. 
-- 4. List total no of employee. 
-- 5. List average sal of each deptID. 
-- 6. List employee details in ascending order of salary make table and input some values

CREATE TABLE Dept (
    deptId INT PRIMARY KEY,
    deptName VARCHAR(10)
);

CREATE TABLE Emp (
    empId INT PRIMARY KEY,
    empName VARCHAR(10),
    empSal INT,
    empDeptId INT,
    FOREIGN KEY (empDeptId) REFERENCES Dept(deptId)
);

-- Department Records
INSERT INTO Dept VALUES
(10, 'HR'),
(20, 'Sales'),
(30, 'IT'),
(40, 'Admin');

-- Employee Records
INSERT INTO Emp VALUES
(101, 'Amit', 25000, 10),
(102, 'Riya', 18000, 20),
(103, 'Karan', 32000, 30),
(104, 'Sneha', 12000, 40),
(105, 'Vivek', 28000, 30),
(106, 'Neha', 15000, 10);

SELECT * 
FROM Emp
WHERE empDeptId IN (10, 30, 40);

SELECT * 
FROM Emp
WHERE empSal BETWEEN 10000 AND 30000;

SELECT COUNT(*) AS Total_Employees
FROM Emp;


SELECT empDeptId, AVG(empSal) AS Avg_Salary
FROM Emp
GROUP BY empDeptId;


SELECT * 
FROM Emp
ORDER BY empSal ASC;
