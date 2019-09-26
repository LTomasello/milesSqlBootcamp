


/* problem 1 */

IF OBJECT_ID (N'UserReport', N'IF') IS NOT NULL 
DROP FUNCTION UserReport;
GO

CREATE FUNCTION UserReport(@userid INT)
RETURNS TABLE
AS 
RETURN SELECT * FROM Workers;
	
GO

SELECT * FROM UserReport(1);




/* problem 2 */

SELECT COUNT(Guests.id) as numberOfGuests, Classes.ClassName FROM Classes
RIGHT JOIN Levels ON Levels.ClassID = Classes.Id
LEFT JOIN Guests ON Levels.GuestID = Guests.id 
GROUP BY ClassName;




/* problem 3 */

SELECT Guests.Name, Classes.ClassName, CurrentLvl,
(CASE
	WHEN CurrentLvl >= 1 AND CurrentLvl <= 30 THEN 'NOVICE'
	WHEN CurrentLvl >= 31 AND CurrentLvl <= 69 THEN 'EXPERT'
	WHEN CurrentLvl >= 70 THEN 'MASTER'
	END
) AS 'Profeciency'
FROM Classes
RIGHT JOIN Levels ON Levels.ClassID = Classes.Id
LEFT JOIN Guests ON Levels.GuestID = Guests.id 
ORDER BY Guests.Name ASC;




/* problem 4 */
IF OBJECT_ID (N'LevelRanking', N'FN') IS NOT NULL 
DROP FUNCTION LevelRanking;
GO

CREATE FUNCTION LevelRanking(@level int)
RETURNS varchar(50)
AS 
BEGIN
	DECLARE @rank varchar(50);
	SELECT @rank =
	(CASE
		WHEN @level >= 1 AND @level <= 30 THEN 'NOVICE'
		WHEN @level >= 31 AND @level <= 69 THEN 'EXPERT'
		WHEN @level >= 70 THEN 'MASTER'
		END
	) 
	 FROM Levels
	RETURN @rank;
END;

GO 

SELECT dbo.LevelRanking(2) as Ranking FROM Levels;





/* problem 5  */ 

IF OBJECT_ID (N'OpenRooms', N'IF') IS NOT NULL 
	DROP FUNCTION OpenRooms;

GO

CREATE FUNCTION OpenRooms(@date date)
RETURNS TABLE
AS
RETURN (
	SELECT Rooms.#ofRooms, Tavern.name,
	
		(CASE
			WHEN @date >= '2000-01-01' AND @date <= '2016-12-31' THEN 'VACANT' 
			WHEN @date >= '2017-01-01' AND @date <= '2019-12-31' THEN 'NO VACANCY'
			ELSE ''
			END) as RequestDate
	FROM Rooms
	JOIN Tavern ON Rooms.TavernID = Tavern.id
	
);

GO

SELECT * FROM OpenRooms('2019-4-22');




/* problem 6 */

IF OBJECT_ID (N'RoomPrices', N'IF') IS NOT NULL 
	DROP FUNCTION RoomPrices;

GO

CREATE FUNCTION RoomPrices(@min float, @max float)
RETURNS TABLE
AS
RETURN (
	SELECT Tavern.name, #ofRooms, RoomStays.Rate
	FROM Rooms
	JOIN Tavern ON Rooms.TavernID = Tavern.id
	JOIN RoomStays ON RoomStays.RoomsId = Rooms.id
	WHERE RoomStays.Rate BETWEEN @min AND @max
	
);

GO

SELECT * FROM RoomPrices(1,200);

/* problem 7 */

INSERT INTO dbo.RoomStays
       SELECT TOP 1 2 RoomsId, (select Top 1 TavernID from Rooms), (SELECT MAX(RoomStays.Stayed) FROM RoomStays), Rate-0.01 AS Rate FROM dbo.RoomPrices(50,200)
	where Rate = (SELECT MIN(Rate) FROM dbo.RoomPrices(50,200));



SELECT * FROM RoomStays;


