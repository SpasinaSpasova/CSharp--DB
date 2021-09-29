SELECT  c.CountryCode,
		COUNT(mc.CountryCode) AS [MountainRanges]
FROM [Countries] AS c
JOIN [MountainsCountries] AS mc ON c.CountryCode=mc.CountryCode
WHERE c.CountryCode IN ('BG','RU', 'US')
GROUP BY (mc.CountryCode),c.[CountryCode]


SELECT  c.[CountryCode],
		COUNT (c.[CountryCode])
FROM [Countries] AS c
JOIN [MountainsCountries] AS mc ON c.CountryCode=mc.CountryCode
JOIN [Mountains] AS m ON mc.MountainId=m.Id
WHERE c.CountryCode IN ('BG','RU', 'US')
GROUP BY c.[CountryCode]