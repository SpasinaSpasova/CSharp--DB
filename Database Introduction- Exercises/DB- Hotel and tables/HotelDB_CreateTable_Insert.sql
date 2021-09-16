
--•	Employees (Id, FirstName, LastName, Title, Notes)

CREATE TABLE [Employees]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[FirstName] NVARCHAR(100) NOT NULL,
[LastName] NVARCHAR(100) NOT NULL,
[Title] NVARCHAR(50) NOT NULL,
[Notes] NVARCHAR(MAX)
)

INSERT INTO [Employees] ([FirstName], [LastName], [Title], [Notes])
VALUES
('A1','B1','C1',NULL),
('A2','B2','C2',NULL),
('A3','B3','C3',NULL)

--•	Customers (AccountNumber, FirstName, LastName,
--PhoneNumber, EmergencyName, EmergencyNumber, Notes)
CREATE TABLE [Customers]
(
[AccountNumber] NVARCHAR(20) PRIMARY KEY ,
[FirstName] NVARCHAR(100) NOT NULL,
[LastName] NVARCHAR(100) NOT NULL,
[PhoneNumber] NVARCHAR(25) NOT NULL,
[EmergencyName] NVARCHAR(100) NOT NULL,
[EmergencyNumber] NVARCHAR(25) NOT NULL,
[Notes] NVARCHAR(MAX)
)

INSERT INTO [Customers] ([AccountNumber], [FirstName], [LastName],
[PhoneNumber], [EmergencyName], [EmergencyNumber], [Notes])
VALUES
('EDGDGX320560','AA','BB','05478920','CC','1681065320',NULL),
('06SD1S0GDV','DD','EE','45012','FF','54201',NULL),
('AFGD05132','GG','HH','78684521','RR','12001234',NULL)

--•	RoomStatus (RoomStatus, Notes)
CREATE TABLE [RoomStatus]
(
    [RoomStatus] NVARCHAR(10) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(MAX)
)

INSERT INTO [RoomStatus] ([RoomStatus], [Notes])
VALUES
('FREE',NULL),
('NOT FREE',NULL),
('NOT IN USE',NULL)

--•	RoomTypes (RoomType, Notes)
CREATE TABLE [RoomTypes]
(
    [RoomType] NVARCHAR(10) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(MAX)
)

INSERT INTO [RoomTypes] ([RoomType], [Notes])
VALUES
('ONE BED',NULL),
('TWO BED',NULL),
('THREE BED',NULL)

--•	BedTypes (BedType, Notes)
CREATE TABLE [BedTypes]
(
    [BedType] NVARCHAR(10) PRIMARY KEY NOT NULL,
	[Notes] NVARCHAR(MAX)
)

INSERT INTO [BedTypes] ([BedType], [Notes])
VALUES
('SINGLE',NULL),
('TWO SINGLE',NULL),
('BEDROOM',NULL)

--•	Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
CREATE TABLE [Rooms]
(
 [RoomNumber] INT PRIMARY KEY NOT NULL,
 [RoomType] NVARCHAR(10) FOREIGN KEY REFERENCES [RoomTypes](RoomType) NOT NULL,
 [BedType] NVARCHAR(10) FOREIGN KEY REFERENCES [BedTypes](BedType) NOT NULL,
 [Rate] INT,
 [RoomStatus] NVARCHAR(10) FOREIGN KEY REFERENCES [RoomStatus](RoomStatus) NOT NULL,
 [Notes] NVARCHAR(MAX)
)

INSERT INTO [Rooms] ([RoomNumber],[RoomType], [BedType], [Rate], [RoomStatus], [Notes])
VALUES
(10,'ONE BED','BEDROOM',10,'FREE',NULL),
(20,'THREE BED','SINGLE',20,'NOT FREE',NULL),
(30,'TWO BED','TWO SINGLE',30,'NOT IN USE',NULL)

--•	Payments (Id, EmployeeId, PaymentDate, 
--AccountNumber, FirstDateOccupied, LastDateOccupied, 
--TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)

CREATE TABLE [Payments]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[EmployeeId] INT FOREIGN KEY REFERENCES [Employees](Id) NOT NULL,
[PaymentDate] DATETIME2 NOT NULL,
[AccountNumber] NVARCHAR(20) FOREIGN KEY REFERENCES [Customers](AccountNumber) NOT NULL,
[FirstDateOccupied] DATETIME2 NOT NULL,
[LastDateOccupied] DATETIME2 NOT NULL,
[TotalDays] AS DATEDIFF(DAY,FirstDateOccupied,LastDateOccupied),
[AmountCharged] DECIMAL(18,2) NOT NULL,
[TaxRate] DECIMAL(18,2) NOT NULL,
[TaxAmount] AS AmountCharged*TaxRate,
[PaymentTotal] DECIMAL(18,2) NOT NULL,
[Notes] NVARCHAR(MAX)
)

INSERT INTO [Payments] ([EmployeeId], [PaymentDate], 
[AccountNumber], [FirstDateOccupied], [LastDateOccupied], 
 [AmountCharged], [TaxRate], [PaymentTotal], [Notes])
 VALUES
 (1,GETDATE(),'EDGDGX320560','2012/10/11','2012/10/15',15.2,12.00,256.32,NULL),
 (2,GETDATE(),'06SD1S0GDV','2021/06/11','2021/06/15',12.2,2.56,15.32,NULL),
 (3,GETDATE(),'AFGD05132','2019/06/01','2019/06/05',1.2,22.56,169.32,NULL)


--•	Occupancies (Id, EmployeeId,
--DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
CREATE TABLE [Occupancies]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[EmployeeId] INT FOREIGN KEY REFERENCES [Employees](Id) NOT NULL,
[DateOccupied] DATETIME2 NOT NULL,
[AccountNumber] NVARCHAR(20) FOREIGN KEY REFERENCES [Customers](AccountNumber) NOT NULL,
[RoomNumber] INT FOREIGN KEY REFERENCES [Rooms](RoomNumber) NOT NULL,
[RateApplied] DECIMAL(18,2),
[PhoneCharge] DECIMAL(18,2),
[Notes] NVARCHAR(MAX)
)

INSERT INTO [Occupancies] ( [EmployeeId],
[DateOccupied], [AccountNumber],[RoomNumber], [RateApplied], [PhoneCharge], [Notes])
VALUES
(1,GETDATE(),'EDGDGX320560',20,152.33,33.25,NULL),
(3,GETDATE(),'AFGD05132',30,25.33,2.25,NULL),
(2,GETDATE(),'06SD1S0GDV',10,16.55,18.91,NULL)