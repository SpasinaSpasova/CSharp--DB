SELECT c.FirstName,
       c.Age,
	   c.PhoneNumber
FROM Customers AS c
LEFT JOIN Countries AS cntr ON c.CountryId=cntr.Id
WHERE (Age>=21 AND FirstName LIKE '%an%') OR
      (PhoneNumber LIKE '%38' AND cntr.Name<>'Greece')
ORDER BY c.FirstName,
         c.Age DESC