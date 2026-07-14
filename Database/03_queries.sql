/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 03_queries.sql
Part: 1 (Queries 1-25)

Description:
Basic and Filtering SQL Queries
===========================================================
*/

USE enterprise_employee_management;

-- =====================================================
-- SECTION A : Basic Queries
-- =====================================================

-- Query 1
-- Display all employees

SELECT *
FROM Employees;

---------------------------------------------------------

-- Query 2
-- Display employee names

SELECT
employee_id,
first_name,
last_name
FROM Employees;

---------------------------------------------------------

-- Query 3
-- Display full employee name

SELECT
employee_id,
CONCAT(first_name,' ',last_name) AS Employee_Name
FROM Employees;

---------------------------------------------------------

-- Query 4
-- Display employee email and phone

SELECT
employee_id,
email,
phone
FROM Employees;

---------------------------------------------------------

-- Query 5
-- Display all departments

SELECT *
FROM Departments;

---------------------------------------------------------

-- Query 6
-- Display all job roles

SELECT *
FROM Job_Roles;

---------------------------------------------------------

-- Query 7
-- Employees ordered by salary (Highest first)

SELECT *
FROM Employees
ORDER BY salary DESC;

---------------------------------------------------------

-- Query 8
-- Employees ordered by hire date

SELECT *
FROM Employees
ORDER BY hire_date;

---------------------------------------------------------

-- Query 9
-- Top 10 highest paid employees

SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 10;

---------------------------------------------------------

-- Query 10
-- Lowest 10 salaries

SELECT *
FROM Employees
ORDER BY salary
LIMIT 10;

---------------------------------------------------------

-- Query 11
-- Total number of employees

SELECT COUNT(*) AS Total_Employees
FROM Employees;

---------------------------------------------------------

-- Query 12
-- Total departments

SELECT COUNT(*) AS Total_Departments
FROM Departments;

---------------------------------------------------------

-- Query 13
-- Total job roles

SELECT COUNT(*) AS Total_Job_Roles
FROM Job_Roles;

---------------------------------------------------------

-- Query 14
-- Employee IDs and department IDs

SELECT
employee_id,
department_id
FROM Employees;

---------------------------------------------------------

-- Query 15
-- Distinct department IDs used

SELECT DISTINCT department_id
FROM Employees;

-- =====================================================
-- SECTION B : Filtering Queries
-- =====================================================

-- Query 16
-- Male employees

SELECT *
FROM Employees
WHERE gender='Male';

---------------------------------------------------------

-- Query 17
-- Female employees

SELECT *
FROM Employees
WHERE gender='Female';

---------------------------------------------------------

-- Query 18
-- Salary greater than 70000

SELECT *
FROM Employees
WHERE salary > 70000;

---------------------------------------------------------

-- Query 19
-- Salary between 50000 and 80000

SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

---------------------------------------------------------

-- Query 20
-- Employees hired after 2022

SELECT *
FROM Employees
WHERE hire_date > '2022-01-01';

---------------------------------------------------------

-- Query 21
-- Employees from IT department (department_id = 2)

SELECT *
FROM Employees
WHERE department_id = 2;

---------------------------------------------------------

-- Query 22
-- Employees whose first name starts with 'A'

SELECT *
FROM Employees
WHERE first_name LIKE 'A%';

---------------------------------------------------------

-- Query 23
-- Employees whose last name ends with 'a'

SELECT *
FROM Employees
WHERE last_name LIKE '%a';

---------------------------------------------------------

-- Query 24
-- Employees working in departments 1,2,3

SELECT *
FROM Employees
WHERE department_id IN (1,2,3);

---------------------------------------------------------

-- Query 25
-- Employees with salary greater than average salary

SELECT *
FROM Employees
WHERE salary >
(
SELECT AVG(salary)
FROM Employees
);

-- =====================================================
-- SECTION C : Aggregate Functions
-- =====================================================

-- Query 26
-- Average employee salary

SELECT ROUND(AVG(salary),2) AS Average_Salary
FROM Employees;

