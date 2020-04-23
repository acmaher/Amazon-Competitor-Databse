CREATE database AM
--remember to write in not null and primary and foregin keys

USE AM;
CREATE TABLE Customers (
CustomerName varchar(50) not null PRIMARY KEY,
Username varchar(50) not null,
CustomerEmail varchar(50) not null,
OrdersReturnInformation varchar(50) not null,
Wishlist varchar(50) null,
CustomerDate datetime not null,
CustomerAddress varchar(50) not null,
);

--test data for customers
INSERT [AM].dbo.Customers VALUES ('Walt Disney', 'walt1', 'walt@disney.com','none', 'Disney+', '1/2/19 12:01', '4301 Orlando Drive');   
INSERT [AM].dbo.Customers VALUES ('Elon Musk', 'teslagod', 'e$@tesla.com','none', 'Tesla', '6/3/19 5:55', '2 Beverly Hills Road');
INSERT [AM].dbo.Customers VALUES ('Matt Dwyer', 'mdwyer', 'md@gmail.com','none', 'Beer', '8/12/19 6:56', '4567 Brooklyn Drive');
INSERT [AM].dbo.Customers VALUES ('Will Marciello', 'will.i.am', 'willm@gmail.com','none', 'Shoes', '4/20/19 11:11', '11 Erie Boulevard');
INSERT [AM].dbo.Customers VALUES ('Joe Flacco', 'eliteqb', 'iamelite@broncos.com','none', 'Football', '6/9/19 7:12', '420 Denver Avenue');
INSERT [AM].dbo.Customers VALUES ('Matt Hillebrand', 'thebighill', 'mh@gmail.com','none', 'Erasers', '1/1/19 1:11', '1 College Street');
INSERT [AM].dbo.Customers VALUES ('Richard Saganey', 'rtsags', 'rtsaganey@gmail.com', 'none', 'Laptop', '1/2/19 12:00', '1 Hag Lane');
INSERT [AM].dbo.Customers VALUES ('Jared Sills', 'jsills', 'jsills@gmail.com','none', 'iPhone', '12/27/19 2:45', '4803 Orlando Drive');
INSERT [AM].dbo.Customers VALUES ('Cam Casciano', 'ccas', 'casci@gmail.com','none', 'Jacket', '12/27/19 2:45', '4902 Orlando Drive');
INSERT [AM].dbo.Customers VALUES ('Tyler Barron', 'tb', 'tb@gmail.com', 'none', 'Cups', '11/27/19 2:45', '1414 Orlando Drive');



CREATE TABLE Products (
ProductID int not null PRIMARY KEY,
ProductName varchar(50) not null,
Price money null,
ProductRating int not null,
);

--test data for products
INSERT [AM].dbo.Products VALUES ('1', 'Halo', '$100', '9');
INSERT [AM].dbo.Products VALUES ('2', 'Mariokart', '$7', '5');
INSERT [AM].dbo.Products VALUES ('3', 'Football', '$22', '3');
INSERT [AM].dbo.Products VALUES ('4', 'Basketball', '$17', '');
INSERT [AM].dbo.Products VALUES ('5', 'Baseball', '$6', '6');
INSERT [AM].dbo.Products VALUES ('6', 'Eraser', '$1', '10');
INSERT [AM].dbo.Products VALUES ('7', 'Pencils', '$3', '1');
INSERT [AM].dbo.Products VALUES ('8', 'Pens', '$5', '2');
INSERT [AM].dbo.Products VALUES ('9', 'Whoopie Cushion', '$2', '8');
INSERT [AM].dbo.Products VALUES ('10', 'Gummy Worms--30 packs', '$25', '10');

SELECT * FROM [AM].dbo.Products



CREATE TABLE Suppliers (
SupplierID int not null PRIMARY KEY,
SupplierName varchar(50) not null,
SupplierAddress varchar(50) not null,
SupplierPhone bigint not null,
SupplierEmail varchar(50) not null,
ProductID int references Products (ProductID) not null,
NumberOfProductsAvailable int not null,
);

