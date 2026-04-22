-- Step 1: Create Table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);

-- Step 2: Create Trigger Function
CREATE OR REPLACE FUNCTION CACULATE_PAYABLE_AMOUNT()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.total_payable_amount := NEW.perhour_salary * NEW.working_hours;

    IF NEW.total_payable_amount > 25000 THEN
        RAISE EXCEPTION 'INVALID ENTRY BECAUSE PAYABLE AMOUNT CAN NOT BE GREATER THAN 25000';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

-- Step 3: Create Trigger
CREATE OR REPLACE TRIGGER AUTOMATED_PAYABLE_AMOUNT_CALCULATION
BEFORE INSERT
ON employee
FOR EACH ROW
EXECUTE FUNCTION CACULATE_PAYABLE_AMOUNT();

-- Step 4: Insert Valid Data
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (1, 'AKASH', 10, 1000);

-- Step 5: Insert Invalid Data (Exception Case)
INSERT INTO employee(emp_id, emp_name, working_hours, perhour_salary)
VALUES (2, 'Ankush', 8, 100000);

-- Step 6: Retrieve Data
SELECT * FROM employee;