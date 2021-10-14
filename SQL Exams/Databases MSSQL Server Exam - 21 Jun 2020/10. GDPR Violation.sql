SELECT T.Id,
    CASE
	WHEN a.MiddleName IS NULL THEN CONCAT(a.FirstName, ' ', a.LastName)
	ELSE CONCAT(a.FirstName, ' ' + a.MiddleName, ' ', a.LastName)
END AS [Full Name],

	   CA.Name AS [From],
	   CH.Name AS [To],

	 CASE
	 WHEN T.CancelDate IS NULL THEN CONCAT(DATEDIFF(DAY,T.ArrivalDate, T.ReturnDate), ' ', 'days')
	 ELSE 'Canceled'
	  END AS [Duration]

FROM Trips AS T

 JOIN AccountsTrips AS ATR ON T.Id=ATR.TripId

 JOIN Accounts AS A ON ATR.AccountId=A.Id

 JOIN Cities AS CA ON A.CityId=CA.Id

 JOIN Rooms AS R ON R.Id=T.RoomId

 JOIN Hotels AS H ON H.Id=R.HotelId

 JOIN Cities AS CH ON CH.Id=H.CityId

 ORDER BY [Full Name], T.Id




      