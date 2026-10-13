
USE CollegeDB;

-- LAB SHEET 5: SQL JOINS

-- Create separate demo tables
CREATE TABLE IF NOT EXISTS Join_Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Join_Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Join_Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Dept_ID INT,
    Course_ID INT
);

CREATE TABLE IF NOT EXISTS Join_Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Dept_ID INT,
    Salary DECIMAL(10,2),
    Manager_ID INT
);

-- Insert sample departments
INSERT INTO Join_Department VALUES
(1,'Computer Science'),
(2,'Mechanical'),
(3,'Electrical'),
(4,'Civil')
ON DUPLICATE KEY UPDATE
Dept_Name=VALUES(Dept_Name);

-- Insert sample courses
INSERT INTO Join_Course VALUES
(101,'BTech CSE'),
(102,'BTech Mechanical'),
(103,'BCA')
ON DUPLICATE KEY UPDATE
Course_Name=VALUES(Course_Name);

-- Insert sample students
INSERT INTO Join_Student VALUES
(1,'Rahul',1,101),
(2,'Priya',1,103),
(3,'Aman',2,102),
(4,'Sneha',NULL,101),
(5,'Rohit',3,101)
ON DUPLICATE KEY UPDATE
Name=VALUES(Name),
Dept_ID=VALUES(Dept_ID),
Course_ID=VALUES(Course_ID);

-- Insert sample employees
INSERT INTO Join_Employee VALUES
(1,'Amit',1,60000,NULL),
(2,'Neha',1,45000,1),
(3,'Vikas',2,50000,NULL),
(4,'Pooja',2,35000,3),
(5,'Karan',3,40000,NULL)
ON DUPLICATE KEY UPDATE
Emp_Name=VALUES(Emp_Name),
Dept_ID=VALUES(Dept_ID),
Salary=VALUES(Salary),
Manager_ID=VALUES(Manager_ID);

-- Q1. INNER JOIN
SELECT *
FROM Join_Student s
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q2. Student and department names
SELECT s.Name,d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q3. Employees with departments
SELECT e.Emp_Name,d.Dept_Name
FROM Join_Employee e
INNER JOIN Join_Department d
ON e.Dept_ID=d.Dept_ID;

-- Q4. Students with course details
SELECT s.Name,c.Course_Name
FROM Join_Student s
INNER JOIN Join_Course c
ON s.Course_ID=c.Course_ID;

-- Q5. Students in Computer Science
SELECT s.Name,d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID
WHERE d.Dept_Name='Computer Science';

-- Q6. LEFT OUTER JOIN
SELECT *
FROM Join_Student s
LEFT OUTER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q7. All students including unmatched
SELECT s.Name,d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q8. RIGHT OUTER JOIN
SELECT *
FROM Join_Student s
RIGHT OUTER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q9. All departments including unmatched
SELECT d.Dept_Name,s.Name
FROM Join_Student s
RIGHT JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q10. Students without departments
SELECT s.*
FROM Join_Student s
LEFT JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q11. Departments without students
SELECT d.*
FROM Join_Department d
LEFT JOIN Join_Student s
ON d.Dept_ID=s.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q12. FULL OUTER JOIN workaround
SELECT s.Student_ID,s.Name,d.Dept_Name
FROM Join_Student s
LEFT JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID
UNION ALL
SELECT s.Student_ID,s.Name,d.Dept_Name
FROM Join_Student s
RIGHT JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q13. CROSS JOIN
SELECT s.Name,c.Course_Name
FROM Join_Student s
CROSS JOIN Join_Course c;

-- Q14. Count possible combinations
SELECT COUNT(*) AS Total_Combinations
FROM Join_Student s
CROSS JOIN Join_Course c;

-- Q15. NATURAL JOIN
SELECT *
FROM
(SELECT Student_ID,Name,Dept_ID FROM Join_Student) s
NATURAL JOIN
(SELECT Dept_ID,Dept_Name FROM Join_Department) d;

-- Q16. Compare with INNER JOIN
SELECT s.Name,d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q17. SELF JOIN
SELECT e.Emp_Name AS Employee,
m.Emp_Name AS Manager
FROM Join_Employee e
LEFT JOIN Join_Employee m
ON e.Manager_ID=m.Emp_ID;

-- Q18. Employees and managers
SELECT e.Emp_Name,m.Emp_Name AS Manager
FROM Join_Employee e
INNER JOIN Join_Employee m
ON e.Manager_ID=m.Emp_ID;

-- Q19. Join three tables
SELECT *
FROM Join_Student s
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID
INNER JOIN Join_Course c
ON s.Course_ID=c.Course_ID;

-- Q20. Student, course, department names
SELECT s.Name,c.Course_Name,d.Dept_Name
FROM Join_Student s
INNER JOIN Join_Course c
ON s.Course_ID=c.Course_ID
INNER JOIN Join_Department d
ON s.Dept_ID=d.Dept_ID;

-- Q21. Employees earning above department average
SELECT e.Emp_Name,e.Salary,d.Dept_Name
FROM Join_Employee e
INNER JOIN Join_Department d
ON e.Dept_ID=d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Join_Employee e2
    WHERE e2.Dept_ID=e.Dept_ID
);

-- Q22. Department with maximum students
SELECT d.Dept_Name,
COUNT(s.Student_ID) AS Total_Students
FROM Join_Department d
LEFT JOIN Join_Student s
ON d.Dept_ID=s.Dept_ID
GROUP BY d.Dept_ID,d.Dept_Name
ORDER BY Total_Students DESC
LIMIT 1;

-- Q23. Total students per department
SELECT d.Dept_Name,
COUNT(s.Student_ID) AS Total_Students
FROM Join_Department d
LEFT JOIN Join_Student s
ON d.Dept_ID=s.Dept_ID
GROUP BY d.Dept_ID,d.Dept_Name;

-- Q24. Total students per course
SELECT c.Course_Name,
COUNT(s.Student_ID) AS Total_Students
FROM Join_Course c
LEFT JOIN Join_Student s
ON c.Course_ID=s.Course_ID
GROUP BY c.Course_ID,c.Course_Name;

-- Q25. Student-Department-Course report
SELECT d.Dept_Name,c.Course_Name,
COUNT(s.Student_ID) AS Total_Students
FROM Join_Department d
LEFT JOIN Join_Student s
ON d.Dept_ID=s.Dept_ID
LEFT JOIN Join_Course c
ON s.Course_ID=c.Course_ID
GROUP BY d.Dept_ID,d.Dept_Name,
c.Course_ID,c.Course_Name
ORDER BY d.Dept_Name,c.Course_Name;
