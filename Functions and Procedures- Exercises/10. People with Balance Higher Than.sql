SELECT SB.FirstName,SB.LastName FROM (
SELECT 
ah.FirstName,
ah.LastName
, SUM(a.Balance) AS [Total]
FROM [Accounts] AS a
CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan @chechTotal MONEY
AS
		SELECT SBQ.FirstName,
		       SBQ.LastName 
		  FROM (
					SELECT 
					        ah.FirstName,
					        ah.LastName,
					        SUM(a.Balance) AS [Total]
					  FROM [Accounts] AS a
					  JOIN [AccountHolders] AS ah ON a.AccountHolderId=ah.Id
				  GROUP BY ah.FirstName,ah.LastName) AS[SBQ]
         WHERE SBQ.Total>@chechTotal
      ORDER BY SBQ.FirstName

GO 

EXEC DBO.usp_GetHoldersWithBalanceHigherThan 250000