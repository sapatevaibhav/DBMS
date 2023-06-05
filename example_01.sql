-- Design Hospital database with at least 3 entities and relationships between them.
-- Draw suitable ER/EER diagram for the system and implement using DDL statements.
                                    -- or
-- Design Hospital database with at least 3 entities and relationships between them.
-- Draw suitable ER/EER diagram for the system and Create Table with
-- primary key and foreign key constraints. a. Alter table with add n modify b. Drop table.

create database hospital;
use hospital;

CREATE TABLE Patients (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(20),
    dob DATE,
    gender VARCHAR(6),
    phone VARCHAR(10),
    address VARCHAR(30)
);

CREATE TABLE Doctors (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(30)
);

CREATE TABLE Appointments (
    ap_id INT PRIMARY KEY,
    p_id INT,
    d_id INT,
    ap_date DATE,
    ap_time TIME,
    FOREIGN KEY (p_id) REFERENCES Patients(p_id),
    FOREIGN KEY (d_id) REFERENCES Doctors(d_id)
);

ALTER TABLE Patients ADD email VARCHAR(30);

ALTER TABLE Appointments RENAME TO ScheduledAppointments;

ALTER TABLE Patients MODIFY phone VARCHAR(15);

ALTER TABLE Patients RENAME COLUMN patient_name to p_name ;

TRUNCATE TABLE ScheduledAppointments;

DESC Patients;

drop table ScheduledAppointments;