---------------------------------------------------------

-- Query 27
-- Highest salary

SELECT MAX(salary) AS Highest_Salary
FROM Employees;

---------------------------------------------------------

-- Query 28
-- Lowest salary

SELECT MIN(salary) AS Lowest_Salary
FROM Employees;

---------------------------------------------------------

-- Query 29
-- Total salary paid

SELECT SUM(salary) AS Total_Salary
FROM Employees;

---------------------------------------------------------

-- Query 30
-- Number of employees in each department

SELECT
department_id,
COUNT(*) AS Total_Employees
FROM Employees
GROUP BY department_id
ORDER BY department_id;

---------------------------------------------------------

-- Query 31
-- Average salary by department

SELECT
department_id,
ROUND(AVG(salary),2) AS Average_Salary
FROM Employees
GROUP BY department_id;

---------------------------------------------------------

-- Query 32
-- Highest salary in each department

SELECT
department_id,
MAX(salary) AS Highest_Salary
FROM Employees
GROUP BY department_id;

---------------------------------------------------------

-- Query 33
-- Lowest salary in each department

SELECT
department_id,
MIN(salary) AS Lowest_Salary
FROM Employees
GROUP BY department_id;

---------------------------------------------------------

-- Query 34
-- Departments having more than 10 employees

SELECT
department_id,
COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) > 10;

---------------------------------------------------------

-- Query 35
-- Average rating from performance reviews

SELECT
ROUND(AVG(rating),2) AS Average_Rating
FROM Performance_Reviews;

-- =====================================================
-- SECTION D : JOIN Queries
-- =====================================================

-- Query 36
-- Employee with department name

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id;

---------------------------------------------------------

-- Query 37
-- Employee with role name

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
jr.role_name
FROM Employees e
INNER JOIN Employee_Roles er
ON e.employee_id=er.employee_id
INNER JOIN Job_Roles jr
ON er.role_id=jr.role_id;

---------------------------------------------------------

-- Query 38
-- Employee, Department and Salary

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
e.salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id;

---------------------------------------------------------

-- Query 39
-- Employee attendance

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
a.attendance_date,
a.status
FROM Employees e
INNER JOIN Attendance a
ON e.employee_id=a.employee_id;

---------------------------------------------------------

-- Query 40
-- Employee performance review

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating,
p.reviewer_name
FROM Employees e
INNER JOIN Performance_Reviews p
ON e.employee_id=p.employee_id;

---------------------------------------------------------

-- Query 41
-- Employees with department and role

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
jr.role_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id
INNER JOIN Employee_Roles er
ON e.employee_id=er.employee_id
INNER JOIN Job_Roles jr
ON er.role_id=jr.role_id;

---------------------------------------------------------

-- Query 42
-- Employees with attendance status

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
a.status
FROM Employees e
INNER JOIN Attendance a
ON e.employee_id=a.employee_id;

---------------------------------------------------------

-- Query 43
-- Employees with review comments

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.comments
FROM Employees e
INNER JOIN Performance_Reviews p
ON e.employee_id=p.employee_id;

---------------------------------------------------------

-- Query 44
-- LEFT JOIN example

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
LEFT JOIN Performance_Reviews p
ON e.employee_id=p.employee_id;

---------------------------------------------------------

-- Query 45
-- RIGHT JOIN example

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
a.status
FROM Employees e
RIGHT JOIN Attendance a
ON e.employee_id=a.employee_id;

---------------------------------------------------------

-- Query 46
-- Department-wise employee list

SELECT
d.department_name,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name
FROM Departments d
INNER JOIN Employees e
ON d.department_id=e.department_id
ORDER BY d.department_name;

---------------------------------------------------------

-- Query 47
-- Employees with role assignment date

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
jr.role_name,
er.assigned_date
FROM Employees e
INNER JOIN Employee_Roles er
ON e.employee_id=er.employee_id
INNER JOIN Job_Roles jr
ON er.role_id=jr.role_id;

---------------------------------------------------------

