 -- ASSIGNMENT-1--
 
 insert into Products values(1,'Tablet' , 101, 201, 10, 39,20,10,4,0),
 (2,'Mobile', 102, 202, 5, 12,75,15,5,0),
 (3,'TV', 103,203, 20,9,150 , 10, 8,0),
 (4,'Laptop', 104,204,18,50,25,15,3,0),
 (5,'Computer', 105,205,8,4,20,30,12,0);
 
 select * from Products;

  update products
 set UnitPrice=24
 where ProductID=1;

  update products
 set Discontinued=1
 where ProductID=3;
  
 update products
 set QuantityPerUnit=45
 where ProductID=4;

 select ProductID, ProductName, UnitPrice from Products where UnitPrice< 20;

 select ProductID, ProductName, UnitPrice from Products where UnitPrice between 15 and 25;

 select  ProductName, UnitPrice from Products where UnitPrice>( select AVG(UnitPrice) from products);

 select top 10  ProductName, UnitPrice from Products order by UnitPrice DESC;
 select top 10  ProductName, UnitPrice from Products order by UnitPrice;

 select count(Discontinued) from products;

 SELECT
    SUM(CASE WHEN Discontinued = 0 THEN 1 ELSE 0 END) AS CurrentProducts,
    SUM(CASE WHEN Discontinued = 1 THEN 1 ELSE 0 END) AS DiscontinuedProducts
FROM Products;


 select ProductName, UnitsOnOrder, UnitsInStock from Products where UnitsInStock < UnitsOnOrder;

 