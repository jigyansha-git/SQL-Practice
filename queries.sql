-- SQL Practice for Data Analyst Preparation

-- 1. Select all records
SELECT * FROM employees;

-- 2. Select specific columns
SELECT employee_id, name, department FROM employees;

-- 3. Filter records using WHERE
SELECT * FROM employees
WHERE department = 'Sales';

-- 4. Sort data using ORDER BY
SELECT name, salary FROM employees
ORDER BY salary DESC;

-- 5. Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 6. Group data using GROUP BY
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 7. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 8. Employees earning more than average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 9. Find highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

-- 10. Departments with more than 5 employees
SELECT department
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
