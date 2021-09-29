SELECT TOP (1) 
ROW_NUMBER() OVER (ORDER BY mc.[MountainId] DESC)  AS [Count]
FROM [Countries] AS c
LEFT JOIN [MountainsCountries] AS mc ON c.CountryCode=mc.CountryCode
WHERE mc.[MountainId] IS NULL
ORDER BY [Count] DESC 
