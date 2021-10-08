CREATE PROCEDURE usp_EmployeesBySalaryLevel @level NVARCHAR(10)
AS
	SELECT SubQ.[FirstName] AS [First Name],
           SubQ.[LastName] AS [Last Name]
FROM(
		SELECT e.[FirstName],
			   e.[LastName],
			   dbo.ufn_GetSalaryLevel(e.Salary) AS [Level]
		  FROM [Employees] AS e
    ) AS [SubQ]
WHERE SubQ.[Level]= @level
GO

EXEC dbo.usp_EmployeesBySalaryLevel 'High'