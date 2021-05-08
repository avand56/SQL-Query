--A)

CREATE VIEW Shipper_Orders As
SELECT Orders.OrderID, Orders.ShipperID, Shippers.ShipperName
FROM Orders
JOIN Shippers
ON Shippers.ShipperID=Orders.ShipperID

SELECT Count(*) FROM [Shipper_Orders]
WHERE ShipperName= ‘Speedy Express’;

--Answer = 54

--B)

CREATE VIEW Employee_Orders AS 
SELECT Orders.EmployeeID, Employees.LastName, Orders.OrderID
FROM Orders
JOIN Employees
ON Employees.EmployeeID=Orders.EmployeeID;

SELECT LastName, COUNT(*)
FROM Employee_Orders
GROUP BY LastName
ORDER BY COUNT(*) desc;

-- Answer=40

--C)

CREATE VIEW Products_Ordered AS
SELECT Orders.OrderID, Customers.Country, OrderDetails.Quantity, Products.ProductName
FROM Orders, OrderDetails
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE Country='Germany';

CREATE VIEW Product_Orders AS
SELECT ProductName, Quantity, COUNT(*) as 'Orders'
FROM Products_Ordered
GROUP BY ProductName;

SELECT ProductName, Quantity, Orders, (Quantity * Orders) AS TotalOrdered
FROM Product_Orders
ORDER BY TotalOrdered desc
LIMIT 1;

--Answer:
--ProductName: Camembert Pierrot
--Orders: 300
--TotalOrdered: 1200

