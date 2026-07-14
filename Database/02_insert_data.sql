/*
===========================================================
Enterprise Employee Management System (EEMS)
File: 02_insert_data.sql
Database: MySQL 8
Author: Hardik Bishnoi
===========================================================

Description:
This file inserts sample data into all tables.

Tables Covered:
1. Departments
2. Job_Roles
3. Employees
4. Employee_Roles
5. Attendance
6. Performance_Reviews
===========================================================
*/

USE enterprise_employee_management;

-- =====================================================
-- PART 1 : Insert Departments
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
-- Verify Departments
-- =====================================================

SELECT COUNT(*) AS Total_Departments
FROM Departments;
-- =====================================================
-- PART 2 : Insert Job Roles
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
-- Verify Job Roles
-- =====================================================

SELECT COUNT(*) AS Total_Job_Roles
FROM Job_Roles;

-- =====================================================
-- PART 3 : Insert Employees
-- =====================================================
INSERT INTO Employees
(first_name,last_name,email,phone,gender,dob,hire_date,salary,department_id)
VALUES
('Aarav','Sharma','aarav.sharma@eems.com','9000000001','Male','1997-02-15','2020-01-10',55000,2),
('Vivaan','Gupta','vivaan.gupta@eems.com','9000000002','Male','1996-08-21','2019-06-15',72000,2),
('Aditya','Verma','aditya.verma@eems.com','9000000003','Male','1998-11-12','2021-03-18',48000,5),
('Vihaan','Mehta','vihaan.mehta@eems.com','9000000004','Male','1995-07-05','2018-09-11',98000,2),
('Arjun','Singh','arjun.singh@eems.com','9000000005','Male','1997-09-09','2022-02-01',51000,1),
('Krishna','Patel','krishna.patel@eems.com','9000000006','Male','1998-05-24','2021-07-15',46000,3),
('Ishaan','Joshi','ishaan.joshi@eems.com','9000000007','Male','1996-01-17','2019-04-20',68000,4),
('Kabir','Malhotra','kabir.malhotra@eems.com','9000000008','Male','1999-03-08','2023-01-09',39000,6),
('Rohan','Kapoor','rohan.kapoor@eems.com','9000000009','Male','1995-06-28','2018-10-12',92000,2),
('Aryan','Chopra','aryan.chopra@eems.com','9000000010','Male','1998-12-30','2022-05-15',53000,8),
('Sneha','Sharma','sneha.sharma@eems.com','9000000011','Female','1997-04-12','2020-02-10',52000,7),
('Priya','Gupta','priya.gupta@eems.com','9000000012','Female','1996-09-19','2019-05-14',61000,3),
('Ananya','Verma','ananya.verma@eems.com','9000000013','Female','1998-10-02','2021-06-11',47000,2),
('Aditi','Mehta','aditi.mehta@eems.com','9000000014','Female','1995-11-26','2018-03-19',89000,5),
('Kavya','Singh','kavya.singh@eems.com','9000000015','Female','1999-01-14','2023-04-01',42000,4),
('Pooja','Patel','pooja.patel@eems.com','9000000016','Female','1997-08-18','2020-08-10',56000,1),
('Neha','Joshi','neha.joshi@eems.com','9000000017','Female','1996-03-06','2019-09-21',65000,3),
('Riya','Malhotra','riya.malhotra@eems.com','9000000018','Female','1998-07-29','2022-01-12',45000,6),
('Simran','Kapoor','simran.kapoor@eems.com','9000000019','Female','1995-02-09','2018-06-28',96000,2),
('Nisha','Chopra','nisha.chopra@eems.com','9000000020','Female','1999-12-11','2023-02-15',41000,7),
('Rahul','Bansal','rahul.bansal@eems.com','9000000021','Male','1997-05-11','2020-04-14',58000,8),
('Mohit','Agarwal','mohit.agarwal@eems.com','9000000022','Male','1996-07-07','2019-08-16',76000,2),
('Saurabh','Saxena','saurabh.saxena@eems.com','9000000023','Male','1995-04-18','2018-11-09',101000,6),
('Deepak','Yadav','deepak.yadav@eems.com','9000000024','Male','1998-09-01','2021-12-12',50000,9),
('Nitin','Mishra','nitin.mishra@eems.com','9000000025','Male','1999-02-20','2023-03-20',39000,10),
('Harsh','Shukla','harsh.shukla@eems.com','9000000026','Male','1996-10-13','2019-07-18',69000,4),
('Karan','Arora','karan.arora@eems.com','9000000027','Male','1995-12-27','2018-05-22',87000,5),
('Yash','Khanna','yash.khanna@eems.com','9000000028','Male','1997-01-25','2020-09-09',57000,3),
('Manish','Rana','manish.rana@eems.com','9000000029','Male','1998-06-15','2021-10-10',52000,8),
('Aman','Gill','aman.gill@eems.com','9000000030','Male','1999-08-30','2022-11-05',44000,7),
('Meera','Bansal','meera.bansal@eems.com','9000000031','Female','1997-03-04','2020-05-06',54000,4),
('Isha','Agarwal','isha.agarwal@eems.com','9000000032','Female','1996-06-10','2019-02-13',73000,2),
('Tanvi','Saxena','tanvi.saxena@eems.com','9000000033','Female','1998-04-22','2021-08-19',49000,9),
('Muskan','Yadav','muskan.yadav@eems.com','9000000034','Female','1995-09-08','2018-12-17',91000,6),
('Payal','Mishra','payal.mishra@eems.com','9000000035','Female','1999-07-27','2023-01-20',43000,10),
('Rashmi','Shukla','rashmi.shukla@eems.com','9000000036','Female','1997-12-01','2020-07-28',59000,1),
('Divya','Arora','divya.arora@eems.com','9000000037','Female','1996-11-14','2019-10-08',66000,5),
('Komal','Khanna','komal.khanna@eems.com','9000000038','Female','1998-02-18','2022-06-30',47000,8),
('Shreya','Rana','shreya.rana@eems.com','9000000039','Female','1995-05-29','2018-01-15',94000,2),
('Pallavi','Gill','pallavi.gill@eems.com','9000000040','Female','1999-10-16','2023-05-11',42000,3),
('Rajat','Sharma','rajat.sharma41@eems.com','9000000041','Male','1995-01-01','2018-04-10',42000,1),
('Ankit','Gupta','ankit.gupta42@eems.com','9000000042','Male','1996-02-02','2019-05-11',43800,2),
('Lokesh','Verma','lokesh.verma43@eems.com','9000000043','Male','1997-03-03','2020-06-12',45600,3),
('Varun','Singh','varun.singh44@eems.com','9000000044','Male','1998-04-04','2021-07-13',47400,4),
('Siddharth','Patel','siddharth.patel45@eems.com','9000000045','Male','1999-05-05','2022-08-14',49200,5),
('Pranav','Joshi','pranav.joshi46@eems.com','9000000046','Male','1995-06-06','2023-09-15',51000,6),
('Nikhil','Mehta','nikhil.mehta47@eems.com','9000000047','Male','1996-07-07','2018-10-16',52800,7),
('Gaurav','Kapoor','gaurav.kapoor48@eems.com','9000000048','Male','1997-08-08','2019-11-17',54600,8),
('Rakesh','Bansal','rakesh.bansal49@eems.com','9000000049','Male','1998-09-09','2020-12-18',56400,9),
('Hemant','Yadav','hemant.yadav50@eems.com','9000000050','Male','1999-10-10','2021-01-19',58200,10),
('Vikas','Agarwal','vikas.agarwal51@eems.com','9000000051','Male','1995-11-11','2022-02-20',60000,1),
('Abhishek','Arora','abhishek.arora52@eems.com','9000000052','Male','1996-12-12','2023-03-21',61800,2),
('Tarun','Khanna','tarun.khanna53@eems.com','9000000053','Male','1997-01-13','2018-04-22',63600,3),
('Sachin','Mishra','sachin.mishra54@eems.com','9000000054','Male','1998-02-14','2019-05-23',65400,4),
('Ritesh','Saxena','ritesh.saxena55@eems.com','9000000055','Male','1999-03-15','2020-06-24',67200,5),
('Pankaj','Gill','pankaj.gill56@eems.com','9000000056','Male','1995-04-16','2021-07-25',69000,6),
('Rohit','Rana','rohit.rana57@eems.com','9000000057','Male','1996-05-17','2022-08-26',70800,7),
('Shivam','Chopra','shivam.chopra58@eems.com','9000000058','Male','1997-06-18','2023-09-27',72600,8),
('Akash','Shukla','akash.shukla59@eems.com','9000000059','Male','1998-07-19','2018-10-01',74400,9),
('Umesh','Malhotra','umesh.malhotra60@eems.com','9000000060','Male','1999-08-20','2019-11-02',76200,10),
('Anjali','Sharma','anjali.sharma61@eems.com','9000000061','Female','1995-09-21','2020-12-03',78000,1),
('Sakshi','Gupta','sakshi.gupta62@eems.com','9000000062','Female','1996-10-22','2021-01-04',79800,2),
('Nandini','Verma','nandini.verma63@eems.com','9000000063','Female','1997-11-23','2022-02-05',81600,3),
('Bhavna','Singh','bhavna.singh64@eems.com','9000000064','Female','1998-12-24','2023-03-06',83400,4),
('Kirti','Patel','kirti.patel65@eems.com','9000000065','Female','1999-01-25','2018-04-07',85200,5),
('Monika','Joshi','monika.joshi66@eems.com','9000000066','Female','1995-02-26','2019-05-08',87000,6),
('Jyoti','Mehta','jyoti.mehta67@eems.com','9000000067','Female','1996-03-27','2020-06-09',88800,7),
('Ritu','Kapoor','ritu.kapoor68@eems.com','9000000068','Female','1997-04-01','2021-07-10',90600,8),
('Swati','Bansal','swati.bansal69@eems.com','9000000069','Female','1998-05-02','2022-08-11',92400,9),
('Preeti','Yadav','preeti.yadav70@eems.com','9000000070','Female','1999-06-03','2023-09-12',94200,10),
('Sonam','Agarwal','sonam.agarwal71@eems.com','9000000071','Female','1995-07-04','2018-10-13',96000,1),
('Ankita','Arora','ankita.arora72@eems.com','9000000072','Female','1996-08-05','2019-11-14',97800,2),
('Ruchi','Khanna','ruchi.khanna73@eems.com','9000000073','Female','1997-09-06','2020-12-15',99600,3),
('Garima','Mishra','garima.mishra74@eems.com','9000000074','Female','1998-10-07','2021-01-16',101400,4),
('Nikita','Saxena','nikita.saxena75@eems.com','9000000075','Female','1999-11-08','2022-02-17',103200,5),
('Sonia','Gill','sonia.gill76@eems.com','9000000076','Female','1995-12-09','2023-03-18',105000,6),
('Asha','Rana','asha.rana77@eems.com','9000000077','Female','1996-01-10','2018-04-19',106800,7),
('Mansi','Chopra','mansi.chopra78@eems.com','9000000078','Female','1997-02-11','2019-05-20',108600,8),
('Tanya','Shukla','tanya.shukla79@eems.com','9000000079','Female','1998-03-12','2020-06-21',110400,9),
('Heena','Malhotra','heena.malhotra80@eems.com','9000000080','Female','1999-04-13','2021-07-22',112200,10),
('Dev','Sharma','dev.sharma81@eems.com','9000000081','Male','1995-01-01','2019-03-06',50000,1),
('Kunal','Gupta','kunal.gupta82@eems.com','9000000082','Male','1996-02-02','2020-04-07',51700,2),
('Harshit','Verma','harshit.verma83@eems.com','9000000083','Male','1997-03-03','2021-05-08',53400,3),
('Mayank','Singh','mayank.singh84@eems.com','9000000084','Male','1998-04-04','2022-06-09',55100,4),
('Tushar','Patel','tushar.patel85@eems.com','9000000085','Male','1999-05-05','2023-07-10',56800,5),
('Ajay','Joshi','ajay.joshi86@eems.com','9000000086','Male','1995-06-06','2019-08-11',58500,6),
('Bhavesh','Mehta','bhavesh.mehta87@eems.com','9000000087','Male','1996-07-07','2020-09-12',60200,7),
('Chirag','Kapoor','chirag.kapoor88@eems.com','9000000088','Male','1997-08-08','2021-10-13',61900,8),
('Dheeraj','Bansal','dheeraj.bansal89@eems.com','9000000089','Male','1998-09-09','2022-11-14',63600,9),
('Farhan','Yadav','farhan.yadav90@eems.com','9000000090','Male','1999-10-10','2023-12-15',65300,10),
('Gagan','Agarwal','gagan.agarwal91@eems.com','9000000091','Male','1995-11-11','2019-01-16',67000,1),
('Hitesh','Arora','hitesh.arora92@eems.com','9000000092','Male','1996-12-12','2020-02-17',68700,2),
('Jatin','Khanna','jatin.khanna93@eems.com','9000000093','Male','1997-01-13','2021-03-18',70400,3),
('Laksh','Mishra','laksh.mishra94@eems.com','9000000094','Male','1998-02-14','2022-04-19',72100,4),
('Madhav','Saxena','madhav.saxena95@eems.com','9000000095','Male','1999-03-15','2023-05-20',73800,5),
('Naveen','Gill','naveen.gill96@eems.com','9000000096','Male','1995-04-16','2019-06-21',75500,6),
('Om','Rana','om.rana97@eems.com','9000000097','Male','1996-05-17','2020-07-22',77200,7),
('Parth','Chopra','parth.chopra98@eems.com','9000000098','Male','1997-06-18','2021-08-23',78900,8),
('Raghav','Shukla','raghav.shukla99@eems.com','9000000099','Male','1998-07-19','2022-09-24',80600,9),
('Suraj','Malhotra','suraj.malhotra100@eems.com','9000000100','Male','1999-08-20','2023-10-25',82300,10),
('Alisha','Sharma','alisha.sharma101@eems.com','9000000101','Female','1995-09-21','2019-11-26',84000,1),
('Bhumi','Gupta','bhumi.gupta102@eems.com','9000000102','Female','1996-10-22','2020-12-27',85700,2),
('Charu','Verma','charu.verma103@eems.com','9000000103','Female','1997-11-23','2021-01-01',87400,3),
('Deepika','Singh','deepika.singh104@eems.com','9000000104','Female','1998-12-24','2022-02-02',89100,4),
('Esha','Patel','esha.patel105@eems.com','9000000105','Female','1999-01-25','2023-03-03',90800,5),
('Farah','Joshi','farah.joshi106@eems.com','9000000106','Female','1995-02-26','2019-04-04',92500,6),
('Geeta','Mehta','geeta.mehta107@eems.com','9000000107','Female','1996-03-27','2020-05-05',94200,7),
('Himani','Kapoor','himani.kapoor108@eems.com','9000000108','Female','1997-04-01','2021-06-06',95900,8),
('Ira','Bansal','ira.bansal109@eems.com','9000000109','Female','1998-05-02','2022-07-07',97600,9),
('Juhi','Yadav','juhi.yadav110@eems.com','9000000110','Female','1999-06-03','2023-08-08',99300,10),
('Khushi','Agarwal','khushi.agarwal111@eems.com','9000000111','Female','1995-07-04','2019-09-09',101000,1),
('Lavanya','Arora','lavanya.arora112@eems.com','9000000112','Female','1996-08-05','2020-10-10',102700,2),
('Madhuri','Khanna','madhuri.khanna113@eems.com','9000000113','Female','1997-09-06','2021-11-11',104400,3),
('Navya','Mishra','navya.mishra114@eems.com','9000000114','Female','1998-10-07','2022-12-12',106100,4),
('Ojasvi','Saxena','ojasvi.saxena115@eems.com','9000000115','Female','1999-11-08','2023-01-13',107800,5),
('Prachi','Gill','prachi.gill116@eems.com','9000000116','Female','1995-12-09','2019-02-14',109500,6),
('Radhika','Rana','radhika.rana117@eems.com','9000000117','Female','1996-01-10','2020-03-15',111200,7),
('Shruti','Chopra','shruti.chopra118@eems.com','9000000118','Female','1997-02-11','2021-04-16',112900,8),
('Trisha','Shukla','trisha.shukla119@eems.com','9000000119','Female','1998-03-12','2022-05-17',114600,9),
('Vaishnavi','Malhotra','vaishnavi.malhotra120@eems.com','9000000120','Female','1999-04-13','2023-06-18',116300,10);

