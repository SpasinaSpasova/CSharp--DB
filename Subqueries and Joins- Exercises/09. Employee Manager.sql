SELECT m.[EmployeeID],
	m.[FirstName],
	m.[ManagerID],
	e.[FirstName] AS [ManagerName]
FROM [Employees] AS e
JOIN [Employees] AS m ON e.[EmployeeID]=m.[ManagerID]
WHERE m.[ManagerID] IN (3,7)
ORDER BY m.[EmployeeID]