-- Query 48
-- Employees with department budget

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
d.budget
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id;

---------------------------------------------------------

-- Query 49
-- Employee attendance with department

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
a.status
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id
INNER JOIN Attendance a
ON e.employee_id=a.employee_id;

---------------------------------------------------------

-- Query 50
-- Complete employee report

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
jr.role_name,
e.salary,
a.status,
p.rating
FROM Employees e
INNER JOIN Departments d
ON e.department_id=d.department_id
INNER JOIN Employee_Roles er
ON e.employee_id=er.employee_id
INNER JOIN Job_Roles jr
ON er.role_id=jr.role_id
INNER JOIN Attendance a
ON e.employee_id=a.employee_id
INNER JOIN Performance_Reviews p
ON e.employee_id=p.employee_id;

-- =====================================================
-- SECTION E : Subqueries
-- =====================================================

-- Query 51
-- Employees earning above average salary

SELECT *
FROM Employees
WHERE salary >
(
SELECT AVG(salary)
FROM Employees
);

---------------------------------------------------------

-- Query 52
-- Employees earning highest salary

SELECT *
FROM Employees
WHERE salary =
(
SELECT MAX(salary)
FROM Employees
);

---------------------------------------------------------

-- Query 53
-- Employees earning lowest salary

SELECT *
FROM Employees
WHERE salary =
(
SELECT MIN(salary)
FROM Employees
);

---------------------------------------------------------

-- Query 54
-- Employees working in the department having highest budget

SELECT *
FROM Employees
WHERE department_id =
(
SELECT department_id
FROM Departments
ORDER BY budget DESC
LIMIT 1
);

---------------------------------------------------------

-- Query 55
-- Employees whose salary is greater than Data Analyst minimum salary

SELECT *
FROM Employees
WHERE salary >
(
SELECT min_salary
FROM Job_Roles
WHERE role_name='Data Analyst'
);

---------------------------------------------------------

-- Query 56
-- Departments having employees

SELECT *
FROM Departments
WHERE department_id IN
(
SELECT DISTINCT department_id
FROM Employees
);

---------------------------------------------------------

-- Query 57
-- Employees having performance rating above 4.5

SELECT *
FROM Employees
WHERE employee_id IN
(
SELECT employee_id
FROM Performance_Reviews
WHERE rating > 4.5
);

---------------------------------------------------------

-- Query 58
-- Employees who were absent

SELECT *
FROM Employees
WHERE employee_id IN
(
SELECT employee_id
FROM Attendance
WHERE status='Absent'
);

---------------------------------------------------------

-- Query 59
-- Employees who were on leave

SELECT *
FROM Employees
WHERE employee_id IN
(
SELECT employee_id
FROM Attendance
WHERE status='Leave'
);

---------------------------------------------------------

-- Query 60
-- Employees with active roles

SELECT *
FROM Employees
WHERE employee_id IN
(
SELECT employee_id
FROM Employee_Roles
WHERE role_end_date IS NULL
);

-- =====================================================
-- SECTION F : Business Queries
-- =====================================================

-- Query 61
-- Department-wise average salary

SELECT
d.department_name,
ROUND(AVG(e.salary),2) AS Average_Salary
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Average_Salary DESC;

---------------------------------------------------------

-- Query 62
-- Department-wise employee count

SELECT
d.department_name,
COUNT(e.employee_id) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Employee_Count DESC;

---------------------------------------------------------

-- Query 63
-- Highest paid employee in each department

SELECT
d.department_name,
MAX(e.salary) AS Highest_Salary
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

---------------------------------------------------------

-- Query 64
-- Average rating by reviewer

SELECT
reviewer_name,
ROUND(AVG(rating),2) AS Average_Rating
FROM Performance_Reviews
GROUP BY reviewer_name
ORDER BY Average_Rating DESC;

---------------------------------------------------------

-- Query 65
-- Attendance summary

SELECT
status,
COUNT(*) AS Total
FROM Attendance
GROUP BY status;

---------------------------------------------------------

