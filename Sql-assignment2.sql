create table salesman(	salesman_id INT NOT NULL,	name varchar(50),	city varchar(50),	commission INT);create table customer(	salesman_id INT NOT NULL,	customer_id INT NOT NULL,	cust_name varchar(50),	city varchar(50),	grade int);create table orders(	salesman_id INT NOT NULL,	customer_id INT NOT NULL,	ord_no INT,	purch_amt INT,	ord_date DATETIME);
insert into salesman values
(101, 'John Smith', 'New York', 0.15),
(102,	'Jane Doe',	'Los Angeles',	0.12),
(103	,'Robert Johnson'	,'Chicago'	,0.10),
(104	,'Emily White'	,'San Francisco',	0.18);

insert into orders values
(301,	3500,	2024-01-10,	201,	101),
(302,	800,	2024-01-12,	202	,102),
(303,	2300,	2024-01-15,	203,	103),
(304,	1200,	2024-01-20,	204,	104);

insert into customer values
(201, 'Mary Johnson',	'California', 535,101),
(202,	'Michael Brown',	'Los Angeles',	354,	102),
(203,'Linda Davis',	'New York',	20,	103),
(204,	'James Wilson',	'San Francisco',	128,	104);

select* from salesman;
select* from orders;
select* from customer;

--1--
use vrushipatel_db
SELECT salesman.name, customer.cust_name, customer.city
FROM dbo.salesman 
INNER JOIN customer
ON salesman.city = customer.city;

--2--
select orders.ord_no, orders.purch_amt, customer.cust_name, customer.city
from orders
INNER JOIN customer
ON orders.customer_id = customer.customer_id 
 where orders.purch_amt Between 500 and 2000;

 --3--
 select s.name,s.commission, c.cust_name, c.city
 from salesman s
 Inner join customer c
 on s.salesman_id=c.salesman_id;

 --4--
 select c.cust_name,c.city, s.name, s.commission
 from salesman s
 inner join customer c
 on s.salesman_id=c.salesman_id
 where s.commission> 0.12;

 --5--
 select c.cust_name,c.city, s.name, s.city, s.commission
 from salesman s
 inner join customer c
 on  s.salesman_id=c.salesman_id
 where s.commission>0.12 and  s.city<> c.city;

 --6--
 select o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade, s.name, s.commission
 from salesman s
 inner join customer c 
 on s.salesman_id=c.salesman_id
 inner join orders o
 on c.customer_id =o.customer_id;

--7--
SELECT s.salesman_id,s.name,s.city, s.commission,c.customer_id,c.cust_name,c.city,c.grade, o.ord_no, o.purch_amt, o.ord_date
FROM salesman s
INNER JOIN 
    customer c ON s.salesman_id = c.salesman_id
INNER JOIN 
    orders o ON c.customer_id = o.customer_id AND s.salesman_id = o.salesman_id
ORDER BY 
    s.salesman_id, c.customer_id, o.ord_no;

--8--
select c.cust_name, c.city,c.grade, s.name,s.city
from salesman s
INNER JOIN customer c on s.salesman_id = c.salesman_id
order by  c.customer_id asc;

--9--
select c.cust_name, c.city,c.grade,s.name,s.city
from salesman s
inner join customer c on s.salesman_id = c.salesman_id
order by  c.customer_id asc;

--10--
SELECT c.cust_name, c.city, c.grade, s.name,scity 
FROM customer c
LEFT OUTER JOIN salesman s
ON c.alesman_id = s.salesman_id 
WHERE c.grade < 300 
ORDER BY c.customer_id;

--11--
select  c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commissionfrom customer c left join orders o on c.customer_id = o.customer_idleft join salesman s on s.salesman_id = c.salesman_id;


--12--
SELECT s.salesman_id,s.name
FROM salesman s
LEFT JOIN orders o
 ON s.salesman_id = o.salesman_id
WHERE
    o.salesman_id IS NOT NULL OR o.salesman_id IS NULL
GROUP BY
    s.salesman_id, s.name
ORDER BY
   s.name ASC;

 --13--
 select s.name,c.cust_name,c.city,c.grade,o.ord_no,o.ord_date, o.purch_amt
 from salesman s
 inner join orders o 
 on s.salesman_id=o.salesman_id
 inner join customer c
 on c.customer_id= o.customer_id
 order by s.name, o.ord_date;

 --14--
 SELECT
    DISTINCT s.salesman_id,s.name
FROM salesman  s
LEFT JOIN orders o
 ON s.salesman_id = o.salesman_id
LEFT JOIN customer c  
 ON o.customer_id = c.customer_id
WHERE
    (
        (o.purch_amt >= 2000 AND c.grade IS NOT NULL)
        OR o.ord_no IS NULL
    )
ORDER BY s.name;

--15--
SELECT DISTINCT s.salesman_id, s.name
FROM salesman s
LEFT JOIN  Orders o
 ON s.salesman_id = o.salesman_id
LEFT JOIN customer c
ON o.customer_id = c.customer_id
WHERE
    (
        (o.purch_amt >= 2000 AND c.grade IS NOT NULL)
        OR o.ord_no IS NULL
    )
ORDER BY s.name;

--16--
SELECT c.cust_name,c.city,o.ord_no,o.purch_amt
FROM customer c
inner JOIN orders o
ON c.customer_id = o.customer_id
WHERE
    (c.grade IS NOT NULL AND o.ord_no IS NOT NULL)
    OR (c.grade IS NULL AND o.ord_no IS NULL)
ORDER BY c.cust_name, o.ord_date;

--17--
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name
FROM salesman s
CROSS JOIN
customer c;

--18--
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name
FROM salesman s
CROSS JOIN
customer c
WHERE s.city=c.city;

--19--
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name
FROM salesman s
CROSS JOIN
customer c
WHERE
s.city = c.city;

--20--
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name
FROM salesman s
CROSS JOIN
customer c
WHERE
    s.City <> c.City AND c.Grade IS NOT NULL;
