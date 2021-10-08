CREATE FUNCTION ufn_GetSalaryLevel (@salary DECIMAL(18,4)) 
RETURNS NVARCHAR(10)
AS
BEGIN
		DECLARE @SalaryLevel NVARCHAR(10)

		IF (@salary<30000)
		SET @SalaryLevel= 'Low'

		ELSE IF (@salary BETWEEN 30000 AND 50000)
		SET @SalaryLevel='Average'

		ELSE IF (@salary>50000)
		SET @SalaryLevel='High'

		RETURN @SalaryLevel
END
 
SELECT e.Salary, dbo.ufn_GetSalaryLevel(e.Salary) AS [SalaryLevel]
FROM Employees AS e