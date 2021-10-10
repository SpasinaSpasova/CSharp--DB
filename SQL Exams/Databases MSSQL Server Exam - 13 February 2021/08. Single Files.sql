SELECT [Id],
	   [Name],
	   CAST([Size] AS VARCHAR(20)) +'KB' AS [Size]
  FROM Files
 WHERE Id NOT IN (
					SELECT ParentId FROM [Files] WHERE ParentId IS NOT NULL
				 )
ORDER BY [Id],
         [Name],
         [Size] DESC

 

