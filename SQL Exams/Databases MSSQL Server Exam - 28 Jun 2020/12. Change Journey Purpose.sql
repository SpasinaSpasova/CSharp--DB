CREATE  PROCEDURE usp_ChangeJourneyPurpose(@JourneyId INT , @NewPurpose VARCHAR(30))
AS
BEGIN
       DECLARE @JID INT= (SELECT Id FROM Journeys
									WHERE Id=@JourneyId)
	  IF(@JID IS NULL)
	  THROW 50001,'The journey does not exist!',1

	  DECLARE @TOchange INT= (SELECT COUNT(*) FROM Journeys
											WHERE Id=@JourneyId AND Purpose= @NewPurpose)
      IF(@TOchange=1)
	  THROW 50001,'You cannot change the purpose!',1

	  UPDATE Journeys
	  SET Purpose=@NewPurpose
	  WHERE Id=@JourneyId
END



EXEC usp_ChangeJourneyPurpose 4, 'Technical'

EXEC usp_ChangeJourneyPurpose 2, 'Educational'

EXEC usp_ChangeJourneyPurpose 196, 'Technical'