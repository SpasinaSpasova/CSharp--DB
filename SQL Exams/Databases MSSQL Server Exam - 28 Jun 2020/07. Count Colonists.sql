SELECT COUNT(*)
FROM Colonists AS C
LEFT JOIN TravelCards AS TS ON C.Id=TS.ColonistId
LEFT JOIN Journeys AS J ON J.Id=TS.JourneyId
WHERE J.Purpose='technical'
