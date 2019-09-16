/* Fixing primary keys and creating foreign keys in existing tables */

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS SalesSupplies;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS Levels;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Status; 
DROP TABLE IF EXISTS Distro;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Workers;
DROP TABLE IF EXISTS Tavern;
DROP TABlE IF EXISTS Location;





CREATE TABLE Location(
id INT PRIMARY KEY, name VARCHAR(250)
);

INSERT INTO Location (id, name) Values ('1', 'Hammonton');
INSERT INTO Location (id, name) Values ('2', 'Winslow');
INSERT INTO Location (id, name) Values ('3', 'Blackwood');
INSERT INTO Location (id, name) Values ('4', 'Egg Harbor');
INSERT INTO Location (id, name) Values ('5', 'Montclair');


CREATE TABLE Tavern(
id INT PRIMARY KEY NOT NULL, name VARCHAR(30), locationID INT FOREIGN KEY REFERENCES Location(id), OwnerID varchar(50));

INSERT INTO Tavern (id, name, locationID, OwnerID) Values ('1', 'The Golden Nugget', 1, null);
INSERT INTO Tavern (id, name, locationID, OwnerID) Values ('2', 'Black Sheep', 2, null);
INSERT INTO Tavern (id, name, locationID, OwnerID) Values ('3', 'The Inn', 3, null);
INSERT INTO Tavern (id, name, locationID, OwnerID) Values ('4', 'The Merigold B&B', 4, null);
INSERT INTO Tavern (id, name, locationID, OwnerID) Values ('5', 'Kona Lodge', 5, null);


CREATE TABLE Workers(
id int PRIMARY KEY, name VARCHAR(30), role VARCHAR(250));

INSERT INTO Workers (id, name, role) Values ('1', 'Amanda', 'Receptionist');
INSERT INTO Workers (id, name, role) Values ('2', 'John', 'Assistant Manager');
INSERT INTO Workers (id, name, role) Values ('3', 'Gaston', 'Chef');
INSERT INTO Workers (id, name, role) Values ('4', 'Pete', 'Janitor');
INSERT INTO Workers (id, name, role) Values ('5', 'Lauren', 'Owner');


CREATE TABLE Supplies(
id int PRIMARY KEY, name VARCHAR(250), units varchar(30));

INSERT INTO Supplies (id, name, units) Values ('1', 'ale', 'ounces');
INSERT INTO Supplies (id, name, units) Values ('2', 'toilet paper', 'rolls');
INSERT INTO Supplies (id, name, units) Values ('3', 'detergent', 'liters');
INSERT INTO Supplies (id, name, units) Values ('4', 'eggs', 'dozens');
INSERT INTO Supplies (id, name, units) Values ('5', 'paper', 'pounds');


CREATE TABLE Inventory(
id int PRIMARY KEY, TavernID INT FOREIGN KEY REFERENCES Tavern(id), date varchar(30), currentCount INT);

INSERT INTO Inventory (id, TavernID, date, currentCount) Values ('1', '1', 'September 30, 2018', '21');
INSERT INTO Inventory (id, TavernID, date, currentCount) Values ('2', '1', 'October 5, 2018', '35');
INSERT INTO Inventory (id, TavernID, date, currentCount) Values ('3', '3', 'October 12, 2018', '44');
INSERT INTO Inventory (id, TavernID, date, currentCount) Values ('4', '4', 'October 19, 2018', '101');
INSERT INTO Inventory (id, TavernID, date, currentCount) Values ('5', '4', 'October 26, 2018', '33');


CREATE TABLE Distro(
id int PRIMARY KEY, TavernID INT FOREIGN KEY REFERENCES Tavern(id), SupplyID INT);

INSERT INTO Distro (id, TavernID, SupplyID) Values ('1', '3', '480523');
INSERT INTO Distro (id, TavernID, SupplyID) Values ('2', '3', '480596');
INSERT INTO Distro (id, TavernID, SupplyID) Values ('3', '1', '563458');
INSERT INTO Distro (id, TavernID, SupplyID) Values ('4', '1', '563222');
INSERT INTO Distro (id, TavernID, SupplyID) Values ('5', '2', '452111');






