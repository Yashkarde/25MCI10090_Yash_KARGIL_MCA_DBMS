-- TABLE CREATION

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


-- INSERT DATA

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


-- INNER JOIN (Students enrolled in courses)

SELECT s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;


-- LEFT JOIN (All students even if not enrolled)

SELECT s.student_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id;


-- RIGHT JOIN (All courses even if no student)

SELECT s.student_name, c.course_name
FROM Students s
RIGHT JOIN Enrollments e
ON s.student_id = e.student_id
RIGHT JOIN Courses c
ON e.course_id = c.course_id;


-- SELF JOIN (Students in same department)

SELECT s1.student_name AS student1,
       s2.student_name AS student2,
       s1.dept_id
FROM Students s1
JOIN Students s2
ON s1.dept_id = s2.dept_id
AND s1.student_id <> s2.student_id;


-- CROSS JOIN (All student-course combinations)

SELECT s.student_name, c.course_name
FROM Students s
CROSS JOIN Courses c
limit 10;


