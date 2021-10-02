SELECT SUM([Difference]) AS [SumDifference]
FROM
	(SELECT * , 
		[Host Wizard Deposit]-[Guest Wizard Deposit] AS [Difference]
	FROM
		(SELECT FirstName AS [Host Wizard]
			  ,DepositAmount AS [Host Wizard Deposit]
			  ,LEAD(FirstName) OVER(ORDER BY ID) AS [Guest Wizard]
			  ,LEAD(DepositAmount) OVER(ORDER BY ID) AS [Guest Wizard Deposit]
		FROM [WizzardDeposits]) AS [sb]
		) AS [Diff]