-- =====================================================
-- Verify Employees
-- =====================================================

SELECT COUNT(*) AS Total_Employees
FROM Employees;


-- =====================================================
-- PART 4 : Insert Employee Roles
-- =====================================================

INSERT INTO Employee_Roles
(
    employee_id,
    role_id,
    assigned_date,
    role_end_date
)
SELECT
    employee_id,
    ((employee_id - 1) % 12) + 1 AS role_id,
    CASE
        WHEN employee_id <= 12 THEN '2019-01-01'
        WHEN employee_id <= 24 THEN '2020-02-01'
        WHEN employee_id <= 36 THEN '2021-03-01'
        WHEN employee_id <= 48 THEN '2022-04-01'
        WHEN employee_id <= 60 THEN '2023-05-01'
        WHEN employee_id <= 72 THEN '2024-06-01'
        WHEN employee_id <= 84 THEN '2019-07-01'
        WHEN employee_id <= 96 THEN '2020-08-01'
        WHEN employee_id <= 108 THEN '2021-09-01'
        ELSE '2022-10-01'
    END AS assigned_date,
    NULL AS role_end_date
FROM Employees;

-- =====================================================
-- Verify Employee Roles
-- =====================================================

SELECT COUNT(*) AS Total_Employee_Roles
FROM Employee_Roles;


