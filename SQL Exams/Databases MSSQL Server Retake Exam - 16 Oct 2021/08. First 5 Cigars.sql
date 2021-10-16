SELECT TOP(5) CigarName	,PriceForSingleCigar,	ImageURL
FROM Cigars AS C
 JOIN Sizes AS S ON C.SizeId=S.Id
WHERE S.Length>=12 AND (C.CigarName LIKE '%ci%'
       OR C.PriceForSingleCigar>=50) AND S.RingRange>=2.55
ORDER BY C.CigarName,C.PriceForSingleCigar DESC

