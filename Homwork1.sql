/* tavern table */
DROP TABLE IF EXISTS Tavern;

CREATE TABLE Tavern(
id int IDENTITY(1,1), TavernID INT PRIMARY KEY NOT NULL, name VARCHAR(30), locationID int, OwnerID INT);

INSERT INTO Tavern (TavernID, name, locationID, OwnerID) Values ('1', 'The Golden Nugget', 1, null);
INSERT INTO Tavern (TavernID, name, locationID, OwnerID) Values ('2', 'Black Sheep', 2, null);
INSERT INTO Tavern (TavernID, name, locationID, OwnerID) Values ('3', 'The Inn', 3, null);
INSERT INTO Tavern (TavernID, name, locationID, OwnerID) Values ('4', 'The Merigold B&B', 4, null);
INSERT INTO Tavern (TavernID, name, locationID, OwnerID) Values ('5', 'Kona Lodge', 5, null);

/* workers table */
DROP TABLE IF EXISTS Workers;

CREATE TABLE Workers(
id int IDENTITY(1,1), name VARCHAR(30), role VARCHAR(250));

INSERT INTO Workers (name, role) Values ('Amanda', 'Receptionist');
INSERT INTO Workers (name, role) Values ('John', 'Assistant Manager');
INSERT INTO Workers (name, role) Values ('Gaston', 'Chef');
INSERT INTO Workers (name, role) Values ('Pete', 'Janitor');
INSERT INTO Workers (name, role) Values ('Lauren', 'Owner');

/* Rats table */
DROP TABLE IF EXISTS Rats;

CREATE TABLE Rats(
id int IDENTITY(1,1), name VARCHAR(30));

INSERT INTO Rats (name) Values ('Jaq');
INSERT INTO Rats (name) Values ('Gus');
INSERT INTO Rats (name) Values ('Remmy');
INSERT INTO Rats (name) Values ('Oneil');
INSERT INTO Rats (name) Values ('Mickey');

/* location table */
DROP TABLE IF EXISTS Location;

CREATE TABLE Location(
id int IDENTITY(1,1), name VARCHAR(250));

INSERT INTO Location (name) Values ('Hammonton');
INSERT INTO Location (name) Values ('Winslow');
INSERT INTO Location (name) Values ('Blackwood');
INSERT INTO Location (name) Values ('Egg Harbor');
INSERT INTO Location (name) Values ('Montclair');

/* Supplies table */
DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies(
id int IDENTITY(1,1), name VARCHAR(250), units varchar(30));

INSERT INTO Supplies (name, units) Values ('ale', 'ounces');
INSERT INTO Supplies (name, units) Values ('toilet paper', 'rolls');
INSERT INTO Supplies (name, units) Values ('detergent', 'liters');
INSERT INTO Supplies (name, units) Values ('eggs', 'dozens');
INSERT INTO Supplies (name, units) Values ('paper', 'pounds');

/* Inventory table */
DROP TABLE IF EXISTS Inventory;

CREATE TABLE Inventory(
id int IDENTITY(1,1), TavernID INT PRIMARY KEY, date varchar(30), currentCount INT);

INSERT INTO Inventory (TavernID, date, currentCount) Values ('1', 'September 30, 2018', '21');
INSERT INTO Inventory (TavernID, date, currentCount) Values ('2', 'October 5, 2018', '35');
INSERT INTO Inventory (TavernID, date, currentCount) Values ('3', 'October 12, 2018', '44');
INSERT INTO Inventory (TavernID, date, currentCount) Values ('4', 'October 19, 2018', '101');
INSERT INTO Inventory (TavernID, date, currentCount) Values ('5', 'October 26, 2018', '33');

/* Distro table */
DROP TABLE IF EXISTS Distro;

CREATE TABLE Distro(
id int IDENTITY(1,1), TavernID INT PRIMARY KEY, SupplyID INT);

INSERT INTO Distro (TavernID, SupplyID) Values ('1', '480523');
INSERT INTO Distro (TavernID, SupplyID) Values ('2', '480596');
INSERT INTO Distro (TavernID, SupplyID) Values ('3', '563458');
INSERT INTO Distro (TavernID, SupplyID) Values ('4', '563222');
INSERT INTO Distro (TavernID, SupplyID) Values ('5', '452111');

/* testing results */

Select * from Tavern;
Select * from Workers;
Select * from Rats;
Select * from Location;
Select * from Supplies;
Select * from Inventory;
Select * from Distro; 