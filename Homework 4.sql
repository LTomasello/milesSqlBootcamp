/* PRIOR TO THIS I MADE A QUERY DROPPIING PREVIOUS TABLES IN ORDER TO FIX ONE OF MY COLUMNS IN Taverns TO BE A FOREIGN KEY. THAT WAY I COULD DO PROBLEM 1 */


/* problem 1 */

SELECT role, Workers.name FROM Workers INNER JOIN Tavern ON OwnerID = Workers.id WHERE Tavern.OwnerID = Workers.id;

/* problem 2 */

SELECT * FROM Workers LEFT JOIN Tavern ON OwnerID = Workers.id WHERE Tavern.OwnerID = Workers.id

/* problem 3 */

SELECT * FROM Guests 
RIGHT JOIN Levels ON GuestID = Guests.id
LEFT JOIN Classes ON Levels.ClassID = Classes.id 
ORDER BY Guests.Name ASC; 

/* problem 4 */ 

SELECT TOP 10 * FROM Sales 
INNER JOIN SalesSupplies ON Sales.salesSuppliesID = SalesSupplies.id 
LEFT JOIN Service ON SalesSupplies.serviceID = Service.id 
ORDER BY Sales.Price DESC; 

/* problem 5 */ 



SELECT COUNT(Classes.ClassName) as numberOfClasses, 
Guests.Name
FROM Levels
JOIN Guests ON Levels.GuestID = Guests.id
JOIN Classes ON Levels.ClassID = Classes.id
GROUP BY Guests.Name
HAVING COUNT(Classes.ClassName) > 1; 

/* problem 6 */

SELECT COUNT(Classes.ClassName) as numberOfClasses, 
Guests.Name
FROM Levels
JOIN Guests ON Levels.GuestID = Guests.id
JOIN Classes ON Levels.ClassID = Classes.id
WHERE CurrentLvl > 5
GROUP BY Guests.Name
HAVING COUNT(Classes.ClassName) > 1;

/* problem 7 */

SELECT MAX(CurrentLvl), Guests.Name FROM Levels
LEFT JOIN Guests ON Levels.GuestID = Guests.id
LEFT JOIN Classes ON Levels.ClassID = Classes.id
GROUP BY Guests.Name; 

/* problem 8 */

SELECT * FROM RoomStays 
JOIN Guests ON RoomStays.GuestId = Guests.id
WHERE RoomStays.Stayed BETWEEN '2018-01-01' AND '2019-09-22';

/* problem 9 (I don't know if i did this one right or if i just found a work around. Couldn't find anything in the INFORMATION_SCHEMA that lists a coulum's IDENTITY or NULL)*/

SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = 'Tavern'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
	Then CONCAT
		('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
	Else ''
	END)
, 
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	Then 
		(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	Else '' 
	END
, 
	CASE WHEN keys.COLUMN_NAME = 'id'
	THEN
		' PRIMARY KEY IDENTITY(1,1)'
	ELSE '' 
	END
,
',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN 
(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
 
  WHERE cols.TABLE_NAME = 'Tavern'
UNION ALL
SELECT ')'; 

