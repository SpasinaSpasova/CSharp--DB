CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber @givenNumber DECIMAL(18,4)
AS 
	SELECT [FirstName]
	      ,[LastName]
	FROM [Employees]
   WHERE [Salary] >=@givenNumber
GO

EXEC dbo.usp_GetEmployeesSalaryAboveNumber 48100