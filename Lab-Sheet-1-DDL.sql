
USE CollegeDB;

SHOW TABLES;

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

SELECT DATABASE();
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

SHOW TABLES;

DESCRIBE Student;

USE CollegeDB;

CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(15)
);

SHOW TABLES;

DESCRIBE Employee;
DESCRIBE Department;
DESCRIBE Product;
DESCRIBE Customer;

USE CollegeDB;

CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Library (
    Book_ID INT PRIMARY KEY,
    Book_Name VARCHAR(150),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

SHOW TABLES;

DESCRIBE Course;
DESCRIBE Faculty;
DESCRIBE Library;

USE CollegeDB;

DESCRIBE Employee;
DESCRIBE Product;
DESCRIBE Student;
USE CollegeDB;

DESCRIBE Student;
DESCRIBE Product;

USE CollegeDB;

-- Task 16: Name column ka size badhana
ALTER TABLE Student
MODIFY COLUMN Name VARCHAR(150) NOT NULL;

-- Task 17: Student table ka naam badalna
-- RENAME TABLE Student TO Student_Details;

-- Task 18: City column ka naam Address karna
-- ALTER TABLE Student_Details
-- RENAME COLUMN City TO Address;

-- Final result check
DESCRIBE Student_Details;

USE CollegeDB;

SHOW COLUMNS FROM Student_Details;
SHOW COLUMNS FROM Employee;
SHOW CREATE TABLE Product;

USE CollegeDB;

-- Task 22: TRUNCATE demonstration
CREATE TABLE IF NOT EXISTS Truncate_Demo (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

TRUNCATE TABLE Truncate_Demo;

-- Task 23: Drop Course table
DROP TABLE IF EXISTS Course;

-- Task 24: Drop Customer table
DROP TABLE IF EXISTS Customer;

-- Verify
SHOW TABLES;

USE CollegeDB;

-- Task 25: Complete Student table
CREATE TABLE IF NOT EXISTS Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 16),
    Email VARCHAR(150) UNIQUE,
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- ALTER demonstration
ALTER TABLE Student_Complete
MODIFY COLUMN Name VARCHAR(150) NOT NULL;

-- DROP demonstration using a temporary table
CREATE TABLE IF NOT EXISTS Drop_Demo (
    ID INT PRIMARY KEY
);

DROP TABLE IF EXISTS Drop_Demo;

-- Verify constraints and structure
SHOW CREATE TABLE Student_Complete;

SHOW TABLES;
