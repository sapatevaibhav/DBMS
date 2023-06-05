-- Perform implementation of Complex queries and set operators in SQL queries on online store database.

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    country VARCHAR(10)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES (1, 'Vaishnavi', 'USA');
INSERT INTO Customers VALUES (2, 'Vaibhav', 'India');
INSERT INTO Customers VALUES (3, 'Om', 'USA');
INSERT INTO Customers VALUES (4, 'Samadhan', 'India');
INSERT INTO Customers VALUES (5, 'Prarthana', 'Australia');
INSERT INTO Orders VALUES (1, 1, '2023-05-15');
INSERT INTO Orders VALUES (2, 2, '2023-05-20');
INSERT INTO Orders VALUES (3, 3, '2023-05-25');
INSERT INTO Orders VALUES (4, 2, '2023-05-30');
INSERT INTO Orders VALUES (5, 4, '2023-06-01');

SELECT customer_name
FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders WHERE order_date > '2023-01-01');

SELECT customer_name
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE order_date > '2023-01-01');

SELECT customer_name
FROM Customers
WHERE customer_id LIKE (SELECT customer_id FROM Orders WHERE order_date = '2023-06-01');


SELECT customer_name FROM Customers UNION SELECT order_id FROM Orders;
SELECT customer_name FROM Customers INTERSECT SELECT order_id FROM Orders;
SELECT customer_name FROM Customers UNION ALL SELECT order_id FROM Orders;