SELECT CONCAT(C.FirstName,' ',C.LastName) AS [Full Name],
        DATEDIFF(DAY,J.IssueDate,'2017-04-24') AS [Time]
       ,j.Status
FROM Clients AS C
LEFT JOIN Jobs AS J ON C.ClientId=J.ClientId
WHERE J.Status<>'Finished'
ORDER BY [Time] DESC,C.ClientId