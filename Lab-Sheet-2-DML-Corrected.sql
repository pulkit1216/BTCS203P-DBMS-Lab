
USE CollegeDB;

-- LAB SHEET 2: DML COMMANDS
-- Separate practice tables to protect original data

DROP TABLE IF EXISTS LS2_Student;
DROP TABLE IF EXISTS LS2_Employee;
DROP TABLE IF EXISTS LS2_Department;
DROP TABLE IF EXISTS LS2_Product;
DROP TABLE IF EXISTS LS2_Customer;
DROP TABLE IF EXISTS LS2_Course;

CREATE TABLE LS2_Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE LS2_Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(12,2)
);

CREATE TABLE LS2_Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE LS2_Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(12,2),
    Quantity INT
);

CREATE TABLE LS2_Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE LS2_Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(12,2)
);

-- Q1. Insert one student
INSERT INTO LS2_Student VALUES
(1, 'Rahul', 20, 'BTech', 'Delhi');

-- Q2. Insert five students separately
INSERT INTO LS2_Student VALUES
(2, 'Aman', 21, 'BCA', 'Meerut');

INSERT INTO LS2_Student VALUES
(3, 'Priya', 20, 'BTech', 'Kanpur');

INSERT INTO LS2_Student VALUES
(4, 'Neha', 22, 'MBA', 'Meerut');

INSERT INTO LS2_Student VALUES
(5, 'Rohit', 19, 'BCA', 'Lucknow');

INSERT INTO LS2_Student VALUES
(6, 'Simran', 21, 'BTech', 'Delhi');

-- Q3. Insert multiple students in one statement
INSERT INTO LS2_Student VALUES
(7, 'Karan', 20, 'BTech', 'Agra'),
(8, 'Pooja', 21, 'BCA', 'Meerut'),
(9, 'Ankit', 22, 'MBA', 'Kanpur');

-- Q4. Insert employee records
INSERT INTO LS2_Employee VALUES
(101, 'Rajesh', 'IT', 45000),
(102, 'Suresh', 'HR', 30000),
(103, 'Meena', 'Sales', 25000),
(104, 'Kavita', 'IT', 55000),
(105, 'Arjun', 'HR', 18000);

-- Q5. Insert department records
INSERT INTO LS2_Department VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Kanpur'),
(3, 'Sales', 'Lucknow');

-- Q6. Insert product records
INSERT INTO LS2_Product VALUES
(201, 'Laptop', 50000, 5),
(202, 'Mouse', 500, 0),
(203, 'Keyboard', 1200, 10),
(204, 'Monitor', 9000, 0);

-- Q7. Insert customer records
INSERT INTO LS2_Customer VALUES
(301, 'Vikas', 'vikas@example.com', '9876543210'),
(302, 'Riya', 'riya@example.com', '9876543211');

-- Q8. Insert course records
INSERT INTO LS2_Course VALUES
(401, 'BTech', '4 Years', 90000),
(402, 'BCA', '3 Years', 60000),
(403, 'MBA', '2 Years', 120000);

-- Q9. Insert student with all columns
INSERT INTO LS2_Student VALUES
(10, 'Aditya', 20, 'BTech', 'Jaipur');

-- Q10. Insert student with selected columns
INSERT INTO LS2_Student (Student_ID, Name, Course)
VALUES (11, 'Sneha', 'BCA');

-- Q11. Update city of a student
UPDATE LS2_Student
SET City = 'Noida'
WHERE Student_ID = 1;

-- Q12. Update salary of one employee
UPDATE LS2_Employee
SET Salary = 50000
WHERE Emp_ID = 101;

-- Q13. Increase all employee salaries by 10%
UPDATE LS2_Employee
SET Salary = Salary * 1.10;

-- Q14. Increase all product prices by 5%
UPDATE LS2_Product
SET Price = Price * 1.05;

-- Q15. Change course of one student
UPDATE LS2_Student
SET Course = 'MCA'
WHERE Student_ID = 2;

-- Q16. Update employee department
UPDATE LS2_Employee
SET Department = 'Finance'
WHERE Emp_ID = 102;

-- Q17. Change Meerut to Delhi
UPDATE LS2_Student
SET City = 'Delhi'
WHERE City = 'Meerut';

-- Q18. Update fees of one course
UPDATE LS2_Course
SET Fees = 95000
WHERE Course_ID = 401;

-- Q19. Update multiple student columns
UPDATE LS2_Student
SET Age = 23, Course = 'MTech', City = 'Pune'
WHERE Student_ID = 3;

-- Q20. Delete a particular student
DELETE FROM LS2_Student
WHERE Student_ID = 9;

-- Q21. Delete students from a particular city
DELETE FROM LS2_Student
WHERE City = 'Lucknow';

-- Q22. Delete employees with low salaries
DELETE FROM LS2_Employee
WHERE Salary < 25000;

-- Q23. Delete products with zero quantity
DELETE FROM LS2_Product
WHERE Quantity = 0;

-- Q24. Delete using AND / OR conditions
DELETE FROM LS2_Student
WHERE (Course = 'MBA' AND Age > 20)
   OR (City = 'Agra' AND Age < 21);

-- Q25. Complete INSERT, UPDATE, DELETE sequence
-- Display table after each operation

INSERT INTO LS2_Student VALUES
(12, 'Nikhil', 20, 'BTech', 'Kanpur');

SELECT * FROM LS2_Student;

UPDATE LS2_Student
SET City = 'Delhi'
WHERE Student_ID = 12;

SELECT * FROM LS2_Student;

DELETE FROM LS2_Student
WHERE Student_ID = 12;

SELECT * FROM LS2_Student;

-- Final results
SELECT * FROM LS2_Student;
SELECT * FROM LS2_Employee;
SELECT * FROM LS2_Department;
SELECT * FROM LS2_Product;
SELECT * FROM LS2_Customer;
SELECT * FROM LS2_Course;
