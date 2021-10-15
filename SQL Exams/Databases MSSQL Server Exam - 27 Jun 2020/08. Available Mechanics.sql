SELECT CONCAT(SB.FirstName,' ',SB.LastName) AS Mechanic FROM
(
SELECT DISTINCT M.FirstName,M.LastName,M.MechanicId
FROM Mechanics AS M
LEFT JOIN Jobs AS J ON M.MechanicId=J.MechanicId
WHERE (J.JobId IS NULL) OR (J.Status='Finished')
) AS SB
ORDER BY SB.MechanicId

