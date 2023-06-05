-- Perform implementation of Arithmetic operations and built in functions in SQL
-- queries on school database.

CREATE TABLE School (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    age INT,
    grade FLOAT
);
INSERT INTO School VALUES (82, 'Prarthana', 14, 85.543);
INSERT INTO School VALUES (89, 'Darshana', 10, 92.8233);
INSERT INTO School VALUES (79, 'Bhavana', 8, 78.2324);
INSERT INTO School VALUES (87, 'Shambhoo', 6, 91.733);

-- Arithmetic Operations

SELECT student_id, age + 1 AS incremented_age FROM School;

SELECT student_id, grade - 5 AS adjusted_grade FROM School;

SELECT student_id, age * 2 AS doubled_age FROM School;

SELECT student_id, grade / 10 AS grade_percentage FROM School;

-- Built-in Functions

SELECT COUNT(*) FROM School;

SELECT AVG(grade) FROM School;

SELECT MIN(age)  FROM School;

SELECT MAX(grade)  FROM School;

SELECT student_id, ROUND(grade, 2) FROM School;

select * from School;