ALTER Table Suppliers
Alter column SupplierPhone bigint not null

--data for suppliers
INSERT [AM].dbo.Suppliers Values ('1', 'Jax Candy', '1 College Drive', '1111234', 'jax@gmail.com', '10', '12500');
INSERT [AM].dbo.Suppliers Values ('2', 'Microsoft', '2 Main Drive', '6781234', 'microsoft@gmail.com', '1', '85');
INSERT [AM].dbo.Suppliers Values ('3', 'Moon Suppliers', '2 College Street', '9821434', 'moon@gmail.com', '3', '200');
INSERT [AM].dbo.Suppliers Values ('4', 'Chaminade', '7 Jackson Avenue', '5671298', 'chami@gmail.com', '6', '999');
INSERT [AM].dbo.Suppliers Values ('5', 'Krazy Sales', '80 College Drive', '5556767', 'ksales@gmail.com', '4', '12500');
INSERT [AM].dbo.Suppliers Values ('6', 'SportsRUs', '97 Main Drive', '8889898', 'Sporticus@gmail.com', '2', '12500');
INSERT [AM].dbo.Suppliers Values ('7', 'Pen Land', '163 Burtis Drive', '8953451', 'pen15@gmail.com', '7', '12500');
INSERT [AM].dbo.Suppliers Values ('8', 'Pencil City', '111 Carnegie Drive', '5457612', 'pencilsjax@gmail.com', '8', '12500');
INSERT [AM].dbo.Suppliers Values ('9', 'Solosos', '666 Satan St', '6666666', 'solo@gmail.com', '5', '12500');
INSERT [AM].dbo.Suppliers Values ('10', 'Cranky Franks', '1 Fishermans Wharf', '3214532', 'cfrank@gmail.com', '9', '12500');


SELECT * FROM [AM].dbo.Suppliers


CREATE TABLE Orders (
OrderID int not null PRIMARY KEY,
OrderStatus varchar(50) not null,
OrderTotalPrice money not null,
OrderDate datetime not null,
ShippingService varchar(50) not null,
ShippingFare money not null,
ExpectedShippingDate datetime not null,
ActualShippingDate datetime not null,
ShippingInformation varchar(50) not null,
ShippingAddress varchar(50) not null,
ProductID int references Products (ProductID) not null,
);



INSERT [AM].dbo.Orders VALUES ('1', 'In Process', '75', '12/1/19 1:00', 'FedEx', '12', '12/15/19 12:00', '12/23/19 12:00', 'none', '4301 Orlando Drive', '1');
INSERT [AM].dbo.Orders VALUES ('2', 'In Process', '25', '12/1/19 1:00', 'UPS', '0', '12/15/19 12:00', '12/23/19 12:00', 'none', '2 Beverly Hills Road', '2');
INSERT [AM].dbo.Orders VALUES ('3', 'In Process', '43', '12/1/19 1:00', 'USPS', '15', '12/15/19 12:00', '12/23/19 12:00', 'none', '4567 Brooklyn Drive', '3');
INSERT [AM].dbo.Orders VALUES ('4', 'In Process', '50', '12/1/19 1:00', 'FedEx', '0', '12/15/19 12:00', '12/23/19 12:00', 'none', '11 Erie Boulevard', '4');
INSERT [AM].dbo.Orders VALUES ('5', 'In Process', '65', '12/1/19 1:00', 'UPS', '0', '12/15/19 12:00', '12/23/19 12:00', 'none', '420 Denver Avenue', '5');
INSERT [AM].dbo.Orders VALUES ('6', 'In Process', '1', '12/1/19 1:00', 'USPS', '0', '12/15/19 12:00', '12/23/19 12:00', 'none', '1 College Street', '6');
INSERT [AM].dbo.Orders VALUES ('7', 'In Process', '5', '12/1/19 1:00', 'FedEx', '11', '12/15/19 12:00', '12/23/19 12:00', 'none', '1 Hag Lane', '7');
INSERT [AM].dbo.Orders VALUES ('8', 'In Process', '8', '12/1/19 1:00', 'UPS', '2', '12/15/19 12:00', '12/23/19 12:00', 'none', '4803 Orlando Drive', '8');
INSERT [AM].dbo.Orders VALUES ('9', 'In Process', '15', '12/1/19 1:00', 'USPS', '3', '12/15/19 12:00', '12/23/19 12:00', 'none', '4902 Orlando Drive', '9');
INSERT [AM].dbo.Orders VALUES ('10', 'In Process', '49', '12/1/19 1:00', 'FedEx', '5', '12/15/19 12:00', '12/23/19 12:00', 'none', '1414 Orlando Drive', '10');

