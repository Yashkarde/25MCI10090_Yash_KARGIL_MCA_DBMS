# 🧪 Experiment 6

---

**DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING**

---

**Student Name:** Yash Karde
**UID:** 25MCI10090
**Branch:** MCA (AI & ML)
**Section / Group:** 25MAM-1
**Semester:** 2nd
**Date of Performance:** 27/02/26

**Subject Name:** Technical Training
**Subject Code:** 25CAP-652

---

## 🎯 AIM

Learn how to create, query, and manage views in SQL to simplify database queries and provide a layer of abstraction for end-users.

---

## 📌 OBJECTIVE

* **Data Abstraction:** To understand how to hide complex table joins and calculations behind a simple virtual table interface.
* **Enhanced Security:** To learn how to restrict user access to sensitive columns by providing views instead of direct table access.
* **Query Simplification:** To master the creation of views that pre-join multiple tables, making reporting easier for non-technical users.
* **View Management:** To understand the syntax for creating, altering, and dropping views, as well as the naming conventions required for efficient data access.

---

## 🧩 Implementation

---

### 🔹 Step 1: Creating a Simple View for Data Filtering

Implementing a view to provide a quick list of active employees without exposing the entire table structure.

```sql
CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    is_active BOOLEAN
);
```

#### Data Insertion

```sql
INSERT INTO Employee (emp_name, department, salary, is_active) VALUES
('Rahul', 'IT', 50000, TRUE),
('Sneha', 'HR', 40000, FALSE),
('Amit', 'Finance', 55000, TRUE),
('Priya', 'IT', 60000, TRUE);
```

#### Query

```sql
CREATE OR REPLACE VIEW active_employees AS
SELECT emp_id, emp_name, department, salary
FROM Employee
WHERE is_active = TRUE;

SELECT * FROM active_employees;
```

**Output :-**

<img width="975" height="301" alt="image" src="https://github.com/user-attachments/assets/c159787a-5328-4517-8c01-b700df35b1ef" />

---

### 🔹 Step 2: Creating a View for Joining Multiple Tables

Simplifying the retrieval of data distributed across Employees and Departments tables.

```sql
CREATE TABLE Departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);
```

```sql
INSERT INTO Departments (dept_name) VALUES
('IT'),
('HR'),
('Finance');
```

```sql
CREATE TABLE Employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    salary NUMERIC(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
```

```sql
INSERT INTO Employees (emp_name, salary, dept_id) VALUES
('Rahul', 50000, 1),
('Sneha', 40000, 2),
('Amit', 55000, 3),
('Priya', 60000, 1);
```

#### Query

```sql
CREATE OR REPLACE VIEW employee_department_view AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_department_view;
```

**Output :-**

<img width="729" height="289" alt="image" src="https://github.com/user-attachments/assets/21e478ee-1513-4513-844c-3f2fa36fdf28" />

---

### 🔹 Step 3: Advanced Summarization View

Creating a view to provide department-level statistics automatically.

#### Query

```sql
CREATE OR REPLACE VIEW department_statistics AS
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Departments d
LEFT JOIN Employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;
```

**Output :-**

<img width="975" height="235" alt="image" src="https://github.com/user-attachments/assets/9f75c9df-394a-4019-9762-a374e296779c" />

---

## 📚 LEARNING OUTCOMES

* **Abstraction Proficiency:** Students will be able to create and query views to simplify efficient data access and abstraction.
* **Security Implementation:** Students will understand how to use views for data masking and providing restricted access to sensitive information.
* **Syntactic Accuracy:** Students will demonstrate the correct syntax for creating and querying views, ensuring logical clarity in naming conventions.
* **Real-world Application:** Students will be able to design views for practical domains like Library Management Systems or Payroll Systems to demonstrate functionality.
