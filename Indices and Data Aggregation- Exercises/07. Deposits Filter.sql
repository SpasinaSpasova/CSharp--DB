SELECT * FROM (
	SELECT DepositGroup, SUM(DepositAmount) AS [TotalSum]
	FROM [WizzardDeposits]
	WHERE MagicWandCreator='Ollivander family'
	GROUP BY [DepositGroup]
) AS [Sb]
WHERE Sb.[TotalSum]<150000
	ORDER BY Sb.[TotalSum] DESC