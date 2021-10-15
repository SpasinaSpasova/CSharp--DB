CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR (30)) 
RETURNS INT
AS
BEGIN 
         DECLARE @RES INT
		 SET @RES=(SELECT COUNT(*) FROM Planets AS P
					LEFT JOIN Spaceports AS S ON P.Id=S.PlanetId
					LEFT JOIN Journeys AS J ON S.Id=J.DestinationSpaceportId
					LEFT JOIN TravelCards AS TC ON J.Id=TC.JourneyId
					LEFT JOIN Colonists AS C ON TC.ColonistId=C.Id
					WHERE P.Name=@PlanetName)
		RETURN @RES
END


SELECT dbo.udf_GetColonistsCount('Otroyphus')