SELECT * FROM [AM].dbo.Orders


CREATE TABLE Warehouses (
WarehouseID int PRIMARY KEY,
StoredProducts varchar(50) not null,
);

INSERT [AM].dbo.Warehouses VALUES ('1', '100');
INSERT [AM].dbo.Warehouses VALUES ('2', '200');
INSERT [AM].dbo.Warehouses VALUES ('3', '300');
INSERT [AM].dbo.Warehouses VALUES ('4', '400');
INSERT [AM].dbo.Warehouses VALUES ('5', '500');
INSERT [AM].dbo.Warehouses VALUES ('6', '600');
INSERT [AM].dbo.Warehouses VALUES ('7', '700');
INSERT [AM].dbo.Warehouses VALUES ('8', '800');
INSERT [AM].dbo.Warehouses VALUES ('9', '900');
INSERT [AM].dbo.Warehouses VALUES ('10', '1000');
INSERT [AM].dbo.Warehouses VALUES ('11', '1100');

CREATE TABLE Reviews (
ReviewDate datetime not null PRIMARY KEY,
WhichOrder int not null,
Score int not null,
ReviewText varchar(50) not null,
WhichProduct varchar(50) not null,
);

INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:00', '1', '1', 'terrible product', '1');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:01', '2', '2', 'bad product', '2');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:02', '3', '3', 'eh product', '3');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:03', '4', '4', 'okay product', '4');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:04', '5', '5', 'pretty good product', '5');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:05', '6', '10', 'awesome product', '6');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:06', '7', '6', 'lit product', '7');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:07', '8', '7', 'cool product', '8');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:08', '9', '8', 'necessary product', '9');
INSERT [AM].dbo.Reviews VALUES ('1/1/20 12:09', '10', '9', 'love it so much', '10');

SELECT* FROM [AM].dbo.Reviews

CREATE TABLE AddressBook (
CustomerAddress varchar(50) not null PRIMARY KEY,
City varchar(50) not null,
CustomerState varchar(50) not null,
Street varchar(50) not null,
);

INSERT [AM].dbo.AddressBook VALUES ('4301 Orlando Drive', 'Orlando', 'Florida', 'Orlando Drive');
INSERT [AM].dbo.AddressBook VALUES ('2 Beverly Hills Road', 'Beverly Hills', 'California', 'Beverly Hills Road');
INSERT [AM].dbo.AddressBook VALUES ('4567 Brooklyn Drive', 'New York City', 'New York', 'Brooklyn Drive');
INSERT [AM].dbo.AddressBook VALUES ('11 Erie Boulevard', 'Syracuse', 'New York', 'Erie Blvd');
INSERT [AM].dbo.AddressBook VALUES ('420 Denver Avenue', 'Denver', 'Colorado', 'Denver Ave');
INSERT [AM].dbo.AddressBook VALUES ('1 College Street', 'Syracuse', 'New York', 'College St');
INSERT [AM].dbo.AddressBook VALUES ('1 Hag Lane', 'Jacksonville', 'Florida', 'Hag Ln');
INSERT [AM].dbo.AddressBook VALUES ('4303 Orlando Drive', 'Orlando', 'Florida', 'Orlando Drive');
INSERT [AM].dbo.AddressBook VALUES ('4902 Orlando Drive', 'Seattle', 'Washington', 'Orlando Drive');
INSERT [AM].dbo.AddressBook VALUES ('1414 Orlando Drive', 'Dallas', 'Texas', 'Orlando Drive');

