/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 05_indexes.sql
Database: MySQL 8
Author: Hardik Bishnoi
===========================================================

Description:
Indexes to improve query performance.

Features:
- Single-column indexes
- Composite indexes
- Faster JOIN operations
- Faster WHERE filtering
- Faster ORDER BY queries
===========================================================
*/

USE enterprise_employee_management;

-- =====================================================
-- Employee Indexes
-- =====================================================

CREATE INDEX idx_employee_last_name
ON Employees(last_name);

CREATE INDEX idx_employee_department
ON Employees(department_id);

CREATE INDEX idx_employee_hire_date
ON Employees(hire_date);

CREATE INDEX idx_employee_salary
ON Employees(salary);

-- =====================================================
-- Attendance Indexes
-- =====================================================

CREATE INDEX idx_attendance_employee
ON Attendance(employee_id);

CREATE INDEX idx_attendance_date
ON Attendance(attendance_date);

CREATE INDEX idx_attendance_employee_date
ON Attendance(employee_id, attendance_date);

-- =====================================================
-- Employee Roles Indexes
-- =====================================================

CREATE INDEX idx_role_employee
ON Employee_Roles(employee_id);

CREATE INDEX idx_role_role
ON Employee_Roles(role_id);

CREATE INDEX idx_role_assigned_date
ON Employee_Roles(assigned_date);

-- =====================================================
-- Performance Review Indexes
-- =====================================================

CREATE INDEX idx_review_employee
ON Performance_Reviews(employee_id);

CREATE INDEX idx_review_rating
ON Performance_Reviews(rating);

CREATE INDEX idx_review_date
ON Performance_Reviews(review_date);

CREATE INDEX idx_review_employee_date
ON Performance_Reviews(employee_id, review_date);

-- =====================================================
-- Department Index
-- =====================================================

CREATE INDEX idx_department_name
ON Departments(department_name);

-- =====================================================
-- Job Role Index
-- =====================================================

CREATE INDEX idx_job_role_name
ON Job_Roles(role_name);

-- =====================================================
-- Show All Indexes
-- =====================================================

SHOW INDEX FROM Departments;

SHOW INDEX FROM Employees;

SHOW INDEX FROM Job_Roles;

SHOW INDEX FROM Employee_Roles;

SHOW INDEX FROM Attendance;

SHOW INDEX FROM Performance_Reviews;
