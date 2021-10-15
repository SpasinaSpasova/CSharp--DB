SELECT CONCAT(M.FirstName,' ',M.LastName) AS Mechanic
       ,J.Status
	   ,J.IssueDate
FROM Jobs AS J
 JOIN Mechanics AS M ON J.MechanicId=M.MechanicId
 ORDER BY M.MechanicId,J.IssueDate,J.JobId
