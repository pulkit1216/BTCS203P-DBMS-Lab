
USE CollegeDB;

CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

DESCRIBE Student;

USE CollegeDB;

-- Insert 5 students
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES
(101, 'Rahul', 20, 'BTech', 'Delhi'),
(102, 'Priya', 21, 'BCA', 'Mumbai'),
(103, 'Aman', 19, 'BTech', 'Kanpur'),
(104, 'Sneha', 22, 'MCA', 'Lucknow'),
(105, 'Rohit', 20, 'BBA', 'Jaipur')
ON DUPLICATE KEY UPDATE Student_ID = Student_ID;

-- Display all students
SELECT * FROM Student;

-- Insert employee records
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary)
VALUES
(201, 'Amit', 'IT', 45000),
(202, 'Neha', 'HR', 38000),
(203, 'Vikas', 'Finance', 52000)
ON DUPLICATE KEY UPDATE Emp_ID = Emp_ID;

-- Display employees
SELECT * FROM Employee;

USE CollegeDB;

-- 1. Update Rahul's city
UPDATE Student
SET City = 'Noida'
WHERE Student_ID = 101;

-- 2. Update Aman's age
UPDATE Student
SET Age = 20
WHERE Student_ID = 103;

-- 3. Increase IT employee salary
UPDATE Employee
SET Salary = Salary + 5000
WHERE Department = 'IT';

-- 4. Display students from BTech
SELECT * FROM Student
WHERE Course = 'BTech';

-- 5. Display employees earning above 40000
SELECT * FROM Employee
WHERE Salary > 40000;

-- 6. DELETE demonstration on a separate table
CREATE TABLE IF NOT EXISTS Delete_Demo (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO Delete_Demo (ID, Name)
VALUES (1, 'Demo Student');

DELETE FROM Delete_Demo
WHERE ID = 1;

SELECT * FROM Delete_Demo;

-- 7. Final verification
SELECT * FROM Student;
SELECT * FROM Employee;

USE CollegeDB;

-- 1. Insert new student

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (106, 'Karan', 23, 'MBA', 'Pune')
ON DUPLICATE KEY UPDATE Student_ID = Student_ID;

-- 2. Insert new employee
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary)
VALUES (204, 'Pooja', 'Marketing', 42000)
ON DUPLICATE KEY UPDATE Emp_ID = Emp_ID;

-- 3. Update student's course
UPDATE Student
SET Course = 'MTech'
WHERE Student_ID = 105;

-- 4. Update employee department
UPDATE Employee
SET Department = 'Management'
WHERE Emp_ID = 204;

-- 5. Display students older than 20
SELECT * FROM Student
WHERE Age > 20;

-- 6. Display employees by salary
SELECT * FROM Employee
ORDER BY Salary DESC;

-- 7. DELETE demonstration
DELETE FROM Student
WHERE Student_ID = 106;

-- 8. Display final records
SELECT * FROM Student;
SELECT * FROM Employee;

USE CollegeDB;

SELECT * FROM Student
WHERE Student_ID = 106;

SELECT * FROM Employee
WHERE Emp_ID = 204;

SELECT * FROM CollegeDB.Student WHERE Student_ID = 106;

