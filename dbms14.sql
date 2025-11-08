-- Write a PL/SQL block to update the salary of employees by 10% whose department is 'SALES'. 
-- Use a cursor FOR loop. 

CREATE TABLE EMP (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    dept_name VARCHAR(20),
    salary DECIMAL(10,2)
);

INSERT INTO EMP VALUES
(101, 'Amit', 'SALES', 40000),
(102, 'Riya', 'HR', 35000),
(103, 'Karan', 'SALES', 50000),
(104, 'Sneha', 'IT', 60000),
(105, 'Neha', 'SALES', 45000);

DELIMITER $$

CREATE PROCEDURE update_sales_salary()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_sal DECIMAL(10,2);

    -- Cursor for all employees in SALES department
    DECLARE cur CURSOR FOR
        SELECT emp_id, salary FROM EMP WHERE dept_name = 'SALES';

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_id, v_sal;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Increase salary by 10%
        UPDATE EMP
        SET salary = v_sal * 1.10
        WHERE emp_id = v_id;
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;


CALL update_sales_salary();


SELECT * FROM EMP;