/* Creating New tables for Guests, their job classes, and current levels*/



CREATE TABLE Status (
id INT PRIMARY KEY, Name VARCHAR(250)
);

INSERT INTO Status(id, Name) VALUES('1', 'Hangry');
INSERT INTO Status(id, Name) VALUES('2', 'Sad');
INSERT INTO Status(id, Name) VALUES('3', 'Tired');
INSERT INTO Status(id, Name) VALUES('4', 'In Love');
INSERT INTO Status(id, Name) VALUES('5', 'Gassy');

CREATE TABLE Classes (
id INT PRIMARY KEY, ClassName VARCHAR(250)
);

INSERT INTO Classes (id, ClassName) VALUES ('1', 'Monk');
INSERT INTO Classes (id, ClassName) VALUES ('2', 'White Mage');
INSERT INTO Classes (id, ClassName) VALUES ('3', 'Warrior');
INSERT INTO Classes (id, ClassName) VALUES ('4', 'Black Mage');
INSERT INTO Classes (id, ClassName) VALUES ('5', 'Thief');

CREATE TABLE Guests (
id INT PRIMARY KEY, Name VARCHAR(30), Bio VARCHAR(max), StatusID INT FOREIGN KEY REFERENCES Status(id), Birthday DATE, Cakeday DATE);

INSERT INTO Guests (id, Name, Bio, StatusID, Birthday, Cakeday) Values ('1', 'Alaina', NULL, '1', '1994-07-01', '2016-03-22');
INSERT INTO Guests (id, Name, Bio, StatusID, Birthday, Cakeday) Values ('2', 'Chris', NULL, '3', '1984-01-08', '2014-04-09');
INSERT INTO Guests (id, Name, Bio, StatusID, Birthday, Cakeday) Values ('3', 'Justin', NULL, '4', NULL, NULL);
INSERT INTO Guests (id, Name, Bio, StatusID, Birthday, Cakeday) Values ('4', 'Nick', NULL, '1', NULL, NULL);
INSERT INTO Guests (id, Name, Bio, StatusID, Birthday, Cakeday) Values ('5', 'Kevin', NULL, '2', NULL, NULL);









CREATE TABLE Levels (
LevelsID INT PRIMARY KEY, GuestID INT FOREIGN KEY REFERENCES Guests(id), ClassID INT FOREIGN KEY REFERENCES Classes(id), CurrentLvl BIGINT 
);

INSERT INTO Levels (LevelsID, GuestID, ClassID, CurrentLvl) VALUES ('1', '1', '4', '42');
INSERT INTO Levels (LevelsID, GuestID, ClassID, CurrentLvl) VALUES ('2', '1', '5', '30');
INSERT INTO Levels (LevelsID, GuestID, ClassID, CurrentLvl) VALUES ('3', '2', '3', '88');
INSERT INTO Levels (LevelsID, GuestID, ClassID, CurrentLvl) VALUES ('4', '5', '2', '69');
INSERT INTO Levels (LevelsID, GuestID, ClassID, CurrentLvl) VALUES ('5', '3', '1', '77');

/* Forgot to add these tables from the last assignment; Services, ServiceStatus */



CREATE TABLE ServiceStatus (
id INT PRIMARY KEY, Name VARCHAR(250)
);

INSERT INTO ServiceStatus (id, Name) VALUES ('1', 'Pending');
INSERT INTO ServiceStatus (id, Name) VALUES ('2', 'Out of Service');
INSERT INTO ServiceStatus (id, Name) VALUES ('3', 'Active');
INSERT INTO ServiceStatus (id, Name) VALUES ('4', 'Inactive');
INSERT INTO ServiceStatus (id, Name) VALUES ('5', 'Coming Soon');


