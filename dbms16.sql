-- A company wants to give a 10% salary hike to all employees working in the ‘SALES’ department. 
-- The table used is EMP(emp_id, emp_name, dept, salary). 
-- Tasks: 
-- 1. Start a transaction to update the salary of employees in the ‘SALES’ department by 10%.  
-- 2. Before committing, display the updated records.  
-- 3. Then rollback the transaction and verify that the changes are undone.  
-- 4. Repeat the update and commit it permanently this time.  
-- 5. Use a savepoint after updating two employees and demonstrate rollback to that savepoint. 

CREATE TABLE EMP (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    dept VARCHAR(20),
    salary DECIMAL(10,2)
);

INSERT INTO EMP VALUES
(101, 'Amit', 'SALES', 40000),
(102, 'Riya', 'SALES', 45000),
(103, 'Karan', 'IT', 50000),
(104, 'Sneha', 'HR', 38000),
(105, 'Neha', 'SALES', 42000);


-- Begin the transaction
START TRANSACTION;

-- Give 10% salary hike to all employees in SALES
UPDATE EMP
SET salary = salary * 1.10
WHERE dept = 'SALES';

-- Show updated records (changes not committed yet)
SELECT * FROM EMP WHERE dept = 'SALES';




ROLLBACK;

-- Verify rollback: all salaries should return to original
SELECT * FROM EMP WHERE dept = 'SALES';






START TRANSACTION;

-- Reset for demonstration (optional): Give additional 10% hike again
UPDATE EMP SET salary = salary * 1.10 WHERE dept = 'SALES';

-- Savepoint after updating first two employees manually
UPDATE EMP SET salary = salary * 1.10 WHERE emp_id = 101;
UPDATE EMP SET salary = salary * 1.10 WHERE emp_id = 102;
SAVEPOINT after_two;

-- Update one more employee
UPDATE EMP SET salary = salary * 1.10 WHERE emp_id = 105;

-- Show all SALES employees (before partial rollback)
SELECT * FROM EMP WHERE dept = 'SALES';

-- Rollback to the savepoint (undo Neha’s update only)
ROLLBACK TO after_two;

-- Display after partial rollback
SELECT * FROM EMP WHERE dept = 'SALES';

-- Commit remaining updates
COMMIT;

-- Final verification
SELECT * FROM EMP WHERE dept = 'SALES';
