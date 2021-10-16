SELECT C.Id,	CigarName,	PriceForSingleCigar,	TasteType,	TasteStrength
FROM Cigars AS C
LEFT JOIN Tastes AS T ON C.TastId=T.Id
WHERE TasteType IN ('Earthy','Woody')
ORDER BY  PriceForSingleCigar DESC


