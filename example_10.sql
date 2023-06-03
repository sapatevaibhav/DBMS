-- Perform implementation of Arithmetic operations and built in functions in SQL
-- queries on school database.

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(20),
    department VARCHAR(20),
    salary int
);

INSERT INTO Employee VALUES (1, 'Vaibhav', 'IT', 5000);
INSERT INTO Employee VALUES (2, 'Manish', 'HR', 5300);
INSERT INTO Employee VALUES (3, 'Prathmesh', 'Sales', 4500);
INSERT INTO Employee VALUES (4, 'Anjali', 'IT', 5500);
INSERT INTO Employee VALUES (5, 'Vaishnavi', 'Communication', 5600);
INSERT INTO Employee VALUES (6, 'Sakshi', 'Finance', 7000);

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

SELECT department, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM Employee
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC
LIMIT 2;

SELECT SUM(salary) AS total_salary
FROM Employee;

