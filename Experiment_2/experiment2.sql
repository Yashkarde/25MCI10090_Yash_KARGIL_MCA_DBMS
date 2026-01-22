CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Yash', 'Pune', 92.5),
(2, 'Neha', 'Nagpur', 96.3),
(3, 'Rohit', 'Pune', 98.1),
(4, 'Aarti', 'Nashik', 94.7),
(5, 'Vikas', 'Nagpur', 97.6),
(6, 'Simran', 'Pune', 95.9),
(7, 'Manoj', 'Nashik', 96.8);

SELECT * FROM Students;

-- Without CASE statement
SELECT city, COUNT(*) AS STUDENT_COUNT
FROM Students
WHERE percentage > 95
GROUP BY city;

-- With CASE statement
SELECT city,
       SUM(CASE WHEN percentage > 95 THEN 1 ELSE 0 END) AS STUDENT_COUNTS
FROM Students
GROUP BY city;

-- (II)
SELECT city,
       CAST(
           AVG(CASE WHEN percentage > 95 THEN percentage ELSE NULL END)
           AS DECIMAL(5,2)
       ) AS STUDENT_AVG
FROM Students
GROUP BY city
ORDER BY STUDENT_AVG DESC;
