SELECT [ContinentCode], 
	   [CurrencyCode], 
	   [CurrencyCount] AS [CurrencyUsage]
FROM 
(
	SELECT *,
			DENSE_RANK() OVER (PARTITION BY [ContinentCode] ORDER BY [CurrencyCount] DESC) 
			AS [CurrencyUsage]
	FROM
	(
			SELECT [ContinentCode], [CurrencyCode], COUNT([CurrencyCode]) AS [CurrencyCount]
			FROM [Countries]
			GROUP BY [ContinentCode], [CurrencyCode]
	) AS [FirstSubQ]
	WHERE [CurrencyCount]>1
) AS [SecondSubQ]
	WHERE [CurrencyUsage]=1
	ORDER BY [ContinentCode]