-- Query 66
-- Employees having rating above average

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
WHERE p.rating >
(
SELECT AVG(rating)
FROM Performance_Reviews
);

---------------------------------------------------------

-- Query 67
-- Employees with salary above department average

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
e.salary,
e.department_id
FROM Employees e
WHERE salary >
(
SELECT AVG(e2.salary)
FROM Employees e2
WHERE e.department_id=e2.department_id
);

---------------------------------------------------------

-- Query 68
-- Employees with excellent performance

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
WHERE p.rating>=4.5;

---------------------------------------------------------

-- Query 69
-- Employees hired before 2020

SELECT *
FROM Employees
WHERE hire_date<'2020-01-01';

---------------------------------------------------------

-- Query 70
-- Employees hired after 2022

SELECT *
FROM Employees
WHERE hire_date>'2022-01-01';

---------------------------------------------------------

-- Query 71
-- Employees ordered by performance rating

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
ORDER BY p.rating DESC;

---------------------------------------------------------

-- Query 72
-- Employees ordered by attendance status

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
a.status
FROM Employees e
JOIN Attendance a
ON e.employee_id=a.employee_id
ORDER BY a.status;

---------------------------------------------------------

-- Query 73
-- Top 5 performers

SELECT
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
ORDER BY p.rating DESC
LIMIT 5;

---------------------------------------------------------

-- Query 74
-- Top 5 highest salaries

SELECT
CONCAT(first_name,' ',last_name) AS Employee_Name,
salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

---------------------------------------------------------

-- Query 75
-- Employees having salary greater than 90000

SELECT
employee_id,
CONCAT(first_name,' ',last_name) AS Employee_Name,
salary
FROM Employees
WHERE salary>90000;

-- =====================================================
-- SECTION G : Advanced SQL Queries
-- =====================================================

-- Query 76
-- Rank employees by salary

SELECT
employee_id,
CONCAT(first_name,' ',last_name) AS Employee_Name,
salary,
RANK() OVER(ORDER BY salary DESC) AS Salary_Rank
FROM Employees;

---------------------------------------------------------

-- Query 77
-- Dense Rank employees by salary

SELECT
employee_id,
CONCAT(first_name,' ',last_name) AS Employee_Name,
salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS Salary_Rank
FROM Employees;

---------------------------------------------------------

-- Query 78
-- Row Number by salary

SELECT
employee_id,
CONCAT(first_name,' ',last_name) AS Employee_Name,
salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS Row_No
FROM Employees;

---------------------------------------------------------

-- Query 79
-- Highest paid employee from each department

SELECT *
FROM
(
SELECT
e.*,
ROW_NUMBER() OVER
(
PARTITION BY department_id
ORDER BY salary DESC
) AS rn
FROM Employees e
) t
WHERE rn=1;

---------------------------------------------------------

-- Query 80
-- Department-wise salary ranking

SELECT
department_id,
employee_id,
salary,
RANK() OVER
(
PARTITION BY department_id
ORDER BY salary DESC
) AS Dept_Rank
FROM Employees;

---------------------------------------------------------

-- Query 81
-- Previous employee salary (LAG)

SELECT
employee_id,
salary,
LAG(salary) OVER
(
ORDER BY salary
) AS Previous_Salary
FROM Employees;

---------------------------------------------------------

-- Query 82
-- Next employee salary (LEAD)

SELECT
employee_id,
salary,
LEAD(salary) OVER
(
ORDER BY salary
) AS Next_Salary
FROM Employees;

---------------------------------------------------------

-- Query 83
-- Running total salary

SELECT
employee_id,
salary,
SUM(salary) OVER
(
ORDER BY employee_id
) AS Running_Total
FROM Employees;

---------------------------------------------------------

-- Query 84
-- Average salary of each department using window function

SELECT
employee_id,
department_id,
salary,
ROUND
(
AVG(salary) OVER(PARTITION BY department_id),
2
) AS Department_Average
FROM Employees;

---------------------------------------------------------

-- Query 85
-- Employees earning more than department average

