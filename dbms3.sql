-- Emp( empId int ,empName varchar(10),empSal int ,empDeptId int) 
-- Dept(deptId int, deptName varchar(10)) 
-- Set appropriate primary key and Foreign key. 
-- 1. Create table Emp(empID) and Dept(deptID). 
-- 2. Add Not Null constraint to empName. 
-- 3. Insert few Record. 
-- 4. Add Unique to deptLoc. 
-- 5. Add column deptloc varchar(10) to dept table.



CREATE TABLE Dept(
    deptId INT PRIMARY KEY,
    deptName VARCHAR(20)
);

CREATE TABLE Emp(
    empId INT PRIMARY KEY,
    empName VARCHAR(20) NOT NULL,
    empSal INT,
    empDeptId INT,
    FOREIGN KEY (empDeptId) REFERENCES Dept(deptId)
);

-- Insert Records
INSERT INTO Dept VALUES (10,'HR'), (20,'IT');
INSERT INTO Emp VALUES (1,'Amit',25000,10),(2,'Riya',30000,20);

-- Add Unique column
ALTER TABLE Dept ADD UNIQUE(deptName);

-- Add new column
ALTER TABLE Dept ADD deptLoc VARCHAR(10);