CREATE TABLE CustomerRatings (
Rating int not null PRIMARY KEY,
RatingText varchar(50) not null,
Score int not null,
DateWhenCreated datetime not null,
CustomerWhoLeftIt varchar(50) not null,
RatingDate datetime references Reviews (ReviewDate) not null,
);

INSERT [AM].dbo.CustomerRatings VALUES ('1', 'terrible', '1', '1/1/20 12:00', 'Walt', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('2', 'bad', '2', '1/1/20 12:00', 'Elon', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('3', 'eh', '3', '1/1/20 12:00', 'Joe', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('4', 'decent', '4', '1/1/20 12:00', 'Matt', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('5', 'okay', '5', '1/1/20 12:00', 'Will', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('10', 'perfect', '10', '1/1/20 12:00', 'Cam', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('6', 'cool', '6', '1/1/20 12:00', 'Tyler', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('7', 'fun', '7', '1/1/20 12:00', 'Jared', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('8', 'necessary', '8', '1/1/20 12:00', 'Rich', '1/1/20 12:00');
INSERT [AM].dbo.CustomerRatings VALUES ('9', 'litty', '9', '1/1/20 12:00', 'Matt H', '1/1/20 12:00');


CREATE TABLE ShippingAddress (
ShippingAddress varchar PRIMARY KEY,
OrderID int references Orders (OrderID) not null,
City varchar(50) not null,
ShippingState varchar(50) not null,
Street varchar(50) not null,
);

Alter table ShippingAddress
Alter column ShippingAddress varchar(50) not null
Alter Table ShippingAddress
Alter column City varchar(50) not null
Alter Table ShippingAddress
Alter column ShippingState varchar(50) not null
Alter Table ShippingAddress
Alter column Street varchar(50) not null;


--attempted to alter but there's a truncation error???


INSERT [AM].dbo.ShippingAddress VALUES ('1 College Drive', 1, 'New York City', 'New York', 'College Dr');
INSERT [AM].dbo.ShippingAddress VALUES ('2 First Street', 2, 'Omaha', 'Nebraska', 'First St');
INSERT [AM].dbo.ShippingAddress VALUES ('1 Second St', 3, 'Kansas City', 'Missouri', 'Second St');
INSERT [AM].dbo.ShippingAddress VALUES ('3 Fourth Drive', 4, 'Canisius', 'New York', 'Fourth Dr');
INSERT [AM].dbo.ShippingAddress VALUES ('4 Third Ave', 5, 'Dallas', 'Texas', 'Third Ave');
INSERT [AM].dbo.ShippingAddress VALUES ('6 Main Drive', 6, 'San Diego', 'California', 'Main Drive');
INSERT [AM].dbo.ShippingAddress VALUES ('12 Madison Ave', 7, 'Los Angeles', 'California', 'Madison Ave');
INSERT [AM].dbo.ShippingAddress VALUES ('1201 Madison St', 8, 'Brooklyn', 'New York', 'Madison St');
INSERT [AM].dbo.ShippingAddress VALUES ('1475 Euclid Ave', 9, 'Queens', 'New York', 'Euclid Ave');
INSERT [AM].dbo.ShippingAddress VALUES ('999 West Erie Boulevard', 10, 'Manhattan', 'New York', 'Erie Blvd');

SELECT* FROM [AM].dbo.ShippingAddress



CREATE TABLE WarehouseAddress (
WarehouseAddress varchar(50) not null PRIMARY KEY,
WarehouseID int references Warehouses (WarehouseID) not null,
City varchar(50) not null,
WarehouseState varchar not null,
Street varchar(50) not null,
);

--stupid error here says truncated and it won't load!!!!
INSERT [AM].dbo.WarehouseAddress VALUES ('1 Warehouse Street', 1, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('2 Warehouse Street', 2, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('3 Warehouse Street', 3, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('4 Warehouse Street', 4, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('5 Warehouse Street', 5, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('6 Warehouse Street', 6, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('7 Warehouse Street', 7, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('8 Warehouse Street', 8, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('9 Warehouse Street', 9, 'Syracuse', 'NY', 'Warehouse St');
INSERT [AM].dbo.WarehouseAddress VALUES ('11 Warehouse Street', 10, 'Syracuse', 'NY', 'Warehouse St');

CREATE TABLE WarehouseStoredProducts (
StoredProducts varchar(50) not null PRIMARY KEY,
WarehouseID int references Warehouses (WarehouseID) not null,
ProductID int references Products (ProductID) not null,
SupplierID int references Suppliers (SupplierID) not null,
ProductName varchar(50) not null,
NumberInStock int not null,
NumberOnTheWay int not null,
NumberInReturn int not null,
);

INSERT [AM].dbo.WarehouseStoredProducts VALUES ('100', 1, 1, 1, 'Football', '100', '5', '5');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('101', 2, 2, 2, 'Basketball', '101', '50', '50');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('102', 3, 3, 3, 'Baseball', '102', '25', '25');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('103', 4, 4, 4, 'Erasers', '103', '35', '35');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('104', 5, 5, 5, 'Pens', '104', '500', '500');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('105', 6, 6, 6, 'Pencils', '105', '1250', '125');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('106', 7, 7, 7, 'Whoopie Cushion', '106', '535', '12');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('107', 8, 8, 8, 'Gummy Worms', '107', '90', '95');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('108', 9, 9, 9, 'Laptop', '108', '511', '105');
INSERT [AM].dbo.WarehouseStoredProducts VALUES ('109', 10, 10, 10, 'Videogames', '109', '205', '75');

---begin entering data--



--c business reports using views



--find the cheapest product and bring up its name, ID, and cost: it should be less than $2
GO
CREATE VIEW CheapestProduct
AS 
SELECT ProductName, ProductID, Price
FROM [AM].dbo.Products
WHERE Price < 2
GO

SELECT* FROM CheapestProduct

--find the most expensive product and it should cost more than $100
GO
CREATE VIEW MostExpensiveProducts
AS
SELECT ProductName, ProductID, Price
FROM [AM].dbo.Products
WHERE Price > 50
GO
SELECT* FROM MostExpensiveProducts




--find the highest rated reviews
GO
CREATE VIEW BestReview
AS
SELECT Score, WhichProduct
FROM [AM].dbo.Reviews
WHERE Score = 10
GO

SELECT* FROM BestReview

--Find the supplier with the highest number of products, thus making them the largest supplier
GO
CREATE VIEW BiggestSupplier
AS
SELECT SupplierName, NumberOfProductsAvailable
FROM [AM].dbo.Suppliers
WHERE NumberOfProductsAvailable > 1000
GO

SELECT* FROM BiggestSupplier



--d business logic using several triggers and constraints
USE [AM];
GO
CREATE TRIGGER DeleteProduct
ON [AM].dbo.Products
AFTER DELETE
AS
PRINT 'Do Not Delete this Product'
GO

USE [AM];
GO
CREATE TRIGGER AddProduct
ON [AM].dbo.Products
AFTER INSERT
AS
PRINT 'Product Has been Added'
GO

USE [AM]
GO
CREATE TRIGGER AddSupplier
ON [AM].dbo.Suppliers
AFTER INSERT
AS
PRINT 'Supplier has been added to the table'
GO

USE [AM];
GO
CREATE TRIGGER UpdateWarehouses
ON [AM].dbo.Warehouses
AFTER UPDATE
AS
PRINT 'Warehouses table has been updated'
GO


-- e create roles and security for a manager of this company in the us branch--
USE [AM];
CREATE ROLE Manager
GRANT UPDATE, INSERT, DELETE, SELECT
ON CUSTOMERS
TO MANAGER --MANAGERS UPDATE CUSTOMER INFO

USE [AM];
CREATE LOGIN ManagerUnitedStatesBranch WITH PASSWORD = '123abc',
default_database = [AM];

CREATE USER Alex FOR LOGIN ManagerUnitedStatesBranch
ALTER ROLE Manager
ADD MEMBER Alex;
--created user alex as the manager for united states of this company

--f)stored procedures and functions
USE [AM];
GO
CREATE PROCEDURE SelectCustomerState
AS
BEGIN
	SELECT CustomerState, CustomerAddress
	FROM AddressBook
	WHERE CustomerState = 'New York'
	ORDER BY CustomerAddress ASC
END
GO

SP_HELP SelectCustomerState

USE [AM];
GO
CREATE PROCEDURE LowCostProducts
AS
BEGIN
	SELECT ProductName, ProductID, Price
	FROM Products
	WHERE Price < 5
	ORDER BY Price DESC
END
GO

SP_HELPTEXT LowCostProducts

USE [AM];
GO
CREATE PROCEDURE RaisePrice
AS
BEGIN
	SELECT Price
	FROM Products
	UPDATE Products SET Price = Price * 1.1
END
GO

SP_HELPTEXT RaisePrice

USE [AM];
GO
CREATE PROCEDURE LowerPrice
AS
BEGIN
	SELECT Price
	FROM Products
	UPDATE Products SET Price = Price *.9
END
GO

SP_HELP LowerPrice

--functions
USE [AM]
GO
CREATE FUNCTION MostExpensiveProducts()
RETURNS FLOAT AS
BEGIN
DECLARE @expensive FLOAT
SET @expensive = (SELECT MAX(Price)
FROM Products)
RETURN @expensive;
END;
GO

USE [AM];
GO
CREATE FUNCTION Cheap()
RETURNS INT AS
BEGIN
DECLARE @cheap INT
	SET @cheap = (SELECT MIN(Price) FROM Products)
	RETURN @cheap;
END;
GO


SELECT [AM].dbo.Cheap() AS CheapItem

SELECT [AM].dbo.MostExpensiveProducts() AS ExpensiveItem

USE [AM];
GO
CREATE FUNCTION EarlyOrders()
RETURNs datetime
AS
BEGIN
	DECLARE @early datetime
	SET @early = (SELECT Min(OrderDate)
	FROM Orders)
RETURN @early;
END;
GO

SELECT [AM].dbo.EarlyOrders() AS EarliestOrderMade

USE [AM];
GO
CREATE FUNCTION AveragePrice()
RETURNS INT
AS
BEGIN
	DECLARE @avg INT
	SET @avg = (SELECT AVG(Price)
	FROM Products)
RETURN @avg;
END;
GO

SELECT [AM].dbo.AveragePrice() AS TotalAverageProductPrice




--g) transactions
BEGIN TRANSACTION
INSERT Suppliers VALUES (11, 'Jordan', '1 Rich Steet', '5169434', 'mj@jordan-distributors.com', 1, 200)
COMMIT TRANSACTION


BEGIN TRAN 
UPDATE Products
SET Price = 20
WHERE ProductName = 'Mariokart'
COMMIT TRAN


BEGIN TRANSACTION
UPDATE WarehouseStoredProducts
SET NumberInStock = 0
WHERE ProductName = 'Videogames'
COMMIT TRANSACTION





