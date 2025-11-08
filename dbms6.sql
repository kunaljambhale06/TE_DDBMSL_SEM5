-- 1) Create tables
CREATE TABLE Stud_Marks (
    name VARCHAR(30),
    total_marks INT
);

CREATE TABLE Result (
    Roll INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(30),
    Class VARCHAR(30)
);

-- 2) Insert sample data
INSERT INTO Stud_Marks VALUES
('Amit', 1450),
('Riya', 980),
('Karan', 860),
('Sneha', 820),
('Neha', 760);

-- 3) Create stored procedure
DELIMITER $$

CREATE PROCEDURE proc_Grade()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_name VARCHAR(30);
    DECLARE s_marks INT;
    DECLARE s_class VARCHAR(30);

    DECLARE stud_cursor CURSOR FOR 
        SELECT name, total_marks FROM Stud_Marks;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN stud_cursor;

    read_loop: LOOP
        FETCH stud_cursor INTO s_name, s_marks;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;

        IF s_marks BETWEEN 990 AND 1500 THEN
            SET s_class = 'Distinction';
        ELSEIF s_marks BETWEEN 900 AND 989 THEN
            SET s_class = 'First Class';
        ELSEIF s_marks BETWEEN 825 AND 899 THEN
            SET s_class = 'Higher Second Class';
        ELSE
            SET s_class = 'Fail';
        END IF;

        INSERT INTO Result (Name, Class) VALUES (s_name, s_class);
    END LOOP;

    CLOSE stud_cursor;
END $$

DELIMITER ;

-- 4) Execute the procedure
CALL proc_Grade();

-- 5) See the results
SELECT * FROM Result;
