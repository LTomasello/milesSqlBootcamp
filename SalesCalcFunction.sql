IF OBJECT_ID (N'SalesCalc', N'FN') IS NOT NULL
DROP FUNCTION SalesCalc;
GO
CREATE FUNCTION SalesCalc(@amount INT)
RETURNS INT
AS
BEGIN
	 
	DECLARE @answer INT;
	SELECT @answer = ISNULL(SUM(sales.amount), 0)
	FROM Sales
	JOIN SalesSupplies ON Sales.salesSuppliesID = salesSuppliesID
	JOIN Service ON SalesSupplies.serviceID = Service.id
	WHERE SalesSupplies.serviceID = @amount
	
	RETURN @answer;
END;

GO

SELECT dbo.SalesCalc(5) AS 
CurrentSupply  
FROM SalesSupplies;