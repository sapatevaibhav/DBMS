-- Perform implementation of Processing Date and Time functions in SQL queries on library database.

CREATE TABLE Library (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author VARCHAR(100),
    published DATE,
    borrowed DATETIME
);

INSERT INTO Library VALUES (1, 'The God of Small Things', 'Arundhati Roy', '1997-06-04', '2022-01-15 09:30:00');
INSERT INTO Library VALUES (2, 'A Suitable Boy', 'Vikram Seth', '1993-01-24', '2022-02-10 14:45:00');
INSERT INTO Library VALUES (3, 'The White Tiger', 'Aravind Adiga', '2008-03-12', '2022-03-25 11:15:00');
INSERT INTO Library VALUES (4, 'The Immortals of Meluha', 'Amish Tripathi', '2010-01-31', '2022-04-20 16:20:00');


SELECT CURDATE() AS current_date;

SELECT NOW() AS current_datetime;

SELECT book_title, YEAR(published) AS publish_year FROM Library;

SELECT book_title, MONTHNAME(published) AS publish_month FROM Library;

SELECT book_title, DAY(published) AS publish_day FROM Library;

SELECT book_title, HOUR(borrowed) AS borrowed_hour FROM Library;

SELECT book_title, MINUTE(borrowed) AS borrowed_minute FROM Library;

SELECT book_title, SECOND(borrowed) AS borrowed_second FROM Library;

SELECT book_title, DATE_ADD(published, INTERVAL 7 DAY) AS due_date FROM Library;

SELECT book_title, DATE_SUB(borrowed, INTERVAL 2 HOUR) AS return_time FROM Library;
