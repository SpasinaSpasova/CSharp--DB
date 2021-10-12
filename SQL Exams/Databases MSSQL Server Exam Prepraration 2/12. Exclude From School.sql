SELECT * FROM Students

CREATE PROCEDURE usp_ExcludeFromSchool(@StudentId INT)
AS
    IF((SELECT Id FROM Students WHERE Id=@StudentId) IS NULL)
	THROW 50001,'This school has no student with the provided id!',1

	DELETE [StudentsTeachers]
	WHERE StudentId=@StudentId

	DELETE StudentsExams
	WHERE StudentId=@StudentId

	DELETE StudentsSubjects
	WHERE StudentId=@StudentId
	
	DELETE Students
	WHERE Id=@StudentId


EXEC usp_ExcludeFromSchool 301


EXEC usp_ExcludeFromSchool 1
SELECT COUNT(*) FROM Students
