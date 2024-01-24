ALTER TABLE orders
ADD category_id int;

--2--
use vrushipatel_db;

CREATE PROCEDURE SalesByCategory @emp_id int , @city varchar(50)
AS
BEGIN;
select c.city, c.salesman_id,sum(purch_amt)
from orders inner join customer
as 
c on orders.customer_id = c.Customer_id
group  by c.salesman_id,City  
having c.Salesman_id=@emp_id and c.City=@city
END;

--exec SalesByCategory 3, 'Los Angeles';

--3--
CREATE PROCEDURE SalesByYear @Year nvarchar(30)
AS
BEGIN;
SELECT sum(Purch_amt) FROM orders where Year(ord_date)=2024;
END;

/* EXEC SalesByYear 2024;

SELECT sum(Purch_amt) FROM Orders where YEAR(Ord_date)=2024;
*/

--4--
CREATE PROCEDURE SalesByCategory @Category_ID int
AS
BEGIN
	select @Category_ID , SUM(Purch_amt) as Sales from orders group by category_id having  Category_ID=@Category_ID;;
END

--Exec SalesByCategory 151;

--5--
CREATE PROCEDURE TenExpensiveProduct
AS
BEGIN;
SELECT TOP 10 * FROM products ORDER BY UnitPrice DESC;
END;

/*EXEC TenExpensiveProduct;

SELECT TOP 10 * FROM Products ORDER BY UnitPrice DESC;
*/

--6--
CREATE PROCEDURE InsertIntoOrder @ord_no int,@purch_amt int,@ord_date datetime,@customer_id int,@salesman_id int
AS
BEGIN
	Insert into orders values (@ord_no,@purch_amt,@ord_date,@customer_id,@salesman_id);

END

/* EXEC InsertIntoOrder 301,3500,'2024-01-10',201,101

select * from orders;
*/

--7--
CREATE PROCEDURE UpdateOrder @ord_no int,@purch_amt int
AS
BEGIN
	UPDATE orders	
		SET purch_amt=@purch_amt
		WHERE Ord_no=@ord_no;

END

EXEC UpdateOrder 1200,304

select * from Orders;

--1--
 CREATE PROCEDURE AvgOfCustomer(@customer_id int,@avg_salary int output)
AS
BEGIN;
select @avg_salary=avg(purch_amt) from Orders group by Customer_Id having  customer_id=@customer_id
END;

Create trigger TriggerDemo
on orders
for insert,update
as 
begin

declare @current_purch_amt int
select @current_purch_amt=purch_amt from inserted
declare @customerID int
select @customerID=customer_ID from inserted
declare @avg_purch_amt int

exec AvgOfCustomer @customerID , @avg_purch_amt out
if @avg_purch_amt>@current_purch_amt
BEGIN
        PRINT 'Current purchase amount is below the Average Purchase Amount.'
END
else 
BEGIN
	Rollback Transaction;
END;
end

