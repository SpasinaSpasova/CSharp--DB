SELECT sub.[DepositGroup] FROM 
	(SELECT TOP(2) [DepositGroup], AVG([MagicWandSize]) AS [LongestMagicWand]
	FROM [WizzardDeposits]
	GROUP BY [DepositGroup] 
	ORDER BY [LongestMagicWand] ) AS [sub]