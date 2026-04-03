# 🧪 Experiment 7

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

Implementation of JOIN operations in PostgreSQL.

---

# S/W Requirement

Oracle Database Express Edition and pgAdmin.

---

# OBJECTIVES

Apply joins to a real-world database schema using tables like Students, Courses, Enrollments, and Departments.

---

# IMPLEMENTATION

---

## Step 1: Table Creation

```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

---

## Step 2: Insert Data into Tables

```sql
-- Students
INSERT INTO Students VALUES (1, 'Amit', 101);
INSERT INTO Students VALUES (2, 'Sara', 102);
INSERT INTO Students VALUES (3, 'John', 103);
INSERT INTO Students VALUES (4, 'Neha', NULL);
INSERT INTO Students VALUES (5, 'Pankaj', NULL);
INSERT INTO Students VALUES (6, 'Rahul', 101);
INSERT INTO Students VALUES (7, 'Simran', 101);

-- Courses
INSERT INTO Courses VALUES (201, 'DBMS');
INSERT INTO Courses VALUES (202, 'Java');
INSERT INTO Courses VALUES (203, 'Python');

-- Enrollments
INSERT INTO Enrollments VALUES (1, 201);
INSERT INTO Enrollments VALUES (1, 202);
INSERT INTO Enrollments VALUES (2, 201);
INSERT INTO Enrollments VALUES (6, 203);

-- Departments
INSERT INTO Departments VALUES (101, 'CS');
INSERT INTO Departments VALUES (102, 'IT');
INSERT INTO Departments VALUES (103, 'ECE');
```

---

# JOIN QUERIES

---

## 1️⃣ INNER JOIN

INNER JOIN returns only matching records between tables (students who are enrolled in courses).

```sql
SELECT s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;
```

Output:

<img width="471" height="231" alt="image" src="https://github.com/user-attachments/assets/c157ab47-0968-413a-913c-77378d9de910" />

---

## 2️⃣ LEFT JOIN

LEFT JOIN returns all records from the left table (Students) even if there is no matching record in the right table.

```sql
SELECT s.student_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id;
```

Output:

<img width="384" height="229" alt="image" src="https://github.com/user-attachments/assets/1b10c52a-9675-4ffc-af8e-c2db91a009e6" />


---

## 3️⃣ RIGHT JOIN

RIGHT JOIN returns all records from the right table (Courses) even if there is no matching record in the left table.

```sql
SELECT s.student_name, c.course_name
FROM Students s
RIGHT JOIN Enrollments e
ON s.student_id = e.student_id
RIGHT JOIN Courses c
ON e.course_id = c.course_id;
```

Output:

<img width="386" height="205" alt="image" src="https://github.com/user-attachments/assets/03643cf8-c34e-4e14-a6d0-f986f6c70901" />

---

## 4️⃣ SELF JOIN

SELF JOIN is used to compare rows within the same table (students in the same department).

```sql
SELECT s1.student_name AS student1,
       s2.student_name AS student2,
       s1.dept_id
FROM Students s1
JOIN Students s2
ON s1.dept_id = s2.dept_id
AND s1.student_id <> s2.student_id;
```

Output:

<img width="409" height="249" alt="image" src="https://github.com/user-attachments/assets/0dfd43a2-d94e-4724-8781-3fe2f1457aaf" />

---

## 5️⃣ CROSS JOIN

CROSS JOIN returns all possible combinations of rows from both tables.

```sql
SELECT s.student_name, c.course_name
FROM Students s
CROSS JOIN Courses c
LIMIT 10;
```

Output:

<img width="509" height="208" alt="image" src="https://github.com/user-attachments/assets/1099b659-329e-4a40-ace1-8573cb82a575" />

---

# LEARNING OUTCOMES

1. INNER JOIN returns only matching records between tables (students who are enrolled in courses).  
2. LEFT JOIN helps identify unmatched data (students with no course enrollments).  
3. RIGHT JOIN ensures all records from the right table appear, even without matches.  
4. SELF JOIN compares rows within the same table (students in the same department).  
5. CROSS JOIN produces all possible combinations of rows (Cartesian product).  

---
