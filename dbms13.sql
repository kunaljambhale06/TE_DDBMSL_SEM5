-- Write a PL/SQL block to accept the name and marks of a student, and display their grade based 
-- on the following: 
--  Marks ≥ 90 → Grade A  
--  Marks ≥ 75 → Grade B  
--  Marks ≥ 60 → Grade C  
--  Else → Grade F  


DELIMITER $$

CREATE PROCEDURE calc_grade(IN stud_name VARCHAR(30), IN marks INT)
BEGIN
    DECLARE grade CHAR(1);

    -- Grade logic
    IF marks >= 90 THEN
        SET grade = 'A';
    ELSEIF marks >= 75 THEN
        SET grade = 'B';
    ELSEIF marks >= 60 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'F';
    END IF;

    -- Display result
    SELECT CONCAT('Student Name: ', stud_name) AS Student,
           CONCAT('Marks: ', marks) AS Marks,
           CONCAT('Grade: ', grade) AS Grade;
END $$

DELIMITER ;



CALL calc_grade('Amit', 92);
CALL calc_grade('Riya', 78);
CALL calc_grade('Karan', 61);
CALL calc_grade('Sneha', 55);
