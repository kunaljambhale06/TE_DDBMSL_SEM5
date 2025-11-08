-- Problem Statement: Design following SQL DML statements: 
-- Create a university/college database containing following tables- 
-- Student (stud_idi, deptnm, sem, name, yr, credits) 
-- Teaches (teacher_id, teacher_name, salary, deptnm) 
-- 1. Insert records into all tables. 
-- 2. Update record on student tables as department name comp to IT. 
-- 3. Find the department that has highest or average salary 
-- 4. Delete the records of all teacher with salary below 2000. 
-- 5. Find the sum of salary of each department(use groupby). 

CREATE TABLE Student(
    stud_id INT PRIMARY KEY,
    deptnm VARCHAR(20),
    sem INT,
    name VARCHAR(20),
    yr INT,
    credits INT
);

CREATE TABLE Teaches(
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(20),
    salary INT,
    deptnm VARCHAR(20)
);

-- 1. Insert records
INSERT INTO Student VALUES (1,'COMP',3,'Riya',2024,30);
INSERT INTO Teaches VALUES (10,'Meena',35000,'COMP');

-- 2. Update
UPDATE Student SET deptnm='IT' WHERE deptnm='COMP';

-- 3. Highest or average salary
SELECT deptnm, MAX(salary), AVG(salary) FROM Teaches GROUP BY deptnm;

-- 4. Delete teachers below 2000
DELETE FROM Teaches WHERE salary<2000;

-- 5. Sum of salary per department
SELECT deptnm, SUM(salary) FROM Teaches GROUP BY deptnm;
