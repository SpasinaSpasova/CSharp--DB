CREATE PROCEDURE usp_SearchByTaste(@taste VARCHAR(20))
AS
BEGIN 
			SELECT CigarName,
			'$'+ CAST(C.PriceForSingleCigar AS VARCHAR(20)) AS Price,	
			TasteType,	
			BrandName,	
			CAST(S.Length AS VARCHAR(20))+' cm' AS CigarLength,	
			CAST(S.RingRange AS VARCHAR(20))+' cm' AS CigarRingRange
			FROM Tastes AS T 
			LEFT JOIN Cigars AS C ON T.Id=C.TastId
			LEFT JOIN Brands AS B ON C.BrandId=B.Id
			LEFT JOIN Sizes AS S ON C.SizeId=S.Id
			WHERE T.TasteType=@taste
			ORDER BY S.Length,	S.RingRange DESC
END



SELECT CigarName,
'$'+ CAST(C.PriceForSingleCigar AS VARCHAR(20)) AS Price,	
TasteType,	
BrandName,	
CAST(S.Length AS VARCHAR(20))+' cm' AS CigarLength,	
CAST(S.RingRange AS VARCHAR(20))+' cm' AS CigarRingRange
FROM Tastes AS T 
LEFT JOIN Cigars AS C ON T.Id=C.TastId
LEFT JOIN Brands AS B ON C.BrandId=B.Id
LEFT JOIN Sizes AS S ON C.SizeId=S.Id
WHERE T.TasteType='Woody'
ORDER BY S.Length,	S.RingRange DESC