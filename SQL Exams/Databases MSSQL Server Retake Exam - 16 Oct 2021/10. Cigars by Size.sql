
SELECT C.LastName,AVG(S.Length),CEILING(AVG(S.RingRange))
FROM ClientsCigars AS CC
 RIGHT JOIN Clients AS C ON CC.ClientId=C.Id
 RIGHT JOIN Cigars AS CI ON CC.CigarId=CI.Id
 RIGHT JOIN Sizes AS S ON CI.SizeId=S.Id
 WHERE C.Id IN (SELECT ClientId FROM ClientsCigars)
GROUP BY C.LastName
ORDER BY AVG(S.Length) DESC