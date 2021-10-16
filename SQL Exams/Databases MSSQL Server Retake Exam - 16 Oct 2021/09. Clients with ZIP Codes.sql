SELECT sb.fullName,sb.Country,sb.ZIP,'$'+CAST(sb.PriceForSingleCigar AS VARCHAR(10)) FROM
(
SELECT C.FirstName+' '+C.LastName as fullName,A.Country,A.ZIP,CI.PriceForSingleCigar,
DENSE_RANK() OVER (PARTITION BY C.FirstName ORDER BY CI.PriceForSingleCigar DESC) AS [Rank]
FROM Clients AS C
LEFT JOIN Addresses AS A ON C.AddressId=A.Id
LEFT JOIN ClientsCigars AS CC ON C.Id=CC.ClientId
LEFT JOIN Cigars AS CI ON CC.CigarId=CI.Id
WHERE ZIP NOT LIKE '%[A-Z]%') AS SB
WHERE SB.Rank=1
