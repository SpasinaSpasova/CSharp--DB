CREATE FUNCTION udf_CalculateTickets
(@origin VARCHAR (50), @destination VARCHAR (50), @peopleCount INT) 
RETURNS VARCHAR (50)
AS
BEGIN
      DECLARE @RES VARCHAR(50)
	  DECLARE @PRICE DECIMAL(18,2)

      IF(@peopleCount<=0)
	  BEGIN
		  RETURN 'Invalid people count!'
	  END

	  IF((SELECT 1 FROM [Flights] WHERE Origin=@origin AND Destination=@destination) IS NULL)
	  BEGIN
		 RETURN 'Invalid flight!'
	  END

	  SET @PRICE= (SELECT t.Price FROM Flights AS f
	  JOIN Tickets AS t ON f.Id=t.FlightId
	  WHERE f.Origin=@origin AND f.Destination=@destination) * @peopleCount

	  SET @RES= 'Total price ' + CONVERT(VARCHAR(20),@PRICE)

	  RETURN @RES

END


SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', 33)
SELECT dbo.udf_CalculateTickets('Kolyshley','Rancabolang', -1)
SELECT dbo.udf_CalculateTickets('Invalid','Rancabolang', 33)
