-- Execute DDL/DML statements which demonstrate the use of views. 
-- Update the base table using its corresponding view. 
-- Also consider restrictions on updatable views and perform view creation from multiple tables.


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    account_number VARCHAR(20)
);

CREATE TABLE Transactions (
    t_id INT PRIMARY KEY,
    account_number VARCHAR(20),
    t_type VARCHAR(20)
);


INSERT INTO Customers VALUES (81, 'Om','A00101');
INSERT INTO Customers VALUES (82, 'Vaibhav','A00102');
INSERT INTO Customers VALUES (83, 'Samadhan','A00103');
INSERT INTO Transactions VALUES (1, 'A00102','ATM - Debit');
INSERT INTO Transactions VALUES (2, 'A00102','UPI - Debit');
INSERT INTO Transactions VALUES (3, 'A00103','UPI - Credit');
INSERT INTO Transactions VALUES (4, 'A00101','Bank - Credit');

CREATE VIEW v1 AS
SELECT customer_id, customer_name, account_number
FROM Customers;

CREATE VIEW v2 AS
SELECT c.customer_id, c.customer_name, t.t_id
FROM Customers c, Transactions t
where c.account_number = t.account_number;

SELECT * FROM v1;
SELECT * FROM v2;


INSERT INTO v1 (customer_id, customer_name) VALUES (81, 'Om');
INSERT INTO v1 (customer_id, customer_name) VALUES (82, 'Vaibhav');
INSERT INTO v1 (customer_id, customer_name) VALUES (83, 'Samadhan');

UPDATE v1 SET customer_id = 100 WHERE customer_id = 82;

ALTER VIEW v1 AS SELECT customer_id, customer_name from Customers;
DELETE FROM v1 WHERE customer_id = 100;


drop view v1;
