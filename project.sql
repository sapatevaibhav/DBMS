-- Drop the database if it exists
DROP DATABASE IF EXISTS delivery_management_system;

-- Create the database
CREATE DATABASE delivery_management_system;

-- Use the database
USE delivery_management_system;

-- Create the `delivery_distribution_centre` table
CREATE TABLE `delivery_distribution_centre` (
  `centre_id` INT PRIMARY KEY AUTO_INCREMENT,
  `centre_name` VARCHAR(50) NOT NULL,
  `centre_address` TEXT NOT NULL,
  `centre_pincode` VARCHAR(10) NOT NULL,
  `centre_latitude` DECIMAL(10, 6) NOT NULL,
  `centre_longitude` DECIMAL(10, 6) NOT NULL
);

-- Create the `user` table
CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email_id` VARCHAR(50),
  `contact_num` BIGINT NOT NULL,
  `user_role` INT NOT NULL,
  `first_name` VARCHAR(25) NOT NULL,
  `middle_name` VARCHAR(25),
  `last_name` VARCHAR(25) NOT NULL,
  `centre_id` INT NOT NULL,
  FOREIGN KEY (`centre_id`) REFERENCES `delivery_distribution_centre` (`centre_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the `user_address` table
CREATE TABLE `user_address` (
  `user_id` INT,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`, `address`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create the `recipient` table (changed table name to "recipient")
CREATE TABLE `recipient` (
  `email_id` VARCHAR(50) PRIMARY KEY,
  `contact_num` BIGINT NOT NULL,
  `address` TEXT NOT NULL,
  `tracking_id` INT NOT NULL,
  `first_name` VARCHAR(25) NOT NULL,
  `middle_name` VARCHAR(25),
  `last_name` VARCHAR(25) NOT NULL
);

-- Create the `delivery` table
CREATE TABLE `delivery` (
  `order_num` INT PRIMARY KEY AUTO_INCREMENT,
  `weight` DECIMAL(5, 2) NOT NULL,
  `type_of_service` INT NOT NULL,
  `type_of_transaction` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `delivery_date` DATE NOT NULL,
  `order_cost` DECIMAL(8, 2) NOT NULL,
  `order_status` INT NOT NULL,
  `is_return` BOOLEAN NOT NULL,
  `employee_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `centre_id` INT NOT NULL,
  `recipient_email` VARCHAR(50) NOT NULL,
  FOREIGN KEY (`centre_id`) REFERENCES `delivery_distribution_centre` (`centre_id`) ON DELETE CASCADE,
  FOREIGN KEY (`employee_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`recipient_email`) REFERENCES `recipient` (`email_id`) ON DELETE CASCADE,
  FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
);

-- Insert data into the `delivery_distribution_centre` table
INSERT INTO `delivery_distribution_centre` (`centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES
('Mumbai', '234/10, Kapoor Towers, Mumbai', '400001', 19.0759, 72.8773),
('Delhi', 'Dr No. 189 Ayur Vigyan Nagar, New Delhi', '110001', 28.7041, 77.1025),
('Bangalore', 'HIG - 77 1st Block 1st Cross, Rammurthy Nagar, Bangalore', '560016', 12.9791, 77.5912),
('Hyderabad', 'HIG - 30 KPHB Colony, Kukatpally, Hyderabad', '500085', 17.3617, 78.4751),
('Mangalore', 'Lohith Nagar, Derebail, Mangaluru', '575001', 12.9141, 74.8560),
('Dhanbad', '32/21 Gandhinagar, Dhanbad', '826001', 23.7998, 86.4305),
('Kanpur', 'Dr No 18 Patel Street, Kanpur, UP', '208001', 26.4499, 80.3318),
('Bikaner', '21/15 Sardar Nagar, Bikaner', '334001', 28.0229, 73.3119);

-- Insert data into the `user` table
INSERT INTO `user` (`username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES
('LBJ', 'LBJ123', 'james@gmail.com', 8234567890, 1, 'Lebron', 'Raymone', 'James', 1),
('Kobe', 'KB123', 'kb23@gmail.com', 9234567992, 1, 'Kobe', 'Bean', 'Bryant', 2),
('Dame', 'DL44', 'dl44@gmail.com', 9784894318, 1, 'Damian', 'Lillard', 'Lillard', 3),
('Steph', 'Steph30', 'sc30@gmail.com', 7423424211, 1, 'Stephen', 'Curry', 'Curry', 4),
('SteveK', 'SK123', 'steve@gmail.com', 8242423422, 1, 'Steve', 'Kerr', 'Kerr', 5),
('Scotty', 'ST132', 'scotty@gmail.com', 8768322436, 1, 'Scotty', 'Pippen', 'Pippen', 6),
('Jammo', 'jammo24', 'jammo@gmail.com', 8423245563, 1, 'Ja', 'Morrant', 'Morrant', 7),
('Johm', 'JN24', 'john@gmail.com', 9232423462, 1, 'John', 'Morrison', 'Wick', 8),
('Ron', 'rn23', 'ron@gmail.com', 8434252432, 2, 'Ron', 'Telly', 'Telly', 1),
('Holly', 'hd26', 'holly@gmail.com', 8436356334, 2, 'Holly', 'Marshal', 'Marshal', 1),
('Selena', 'SL54', 'sele@gmail.con', 8342340234, 2, 'Selena', 'Abbot', 'Abbot', 2),
('Ashwin', 'AS234', 'ashwin@gmail.com', 9534345342, 2, 'Ashwin', 'Rao', 'Rao', 2),
('Amit', 'AM99', 'amit@gmail.com', 7534234233, 2, 'Amit', 'Kumar', 'Kumar', 3),
('Kiran', 'KR101', 'kiran@gmail.com', 9345342424, 2, 'Kiran', 'Balani', 'Balani', 4);

-- Insert data into the `user_address` table
INSERT INTO `user_address` (`user_id`, `address`) VALUES
(1, '123 Main St, Apartment 4B, Mumbai, 400001'),
(2, '456 Oak St, Delhi, 110001'),
(3, '789 Pine St, Bangalore, 560016'),
(4, '101 Cedar St, Hyderabad, 500085'),
(5, '202 Elm St, Mangalore, 575001'),
(6, '303 Birch St, Dhanbad, 826001'),
(7, '404 Maple St, Kanpur, 208001'),
(8, '505 Walnut St, Bikaner, 334001'),
(9, '606 Cherry St, Mumbai, 400001'),
(10, '707 Redwood St, Mumbai, 400001'),
(11, '808 Spruce St, Delhi, 110001'),
(12, '909 Birch St, Delhi, 110001'),
(13, '1010 Pine St, Bangalore, 560016'),
(14, '1111 Cedar St, Hyderabad, 500085');

-- Insert data into the `recipient` table
INSERT INTO `recipient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `middle_name`, `last_name`) VALUES
('recipient1@gmail.com', 8234523490, '1 Elm St, Mumbai, 400001', 1, 'John', 'Middle', 'Doe'),
('recipient2@gmail.com', 9234567999, '2 Oak St, Delhi, 110001', 2, 'Jane', 'Marie', 'Smith'),
('recipient3@gmail.com', 9784894318, '3 Pine St, Bangalore, 560016', 3, 'Bob', 'J.', 'Johnson'),
('recipient4@gmail.com', 7423424211, '4 Cedar St, Hyderabad, 500085', 4, 'Amanda', 'L.', 'Miller');

-- Insert data into the `delivery` table
INSERT INTO `delivery` (`weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `is_return`, `employee_id`, `customer_id`, `centre_id`, `recipient_email`) VALUES
(2.5, 1, 2, '2023-10-10', '2023-10-15', 200.00, 1, 1, 1, 9, 1, 'recipient1@gmail.com'),
(3.0, 2, 1, '2023-10-11', '2023-10-16', 250.00, 2, 2, 2, 10, 1, 'recipient2@gmail.com'),
(1.8, 1, 2, '2023-10-12', '2023-10-17', 150.00, 3, 3, 3, 11, 2, 'recipient3@gmail.com'),
(4.2, 2, 2, '2023-10-13', '2023-10-18', 300.00, 4, 4, 4, 12, 2, 'recipient4@gmail.com');

-- Create the `service` table
CREATE TABLE `service` (
  `service_id` INT PRIMARY KEY AUTO_INCREMENT,
  `service_name` VARCHAR(50) NOT NULL,
  `service_description` TEXT
);

-- Insert data into the `service` table
INSERT INTO `service` (`service_name`, `service_description`) VALUES
('Standard', 'Delivery within 5-7 business days.'),
('Express', 'Fast delivery within 2-3 business days.');

-- Create the `transaction_type` table
CREATE TABLE `transaction_type` (
  `transaction_id` INT PRIMARY KEY AUTO_INCREMENT,
  `transaction_name` VARCHAR(50) NOT NULL
);

-- Insert data into the `transaction_type` table
INSERT INTO `transaction_type` (`transaction_name`) VALUES
('Inbound'),
('Outbound');
