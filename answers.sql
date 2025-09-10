-- Setup: Create a fresh database for assignment
DROP DATABASE IF EXISTS assignmentDB;
CREATE DATABASE assignmentDB;
USE assignmentDB;

-- Create customers table with phone column
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Question 1 Indexing
-- Create index on phone column
CREATE INDEX IdxPhone ON assignmentDB.customers(phone);

-- Drop index named IdxPhone from customers table
DROP INDEX IdxPhone ON assignmentDB.customers;

-- Verification: check indexes on customers table
SHOW INDEXES FROM assignmentDB.customers;

-- Question 2 👤 User creation
-- Create a user 'bob' with password restricted to localhost
CREATE USER IF NOT EXISTS 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

-- Verification: list all users
SELECT user, host FROM mysql.user;

-- Question Privileges
-- Grant INSERT privilege on assignmentDB database to user 'bob'
GRANT INSERT ON assignmentDB.* TO 'bob'@'localhost';

-- Verification: show privileges for 'bob'
SHOW GRANTS FOR 'bob'@'localhost';

-- Question 4 Password change
-- Change password for user 'bob' to 'P$55!23'
ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';

-- Verification: try logging in as bob (done in terminal/Workbench)
-- mysql -u bob -p
-- Enter the new password: P$55!23