CREATE TABLE Service (
id INT PRIMARY KEY, Name VARCHAR(250), ServStatID INT FOREIGN KEY REFERENCES ServiceStatus(id), 
TavernID INT FOREIGN KEY REFERENCES Tavern(id)
);

INSERT INTO Service (id, Name,  ServStatID, TavernID) VALUES ('1', 'Outdoor Pool', '3', '2');
INSERT INTO Service (id, Name,  ServStatID, TavernID) VALUES ('2', 'Bar', '3', '2');  
INSERT INTO Service (id, Name,  ServStatID, TavernID) VALUES ('3', 'Arcade', '4', '2'); 
INSERT INTO Service (id, Name,  ServStatID, TavernID) VALUES ('4', 'Rec Room', '1', '2'); 
INSERT INTO Service (id, Name,  ServStatID, TavernID) VALUES ('5', 'Spa', '1', '2'); 




CREATE TABLE SalesSupplies (
id INT PRIMARY KEY, serviceID INT FOREIGN KEY REFERENCES Service(id), suppliesID INT FOREIGN KEY REFERENCES Supplies(id),
InvID INT FOREIGN KEY REFERENCES Inventory(id), pricePerUnit DECIMAL(18,2), TavernID INT
);

INSERT INTO SalesSupplies (id, serviceID, suppliesID, InvID, pricePerUnit)	VALUES ('1', '2', '2', 5.99, '2');
INSERT INTO SalesSupplies (id, serviceID, suppliesID, InvID, pricePerUnit)	VALUES ('2', '2', '2', 5.99, '2');
INSERT INTO SalesSupplies (id, serviceID, suppliesID, InvID, pricePerUnit)	VALUES ('3', '1', '4', 5.99, '2');
INSERT INTO SalesSupplies (id, serviceID, suppliesID, InvID, pricePerUnit)	VALUES ('4', '1', '4', 5.99, '2');
INSERT INTO SalesSupplies (id, serviceID, suppliesID, InvID, pricePerUnit)	VALUES ('5', '1', '4', 5.99, '2');





CREATE TABLE Sales (
id INT PRIMARY KEY, GuestID INT FOREIGN KEY REFERENCES Guests(id), 
Price DECIMAL(18,2), amount INT, Date DATETIME, salesSuppliesID INT FOREIGN KEY REFERENCES SalesSupplies(id),
TavernID INT FOREIGN KEY REFERENCES Tavern(id) 
);

INSERT INTO Sales (id, GuestID, amount, Price, Date, salesSuppliesID) VALUES ('1', '3', '1', 5.99, NULL, '1'); 
INSERT INTO Sales (id, GuestID, amount, Price, Date, salesSuppliesID) VALUES ('2', '2', '4', 25.00, NULL, '5'); 
INSERT INTO Sales (id, GuestID, amount, Price, Date, salesSuppliesID) VALUES ('3', '2', '2', 57.89, NULL, '5'); 
INSERT INTO Sales (id, GuestID, amount, Price, Date, salesSuppliesID) VALUES ('4', '5', '1', 32.97, NULL, '1'); 
INSERT INTO Sales (id, GuestID, amount, Price, Date, salesSuppliesID) VALUES ('5', '5', '1', 32.97, NULL, '1'); 



/* Adding a foreign key to SalesSupplies for the TavernID */
ALTER TABLE SalesSupplies ADD FOREIGN KEY (TavernID) References Tavern(id);




/* Deleting rats from the database */
DROP TABLE IF EXISTS Rats; 


/* DROP TABLE IF EXISTS Location; <- Cannot execute because it has column that is a foreign key used in Taverns */  


/* testing results */ 
Select * from Guests;
Select * from Classes;
Select * from Status;
Select * from Levels;
Select * from Tavern;
Select * from Workers;
Select * from Location;
Select * from Supplies;
Select * from Inventory;
Select * from Distro; 
Select * from Service;
Select * from ServiceStatus;
Select * from Sales;
Select * from SalesSupplies; 