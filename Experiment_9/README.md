# 🧪 Experiment 9

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

To implement database triggers in PostgreSQL to automatically calculate values and enforce constraints during data insertion operations.

---

# TOOLS USED

PostgreSQL

---

# OBJECTIVES

- Trigger Implementation: To understand how to create and use triggers in PostgreSQL.  
- Automation: To automate calculation of total payable amount using triggers.  
- Data Integrity: To enforce constraints using trigger conditions.  
- Real-time Processing: To execute logic automatically before inserting data.  

---

# THEORY

Triggers are special database objects that automatically execute a function when a specified event (INSERT, UPDATE, DELETE) occurs on a table. In PostgreSQL, triggers are associated with trigger functions written in PL/pgSQL. They help maintain data integrity, enforce business rules, and automate tasks.

---

# IMPLEMENTATION

---

## Step 1: Creating Table

Query:

```sql
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);
```


## Step 2: Creating Trigger Function

Query:

```sql
CREATE OR REPLACE FUNCTION CACULATE_PAYABLE_AMOUNT()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.total_payable_amount := NEW.perhour_salary * NEW.working_hours;

    IF NEW.total_payable_amount > 25000 THEN
        RAISE EXCEPTION 'INVALID ENTRY BEACUSE PAYABLE AMOUNT CAN NOT BE GREATER THAN 25000';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
```

## Step 3: Creating Trigger

Query:

```sql
CREATE OR REPLACE TRIGGER AUTOMATED_PAYABLE_AMOUNT_CALCULATION
BEFORE INSERT
ON employee
FOR EACH ROW
EXECUTE FUNCTION CACULATE_PAYABLE_AMOUNT();
```

## Step 4: Inserting Valid Data

Query:

```sql
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (1, 'AKASH', 10, 1000);
```

Output:
<img width="705" height="213" alt="image" src="https://github.com/user-attachments/assets/e47cf38b-8519-4e06-9e78-5eae09906f73" />

---

## Step 5: Inserting Invalid Data (Exception Case)

Query:

```sql
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (2, 'Ankush', 8, 100000);
```

Output:

<img width="1055" height="214" alt="image" src="https://github.com/user-attachments/assets/2ee187a6-82bd-47d3-9775-7dc14a65e35d" />


---

## Step 6: Retrieving Data

Query:

```sql
SELECT * FROM employee;
```

Output:

<img width="1055" height="281" alt="image" src="https://github.com/user-attachments/assets/6e4cc017-6a57-4add-9a52-4db63dd84e92" />


---

# LEARNING OUTCOMES

- Students will be able to create and use triggers in PostgreSQL.  
- Students will understand how to automate calculations using triggers.  
- Students will enforce constraints using trigger conditions.  
- Students will understand real-time execution of database logic.

---
