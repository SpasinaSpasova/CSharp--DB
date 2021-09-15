CREATE TABLE [People]
(
 [Id] BIGINT PRIMARY KEY IDENTITY ,
 [Name] NVARCHAR(200) NOT NULL,
 CHECK (datalength([Name])<=200),
 [Picture] VARBINARY(MAX) ,
 CHECK (datalength([Picture])<=16000000),
 [Height] DECIMAL(18,2),
 [Weight] DECIMAL(18,2),
 [Gender] CHAR(1) NOT NULL,
 CHECK ([Gender] in ('m','f')),
 [Birthdate] DATETIME2 NOT NULL,
 [Biography] NVARCHAR(MAX)
)

INSERT INTO [People] ([Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography])
VALUES
	('A1', null, 1.64, 65.77, 'f', '1985/01/17', 'Bio'),
	('A2', null, 1.88, 87.00, 'm', '2010/06/11', 'Bio'),
	('A3', null, 1.64, 65.77, 'f', '1985/05/03', 'Bio'),
	('A4', null, 1.70, 60.52, 'f', '1975/06/06', 'Bio'),
	('A5', null, 1.90, 85.7, 'm', '2000/08/08', 'Bio')