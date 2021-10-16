SELECT C.Id, C.FirstName+' '+C.LastName AS CLnAME,C.Email
FROM Clients AS C
LEFT JOIN ClientsCigars AS CC ON C.Id=CC.ClientId
LEFT JOIN Cigars AS CI ON CC.CigarId=CI.Id
WHERE C.Id NOT IN (SELECT ClientId FROM ClientsCigars)
ORDER BY CLnAME