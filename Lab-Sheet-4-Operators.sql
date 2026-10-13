
USE CollegeDB;

-- LAB SHEET 4: SQL OPERATORS

-- 1. Arithmetic operators
SELECT 20 + 10 AS Addition;
SELECT 20 - 10 AS Subtraction;
SELECT 20 * 10 AS Multiplication;
SELECT 20 / 10 AS Division;
SELECT MOD(20, 3) AS Remainder;

-- 2. Comparison operators
SELECT * FROM Student WHERE Age = 20;
SELECT * FROM Student WHERE Age > 20;
SELECT * FROM Student WHERE Age < 22;
SELECT * FROM Employee WHERE Salary >= 40000;
SELECT * FROM Employee WHERE Salary <> 40000;

-- 3. Logical operators
SELECT * FROM Student
WHERE Age > 18 AND Course = 'BTech';

SELECT * FROM Student
WHERE City = 'Kanpur' OR City = 'Delhi';

SELECT * FROM Student
WHERE NOT Course = 'BCA';

-- 4. Special operators
SELECT * FROM Student
WHERE Age BETWEEN 19 AND 22;

SELECT * FROM Student
WHERE City IN ('Kanpur', 'Delhi', 'Lucknow');

SELECT * FROM Student
WHERE Name LIKE 'A%';

SELECT * FROM Student
WHERE Name LIKE '%a';

SELECT * FROM Student
WHERE City IS NOT NULL;

-- 5. More operator examples
SELECT * FROM Employee
WHERE Salary BETWEEN 30000 AND 60000;

SELECT * FROM Employee
WHERE Department IN ('IT', 'HR');

SELECT * FROM Employee
WHERE Emp_Name LIKE 'A%';

SELECT * FROM Student
WHERE Age NOT BETWEEN 19 AND 21;

SELECT * FROM Student
WHERE City NOT IN ('Mumbai', 'Jaipur');

SELECT * FROM Employee
WHERE Salary > 40000 AND Department = 'IT';

SELECT * FROM Student
WHERE Age >= 20 OR City = 'Kanpur';