-- =====================================================
-- PART 5 : Insert Attendance
-- =====================================================

INSERT INTO Attendance
(
    employee_id,
    attendance_date,
    status,
    check_in,
    check_out
)
SELECT
    employee_id,
    '2025-07-01',

    CASE
        WHEN employee_id % 15 = 0 THEN 'Leave'
        WHEN employee_id % 7 = 0 THEN 'Absent'
        ELSE 'Present'
    END AS status,

    CASE
        WHEN employee_id % 15 = 0 THEN NULL
        WHEN employee_id % 7 = 0 THEN NULL
        ELSE MAKETIME(9 + (employee_id % 2), employee_id % 60, 0)
    END AS check_in,

    CASE
        WHEN employee_id % 15 = 0 THEN NULL
        WHEN employee_id % 7 = 0 THEN NULL
        ELSE MAKETIME(18 + (employee_id % 2), employee_id % 60, 0)
    END AS check_out

FROM Employees;

-- =====================================================
-- Verify Attendance
-- =====================================================

SELECT COUNT(*) AS Total_Attendance
FROM Attendance;

SELECT
    status,
    COUNT(*) AS Total
FROM Attendance
GROUP BY status;


-- =====================================================
-- PART 6 : Insert Performance Reviews
-- =====================================================


INSERT INTO Performance_Reviews
(
    employee_id,
    review_date,
    rating,
    reviewer_name,
    comments
)
SELECT
    employee_id,

    CASE
        WHEN employee_id <= 30 THEN '2024-03-31'
        WHEN employee_id <= 60 THEN '2024-06-30'
        WHEN employee_id <= 90 THEN '2024-09-30'
        ELSE '2024-12-31'
    END AS review_date,

    CASE
        WHEN employee_id % 20 = 0 THEN 5.0
        WHEN employee_id % 10 = 0 THEN 4.8
        WHEN employee_id % 7 = 0 THEN 4.5
        WHEN employee_id % 5 = 0 THEN 4.2
        WHEN employee_id % 3 = 0 THEN 3.8
        ELSE 4.0
    END AS rating,

    CASE
        WHEN employee_id % 5 = 1 THEN 'Rajesh Kumar'
        WHEN employee_id % 5 = 2 THEN 'Priya Sharma'
        WHEN employee_id % 5 = 3 THEN 'Amit Verma'
        WHEN employee_id % 5 = 4 THEN 'Neha Gupta'
        ELSE 'Vikas Singh'
    END AS reviewer_name,

    CASE
        WHEN employee_id % 20 = 0 THEN 'Outstanding performer with exceptional leadership skills.'
        WHEN employee_id % 10 = 0 THEN 'Exceeded performance expectations throughout the review period.'
        WHEN employee_id % 7 = 0 THEN 'Very good performance with strong teamwork and communication.'
        WHEN employee_id % 5 = 0 THEN 'Consistently met objectives and delivered quality work.'
        WHEN employee_id % 3 = 0 THEN 'Good performance with opportunities for further improvement.'
        ELSE 'Satisfactory performance with consistent contribution.'
    END AS comments

FROM Employees;

-- =====================================================
-- Verify Performance Reviews
-- =====================================================

SELECT COUNT(*) AS Total_Performance_Reviews
FROM Performance_Reviews;

SELECT
    ROUND(AVG(rating),2) AS Average_Rating,
    MAX(rating) AS Highest_Rating,
    MIN(rating) AS Lowest_Rating
FROM Performance_Reviews;

SELECT
    reviewer_name,
    COUNT(*) AS Reviews_Conducted
FROM Performance_Reviews
GROUP BY reviewer_name
ORDER BY Reviews_Conducted DESC;
