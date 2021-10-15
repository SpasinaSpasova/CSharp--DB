SELECT C.Id,
       CONCAT(C.FirstName,' ',C.LastName) AS [full_name]
FROM Colonists AS C
LEFT JOIN TravelCards AS TS ON C.Id=TS.ColonistId
WHERE TS.JobDuringJourney= 'Pilot'
ORDER BY C.Id