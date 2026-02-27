--step 1

CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO Employee (emp_name, department, salary) VALUES
('Rahul', 'IT', 50000),
('Sneha', 'HR', 40000),
('Amit', 'Finance', 55000),
('Priya', 'IT', 60000);

CREATE OR REPLACE FUNCTION display_employees()
RETURNS VOID AS
$$
DECLARE
    emp_record RECORD;
BEGIN
    FOR emp_record IN SELECT * FROM Employee
    LOOP
        RAISE NOTICE 'ID: %, Name: %, Department: %, Salary: %',
            emp_record.emp_id,
            emp_record.emp_name,
            emp_record.department,
            emp_record.salary;
    END LOOP;
END;
$$
LANGUAGE plpgsql;


SELECT display_employees();

--step 2

ALTER TABLE Employee
ADD COLUMN experience INT,
ADD COLUMN performance_score INT;

UPDATE Employee SET experience = 5, performance_score = 8 WHERE emp_id = 1;
UPDATE Employee SET experience = 3, performance_score = 6 WHERE emp_id = 2;
UPDATE Employee SET experience = 7, performance_score = 9 WHERE emp_id = 3;
UPDATE Employee SET experience = 2, performance_score = 5 WHERE emp_id = 4;


CREATE OR REPLACE FUNCTION update_salary_by_ratio()
RETURNS VOID AS
$$
DECLARE
    emp_rec RECORD;
    exp_perf_ratio NUMERIC;
BEGIN
    FOR emp_rec IN SELECT * FROM Employee
    LOOP
        exp_perf_ratio := emp_rec.performance_score::NUMERIC / emp_rec.experience;

        IF exp_perf_ratio > 1.5 THEN
            UPDATE Employee
            SET salary = salary * 1.20
            WHERE emp_id = emp_rec.emp_id;

        ELSIF exp_perf_ratio BETWEEN 1 AND 1.5 THEN
            UPDATE Employee
            SET salary = salary * 1.10
            WHERE emp_id = emp_rec.emp_id;

        ELSE
            UPDATE Employee
            SET salary = salary * 1.05
            WHERE emp_id = emp_rec.emp_id;
        END IF;

        RAISE NOTICE 'Updated Employee ID: %, Ratio: %',
            emp_rec.emp_id, exp_perf_ratio;

    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT update_salary_by_ratio();

SELECT emp_id, emp_name, salary FROM Employee;


--step 3
CREATE OR REPLACE FUNCTION safe_cursor_example()
RETURNS VOID AS
$$
DECLARE
    emp_rec RECORD;
    emp_cursor CURSOR FOR SELECT * FROM Employee;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_rec;

        EXIT WHEN NOT FOUND;   

        RAISE NOTICE 'Employee ID: %, Name: %',
            emp_rec.emp_id,
            emp_rec.emp_name;

    END LOOP;

    CLOSE emp_cursor;

    RAISE NOTICE 'Cursor executed successfully.';
END;
$$
LANGUAGE plpgsql;


SELECT safe_cursor_example();