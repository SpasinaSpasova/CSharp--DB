CREATE PROCEDURE usp_GetTownsStartingWith @srtCheck VARCHAR(50)
AS 
	SELECT [Name]
	 FROM [Towns]
    WHERE [Name] LIKE @srtCheck+'%'
GO

EXEC dbo.usp_GetTownsStartingWith 'B'