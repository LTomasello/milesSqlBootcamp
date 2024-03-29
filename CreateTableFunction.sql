IF OBJECT_ID(N'CreateTableTaverns', N'IF') IS NOT NULL
	DROP FUNCTION CreateTableTaverns;
GO

CREATE FUNCTION CreateTableTaverns (@TABLE_NAME varchar(50))
RETURNS TABLE
AS 
RETURN 
(
	SELECT 
		CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = @TABLE_NAME
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
 
	WHERE cols.TABLE_NAME = @TABLE_NAME
	UNION ALL
	SELECT ')'
);
	 




