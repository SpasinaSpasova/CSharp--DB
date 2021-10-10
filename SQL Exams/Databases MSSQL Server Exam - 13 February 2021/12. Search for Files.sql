CREATE PROCEDURE usp_SearchForFiles(@fileExtension VARCHAR (20))
AS
BEGIN
     DECLARE @LEN INT =LEN(@fileExtension);
	 SELECT   [Id],
			  [Name],
			  CAST([Size] AS VARCHAR(20)) + 'KB' AS [Size]
			  FROM [Files]
			  WHERE RIGHT([Name],@LEN)= @fileExtension
	ORDER BY [Id],
			 [Name],
			 [Size] DESC
END

EXEC usp_SearchForFiles 'txt'