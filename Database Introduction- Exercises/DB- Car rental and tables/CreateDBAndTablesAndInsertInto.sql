
--•	Categories (Id, CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)

CREATE TABLE [Categories]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[CategoryName] NVARCHAR(50) NOT NULL,
[DailyRate] DECIMAL(18,2),
[WeeklyRate] DECIMAL(18,2),
[MonthlyRate] DECIMAL(18,2),
[WeekendRate] DECIMAL(18,2)
)

INSERT INTO [Categories] ([CategoryName], [DailyRate],
[WeeklyRate], [MonthlyRate], [WeekendRate]) 
VALUES
('Car',100.66,1000,10000,56.25),
('Jeep',33.25,500,20000,16.25),
('Yacht',52.25,520,25000,56.75)

--•	Cars (Id, PlateNumber, Manufacturer, 
--Model, CarYear, CategoryId, Doors, Picture, Condition, Available)

CREATE TABLE [Cars]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[PlateNumber] NVARCHAR(50) NOT NULL,
[Manufacturer] NVARCHAR(50) NOT NULL,
[Model] NVARCHAR(50) NOT NULL,
[CarYear] DATE NOT NULL,
[CategoryId] INT FOREIGN KEY REFERENCES [Categories](Id) NOT NULL,
[Doors] INT NOT NULL,
[Picture] VARBINARY(MAX),
[Condition] NVARCHAR(50),
[Available] BIT NOT NULL
)

INSERT INTO [Cars]([PlateNumber], [Manufacturer], 
[Model], [CarYear], [CategoryId], [Doors], [Picture], [Condition], [Available])
VALUES
('PB5230CH','BMW','320','2005-06-05',3,4,NULL,'used',1),
('CB6606BH','Audi','A4','2005-12-05',2,2,NULL,'used',0),
('K5230RB','BMW','X6','2020-09-25',1,4,NULL,'NEW',1)

--•	Employees (Id, FirstName, LastName, Title, Notes)

CREATE TABLE [Employees]
(
  [Id] INT PRIMARY KEY IDENTITY NOT NULL,
  [FirstName] NVARCHAR(50) NOT NULL,
  [LastName] NVARCHAR(50) NOT NULL,
  [Title] NVARCHAR(MAX)  NOT NULL,
  [Notes] NVARCHAR(MAX)  ,
)

INSERT INTO [Employees] ([FirstName], [LastName], [Title], [Notes])
VALUES
('A1','B1','C1',NULL),
('A2','B2','C2',NULL),
('A3','B3','C3',NULL)

--•	Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
CREATE TABLE [Customers]
(
 [Id] INT PRIMARY KEY IDENTITY NOT NULL,
 [DriverLicenceNumber] NVARCHAR(50) NOT NULL,
 [FullName] NVARCHAR(250) NOT NULL,
 [Address] NVARCHAR(250) NOT NULL,
 [City] NVARCHAR(250) NOT NULL,
 [ZIPCode] NVARCHAR(250) NOT NULL,
 [Notes] NVARCHAR(MAX)
)

INSERT INTO [Customers] ([DriverLicenceNumber], [FullName], [Address], [City],
[ZIPCode], [Notes])
VALUES
('51513205','Spasina Spasova','ul.Petko Voivoda','Varna','5600',null),
('04620144','Vesa Spasova','ul.Boycho Handjiev','Panagyrishte','4750',null),
('04789632','Bobi Ivano','ul.Todor Ikonomov','Belashtica','4000',null)

--•	RentalOrders (Id, EmployeeId, CustomerId, CarId,
--TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, 
--StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)

CREATE TABLE [RentalOrders]
(
  [Id] INT PRIMARY KEY IDENTITY NOT NULL,
  [EmployeeId] INT FOREIGN KEY REFERENCES [Employees](Id) NOT NULL,
  [CustomerId] INT FOREIGN KEY REFERENCES [Customers](Id) NOT NULL,
  [CarId] INT FOREIGN KEY REFERENCES [Cars](Id) NOT NULL,
  [TankLevel] DECIMAL(18,2) NOT NULL,
  [KilometrageStart] DECIMAL(18,2) ,
  [KilometrageEnd] DECIMAL(18,2) ,
  [TotalKilometrage] AS [KilometrageStart] - [KilometrageEnd] ,
  [StartDate] DATETIME2 ,
  [EndDate] DATETIME2,
  [TotalDate] AS DATEDIFF(Day,[StartDate],[EndDate]) ,
  [RateApplied] DECIMAL(18,2) NOT NULL,
  [TaxRate] DECIMAL(18,2) NOT NULL,
  [OrderStatus] NVARCHAR(250) NOT NULL,
  [Notes] NVARCHAR(MAX) 
)

INSERT INTO [RentalOrders] ([EmployeeId], [CustomerId],[CarId],
[TankLevel], [KilometrageStart], [KilometrageEnd], 
[StartDate], [EndDate], [RateApplied], [TaxRate], [OrderStatus], [Notes])
VALUES
(1,1,1,10.10,10.10,20.20,'2018/12/10','2019/10/10',1010.10,1010.10,'YES',null),
(2,2,2,20.20,20.20,30.30,'2019/12/10','2020/10/10',2020.20,2020.20,'NO',null),
(3,3,3,30.30,30.30,40.40,'2020/12/10','2021/10/10',3030.30,3030.30,'YES',null)