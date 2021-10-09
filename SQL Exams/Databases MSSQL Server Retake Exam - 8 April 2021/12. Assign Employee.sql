CREATE PROCEDURE usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT) 
AS
     
	 DECLARE @Employee INT = (SELECT e.DepartmentId
								FROM Employees AS e
								WHERE e.Id = @EmployeeId)

	DECLARE @Report INT = (SELECT c.DepartmentId
						  FROM Reports AS r
						   JOIN Categories AS c ON c.Id = r.CategoryId
						  WHERE r.Id = @ReportId )

	IF @Employee != @Report
	THROW 50005,'Employee doesn''t belong to the appropriate department!', 1;
	
UPDATE Reports 
SET EmployeeId = @EmployeeId
	WHERE Id = @ReportId

GO

EXEC usp_AssignEmployeeToReport 30, 1

EXEC usp_AssignEmployeeToReport 17, 2


SELECT *,e.DepartmentId
FROM Employees AS e
WHERE e.Id = 17

SELECT *,c.DepartmentId
 FROM Reports AS r
  JOIN Categories AS c ON c.Id = r.CategoryId
 WHERE r.Id = 2

