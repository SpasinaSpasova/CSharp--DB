--Problem 19.	Basic Select All Fields
SELECT * FROM [Towns] 
SELECT * FROM [Departments]
SELECT * FROM [Employees]

--Problem 20.	Basic Select All Fields and Order Them
SELECT * FROM [Towns] ORDER BY [Name]
SELECT * FROM [Departments] ORDER BY [Name]
SELECT * FROM [Employees] ORDER BY [Salary] DESC

--Problem 21.	Basic Select Some Fields
SELECT [Name] FROM [Towns] ORDER BY [Name]
SELECT [Name] FROM [Departments] ORDER BY [Name]
SELECT [FirstName], [LastName], [JobTitle], [Salary] 
FROM [Employees] ORDER BY [Salary] DESC

--Problem 22.	Increase Employees Salary
UPDATE [Employees] SET [Salary]=[Salary]*(100+10)/100
 SELECT  [Salary] FROM [Employees] 


 --Problem 23.	Decrease Tax Rate
 USE [Hotel]
 UPDATE [Payments] SET [TaxRate]=[TaxRate]-(3/100)
 SELECT  [TaxRate] FROM [Payments]

 --Problem 24.	Delete All Records
 TRUNCATE TABLE [Occupancies]