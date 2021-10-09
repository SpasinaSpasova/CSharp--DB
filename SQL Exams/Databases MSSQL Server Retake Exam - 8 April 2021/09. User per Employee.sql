SELECT CONCAT(e.[FirstName],' ', e.[LastName]) AS [Full Name]
      ,COUNT(r.UserId) AS [UsersCount]
		 FROM [Reports] AS r
    LEFT JOIN [Users] AS u 
		   ON r.UserId= u.Id
	RIGHT JOIN [Employees] AS e 
		   ON r.EmployeeId=e.Id
GROUP BY e.[FirstName],e.[LastName]
ORDER BY [UsersCount] DESC,[Full Name]

