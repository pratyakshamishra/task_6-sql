create database job;
use  job;
-- Table: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Table: employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
-- Departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- Employees
INSERT INTO employees (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Ravi', 1, 30000),
(102, 'Sneha', 2, 50000),
(103, 'Ankit', 3, 75000),
(104, 'Meena', 3, 65000),
(105, 'Aarti', 4, 40000),
(106, 'Kunal', 2, 60000);

SELECT emp_name
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'Finance'
);
SELECT e.emp_name, e.salary,
       (SELECT AVG(salary)
        FROM employees
        WHERE dept_id = e.dept_id) AS dept_avg_salary
FROM employees e;

SELECT *
FROM (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS salary_summary
WHERE avg_salary > 50000;

SELECT emp_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);


