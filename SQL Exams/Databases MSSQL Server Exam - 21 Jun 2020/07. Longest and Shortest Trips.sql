SELECT a.Id,
       CONCAT(a.FirstName,' ',a.LastName) AS FullName,
       MAX(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDATE)) AS LongestTrip,
       MIN(DATEDIFF(DAY,t.ArrivalDate,t.ReturnDATE)) AS ShortestTrip 
FROM Accounts AS a
            JOIN [AccountsTrips] AS [at] ON at.AccountId=a.Id
            JOIN [Trips] AS t ON at.TripId= t.Id
WHERE (a.MiddleName IS NULL) AND (t.CancelDate IS  NULL)
GROUP BY a.FirstName,
         a.LastName,
		 a.Id
ORDER BY LongestTrip DESC,
         ShortestTrip