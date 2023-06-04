-- Write a PL/SQL block to implement all types of cursor


-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade float
);

-- Insert some mock data
 INSERT INTO Student VALUES (1, 'Om', 90.45);
 INSERT INTO Student VALUES (2, 'Vaibhav', 85.75);
 INSERT INTO Student VALUES (3, 'Vaishnavi', 96.23);
 INSERT INTO Student VALUES (4, 'Samadhan', 82.56);

-- create procedure containing cursor
delimiter //
CREATE PROCEDURE pcursor()
 BEGIN
     DECLARE s_id INT;
     DECLARE s_name VARCHAR(20);
     DECLARE cur1 CURSOR FOR SELECT id, name FROM Student WHERE grade > 85;
     OPEN cur1;
     read_loop: LOOP
         FETCH cur1 INTO s_id, s_name;
         SELECT CONCAT(s_id, ' ', s_name) AS info;
     END LOOP;
     CLOSE cur1;
 END;
//

-- call procedure
call pcursor() //