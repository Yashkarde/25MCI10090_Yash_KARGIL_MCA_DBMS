# 🧪 Experiment 8

---

DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING

---

Student Name: Yash Karde  
UID: 25MCI10090  
Branch: MCA (AI/ML)  
Section / Group: 25MAM-1 A  
Semester: 2nd  
Date of Performance: 31/03/2026  

Subject Name: TECHNICAL SKILLS  
Subject Code:  

---

# AIM

To apply the concept of Stored Procedures in database operations in order to perform tasks like insertion, updating, deletion, and retrieval of data efficiently, securely, and in a reusable manner within the database system.

---

# S/W Requirement

Oracle Database Express Edition and pgAdmin.

---

# OBJECTIVES

Apply stored procedure concepts for database operations.

---

# IMPLEMENTATION

---

## Step 1: Table Creation

```sql
CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
```

---

## Step 2: Stored Procedure for Inserting Employee

This procedure inserts a new employee record into the Employee table.

```sql
CREATE OR REPLACE PROCEDURE insert_employee(
    eid INT,
    ename VARCHAR,
    esalary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee VALUES (eid, ename, esalary);
END;
$$;
```

---

## Step 3: Stored Procedure for Updating Salary

This procedure updates the salary of an existing employee.

```sql
CREATE OR REPLACE PROCEDURE update_salary(
    eid INT,
    new_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employee
    SET salary = new_salary
    WHERE empId = eid;
END;
$$;
```

---

## Step 4: Stored Procedure for Deleting Employee

This procedure deletes an employee record from the table.

```sql
CREATE OR REPLACE PROCEDURE delete_employee(
    eid INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employee
    WHERE empId = eid;
END;
$$;
```

---

## Step 5: Function to Retrieve Employee Data

This function retrieves all employee records from the table.

```sql
CREATE OR REPLACE FUNCTION get_employees()
RETURNS TABLE(empId INT, name VARCHAR, salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM Employee;
END;
$$;
```

---

# EXECUTION

Executing stored procedures and function to perform CRUD operations.

```sql
CALL insert_employee(1, 'John', 5000);

CALL update_salary(1, 6000);

CALL insert_employee(2, 'Rahul', 5000);

SELECT * FROM get_employees();

CALL delete_employee(1);
```

Output:

<img width="430" height="192" alt="image" src="https://github.com/user-attachments/assets/810a9c95-71b3-4ec4-9ddb-a98798a591a6" />


<img width="492" height="202" alt="image" src="https://github.com/user-attachments/assets/aa7004ec-7ef1-4424-9a83-a477bbad8fe4" />


<img width="462" height="166" alt="image" src="https://github.com/user-attachments/assets/6c558d95-f579-4407-a76d-8db1afb7a5b7" />

---

# LEARNING OUTCOMES

1. Insert Procedure successfully adds new employee records into the Employee table.  
2. Update Procedure modifies existing data (e.g., updating salary based on empId).  
3. Delete Procedure removes specific employee records from the table.  
4. Function (get_employees) retrieves and displays all employee data in a structured format.  
5. Demonstrates how procedures handle CRUD operations while functions are used for data retrieval in PostgreSQL.

---
