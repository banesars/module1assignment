USE Northwind;

INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('BFM', 'Bagans Food Market', 'Zak Bagans', 'Owner');

SELECT* FROM Customers
WHERE CustomerID = 'BFM';

UPDATE Customers
SET Address = '67 Adventure Blvd'
WHERE CustomerID = 'BFM';

DELETE FROM Customers
WHERE CustomerID = 'BFM';

CREATE TABLE Advertisers
(AdvertiserID int NOT NULL,
CompanyName varchar(50),
AdvertisingType varchar(50),
UnitPrice decimal(10,2),
PRIMARY KEY(AdvertiserID));

ALTER TABLE Advertisers
ADD address varchar(80),
ADD city varchar(50), 
ADD zipCode varchar(10);

INSERT INTO Advertisers
(AdvertiserID, CompanyName)
VALUES(1001, 'Hubbard Braodcasting');

DROP TABLE Advertisers;


SELECT C.ContactName, C.CompanyName, C.City, O.OrderID, O.OrderDate, O.RequiredDate
FROM Customers C
INNER JOIN Orders O ON C.CustomerID=O.CustomerID;

/*LEFT OUTER JOIN*/
SELECT C.ContactName, C.CompanyName, C.City,
O.OrderID,
O.OrderDate,
O.RequiredDate
FROM Customers C LEFT OUTER JOIN Orders O 
ON C.CustomerID=O.CustomerID;

/*RIGHT OUTER JOIN*/
SELECT C.ContactName, C.CompanyName, C.City,
O.OrderID,
O.OrderDate,
O.RequiredDate
FROM Customers C RIGHT OUTER JOIN Orders O 
ON C.CustomerID=O.CustomerID;

/*MULTIPLE JOIN*/
SELECT C.ContactName, C.CompanyName, C.City,
O.OrderID,
O.OrderDate,
O.RequiredDate,
OD.Quantity,
OD.UnitPrice,
P.ProductName
FROM Customers C INNER JOIN Orders O
ON C.CustomerID = O.CustomerID INNER JOIN Order_Details OD
ON O.OrderID = OD.OrderID INNER JOIN Products P
ON OD.ProductID = P.ProductID;

/*LAB CHALLENGE*/
USE Northwind; 

INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('GAF', 'Ghost Adventures Foods', 'Aaron Goodwin', 'CEO');

/*Updating table*/
UPDATE Customers
SET Address = '123 Puravida Blvd'
WHERE CustomerID = 'GAF';

/*Pup Dog Snacks Table Information*/
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('PDS', 'Pup Dog Snacks', 'Snoopy Brown', 'Chief Doggy Officer'); 

/*Updating table*/
UPDATE Customers
SET Address = '567 Aldrich Ave S'
WHERE CustomerID = 'PDS'; 

/*ICL Table Information*/
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('ICL', 'Iguana Chow, Ltd', 'Gracie Green', 'Owner');

UPDATE Customers
SET Address = '1213 Warzone Circle'
WHERE CustomerID = 'ICL'; 

/*VCC Table Information*/
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('VCC', 'Valentines Candy Co', 'Fabio Bertini', 'CEO'); 

UPDATE Customers
SET Address = '2011 Fairview Street'
WHERE CustomerID = 'VCC'; 

/*CSS Table Information*/
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('CSS', 'Chicken Soup for the Stomach', 'Bao Vang', 'Owner');

UPDATE Customers
SET Address = '1029 Aurora Blvd'
WHERE CustomerID = 'VCC'; 

DELETE FROM Customers
WHERE CustomerID = 'GAF';

DROP TABLE delivery;
/*Creating a table for same day delivery*/
CREATE TABLE Deliveries
(DeliveryID int NOT NULL,
CompanyName varchar(50),
DeliveryType varchar(50),
UnitPrice decimal(10,2),
PRIMARY KEY(DeliveryID));

INSERT INTO Deliveries (DeliveryID, CompanyName, DeliveryType, UnitPrice)
VALUES (7, 'Same Day Del', 'Same Day', 30);

INSERT INTO randomy (DeliveryID, CompanyName, DeliveryType, UnitPrice)
VALUES (1001, 'BestBuy', 'FEDEX', 30);

CREATE TABLE Randomy
(RandomID int NOT NULL,
CompanyName varchar(50),
RandomType varchar(50),
UnitPrice decimal(10,2),
PRIMARY KEY(RandomID));

/*Delete Randomy table that was just created*/
DROP TABLE Randomy;