SELECT    d.Name AS DistributorName,
          i.Name AS IngredientName,
		  p.Name AS ProductName,
		  AVG(fb.Rate) AS AverageRate
FROM [Distributors] AS d
	 JOIN [Ingredients] AS i ON d.Id=i.DistributorId
	 JOIN ProductsIngredients AS piN ON i.Id=piN.IngredientId
	 JOIN Products AS p ON piN.ProductId=p.Id
	 JOIN Feedbacks AS fb ON p.Id=fb.ProductId
WHERE (d.Id IN (SELECT DistributorId FROM Ingredients) 
  AND (i.Id IN (SELECT IngredientId FROM Products)))
 GROUP BY d.Name,
          i.Name,
          p.Name
HAVING AVG(fb.Rate) BETWEEN 5 AND 8
ORDER BY  d.Name,
          i.Name,
		  p.Name

