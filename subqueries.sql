create database subquery;
use subquery;
show tables;

create table departments(
dept_id int primary key,
dept_name varchar(50));

create table employees(
emp_id int primary key,
emp_name varchar(50),
salary decimal(10,2),
dept_id int,
foreign key(dept_id) references departments(dept_id));

insert into departments (dept_id, dept_name) values
(1, 'hr'),
(2, 'it'),
(3, 'sales'),
(4, 'finance');

insert into employees (emp_id,emp_name,salary,dept_id) values
(101, 'alice', 50000, 1),
(102, 'bob', 60000, 1),
(103, 'charlie', 55000, 2),
(104, 'diana', 70000, 2),
(105, 'eva', 40000, 3),
(106, 'frank', 45000, 3),
(107, 'george', 48000, 1),
(108, 'helen', 52000, 2),
(109, 'ivy', 75000, 2),
(110, 'jack', 62000, 3),
(111, 'karen', 43000, 1),
(112, 'leo', 39000, 4),
(113, 'mona', 41000, 4),
(114, 'nate', 58000, 1),
(115, 'olive', 46000, 3),
(116, 'paul', 49000, 2),
(117, 'queen', 54000, 4),
(118, 'ruth', 47000, 3),
(119, 'sam', 61000, 2),
(120, 'tina', 38000, 4);

-- 1. scalar subquery → returns a single value
-- 2. correlated subquery → depends on outer query
-- 3. nested subquery → independent inner query
-- 4. multirow subquery → returns multiple rows
-- 5. exists subquery → checks if rows exist
-- ============================================================

-- scalar subquery
-- definition: returns exactly one value

-- example 1:
-- display employee name, salary, and average salary of all employees
-- departments(dept_id , dept_name)
-- employees(emp_id , emp_name , salary , dept_id)

select emp_name,salary,(select avg(salary) from employees) as avg_sal
from employees;

select avg(salary) from employees;

-- example 2: display employee name, salary, and maximum with minimum salary in the company.
select emp_name,salary,(select max(salary) from employees)as max_sal,(select min(salary) from employees)as min_sal
from employees;

-- example 3: display each employee's name, salary, and department name
select emp_name,salary,(select dept_name from departments where employees.dept_id = departments.dept_id) as dept
from employees ;

-- ============================================================

-- correlated subquery
-- subquery that uses values from the outer query.
-- execute once per each row of outer query.

-- find employees who earn more than the average salary of the company
select emp_name,salary
from employees
where salary > (select avg(salary) from employees);

-- find employees whose salary is greater than the minimum salary in the company
select emp_name , salary 
from employees
where salary > (select min(salary) from employees);

-- Find out the maximum salary and it's emp name also it's corresponding department name.
 select emp_name , salary , (select dept_name from departments where employees.dept_id = departments.dept_id)
 from employees
 where salary = (select max(salary) from employees);

-- find employees whose salary is higher than all other employees in their department
select emp_name , salary , (select dept_name from departments d where e1.dept_id = d.dept_id) as deptname
from employees e1
where salary > all (select max(salary )from employees e2 where e2.dept_id = e1.dept_id and e1.emp_id != e2.emp_id);

-- find employees earning more than the average salary of their department
select emp_name , salary , (select dept_name from departments d where e1.dept_id = d.dept_id) as deptname
from employees e1
where salary > (select avg(e2.salary) from employees e2
where e1.dept_id = e2.dept_id);
