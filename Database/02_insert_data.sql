/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 02_insert_data.sql
Part: 2.1
Description:
Insert master data into Departments and Job_Roles tables.
===========================================================
*/

USE enterprise_employee_management;

-- =====================================================
-- Insert Departments
-- =====================================================

INSERT INTO Departments (department_name, location, budget) VALUES
('Human Resources', 'Chandigarh', 1200000.00),
('Information Technology', 'Bangalore', 8500000.00),
('Finance', 'Mumbai', 3500000.00),
('Marketing', 'Delhi', 2800000.00),
('Sales', 'Hyderabad', 5000000.00),
('Research & Development', 'Pune', 7000000.00),
('Customer Support', 'Noida', 2200000.00),
('Operations', 'Jaipur', 4200000.00),
('Legal', 'Gurgaon', 1800000.00),
('Administration', 'Ahmedabad', 1500000.00);

-- =====================================================
-- Insert Job Roles
-- =====================================================

INSERT INTO Job_Roles (role_name, min_salary, max_salary) VALUES
('Intern', 15000, 25000),
('Software Engineer', 35000, 90000),
('Senior Software Engineer', 70000, 140000),
('Team Lead', 90000, 180000),
('Project Manager', 120000, 250000),
('HR Executive', 30000, 60000),
('Finance Analyst', 45000, 90000),
('Marketing Executive', 35000, 70000),
('Sales Executive', 30000, 80000),
('Data Analyst', 45000, 100000),
('System Administrator', 40000, 90000),
('QA Engineer', 35000, 85000);

-- =====================================================
-- Verify Master Data
-- =====================================================

SELECT * FROM Departments;
SELECT * FROM Job_Roles;

SELECT COUNT(*) AS Total_Departments
FROM Departments;

SELECT COUNT(*) AS Total_Job_Roles
FROM Job_Roles;