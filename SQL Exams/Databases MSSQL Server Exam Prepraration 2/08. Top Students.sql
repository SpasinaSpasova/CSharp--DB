SELECT TOP(10) s.FirstName,
       s.LastName,
       CAST(AVG(se.Grade)AS DECIMAL(3,2)) AS [Grade]
FROM [Students] AS s
LEFT JOIN [StudentsExams] AS se ON s.Id=se.StudentId
GROUP BY s.FirstName,s.LastName
ORDER BY [Grade] DESC,
         s.FirstName,
         s.LastName