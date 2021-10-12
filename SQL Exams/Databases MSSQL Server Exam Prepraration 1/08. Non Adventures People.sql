SELECT p.FirstName,
       p.LastName,
	   p.Age
FROM [Passengers] AS p
LEFT JOIN [Tickets] AS t ON p.Id=t.PassengerId
WHERE p.Id NOT IN (SELECT [PassengerId] FROM [Tickets] )
ORDER BY p.Age DESC,
		 p.FirstName,
         p.LastName
         