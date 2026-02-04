# 🧪 Experiment 2

---

**Student Name:** Yash Karde
**UID:** 25MCI10090
**Branch:** M.C.A (AI & ML)
**Section / Group:** 25MAM-1 A
**Semester:** 2nd
**Date of Performance:** 12/01/2026

**Subject Name:** TECHINCAL SKILLS
**Subject Code:** 25CAP-652

---

## 🎯 AIM

To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

**S/W Requirement:** Oracle Database Express Edition and pgAdmin

---

## 📌 OBJECTIVES

* To retrieve specific data using filtering conditions
* To sort query results using single and multiple attributes
* To perform aggregation using grouping techniques
* To apply conditions on aggregated data
* To understand real-world analytical queries commonly asked in placement interviews

---

## 🧩 Practical / Experiment Steps

---

### 🔹 Step 1: Database and Table Preparation

**Description:**

* Start the PostgreSQL server
* Open the PostgreSQL client tool
* Create a database for the experiment
* Prepare a sample table representing customer orders containing details such as customer name, product, quantity, price, and order date
* Insert sufficient sample records to allow meaningful analysis

**Query:**

**Table Creation:**

```sql
CREATE TABLE CustomerOrders (
    OrderID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);
```

**Insertion Of Records:**

```sql
INSERT INTO CustomerOrders
(CustomerName, Product, Quantity, Price, OrderDate)
VALUES
('Aarav', 'Laptop', 1, 65000, '2025-01-10'),
('Neha', 'Mobile', 2, 40000, '2025-01-12'),
('Rohit', 'Laptop', 1, 70000, '2025-01-15'),
('Priya', 'Tablet', 3, 45000, '2025-01-18'),
('Karan', 'Mobile', 1, 20000, '2025-01-20'),
('Simran', 'Laptop', 2, 130000, '2025-01-22'),
('Aman', 'Tablet', 2, 30000, '2025-01-25'),
('Riya', 'Mobile', 3, 60000, '2025-01-26'),
('Vikas', 'Laptop', 1, 68000, '2025-01-28'),
('Pooja', 'Tablet', 1, 15000, '2025-01-30');
```

**Output:**

<img width="1090" height="436" alt="image" src="https://github.com/user-attachments/assets/0dfa316a-f071-48fd-8f8b-4995dbca3870" />

---

### 🔹 Step 2: Filtering Data Using Conditions

**Description:**

* Execute data retrieval operations to display only those records that satisfy specific conditions, such as higher priced orders

**Query (Without CASE Statement):**

```sql
SELECT *
FROM CustomerOrders
WHERE Price > 50000;
```

**Query (With CASE Statement):**

```sql
SELECT *
FROM CustomerOrders
WHERE
    CASE
        WHEN Price > 50000 THEN 1
        ELSE 0
    END = 1;
```

**Output:**

<img width="1090" height="264" alt="image" src="https://github.com/user-attachments/assets/eed0270b-72ff-4714-bcdf-c62d57f835e7" />

---

### 🔹 Step 3: Sorting Query Results

**Description:**

* Retrieve selected columns from the table and arrange the output based on numerical values such as price
* Perform sorting using both ascending and descending order
* Apply sorting on more than one attribute to understand priority-based ordering

**Sort Orders by Price (Ascending):**

```sql
SELECT *
FROM CustomerOrders
ORDER BY Price ASC;
```

**Output:**

<img width="849" height="354" alt="image" src="https://github.com/user-attachments/assets/d42aa4e8-f18b-4795-9480-1677a2e7e142" />

**Sort Orders by Price (Descending):**

```sql
SELECT *
FROM CustomerOrders
ORDER BY Price DESC;
```

**Output:** 

<img width="906" height="374" alt="image" src="https://github.com/user-attachments/assets/f9e49abb-0665-4f01-a331-12936a6f2ddc" />

**Sort Using Multiple Columns:**

```sql
SELECT *
FROM CustomerOrders
ORDER BY Product ASC, Price DESC;
```

**Output:** 

<img width="767" height="324" alt="image" src="https://github.com/user-attachments/assets/0b2d91ae-19bd-406f-80d5-12e4f26ad7fb" />

---

### 🔹 Step 4: Grouping Data for Aggregation

**Description:**

* Group records based on a common attribute such as product
* Calculate aggregate values like total sales and average price for each group

**Total Sales for Each Product:**

```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product;
```

**Output:** 

<img width="448" height="180" alt="image" src="https://github.com/user-attachments/assets/81681176-b8cc-4dd4-93f3-863f2230529b" />

**Average Price of Each Product:**

```sql
SELECT
    Product,
    AVG(Price) AS AveragePrice
FROM CustomerOrders
GROUP BY Product;
```

**Output:**

<img width="443" height="200" alt="image" src="https://github.com/user-attachments/assets/11ada861-199b-4fe1-be3a-9c6ed58fba3d" />

---

### 🔹 Step 5: Applying Conditions on Aggregated Data

**Description:**

* Apply conditions on grouped results to retrieve only those groups that satisfy specific aggregate criteria
* Compare the difference between row-level filtering and group-level filtering

**Group-Level Filtering (Using HAVING):**

```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;
```

**Output:**

<img width="444" height="152" alt="image" src="https://github.com/user-attachments/assets/abc1e9fd-7be0-489d-96de-2c18d3c9906c" />

**Row-Level Filtering (Using WHERE):**

```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
WHERE Price > 50000
GROUP BY Product;
```

**Output:** 

<img width="448" height="147" alt="image" src="https://github.com/user-attachments/assets/ad04252a-763c-4894-bf9e-203f4ffe2862" />

---

### 🔹 Step 6: Conceptual Understanding of Filtering vs Aggregation Conditions

**Description:**

* Analyze scenarios where conditions are incorrectly applied before grouping
* Correctly apply conditions after grouping to avoid logical errors

**Incorrect Usage:**

```sql
SELECT Product, SUM(Price)
FROM CustomerOrders
WHERE SUM(Price) > 100000
GROUP BY Product;
```

**Correct Usage:**

```sql
SELECT Product, SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;
```

**Output:** 

<img width="444" height="152" alt="image" src="https://github.com/user-attachments/assets/1f6c48e2-ac53-4a4c-8e20-d5b93dcdf41a" />

---

## 📚 Learning Outcomes

* Understand how to create relational database tables using appropriate data types and constraints
* Learn to retrieve required data from a table using row-level filtering with the WHERE clause
* Gain the ability to apply column-level (group-level) filtering using the HAVING clause
* Develop practical knowledge of using CASE statements for conditional logic in SQL queries
* Understand the use of aggregate functions such as SUM(), AVG(), and COUNT() for analytical reporting
* Clearly differentiate between row-level filtering and group-level filtering, and apply them correctly in real-world SQL scenarios
