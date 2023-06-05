-- Design College database with at least 3 entities and relationships between them.
-- Draw suitable ER/EER diagram for the system and implement using DDL statements.
                                    -- or
-- Design College database with at least 3 entities and relationships between them.
-- Draw suitable ER/EER diagram for the system and Create Table with primary key
-- and foreign key constraints. a. Alter table with add n modify b. Drop table

CREATE DATABASE college;
USE college;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    dob DATE
);

CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    professor_name VARCHAR(20),
    phone VARCHAR(20)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    student_id INT,
    professor_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

ALTER TABLE Students ADD email VARCHAR(30);

ALTER TABLE Departments RENAME TO Dept;

ALTER TABLE Students
MODIFY email VARCHAR(15);

ALTER TABLE Students 
CHANGE COLUMN student_name student_name VARCHAR(50);

TRUNCATE TABLE Dept;

DESC Students;

DROP TABLE Dept;
DROP TABLE Professors;
drop table Students;