SELECT TOP(5) 
		     r.[Id],
			 r.[Name],
			 COUNT(r.Name) AS [Commits]
		FROM [Commits] AS c
		JOIN  [Repositories] AS r 
		  ON c.RepositoryId=r.Id
		JOIN [RepositoriesContributors] AS rc 
		  ON rc.RepositoryId=r.Id
GROUP BY r.[Name],r.[Id]
ORDER BY [Commits] DESC, r.[Id],r.[Name]

