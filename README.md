# Employee Database Management System

**A Production-Grade MySQL Project Demonstrating Employee Database Management with Complete CRUD Operations, NULL Value Handling, and Data Validation**

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Database: MySQL](https://img.shields.io/badge/Database-MySQL-orange.svg)
![Status: Active](https://img.shields.io/badge/Status-Active-brightgreen.svg)

---

## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [SQL Operations](#sql-operations)
  - [CREATE Operations](#create-operations)
  - [READ Operations](#read-operations)
  - [UPDATE Operations](#update-operations)
  - [DELETE Operations](#delete-operations)
- [NULL Value Handling](#null-value-handling)
- [Best Practices Demonstrated](#best-practices-demonstrated)
- [Usage Examples](#usage-examples)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 Overview

This project is a **production-style MySQL database** demonstrating comprehensive employee management capabilities. It showcases professional database design patterns, CRUD operations, intelligent NULL value handling, and real-world data constraints while maintaining clean, maintainable SQL scripts following relational database best practices.

**Perfect for:**
- Learning database design and CRUD operations
- Understanding NULL value handling in relational databases
- Studying production-ready SQL practices
- Building upon a solid database foundation
- Training and educational purposes

---

## ✨ Key Features

### 🗂️ Complete CRUD Operations
- **CREATE**: Database and table initialization with proper schema design
- **READ**: Flexible SELECT queries with filtering and NULL handling
- **UPDATE**: Intelligent data modifications including NULL-to-value conversions
- **DELETE**: Conditional deletion based on business logic

### 🎭 Advanced NULL Handling
- Mixed NULL and non-NULL column definitions
- Conditional NULL checks (`IS NULL`, `IS NOT NULL`)
- NULL-to-value updates for missing data
- Strategic use of DEFAULT constraints
- Practical NULL handling in real-world scenarios

### 🔒 Data Integrity & Constraints
- **PRIMARY KEY**: Auto-incrementing employee IDs
- **UNIQUE**: Email uniqueness constraint
- **NOT NULL**: Mandatory fields (names, hire dates)
- **DEFAULT**: Sensible defaults for department and salary
- **FOREIGN KEY CONCEPT**: Manager ID references for hierarchy

### 📊 Realistic Sample Data
- 6 diverse employees with complete profiles
- Mixed NULL and populated fields
- Realistic email, phone, and salary variations
- Department hierarchy and manager relationships
- Production-like data scenarios

### 🎓 Best Practice Implementation
- Structured and commented SQL
- Clear section separation
- Meaningful naming conventions
- Logical operation flow
- Professional documentation

---

## 📁 Project Structure

```
employees-crud-null-handling/
├── main.sql           # Complete database setup and operations
├── README.md          # This file - comprehensive documentation
├── LICENSE            # MIT License
└── .gitignore         # Git ignore rules (optional)
```

### File Descriptions

| File | Purpose |
|------|---------|
| **main.sql** | Complete SQL script containing schema definition, sample data, CRUD operations, and verification queries |
| **README.md** | Comprehensive project documentation with examples and best practices |
| **LICENSE** | MIT License for open-source distribution |

---

## 🏗️ Database Schema

### Employees Table

```sql
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
```

### Column Specifications

| Column | Type | Constraints | Purpose |
|--------|------|-----------|---------|
| `employee_id` | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each employee |
| `first_name` | VARCHAR(50) | NOT NULL | Employee's first name (required) |
| `last_name` | VARCHAR(50) | NOT NULL | Employee's last name (required) |
| `email` | VARCHAR(100) | UNIQUE, nullable | Email address (unique, optional) |
| `phone` | VARCHAR(20) | nullable | Contact phone number (optional) |
| `department` | VARCHAR(50) | DEFAULT 'General' | Department assignment with default value |
| `salary` | DECIMAL(10,2) | DEFAULT 30000.00 | Annual salary with default value |
| `hire_date` | DATE | NOT NULL | Employment start date (required) |
| `manager_id` | INT | nullable | References employee ID of manager (optional) |
| `bonus` | DECIMAL(10,2) | nullable | Performance bonus (optional) |

### NULL vs NOT NULL Strategy

- **NOT NULL Columns**: Core identity and hire information (first_name, last_name, hire_date)
- **Nullable Columns**: Optional contact details (phone, email) and hierarchical relationships (manager_id)
- **DEFAULT Columns**: Sensible defaults for organizational unit and baseline compensation

---

## 🚀 Getting Started

### Prerequisites

- **MySQL Server** (version 5.7 or higher)
- **MySQL Client** (command-line or GUI tool like MySQL Workbench)
- Basic understanding of SQL and relational databases

### Installation & Setup

#### Option 1: Using MySQL Command Line

```bash
# Connect to MySQL server
mysql -u root -p

# Execute the SQL script
source /path/to/main.sql;

# Or paste the contents directly into the MySQL prompt
```

#### Option 2: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your MySQL instance
3. File → Open SQL Script → Select `main.sql`
4. Execute the script (Cmd+Enter or Ctrl+Enter)

#### Option 3: Using a GUI Tool (phpMyAdmin)

1. Upload `main.sql` to phpMyAdmin
2. Select target database
3. Click "Import" and execute

### Verification

After running the script, verify the setup:

```sql
-- Check if database exists
SHOW DATABASES;

-- Switch to the database
USE EmployeeDB;

-- Verify the table structure
DESCRIBE Employees;

-- View all employees
SELECT * FROM Employees;
```

Expected output should show 4 employees (after deletions) with their complete profiles.

---

## 📝 SQL Operations

### CREATE Operations

#### Database Creation

```sql
DROP DATABASE IF EXISTS EmployeeDB;
CREATE DATABASE EmployeeDB;
USE EmployeeDB;
```

**Purpose**: Ensures clean database initialization by removing any existing database and creating a fresh one.

#### Table Creation

```sql
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
```

**Key Points**:
- AUTO_INCREMENT for automatic ID generation
- UNIQUE constraint on email
- NOT NULL on required fields
- DEFAULT values for organizational defaults
- Nullable columns for optional data

#### Data Insertion

```sql
INSERT INTO Employees
(first_name, last_name, email, phone, department, salary, hire_date, manager_id, bonus)
VALUES
('Joy', 'Raj', 'joy008@email.com', '9876543210', 'IT', 60000, '2026-01-15', NULL, 5000),
('Arpita', 'Khan', 'arpita22@email.com', NULL, 'HR', 45000, '2025-11-20', 1, NULL),
('Mou', 'Mondal', 'mou9@email.com', '9123456789', 'Finance', 55000, '2024-08-10', 1, 3500),
('Sonia', 'Das', NULL, '9988776655', 'Marketing', 48000, '2026-02-05', 2, NULL),
('Avi', 'Roy', 'avi120@email.com', NULL, 'General', 30000, '2025-03-12', NULL, NULL),
('Olivia', 'Sinha', 'olivia99@email.com', '9871203456', 'Sales', 52000, '2025-09-01', 3, 2500);
```

**Insertion Highlights**:
- 6 diverse employee records
- Mix of NULL and populated fields
- Real-world data variations
- Varying compensation structures

### READ Operations

#### Retrieve All Employees

```sql
SELECT * FROM Employees;
```

Returns: Complete employee records with all columns.

#### Employees Without Manager (NULL Check)

```sql
SELECT *
FROM Employees
WHERE manager_id IS NULL;
```

Returns: Employees who report directly without a manager assignment.

#### Employees Receiving Bonus

```sql
SELECT *
FROM Employees
WHERE bonus IS NOT NULL;
```

Returns: Only employees with assigned performance bonuses.

#### Employees with Default Salary

```sql
SELECT *
FROM Employees
WHERE salary = 30000;
```

Returns: Employees with the default salary tier.

#### Advanced Query Example

```sql
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    department,
    salary,
    COALESCE(bonus, 0) AS bonus
FROM Employees
ORDER BY salary DESC;
```

Returns: Formatted employee list sorted by compensation.

### UPDATE Operations

#### Increase Salary

```sql
UPDATE Employees
SET salary = 65000
WHERE employee_id = 1;
```

**Effect**: Updates Joy Raj's salary from 60000 to 65000.

#### Add Missing Email

```sql
UPDATE Employees
SET email = 'sonia798@email.com'
WHERE first_name = 'Sonia';
```

**Effect**: Populates missing email for Sonia Das.

#### Update NULL Phone Numbers

```sql
UPDATE Employees
SET phone = '9935827978'
WHERE phone IS NULL;
```

**Effect**: Assigns phone number to all employees missing contact information.

#### Assign Bonuses to Uncompensated Employees

```sql
UPDATE Employees
SET bonus = 1500
WHERE bonus IS NULL;
```

**Effect**: Provides baseline bonus to employees without performance bonuses.

#### Department Transfer

```sql
UPDATE Employees
SET department = 'Operations'
WHERE first_name = 'Avi';
```

**Effect**: Transfers Avi Roy to Operations department.

### DELETE Operations

#### Delete by Department

```sql
DELETE FROM Employees
WHERE department = 'Sales';
```

**Effect**: Removes Olivia Sinha from the database (Sales department).

#### Delete by Salary Threshold

```sql
DELETE FROM Employees
WHERE salary < 25000;
```

**Effect**: Removes employees below salary threshold (none in this dataset).

**Note**: These operations are irreversible without backups.

---

## 🔍 NULL Value Handling

### Understanding NULL in This Project

**NULL** represents missing or unknown data, distinct from zero, empty string, or default values.

### Practical Examples in This Dataset

#### Scenario 1: Missing Contact Information

```sql
-- Arpita Khan's phone is NULL (not provided initially)
INSERT INTO Employees (..., phone, ...) VALUES (..., NULL, ...);

-- Update when information becomes available
UPDATE Employees
SET phone = '9935827978'
WHERE phone IS NULL;
```

#### Scenario 2: Organizational Hierarchy

```sql
-- Joy Raj has no manager (top-level position)
INSERT INTO Employees (..., manager_id, ...) VALUES (..., NULL, ...);

-- Query all top-level employees
SELECT * FROM Employees WHERE manager_id IS NULL;
```

#### Scenario 3: Optional Compensation

```sql
-- Arpita Khan doesn't have a bonus initially
INSERT INTO Employees (..., bonus, ...) VALUES (..., NULL, ...);

-- Add bonuses for high performers
UPDATE Employees
SET bonus = 1500
WHERE bonus IS NULL AND salary > 45000;
```

### NULL Comparison Operators

| Operator | Usage | Example |
|----------|-------|---------|
| `IS NULL` | Check for NULL values | `WHERE manager_id IS NULL` |
| `IS NOT NULL` | Check for non-NULL values | `WHERE bonus IS NOT NULL` |
| `COALESCE()` | Provide default for NULL | `COALESCE(bonus, 0)` |
| `IFNULL()` | MySQL-specific NULL handling | `IFNULL(phone, 'N/A')` |

### NULL Aggregation

```sql
-- Count employees with bonuses
SELECT COUNT(*) 
FROM Employees 
WHERE bonus IS NOT NULL;

-- Sum bonuses (NULL values excluded automatically)
SELECT SUM(bonus) 
FROM Employees;

-- Average salary including all employees
SELECT AVG(salary) 
FROM Employees;
```

---

## 🏆 Best Practices Demonstrated

### 1. **Schema Design**

✅ **Enforced**:
- Appropriate data types for each column
- Meaningful column names
- Proper constraint usage
- Clear NULL vs NOT NULL specification

### 2. **Data Integrity**

✅ **Implemented**:
- PRIMARY KEY for uniqueness (employee_id)
- UNIQUE constraint for non-repetitive data (email)
- NOT NULL constraints on required fields
- DEFAULT values for common scenarios
- Foreign key concept for relationships (manager_id)

### 3. **Code Organization**

✅ **Structure**:
- Clear section headers with comments
- Logical operation flow (CREATE → INSERT → UPDATE → DELETE → VERIFY)
- Grouped related operations
- Professional documentation

### 4. **CRUD Operations**

✅ **Complete Implementation**:
- CREATE: Database and table setup
- READ: Multiple SELECT queries with various filters
- UPDATE: Five different update scenarios
- DELETE: Conditional deletion with WHERE clauses

### 5. **NULL Handling**

✅ **Strategic Use**:
- Distinguishes required vs optional fields
- Handles missing data gracefully
- Updates NULL values when data becomes available
- Verifies NULL handling with queries

### 6. **Query Efficiency**

✅ **Optimized**:
- Indexed PRIMARY KEY
- UNIQUE constraints for faster lookups
- Efficient WHERE clauses
- Appropriate data types

### 7. **Documentation**

✅ **Comprehensive**:
- Inline SQL comments
- Clear operation descriptions
- Example data included
- Purpose of each query explained

---

## 💡 Usage Examples

### Example 1: Retrieve Employee Payroll Information

```sql
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    department,
    salary,
    bonus,
    (salary + COALESCE(bonus, 0)) AS total_compensation
FROM Employees
WHERE department IN ('IT', 'HR', 'Finance')
ORDER BY total_compensation DESC;
```

### Example 2: Find Management Chain

```sql
-- Find who manages whom
SELECT 
    e1.employee_id,
    CONCAT(e1.first_name, ' ', e1.last_name) AS employee,
    CONCAT(e2.first_name, ' ', e2.last_name) AS manager
FROM Employees e1
LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id;
```

### Example 3: Audit Missing Contact Information

```sql
-- Find employees missing email or phone
SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    CASE WHEN email IS NULL THEN 'Missing Email' ELSE 'OK' END AS email_status,
    CASE WHEN phone IS NULL THEN 'Missing Phone' ELSE 'OK' END AS phone_status
FROM Employees
WHERE email IS NULL OR phone IS NULL;
```

### Example 4: Department Summary with Statistics

```sql
SELECT 
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    SUM(COALESCE(bonus, 0)) AS total_bonus
FROM Employees
GROUP BY department
HAVING COUNT(*) > 0
ORDER BY avg_salary DESC;
```

---

## 🤝 Contributing

We welcome contributions to improve this educational project!

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/enhancement`)
3. **Commit** your changes (`git commit -m 'Add new SQL examples'`)
4. **Push** to the branch (`git push origin feature/enhancement`)
5. **Open** a Pull Request

### Contribution Ideas

- ✨ Additional SQL query examples
- 📚 Extended documentation
- 🔧 Performance optimization queries
- 🎓 Educational scenarios
- 🐛 Bug fixes or improvements

---

## 📋 Query Reference

### Common Operations

#### Get Employee by ID
```sql
SELECT * FROM Employees WHERE employee_id = 1;
```

#### Search by Name
```sql
SELECT * FROM Employees WHERE first_name LIKE '%Joy%';
```

#### Get Department Statistics
```sql
SELECT department, COUNT(*) as count FROM Employees GROUP BY department;
```

#### Find High Earners
```sql
SELECT * FROM Employees WHERE salary > 50000 ORDER BY salary DESC;
```

#### List Bonused Employees
```sql
SELECT first_name, last_name, bonus FROM Employees WHERE bonus IS NOT NULL;
```

---

## 🎓 Learning Resources

### SQL Concepts Covered

- **DDL** (Data Definition Language): CREATE, DROP
- **DML** (Data Manipulation Language): INSERT, UPDATE, DELETE, SELECT
- **Constraints**: PRIMARY KEY, UNIQUE, NOT NULL, DEFAULT
- **NULL Handling**: IS NULL, IS NOT NULL, COALESCE
- **Joins**: LEFT JOIN for hierarchical queries
- **Aggregation**: COUNT, SUM, AVG, GROUP BY
- **Filtering**: WHERE, HAVING, ORDER BY

### Recommended Reading

- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
- [Database Design Best Practices](https://en.wikipedia.org/wiki/Database_design)

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

**License Summary**:
- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Private use
- ⚠️ Liability disclaimer included

---

## 👨‍💻 Author

**KISHANU MONDAL**

- GitHub: [@kxnux-builds](https://github.com/kxnux-builds)
- Repository: [employees-crud-null-handling](https://github.com/kxnux-builds/employees-crud-null-handling)

---

## 📞 Support & Issues

Found a bug or have a question?

- 🐛 **Report Issues**: [GitHub Issues](https://github.com/kxnux-builds/employees-crud-null-handling/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/kxnux-builds/employees-crud-null-handling/discussions)

---

## 🎯 Project Status

| Aspect | Status |
|--------|--------|
| Development | ✅ Complete |
| Documentation | ✅ Comprehensive |
| Testing | ✅ Verified |
| Production Ready | ✅ Yes |
| Maintenance | 🔄 Active |

---

## 🙏 Acknowledgments

This project was created as an educational resource demonstrating:
- Professional database design
- CRUD operation best practices
- Real-world NULL handling scenarios
- Clean, maintainable SQL code

Perfect for students, developers, and database administrators learning MySQL fundamentals.

---

<div align="center">

**Made with ❤️ for the developer community**

[⭐ Star this repository](#) | [🔗 Share](#) | [📧 Feedback](#)

</div>

---

## 📚 Table of References

### Data Types Used
- **INT**: Integer values (employee_id, manager_id)
- **VARCHAR**: Variable-length strings (names, email, phone)
- **DATE**: Calendar dates (hire_date)
- **DECIMAL**: Fixed-point decimal numbers (salary, bonus)

### Keywords & Operators
- **DDL**: CREATE, DROP
- **DML**: INSERT, UPDATE, DELETE, SELECT
- **Operators**: IS NULL, IS NOT NULL, WHERE, AND, OR
- **Functions**: CONCAT, COALESCE, COUNT, SUM, AVG, MAX, MIN

### Best Practices Summary
1. Use appropriate data types
2. Implement meaningful constraints
3. Handle NULL values deliberately
4. Write clear, commented code
5. Follow consistent naming conventions
6. Document your schema and operations
7. Test all CRUD operations
8. Consider future scalability

---

**Last Updated**: June 2026 | **Version**: 1.0.0 | **Status**: Production Ready
