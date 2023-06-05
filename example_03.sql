-- Execute DDL/DML statements which demonstrate the use of views. 
-- Update the base table using its corresponding view. 
-- Also consider restrictions on updatable views and perform view creation from multiple tables.


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    account_number VARCHAR(20)
);

CREATE TABLE Transactions (
    t_id INT PRIMARY KEY,
    account_number VARCHAR(20),
    t_type VARCHAR(20)
);

CREATE VIEW v1 AS
SELECT customer_id, customer_name, account_number
FROM Customers;

CREATE VIEW v2 AS
SELECT c.customer_id, c.customer_name, t.t_id
FROM Customers c, Transactions t
where c.account_number = t.account_number;

INSERT INTO v1 (customer_id, customer_name) VALUES (81, 'Om');
INSERT INTO v1 (customer_id, customer_name) VALUES (82, 'Vaibhav');
INSERT INTO v1 (customer_id, customer_name) VALUES (83, 'Samadhan');

UPDATE v1 SET customer_id = 100 WHERE customer_id = 82;

ALTER VIEW v1 AS SELECT customer_id, customer_name from Customers;
DELETE FROM v1 WHERE customer_id = 100;
--drop view v1;