CREATE TABLE compliance_report (
    id SERIAL PRIMARY KEY,
    schema_name VARCHAR(50) NOT NULL,
    violation_count INT NOT NULL
);
INSERT INTO compliance_report (schema_name, violation_count) VALUES
('HR_SCHEMA', 0),          
('FINANCE_SCHEMA', 2),    
('SALES_SCHEMA', 5),       
('INVENTORY_SCHEMA', 9),   
('SECURITY_SCHEMA', 15);   

select * from compliance_report  

SELECT
    schema_name,
    violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 3 THEN 'Minor Violation'
        WHEN violation_count BETWEEN 4 AND 7 THEN 'Moderate Violation'
        ELSE 'Critical Violation'
    END AS violation_status
FROM compliance_report;

ALTER TABLE compliance_report
ADD COLUMN approval_status VARCHAR(20); 

UPDATE compliance_report
SET approval_status =
    CASE
        WHEN violation_count <= 2 THEN 'Approved'
        WHEN violation_count BETWEEN 3 AND 7 THEN 'Needs Review'
        ELSE 'Rejected'
    END;

DO $$
DECLARE
    v_violation_count INT := 5;
BEGIN
    IF v_violation_count = 0 THEN
        RAISE NOTICE 'No Violation: Schema is fully compliant';

    ELSIF v_violation_count BETWEEN 1 AND 3 THEN
        RAISE NOTICE 'Minor Violation: Approval Granted';

    ELSIF v_violation_count BETWEEN 4 AND 7 THEN
        RAISE NOTICE 'Moderate Violation: Needs Review';

    ELSE
        RAISE NOTICE 'Critical Violation: Approval Rejected';
    END IF;
END $$;

CREATE TABLE student_grades (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);


INSERT INTO student_grades (student_name, marks) VALUES
('Amit', 92),
('Riya', 78),
('Rahul', 65),
('Sneha', 54),
('Karan', 38);

SELECT
    student_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A'
        WHEN marks BETWEEN 75 AND 89 THEN 'B'
        WHEN marks BETWEEN 60 AND 74 THEN 'C'
        WHEN marks BETWEEN 40 AND 59 THEN 'D'
        ELSE 'Fail'
    END AS grade
FROM student_grades;

SELECT
    schema_name,
    violation_count
FROM compliance_report
ORDER BY
    CASE
        WHEN violation_count = 0 THEN 1           
        WHEN violation_count BETWEEN 1 AND 3 THEN 2 
        WHEN violation_count BETWEEN 4 AND 7 THEN 3 
        ELSE 4                                    
    END;



