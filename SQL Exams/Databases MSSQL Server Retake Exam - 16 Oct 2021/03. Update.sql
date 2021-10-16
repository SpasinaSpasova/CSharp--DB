SELECT * FROM Cigars

SELECT * FROM Tastes
WHERE TasteType='Spicy'--id 1

SELECT * FROM Brands

UPDATE Cigars
SET PriceForSingleCigar=PriceForSingleCigar*1.2
WHERE TastId=1

UPDATE Brands
SET BrandDescription= 'New description'
WHERE BrandDescription IS NULL