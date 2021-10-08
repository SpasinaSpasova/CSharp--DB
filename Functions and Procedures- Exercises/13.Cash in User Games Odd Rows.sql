CREATE FUNCTION ufn_CashInUsersGames(@name NVARCHAR(50))
RETURNS TABLE AS
RETURN (
			  SELECT SUM(sb.Cash) AS [SumCashe]
		FROM (
				 SELECT g.[Name]
					  ,ROW_NUMBER() OVER (PARTITION BY g.[Name] ORDER BY ug.Cash DESC) AS [ROW]
					  ,ug.Cash
				  FROM UsersGames as ug
				  JOIN [Games] AS g ON ug.GameId=g.Id) AS [sb]
		WHERE sb.ROW%2<>0 and sb.[Name]=@name
		GROUP BY sb.[Name]
	)

SELECT * from ufn_CashInUsersGames('Love in a mist')