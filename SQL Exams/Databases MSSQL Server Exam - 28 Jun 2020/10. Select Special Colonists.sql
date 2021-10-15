SELECT * FROM(

SELECT TC.JobDuringJourney
       ,CONCAT (C.FirstName,' ',C.LastName) AS [FullName]
	   ,DENSE_RANK() OVER (PARTITION BY TC.JobDuringJourney ORDER BY C.BirthDate ASC) AS [JobRank]
FROM Colonists AS C
 JOIN TravelCards AS TC ON C.Id=TC.ColonistId
 ) AS [SB]
 WHERE SB.JobRank=2

