/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 01_schema.sql
Database: MySQL 8
Author: Hardik Bishnoi
===========================================================

Description:
This file creates the complete database schema for the
Enterprise Employee Management System.

Features:
- Database creation
- 6 Normalized Tables (3NF)
- Primary Keys
- Foreign Keys
- AUTO_INCREMENT
- UNIQUE Constraints
- CHECK Constraints (MySQL 8+)
- NOT NULL Constraints
- Referential Integrity
===========================================================
*/

-- =====================================================
-- Drop Database (Optional)
-- =====================================================

DROP DATABASE IF EXISTS enterprise_employee_management;

-- =====================================================
-- Create Database
-- =====================================================

CREATE DATABASE enterprise_employee_management;

USE enterprise_employee_management;

-- =====================================================
-- TABLE 1 : Departments
-- =====================================================

CREATE TABLE Departments
(
    department_id INT AUTO_INCREMENT PRIMARY KEY,

    department_name VARCHAR(100) NOT NULL UNIQUE,

    location VARCHAR(100) NOT NULL,

    budget DECIMAL(15,2) NOT NULL,

    CHECK (budget >= 0)
);

-- =====================================================
-- TABLE 2 : Employees
-- =====================================================

CREATE TABLE Employees
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(120) NOT NULL UNIQUE,

    phone VARCHAR(15) NOT NULL UNIQUE,

    gender ENUM('Male','Female','Other') NOT NULL,

    dob DATE NOT NULL,

    hire_date DATE NOT NULL,

    salary DECIMAL(10,2) NOT NULL,

    department_id INT NOT NULL,

    CHECK (salary >= 15000),

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =====================================================
-- TABLE 3 : Job Roles
-- =====================================================

CREATE TABLE Job_Roles
(
    role_id INT AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(100) NOT NULL UNIQUE,

    min_salary DECIMAL(10,2) NOT NULL,

    max_salary DECIMAL(10,2) NOT NULL,

    CHECK (min_salary >= 0),

    CHECK (max_salary >= min_salary)
);

-- =====================================================
-- TABLE 4 : Employee Roles
-- =====================================================
-- Stores employee role history.
-- One employee can hold multiple roles over time.
-- =====================================================

CREATE TABLE Employee_Roles
(
    emp_role_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT NOT NULL,

    role_id INT NOT NULL,

    assigned_date DATE NOT NULL,

    role_end_date DATE DEFAULT NULL,

    UNIQUE(employee_id, role_id),

    CHECK
    (
        role_end_date IS NULL
        OR role_end_date >= assigned_date
    ),

    CONSTRAINT fk_er_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_er_role
        FOREIGN KEY (role_id)
        REFERENCES Job_Roles(role_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =====================================================
-- TABLE 5 : Attendance
-- =====================================================

CREATE TABLE Attendance
(
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT NOT NULL,

    attendance_date DATE NOT NULL,

    status ENUM
    (
        'Present',
        'Absent',
        'Leave'
    ) NOT NULL,

    check_in TIME,

    check_out TIME,

    UNIQUE(employee_id, attendance_date),

    CHECK
    (
        check_out IS NULL
        OR check_in IS NULL
        OR check_out > check_in
    ),

    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =====================================================
-- TABLE 6 : Performance Reviews
-- =====================================================
-- Stores yearly performance appraisal records.
-- =====================================================

CREATE TABLE Performance_Reviews
(
    review_id INT AUTO_INCREMENT PRIMARY KEY,

    employee_id INT NOT NULL,

    review_date DATE NOT NULL,

    rating DECIMAL(3,2) NOT NULL,

    reviewer_name VARCHAR(100) NOT NULL,

    comments VARCHAR(500),

    CHECK (rating BETWEEN 1.00 AND 5.00),

    CONSTRAINT fk_review_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =====================================================
-- Verify Tables
-- =====================================================

SHOW TABLES;

-- =====================================================
-- Describe Tables
-- =====================================================

DESCRIBE Departments;
DESCRIBE Employees;
DESCRIBE Job_Roles;
DESCRIBE Employee_Roles;
DESCRIBE Attendance;
DESCRIBE Performance_Reviews;