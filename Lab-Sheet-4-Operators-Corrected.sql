
USE CollegeDB;

-- LAB SHEET 4: SQL OPERATORS
-- All 25 Questions

-- Q1. Addition
SELECT 25 + 15 AS Addition_Result;

-- Q2. Subtraction
SELECT 50 - 20 AS Subtraction_Result;

-- Q3. Multiplication
SELECT 12 * 5 AS Multiplication_Result;

-- Q4. Division
SELECT 100 / 4 AS Division_Result;

-- Q5. Price multiplied by Quantity
SELECT Product_Name, Price, Quantity,
       Price * Quantity AS Total_Amount
FROM LS2_Product;

-- Q6. AND operator
SELECT * FROM LS2_Student
WHERE Age >= 20 AND Course = 'BTech';

-- Q7. OR operator
SELECT * FROM LS2_Student
WHERE City = 'Delhi' OR City = 'Kanpur';

-- Q8. NOT operator
SELECT * FROM LS2_Student
WHERE NOT Course = 'BTech';

-- Q9. Students in a specific course AND city
SELECT * FROM LS2_Student
WHERE Course = 'BTech' AND City = 'Delhi';

-- Q10. Employees from either of two departments
SELECT * FROM LS2_Employee
WHERE Department = 'IT' OR Department = 'HR';

-- Q11. Equal to operator
SELECT * FROM LS2_Student
WHERE Age = 20;

-- Q12. Greater than operator
SELECT * FROM LS2_Employee
WHERE Salary > 30000;

-- Q13. Less than operator
SELECT * FROM LS2_Product
WHERE Price < 10000;

-- Q14. Greater than or equal / Less than or equal
SELECT * FROM LS2_Student
WHERE Age >= 20 AND Age <= 22;

-- Q15. Not equal operator
SELECT * FROM LS2_Student
WHERE City <> 'Delhi';

-- Q16. BETWEEN operator
SELECT * FROM LS2_Employee
WHERE Salary BETWEEN 30000 AND 60000;

-- Q17. IN operator
SELECT * FROM LS2_Student
WHERE City IN ('Delhi', 'Kanpur', 'Pune');

-- Q18. NOT IN operator
SELECT * FROM LS2_Student
WHERE City NOT IN ('Delhi', 'Kanpur');

-- Q19. LIKE operator
SELECT * FROM LS2_Student
WHERE Name LIKE 'A%';

-- Q20. IS NULL and IS NOT NULL
SELECT * FROM LS2_Student
WHERE City IS NULL;

SELECT * FROM LS2_Student
WHERE City IS NOT NULL;

-- Q21. UNION
SELECT City AS Place_Name FROM LS2_Student
UNION
SELECT Location AS Place_Name FROM LS2_Department;

-- Q22. UNION ALL
SELECT City AS Place_Name FROM LS2_Student
UNION ALL
SELECT Location AS Place_Name FROM LS2_Department;

-- Q23. INTERSECT (MySQL 8.0.45)
SELECT City FROM LS2_Student
INTERSECT
SELECT Location FROM LS2_Department;

-- Q24. EXCEPT (MySQL 8.0.45)
SELECT City FROM LS2_Student
EXCEPT
SELECT Location FROM LS2_Department;

-- Q25. Arithmetic + Logical + Comparison
-- and Special operators together
SELECT Product_Name, Price, Quantity,
       Price * Quantity AS Total_Amount
FROM LS2_Product
WHERE Price > 1000
  AND Quantity > 0
  AND Product_Name IN ('Laptop', 'Keyboard', 'Monitor');
