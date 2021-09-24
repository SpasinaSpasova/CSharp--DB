SELECT [PeakName]
	, [RiverName]
	, LOWER(
		CONCAT(
				[PeakName],
				RIGHT([RiverName],LEN([RiverName])-1)	
				)
					) AS Mix
	FROM [Peaks],[Rivers]
WHERE RIGHT([PeakName],1) LIKE LEFT([RiverName],1)
ORDER BY [Mix]