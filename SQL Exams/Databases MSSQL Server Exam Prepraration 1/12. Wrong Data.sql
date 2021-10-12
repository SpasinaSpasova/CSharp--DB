CREATE PROCEDURE usp_CancelFlights
AS
	UPDATE Flights
	SET DepartureTime = NULL,ArrivalTime=NULL
	WHERE ArrivalTime>DepartureTime

EXEC usp_CancelFlights