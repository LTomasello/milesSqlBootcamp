/* problem 1 */

DROP TABLE IF EXISTS RoomStays;
DROP TABLE IF EXISTS Rooms;


CREATE TABLE Rooms (
id INT IDENTITY (1,1) PRIMARY KEY, TavernID INT FOREIGN KEY REFERENCES Tavern(id), #ofRooms BIGINT, Status VARCHAR(250)
);

INSERT INTO Rooms(TavernID, #ofRooms, Status) VALUES (1, 200, 'Vacant');
INSERT INTO Rooms(TavernID, #ofRooms, Status) VALUES (2, 400, 'Vacant');
INSERT INTO Rooms(TavernID, #ofRooms, Status) VALUES (3, 600, 'Vacant');
INSERT INTO Rooms(TavernID, #ofRooms, Status) VALUES (4, 800, 'Vacant');
INSERT INTO Rooms(TavernID, #ofRooms, Status) VALUES (5, 100, 'No Vacancy');

CREATE TABLE RoomStays (
id INT IDENTITY (1,1) PRIMARY KEY, RoomsId INT FOREIGN KEY REFERENCES Rooms(id), GuestId INT FOREIGN KEY REFERENCES Guests(id), Stayed DATE, Rate DECIMAL(18,2)
);

INSERT INTO RoomStays (RoomsId, GuestId, Stayed, Rate) VALUES ('1', '1', '9-9-2019', 399.99);
INSERT INTO RoomStays (RoomsId, GuestId, Stayed, Rate) VALUES ('1', '2', '9-9-2019', 399.99);
INSERT INTO RoomStays (RoomsId, GuestId, Stayed, Rate) VALUES ('4', '5', '1-4-2019', 89.99);
INSERT INTO RoomStays (RoomsId, GuestId, Stayed, Rate) VALUES ('3', '2', '3-24-2017', 399.99);
INSERT INTO RoomStays (RoomsId, GuestId, Stayed, Rate) VALUES ('2', '2', '9-9-2018', 199.99);





/* What i was able to come with for the exercise */

SELECT CONCAT(COLUMN_NAME, ' ', DATA_TYPE,' ', CHARACTER_MAXIMUM_LENGTH ) AS 'CREATE Taverns'

/* versus the actual answer -_- */

SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = 'Tavern'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
Then CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), 
')') Else '' END), ',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols WHERE
TABLE_NAME = 'Tavern'
UNION ALL
SELECT ')';


/* testing new tables */
	
FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Tavern';

SELECT * FROM Guests;

SELECT * FROM RoomStays JOIN Rooms ON RoomStays.RoomsId = Rooms.id
JOIN Guests ON RoomStays.GuestId = Guests.id;


/* problem 2 */ 

SELECT * FROM Guests;
SELECT DISTINCT * FROM Guests WHERE Guests.Birthday < '2000-01-01';

/* problem 3 */ 

SELECT * FROM RoomStays WHERE RoomStays.Rate > 100;

/* problem 4 */

SELECT DISTINCT Name FROM Guests;   	

/* problem 5 */

SELECT * FROM Guests ORDER BY Name ASC;

/* problem 6 */ 

SELECT * FROM Sales 
SELECT * FROM Service;
SELECT * FROM SalesSupplies JOIN Service ON SalesSupplies.serviceID = Service.id;

INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('6', '3', 45.00, '5', '5', '3'); 
INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('7', '3', 15.00, '3', '3', '3'); 
INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('8', '3', 3.99, '3', '2', '3'); 
INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('9', '3', 1.99, '3', '1', '3'); 
INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('10', '3', 10.00, '3', '2', '3'); 
INSERT INTO Sales (id, GuestID, Price, amount, salesSuppliesID, TavernID) VALUES ('11', '3', 2.99, '2', '3', '3'); 

SELECT TOP 10 Price FROM Sales ORDER BY Price DESC; 

/* problem 7 (I didn't really know what you meant so i made a table with distinct names to lookup tables by) */

SELECT DISTINCT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
UNION
SELECT DISTINCT NAME FROM Guests
UNION
SELECT DISTINCT NAME FROM Tavern
UNION
SELECT DISTINCT name FROM Status
UNION 
SELECT DISTINCT ClassName FROM Classes 
;

/* problem 8 (I think there's something wrong with my table because it won't let me join these two even though i used foriegn keys) skipping for now */

SELECT * FROM Levels JOIN ClassID ON Levels.ClassID = Classes.id;

/* problem 9  I have no idea what to do with this one. i'll ask for help in class */


