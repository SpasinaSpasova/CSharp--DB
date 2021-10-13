SELECT subq.CountryName,subq.DisributorName FROM 
(
		SELECT C.Name as CountryName,
			   D.Name as DisributorName,
			   DENSE_RANK() OVER (PARTITION BY C.Name ORDER BY COUNT(D.Name) DESC) as [rank]
		FROM [Countries] as C
		LEFT JOIN Distributors AS D ON C.Id=D.CountryId
		LEFT JOIN Ingredients AS I ON D.Id=I.DistributorId
		GROUP BY C.Name,D.Name) AS [subq]
WHERE subq.rank=1
ORDER BY subq.CountryName,subq.DisributorName
