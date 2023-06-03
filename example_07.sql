--Perform implementation of relational operators in SQL queries on employee database.

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(10),
    dept VARCHAR(10),
    salary int
);

INSERT INTO Employee VALUES (1, 'Vaibhav', 'IT', 5000);
INSERT INTO Employee VALUES (2, 'Satyam', 'CO', 6000);
INSERT INTO Employee VALUES (3, 'Om', 'ME', 4500);
INSERT INTO Employee VALUES (4, 'Dnyaneshwar', 'Eco', 5500);
INSERT INTO Employee VALUES (5, 'Samadhan', 'AI', 7000);

-- Relational operations
SELECT * FROM Employee WHERE salary = 5000;

SELECT * FROM Employee WHERE dept <> 'IT';

SELECT * FROM Employee WHERE salary > 5500;

SELECT * FROM Employee WHERE salary < 6000;

SELECT * FROM Employee WHERE salary >= 6000;

SELECT * FROM Employee WHERE salary <= 5000;

-- Combining conditions with AND and OR
SELECT * FROM Employee WHERE dept = 'IT' AND salary >= 5000;
SELECT * FROM Employee WHERE dept = 'CO' OR dept = 'AI';

