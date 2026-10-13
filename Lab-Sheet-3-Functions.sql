
USE CollegeDB;

-- LAB SHEET 3: SQL FUNCTIONS

-- A. NUMBER FUNCTIONS

-- Q1. ABS()
SELECT ABS(-25) AS Absolute_Value;

-- Q2. ROUND()
SELECT ROUND(45.678, 2) AS Rounded_Value;

-- Q3. CEIL() and FLOOR()
SELECT CEIL(12.3) AS Ceiling_Value,
       FLOOR(12.9) AS Floor_Value;

-- Q4. MOD()
SELECT MOD(17, 5) AS Remainder;

-- Q5. Rounded salary
SELECT Emp_Name, ROUND(Salary, 0) AS Rounded_Salary
FROM Employee;


-- B. AGGREGATE FUNCTIONS

-- Q6. COUNT()
SELECT COUNT(*) AS Total_Students FROM Student;

-- Q7. SUM()
SELECT SUM(Salary) AS Total_Salary FROM Employee;

-- Q8. AVG()
SELECT AVG(Salary) AS Average_Salary FROM Employee;

-- Q9. MAX()
SELECT MAX(Salary) AS Highest_Salary FROM Employee;

-- Q10. MIN()
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;


-- C. CHARACTER FUNCTIONS

-- Q11. UPPER()
SELECT Name, UPPER(Name) AS Upper_Name FROM Student;

-- Q12. LOWER()
SELECT Name, LOWER(Name) AS Lower_Name FROM Student;

-- Q13. LENGTH()
SELECT Name, LENGTH(Name) AS Name_Length FROM Student;

-- Q14. CONCAT()
SELECT CONCAT('Rahul', ' ', 'Sharma') AS Full_Name;

-- Q15. SUBSTRING() / SUBSTR()
SELECT SUBSTRING('Database Management', 1, 8)
AS Substring_Result;


-- D. CONVERSION FUNCTIONS

-- Q16. Number to string
SELECT CAST(12345 AS CHAR) AS Number_To_String;

-- Q17. String to number
SELECT CAST('2500' AS UNSIGNED) AS String_To_Number;

-- Q18. Date formatting
SELECT DATE_FORMAT('2026-10-14', '%d/%m/%Y')
AS Formatted_Date;

-- Q19. CAST()
SELECT CAST(45.89 AS SIGNED) AS Converted_Integer;

-- Q20. CONVERT()
SELECT CONVERT('1234', UNSIGNED) AS Converted_Number;


-- E. DATE FUNCTIONS

-- Q21. Current date
SELECT CURDATE() AS Today_Date;

-- Q22. Extract year, month and day
SELECT YEAR('2026-10-14') AS Year_Value,
       MONTH('2026-10-14') AS Month_Value,
       DAY('2026-10-14') AS Day_Value;

-- Q23. Difference between dates
SELECT DATEDIFF('2026-10-14', '2026-10-01')
AS Days_Difference;

-- Q24. Add days to date
SELECT DATE_ADD('2026-10-14', INTERVAL 10 DAY)
AS New_Date;

-- Q25. Employee joining date formatting
-- Using a sample joining date because Employee
-- table does not have a Joining_Date column.
SELECT Emp_Name,
       DATE_FORMAT('2025-07-15', '%d-%m-%Y')
       AS Joining_Date
FROM Employee;
