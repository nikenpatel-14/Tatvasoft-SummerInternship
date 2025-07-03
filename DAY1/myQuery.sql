-- Create 'departments' table
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create 'employees' table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2),
    hire_date DATE,
    dept_id INT REFERENCES departments(dept_id)
);
-- Insert into departments
INSERT INTO departments (dept_name) VALUES 
('HR'),
('Engineering'),
('Sales');

-- Insert into employees
INSERT INTO employees (emp_name, salary, hire_date, dept_id) VALUES 
('Alice', 50000, '2023-05-10', 1),
('Bob', 70000, '2022-03-15', 2),
('Charlie', 45000, '2024-01-20', 1),
('David', 80000, '2021-11-30', 2),
('Eve', 60000, '2023-07-01', 3);


-- Basic read
SELECT * FROM employees;

-- WHERE clause
SELECT * FROM employees WHERE salary > 50000;

-- LIKE operator
SELECT * FROM employees WHERE emp_name LIKE 'A%';

-- ORDER BY salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- INNER JOIN employees with departments
SELECT 
    e.emp_name,
    e.salary,
    d.dept_name
FROM 
    employees e
JOIN 
    departments d ON e.dept_id = d.dept_id;

	
-- Average salary by department
SELECT 
    d.dept_name,
    AVG(e.salary) AS avg_salary
FROM 
    employees e
JOIN 
    departments d ON e.dept_id = d.dept_id
GROUP BY 
    d.dept_name
ORDER BY 
    avg_salary DESC;
	
	
-- Update salary of an employee
UPDATE employees
SET salary = 75000
WHERE emp_name = 'Charlie';

-- Delete employee with low salary
DELETE FROM employees
WHERE salary < 46000;

-- All employees with department and formatted info
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    TO_CHAR(e.hire_date, 'Mon YYYY') AS hired_month,
    d.dept_name
FROM 
    employees e
JOIN 
    departments d ON e.dept_id = d.dept_id
ORDER BY 
    e.hire_date DESC;
