-- Write and execute PL/SQL stored procedure and function to perform a suitable
-- task on the database. Demonstrate its use.

create database stu1;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    grade float
);

INSERT INTO student VALUES (1, 'Om', 90.45);
INSERT INTO student VALUES (2, 'Vaibhav', 85.75);
INSERT INTO student VALUES (3, 'Vaishnavi', 96.23);

create procedure p(IN id1 INT, OUT n VARCHAR(20))
BEGIN
SELECT `name` INTO n FROM student WHERE id = id1;
select n;
END;

call p(2,@name);

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION f1() RETURNS float
BEGIN
    declare high int;
    SELECT MAX(grade) INTO high FROM student;
    RETURN high;
END;

select f1();

DROP PROCEDURE P;