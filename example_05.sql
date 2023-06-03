-- Write and execute suitable database triggers . 
-- Consider row level and statement level triggers.

-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade VARCHAR(3)
);

-- Create the row-level trigger
delimiter //

CREATE TRIGGER t1 BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    SET NEW.grade = UPPER(NEW.grade);
END;
//


CREATE TRIGGER t2 BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
 IF (NEW.grade NOT IN ('A', 'B', 'C', 'D', 'E')) THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid grade';
 END IF;
END;
//

select * from Student