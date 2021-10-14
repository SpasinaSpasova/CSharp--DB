CREATE PROCEDURE usp_SwitchRoom(@TripId INT , @TargetRoomId INT)
AS
BEGIN 
		DECLARE @TripIdIN INT =(SELECT * FROM Hotels AS h
						 JOIN Rooms AS R ON H.Id=R.HotelId
						 JOIN Trips AS T ON R.Id=T.RoomId
						 WHERE T.Id=@TripId)

		DECLARE  @TargetRoomIdIN INT  = (SELECT H.Id
							FROM Rooms AS R
							JOIN Hotels AS H ON H.Id = R.HotelId
							WHERE R.Id = @TargetRoomId)

		IF(@TripIdIN != @TargetRoomIdIN)
	 THROW 50001, 'Target room is in another hotel!',1

	DECLARE  @BedsInTargetRoom INT  = (SELECT R.Beds
							FROM Rooms AS R
							WHERE R.Id = @TargetRoomIdIN)

	DECLARE  @CountOfTrips INT = (SELECT COUNT(AccountId)
                                      FROM AccountsTrips
                                      WHERE TripId = @TripId)

	IF(@BedsInTargetRoom < @CountOfTrips)
	 THROW 50002, 'Not enough beds in target room!',1

	 UPDATE Trips
     SET RoomId=@TargetRoomId
     WHERE Id = @TripId
 
END



