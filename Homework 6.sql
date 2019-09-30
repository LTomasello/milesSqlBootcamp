/* problem 1 */

CREATE PROCEDURE GuestToClass
@ClassName varchar(50)
AS
	SELECT Classes.ClassName, Guests.Name, Levels.CurrentLvl FROM Levels
	JOIN Classes ON Levels.ClassID = Classes.id
	JOIN Guests ON Levels.GuestID = Guests.id
	WHERE ClassName = @ClassName;
Go
EXEC GuestToClass @ClassName = 'Black Mage';

select * from RoomStays;
/* problem 2 */

GO
CREATE PROCEDURE GuestsTotalSpent
@Guestid smallint
AS
	SELECT SUM(RoomStays.rate + Sales.Price), Guests.name FROM Guests
	RIGHT JOIN Sales ON Sales.GuestID = Guests.id
	RIGHT JOIN RoomStays ON RoomStays.GuestId = Guests.id
	WHERE Guests.id	= @Guestid
	GROUP BY Guests.name;
GO

EXEC GuestsTotalSpent @Guestid = '5'; 

/* problem 3 (can't figure this one out, will follow up in class)*/

GO

DROP PROCEDURE HighOrLowLvl; 

GO

CREATE PROCEDURE HighOrLowLvl
@LowLvl int = '0',
@HighLvl int = '99'
AS
	
	SELECT Guests.Name, Levels.CurrentLvl, Classes.ClassName
	 FROM Levels
	JOIN Guests ON Levels.GuestID = Guests.id
	JOIN Classes ON Levels.ClassID = Classes.id
	WHERE CurrentLvl <= @LowLvl OR CurrentLvl >= @HighLvl;
GO

EXEC HighOrLowLvl 
@HighLvl='50';

/* problem 4 */



DROP PROCEDURE DeleteTavern;
GO
CREATE PROCEDURE DeleteTavern
@TavernID int
AS
	DELETE FROM Tavern WHERE id = @TavernID;

GO

/* EXEC DeleteTavern @TavernID = 6; */

/* problem 5 */

CREATE TRIGGER TavernPull
ON dbo.Tavern
FOR DELETE
AS
BEGIN
	DELETE FROM Tavern WHERE EXISTS (SELECT deleted.id from deleted)
	DELETE FROM SalesSupplies Where EXISTS (SELECT id from deleted where deleted.id = SalesSupplies.TavernID)
	DELETE FROM Rooms Where EXISTS (SELECT id from deleted where deleted.id = Rooms.TavernID)
	DELETE FROM Service Where EXISTS (SELECT id from deleted where deleted.id = Service.TavernID)
END

/* problem 6 (didn't know how to do this one and couldn't finish in time) */

GO

CREATE PROCEDURE BookARoom
@GuestID int
AS
BEGIN
	SELECT * FROM OpenRooms('2019-4-22'), 

/* problem 7 (same with this one) */