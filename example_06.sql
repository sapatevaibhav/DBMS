-- Write a PL/SQL block to implement all types of cursor

CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade float
);

 INSERT INTO Student VALUES (1, 'Om', 90.45);
 INSERT INTO Student VALUES (2, 'Vaibhav', 85.75);
 INSERT INTO Student VALUES (3, 'Vaishnavi', 96.23);
 INSERT INTO Student VALUES (4, 'Samadhan', 82.56);

delimiter //
CREATE PROCEDURE pcursor()
 BEGIN
     DECLARE s_id INT;
     DECLARE s_name VARCHAR(20);
     DECLARE cur1 CURSOR FOR SELECT id, name FROM Student WHERE grade > 85;
     OPEN cur1;
     read_loop: loop
         FETCH cur1 INTO s_id, s_name;
         SELECT CONCAT(s_id, ' ', s_name) AS info;
     END LOOP;
     CLOSE cur1;
 END;
//

call pcursor() //