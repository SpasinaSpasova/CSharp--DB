SELECT   pl.[Name],pl.[Seats],COUNT (t.[PassengerId]) AS [Passengers Count]
FROM [Planes] AS pl
   LEFT JOIN [Flights] AS f ON pl.Id=f.PlaneId
    LEFT JOIN [Tickets] AS t ON t.FlightId=f.Id
 LEFT JOIN [Passengers] AS p ON p.[Id] =t.[PassengerId]
GROUP BY pl.[Name],pl.[Seats]
ORDER BY [Passengers Count] DESC,
       pl.[Name],
       pl.[Seats]


