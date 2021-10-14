SELECT A.Id,
       A.Email,
	   C.Name,
       COUNT(H.Id) AS Trips
FROM Accounts A 
JOIN AccountsTrips AS [AT] ON [AT].AccountId = A.Id
JOIN Trips		   AS T ON T.Id = [AT].TripId
JOIN Rooms		   AS R ON R.Id = T.RoomId
JOIN Hotels		   AS H ON H.Id = R.HotelId
JOIN Cities		   AS C ON C.Id = H.CityId
WHERE A.CityId=H.CityId
GROUP BY A.Id,
         A.Email,
		 C.Name
ORDER BY COUNT(H.Id) DESC,A.Id