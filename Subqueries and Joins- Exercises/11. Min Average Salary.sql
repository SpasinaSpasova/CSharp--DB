SELECT MIN(SubQuery.MinAvgSalary) AS [MinAvgSalary] FROM 
(
	SELECT AVG(e.[Salary]) AS [MinAvgSalary]
	FROM [Employees] AS e
	GROUP BY e.[DepartmentID] 
) AS SubQuery