CREATE TABLE [Users]
(
 [Id] BIGINT PRIMARY KEY IDENTITY ,
 [Username]  VARCHAR(30) UNIQUE NOT NULL,
 CHECK (datalength([Username])<=30),
 [Password]  VARCHAR(26) UNIQUE NOT NULL,
 [ProfilePicture] VARBINARY(MAX) ,
 CHECK (datalength([ProfilePicture])<=7200000),
 [LastLoginTime] DATETIME2,
 [IsDeleted] bit
)

INSERT INTO [Users] ([Username], [Password],[ProfilePicture], [LastLoginTime], [IsDeleted])
VALUES
	('A1', '789', null,  '1985/01/22', 1),
	('A2', '456', null,  '1455/01/11', 0),
	('A3', '123', null,  '1955/11/10', 0),
	('A4', '2365', null,  '1985/01/17', 1),
	('A5', '000', null,  '1985/01/16', 1)