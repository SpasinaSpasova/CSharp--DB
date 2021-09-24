CREATE TABLE [People]
(
	[Id] INT PRIMARY KEY IDENTITY NOT NULL,
	[Name] NVARCHAR(50) NOT NULL,
	[Birthday]  DATETIME2 NOT NUll
)
INSERT INTO [People] ([Name],[Birthday]) VALUES
('Victor','2000-12-07 00:00:00.000'),
('Steven','1992-09-10 00:00:00.000'),
('Stephen','1910-09-19 00:00:00.000'),
('John','2010-01-06 00:00:00.000')


SELECT [Name],
	   DATEDIFF(YEAR,[Birthday],CAST(GETDATE() AS datetime2)) AS [Age in Years],
	   DATEDIFF(MONTH,[Birthday],CAST(GETDATE() AS datetime2)) AS [Age in Months],
	   DATEDIFF(DAY,[Birthday],CAST(GETDATE() AS datetime2)) AS [Age in Days],
	   DATEDIFF(MINUTE,[Birthday],CAST(GETDATE() AS datetime2)) AS [Age in Minutes]
FROM [People]