SELECT *
FROM
(
SELECT
employee_id,
first_name,
last_name,
department_id,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS Avg_Department_Salary
FROM Employees
) t
WHERE salary>Avg_Department_Salary;

---------------------------------------------------------

-- Query 86
-- Department with highest average salary

SELECT
d.department_name,
ROUND(AVG(e.salary),2) AS Avg_Salary
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name
ORDER BY Avg_Salary DESC
LIMIT 1;

---------------------------------------------------------

-- Query 87
-- Highest performance rating

SELECT *
FROM Performance_Reviews
ORDER BY rating DESC
LIMIT 1;

---------------------------------------------------------

-- Query 88
-- Employees with rating greater than 4.5

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
WHERE rating>=4.5;

---------------------------------------------------------

-- Query 89
-- Attendance percentage

SELECT
status,
ROUND(COUNT(*)*100.0/
(SELECT COUNT(*) FROM Attendance),2)
AS Percentage
FROM Attendance
GROUP BY status;

---------------------------------------------------------

-- Query 90
-- Employees whose salary is within role salary range

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
e.salary,
jr.role_name
FROM Employees e
JOIN Employee_Roles er
ON e.employee_id=er.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id
WHERE e.salary
BETWEEN jr.min_salary AND jr.max_salary;

---------------------------------------------------------

-- Query 91
-- Employees whose salary exceeds role maximum

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
e.salary,
jr.role_name,
jr.max_salary
FROM Employees e
JOIN Employee_Roles er
ON e.employee_id=er.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id
WHERE e.salary>jr.max_salary;

---------------------------------------------------------

-- Query 92
-- Employees hired in the same year

SELECT
YEAR(hire_date) AS Hire_Year,
COUNT(*) AS Total_Employees
FROM Employees
GROUP BY YEAR(hire_date)
ORDER BY Hire_Year;

---------------------------------------------------------

-- Query 93
-- Oldest employee

SELECT *
FROM Employees
ORDER BY dob
LIMIT 1;

---------------------------------------------------------

-- Query 94
-- Youngest employee

SELECT *
FROM Employees
ORDER BY dob DESC
LIMIT 1;

---------------------------------------------------------

-- Query 95
-- Employees with perfect rating

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
p.rating
FROM Employees e
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id
WHERE p.rating=5;

---------------------------------------------------------

-- Query 96
-- Employees currently assigned to active roles

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
jr.role_name
FROM Employees e
JOIN Employee_Roles er
ON e.employee_id=er.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id
WHERE er.role_end_date IS NULL;

---------------------------------------------------------

-- Query 97
-- Employees ordered by department then salary

SELECT
department_id,
employee_id,
salary
FROM Employees
ORDER BY department_id,salary DESC;

---------------------------------------------------------

-- Query 98
-- Department budget with employee count

SELECT
d.department_name,
d.budget,
COUNT(e.employee_id) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.department_id=e.department_id
GROUP BY
d.department_id,
d.department_name,
d.budget;

---------------------------------------------------------

-- Query 99
-- Employee complete report

SELECT
e.employee_id,
CONCAT(e.first_name,' ',e.last_name) AS Employee_Name,
d.department_name,
jr.role_name,
e.salary,
a.status,
p.rating
FROM Employees e
JOIN Departments d
ON e.department_id=d.department_id
JOIN Employee_Roles er
ON e.employee_id=er.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id
JOIN Attendance a
ON e.employee_id=a.employee_id
JOIN Performance_Reviews p
ON e.employee_id=p.employee_id;

---------------------------------------------------------

-- Query 100
-- Database Summary Report

SELECT
(SELECT COUNT(*) FROM Departments) AS Departments,
(SELECT COUNT(*) FROM Employees) AS Employees,
(SELECT COUNT(*) FROM Job_Roles) AS Job_Roles,
(SELECT COUNT(*) FROM Employee_Roles) AS Employee_Roles,
(SELECT COUNT(*) FROM Attendance) AS Attendance,
(SELECT COUNT(*) FROM Performance_Reviews) AS Performance_Reviews;