SELECT DepartmentID, sb.[Max] AS [ThirdHighestSalary]
FROM 
(
	SELECT DepartmentID,
	       MAX(Salary) AS [Max],
		   Salary ,
		  DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
	FROM Employees
	GROUP BY DepartmentID,Salary) AS [sb]
WHERE sb.[Rank]= 3
ORDER BY DepartmentID