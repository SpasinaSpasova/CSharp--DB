SELECT fb.ProductId,
       fb.Rate,
	   fb.Description,
	   fb.CustomerId,
	   c.Age,
	   c.Gender
FROM Feedbacks AS fb
LEFT JOIN [Customers] AS c 
ON fb.CustomerId=c.Id
WHERE fb.Rate<5.00
ORDER BY fb.ProductId DESC, 
         fb.Rate