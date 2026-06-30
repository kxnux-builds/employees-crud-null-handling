-- =====================================================
-- Employee Database CRUD & NULL Handling in MySQL
-- =====================================================

DROP DATABASE IF EXISTS EmployeeDB;
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    department VARCHAR(50) DEFAULT 'General',
    salary DECIMAL(10,2) DEFAULT 30000.00,
    hire_date DATE NOT NULL,
    manager_id INT NULL,
    bonus DECIMAL(10,2) NULL
);

-- =====================================================
-- INSERT DATA
-- =====================================================

INSERT INTO Employees
(first_name, last_name, email, phone, department, salary, hire_date, manager_id, bonus)
VALUES
('Joy', 'Raj', 'joy008@email.com', '9876543210', 'IT', 60000, '2026-01-15', NULL, 5000),

('Arpita', 'Khan', 'arpita22@email.com', NULL, 'HR', 45000, '2025-11-20', 1, NULL),

('Mou', 'Mondal', 'mou9@email.com', '9123456789', 'Finance', 55000, '2024-08-10', 1, 3500),

('Sonia', 'Das', NULL, '9988776655', 'Marketing', 48000, '2026-02-05', 2, NULL),

('Avi', 'Roy', 'avi120@email.com', NULL, 'General', 30000, '2025-03-12', NULL, NULL),

('Olivia', 'Sinha', 'olivia99@email.com', '9871203456', 'Sales', 52000, '2025-09-01', 3, 2500);

-- View inserted data
SELECT * FROM Employees;

-- =====================================================
-- UPDATE DATA
-- =====================================================

-- Increase Joy's salary
UPDATE Employees
SET salary = 65000
WHERE employee_id = 1;

-- Add missing email for Sonia
UPDATE Employees
SET email = 'sonia798@email.com'
WHERE first_name = 'Sonia';

-- Update NULL phone numbers
UPDATE Employees
SET phone = '9935827978'
WHERE phone IS NULL;

-- Give bonus to employees without bonus
UPDATE Employees
SET bonus = 1500
WHERE bonus IS NULL;

-- Change department for Avi
UPDATE Employees
SET department = 'Operations'
WHERE first_name = 'Avi';

-- View updated data
SELECT * FROM Employees;

-- =====================================================
-- DELETE DATA
-- =====================================================

-- Delete employee from Sales department
DELETE FROM Employees
WHERE department = 'Sales';

-- Delete employees with salary less than 25000
DELETE FROM Employees
WHERE salary < 25000;

-- =====================================================
-- FINAL DATA
-- =====================================================

SELECT * FROM Employees;

-- =====================================================
-- VERIFY NULL HANDLING
-- =====================================================

-- Employees without manager
SELECT *
FROM Employees
WHERE manager_id IS NULL;

-- Employees receiving bonus
SELECT *
FROM Employees
WHERE bonus IS NOT NULL;

-- Employees's salary is 30000
SELECT *
FROM Employees
WHERE salary = 30000;

-- =====================================================
-- END OF PROJECT
-- =====================================================