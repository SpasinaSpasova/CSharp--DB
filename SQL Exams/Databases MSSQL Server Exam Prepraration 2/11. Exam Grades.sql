CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(18,2))
RETURNS VARCHAR (150)
AS
BEGIN
            DECLARE @COUNT INT
			
			IF((SELECT Id FROM Students WHERE Id= @studentId)IS NULL)
				RETURN 'The student with provided id does not exist in the school!'
			IF((@grade+0.50)>6.00)
				RETURN 'Grade cannot be above 6.00!'
			
			SET @COUNT=(SELECT COUNT(*) FROM StudentsExams AS se
						LEFT JOIN [Students] AS s ON se.StudentId=s.Id
						WHERE se.StudentId= @studentId AND 
						(se.Grade BETWEEN @grade AND (@grade + 0.50)))
			RETURN 'You have to update '+ CAST(@COUNT AS VARCHAR(20))+ ' grades for the student '+ 
					(SELECT FirstName FROM Students WHERE Id=@studentId)
END


SELECT dbo.udf_ExamGradesToUpdate(12, 6.20)

SELECT dbo.udf_ExamGradesToUpdate(12, 5.50)

SELECT dbo.udf_ExamGradesToUpdate(121, 5.50)