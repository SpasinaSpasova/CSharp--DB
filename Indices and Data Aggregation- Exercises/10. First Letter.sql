SELECT fgb.FirstLetter FROM 
	(SELECT LEFT(FirstName, 1) AS [FirstLetter] FROM [WizzardDeposits]
	WHERE DepositGroup ='Troll Chest'
	GROUP BY FirstName) AS [fgb]
GROUP BY fgb.FirstLetter
ORDER BY [FirstLetter]

