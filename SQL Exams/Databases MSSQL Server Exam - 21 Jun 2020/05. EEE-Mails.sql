SELECT FirstName,
       LastName,
       FORMAT(BirthDate,'MM-dd-yyyy') AS BirthDate,
       c.Name AS Hometown,	
       Email
FROM [Accounts] AS a
LEFT JOIN Cities AS c ON a.CityId =c.Id
WHERE Email LIKE 'E%'
ORDER BY c.Name