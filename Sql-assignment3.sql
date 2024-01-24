
use vrushipatel_db;

create table department
(
dept_id INT PRIMARY KEY,
dept_name varchar(50)
);

create table employee
(
emp_id INT NOT NULL,
dept_id INT ,
mngr_id INT,
emp_name varchar(50),
salary float ,
foreign key(dept_id) references department(dept_id)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Finance');


INSERT INTO Employee  VALUES
(101, 1, NULL, 'John Doe', 60000),
(102, 1, 101, 'Jane Smith', 50000),
(103, 2, NULL, 'Bob Johnson', 70000),
(104, 2, 103, 'Alice Williams', 75000),
(105, 3, NULL, 'Chris Davis', 55000),
(106, 3, 105, 'Eva Miller', 60000),
(107, 4, NULL, 'Mike Wilson', 80000),
(108, 4, 107, 'Sara Brown', 90000),
(109, 1, NULL, 'Jane Miller', 97000),
(110, 4, 108, 'Alice Brown', 80500);

select * from department;
select * from employee;

--1--
SELECT
    MAX(e.emp_id) AS emp_id,
    MAX(e.dept_id) as dept_id,
	MAX(d.dept_name) as dept_name,
    MAX(emp_name) AS emp_name,
    MAX(salary) AS salary
FROM
    employee e
	inner join department d
	on d.dept_id=e.dept_id
GROUP BY
    d.dept_id;

--2--
SELECT
    d.dept_id,
	d.dept_name,
    COUNT(e.emp_id) AS num_employees
FROM
    employee e
	inner join department d
	on d.dept_id=e.dept_id
GROUP BY
    d.dept_id , d.dept_name
HAVING
    COUNT(e.emp_id) < 3;

--3--
select d.dept_name, count(e.emp_name) as num_of_employees
from department d
inner join employee e
on d.dept_id=e.dept_id
group by d.dept_name;


--4--
select * from department;
select * from employee;
select d.dept_name, sum(e.salary) as total_salary
from department d
inner join employee e
on d.dept_id=e.dept_id
group by d.dept_name;




