CREATE PROCEDURE usp_GetEmployeesFromTown @town VARCHAR(50)
AS 
	SELECT e.FirstName,
		   e.LastName
      FROM [Employees] AS e
      JOIN [Addresses] AS a ON e.AddressID=a.AddressID
      JOIN [Towns] AS t ON a.TownID=t.TownID
     WHERE t.[Name]= @town
GO

EXEC dbo.usp_GetEmployeesFromTown 'Sofia'