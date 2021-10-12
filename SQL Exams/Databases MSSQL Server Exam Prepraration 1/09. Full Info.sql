SELECT CONCAT(p.FirstName,' ',p.LastName) AS [Full Name],
       pl.[Name] AS [Plane Name],
	   CONCAT(f.Origin,' - ',f.Destination) AS [Trip],
	   lp.[Type] AS [Luggage Type]
FROM [Passengers] AS p
		 JOIN [Tickets] AS t ON p.Id=t.PassengerId
		 JOIN [Luggages] AS l ON t.LuggageId=l.Id
		 JOIN [LuggageTypes] AS lp ON l.LuggageTypeId=lp.Id
		 JOIN [Flights] AS f ON t.FlightId=f.Id
		 JOIN [Planes] AS pl ON pl.Id=f.PlaneId
ORDER BY [Full Name],
         [Plane Name],
		 f.Origin,
		 f.Destination,
		 [Luggage Type]