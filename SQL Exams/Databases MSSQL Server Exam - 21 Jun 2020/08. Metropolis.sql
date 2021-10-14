SELECT TOP(10) c.Id,
        c.Name AS City,
		c.CountryCode AS Country,
        COUNT(a.Id) as Accounts
FROM Accounts AS a
 JOIN Cities AS c ON a.CityId=c.Id
GROUP BY c.Name, 
         c.Id,
         c.Name,
		 c.CountryCode
ORDER BY COUNT(a.Id) DESC
