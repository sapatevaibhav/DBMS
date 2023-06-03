-- Write and execute PL/SQL stored procedure and function to perform a suitable
-- task on the database. Demonstrate its use.

create database stu;

-- create a table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade float
);

-- Insert some data
INSERT INTO Student VALUES (1, 'Om', 90.45);
INSERT INTO Student VALUES (2, 'Vaibhav', 85.75);
INSERT INTO Student VALUES (3, 'Vaishnavi', 96.23);

-- create stored procedure
create procedure p(IN id1 INT, OUT n VARCHAR(20))
BEGIN
SELECT `name` INTO n FROM Student WHERE id = id1;
select n;
END;

-- call procedure
call p(2,@name);

-- Create the stored function
CREATE FUNCTION f1() RETURNS VARCHAR(3)
BEGIN
    declare high int;
    SELECT MAX(grade) INTO high
    FROM Student;
    RETURN high;
END;

-- call function
select f1();