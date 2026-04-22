# 🧪 Experiment 10

---

DEPARTMENT OF COMPUTER SCIENCE & ENGINEERING

---

Student Name: Yash Karde  
UID: 25MCI10090  
Branch: MCA (AI/ML)  
Section / Group: 25MAM-1 A  
Semester: 2nd  
Date of Performance:  

Subject Name: TECHNICAL SKILLS  
Subject Code:  

---

# AIM

To understand and apply transaction control in PostgreSQL using BEGIN, COMMIT, ROLLBACK, and SAVEPOINT to maintain data integrity during database operations.

---

# S/W Requirement

PostgreSQL and pgAdmin

---

# OBJECTIVES

Apply transaction control commands for safe and reliable database updates.

---

# IMPLEMENTATION

---

## Step 1: Table Creation and Initial Data

Query:

```sql
DROP TABLE IF EXISTS Payroll;

CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0)
);

INSERT INTO Payroll VALUES
(1, 'Amit', 30000),
(2, 'Neha', 40000),
(3, 'Ravi', 50000);

SELECT * FROM Payroll;
```

<img width="856" height="435" alt="image" src="https://github.com/user-attachments/assets/24f4a99b-6d4c-4d06-b8b6-90b4daebd011" />


Figure 1: Table created and initial data inserted

---

# Experiment 1: Transaction with ROLLBACK

Query:

```sql
BEGIN;

UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

SELECT * FROM Payroll;

ROLLBACK;

SELECT * FROM Payroll;
```

Output:

<img width="738" height="221" alt="image" src="https://github.com/user-attachments/assets/49ac2a0a-64c6-4fa9-8803-7a6658f1a235" />

Figure 2: Transaction started with BEGIN  

<img width="856" height="214" alt="image" src="https://github.com/user-attachments/assets/160980bc-f294-4a1b-8e78-fe5271332557" />

Figure 3: Constraint violation error during update  

<img width="856" height="316" alt="image" src="https://github.com/user-attachments/assets/e58fe859-3839-4505-b1fb-bcf63c3fe617" />

Figure 4: Table state after rollback

---

# Experiment 2: Transaction with SAVEPOINT

Query:

```sql
BEGIN;

UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

SAVEPOINT sp1;

UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;

UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM Payroll;
```

Output:

<img width="856" height="589" alt="image" src="https://github.com/user-attachments/assets/9621ab44-1fbc-4b3a-92a9-ae8cb7845064" />

Figure 5: First valid update before savepoint  

<img width="738" height="240" alt="image" src="https://github.com/user-attachments/assets/aa76a469-3838-4cdf-b4d6-cce559b64491" />

Figure 6: Savepoint created successfully  

<img width="856" height="761" alt="image" src="https://github.com/user-attachments/assets/20c86d03-4233-4d9e-820f-c906ef55aa5e" />

Figure 7: Final result after rollback to savepoint and commit  

<img width="856" height="393" alt="image" src="https://github.com/user-attachments/assets/c6570fa0-2fd5-4a63-82b5-ce75e0d66c89" />

Figure 8: Table data after transaction handling

---

# LEARNING OUTCOMES

1. BEGIN starts a transaction block for grouping multiple SQL commands.  
2. ROLLBACK cancels changes made inside the transaction.  
3. SAVEPOINT allows partial rollback without losing all valid updates.  
4. CHECK constraint ensures salary remains greater than zero.  
5. PostgreSQL transaction control helps maintain consistency and data integrity.

---
