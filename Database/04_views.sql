/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 04_views.sql
Database: MySQL 8
Author: Hardik Bishnoi
===========================================================

Description:
Views for reporting and analytics.

===========================================================
*/

USE enterpriseemployeedb;

-- =====================================================
-- View 1 : Employee Basic Details
-- =====================================================

CREATE OR REPLACE VIEW vw_employee_details AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    e.email,
    e.phone,
    d.department_name,
    e.salary,
    e.hire_date
FROM Employees e
JOIN Departments d
ON e.department_id=d.department_id;

-- =====================================================
-- View 2 : Employee Role Details
-- =====================================================

CREATE OR REPLACE VIEW vw_employee_roles AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    jr.role_name,
    er.assigned_date,
    er.role_end_date
FROM Employee_Roles er
JOIN Employees e
ON er.employee_id=e.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id;

-- =====================================================
-- View 3 : Attendance Summary
-- =====================================================

CREATE OR REPLACE VIEW vw_attendance_summary AS
SELECT
    employee_id,
    COUNT(*) AS total_days,
    SUM(status='Present') AS present_days,
    SUM(status='Absent') AS absent_days,
    SUM(status='Leave') AS leave_days
FROM Attendance
GROUP BY employee_id;

-- =====================================================
-- View 4 : Performance Summary
-- =====================================================

CREATE OR REPLACE VIEW vw_performance_summary AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    ROUND(AVG(pr.rating),2) AS average_rating
FROM Employees e
LEFT JOIN Performance_Reviews pr
ON e.employee_id=pr.employee_id
GROUP BY e.employee_id;

-- =====================================================
-- View 5 : Department Salary Summary
-- =====================================================

CREATE OR REPLACE VIEW vw_department_salary AS
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
FROM Departments d
LEFT JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

-- =====================================================
-- View 6 : High Performers
-- =====================================================

CREATE OR REPLACE VIEW vw_high_performers AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    pr.rating,
    pr.review_date
FROM Employees e
JOIN Performance_Reviews pr
ON e.employee_id=pr.employee_id
WHERE pr.rating>=4.5;

-- =====================================================
-- View 7 : Current Active Roles
-- =====================================================

CREATE OR REPLACE VIEW vw_current_roles AS
SELECT
    e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    jr.role_name
FROM Employee_Roles er
JOIN Employees e
ON er.employee_id=e.employee_id
JOIN Job_Roles jr
ON er.role_id=jr.role_id
WHERE er.role_end_date IS NULL;

-- =====================================================
-- View 8 : Department Performance
-- =====================================================

CREATE OR REPLACE VIEW vw_department_performance AS
SELECT
    d.department_name,
    ROUND(AVG(pr.rating),2) AS average_rating
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
JOIN Performance_Reviews pr
ON e.employee_id=pr.employee_id
GROUP BY d.department_name;

-- =====================================================
-- Verify Views
-- =====================================================

SHOW FULL TABLES
WHERE Table_type='VIEW';

SELECT * FROM vw_employee_details;
SELECT * FROM vw_employee_roles;
SELECT * FROM vw_attendance_summary;
SELECT * FROM vw_performance_summary;
SELECT * FROM vw_department_salary;
SELECT * FROM vw_high_performers;
SELECT * FROM vw_current_roles;
SELECT * FROM vw_department_performance;