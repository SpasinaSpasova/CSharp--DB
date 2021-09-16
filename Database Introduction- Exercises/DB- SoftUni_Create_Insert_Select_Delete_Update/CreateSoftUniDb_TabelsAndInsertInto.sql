--•	Towns (Id, Name)

CREATE TABLE [Towns]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(50) NOT NULL
)

INSERT INTO [Towns] ([Name])
VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')


--•	Addresses (Id, AddressText, TownId)

CREATE TABLE [Addresses]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[AddressText] NVARCHAR(50) NOT NULL,
[TownId] INT FOREIGN KEY REFERENCES [Towns](Id) NOT NULL
)

--•	Departments (Id, Name)
CREATE TABLE [Departments]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(50) NOT NULL
)
INSERT INTO [Departments] ([Name])
VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

--•	Employees (Id, FirstName, MiddleName, LastName,
--JobTitle, DepartmentId, HireDate, Salary, AddressId)

CREATE TABLE [Employees]
(
[Id] INT PRIMARY KEY IDENTITY NOT NULL,
[FirstName] NVARCHAR(50) NOT NULL,
[MiddleName] NVARCHAR(50) NOT NULL,
[LastName] NVARCHAR(50) NOT NULL,
[JobTitle] NVARCHAR(50) NOT NULL,
[DepartmentId] INT FOREIGN KEY REFERENCES [Departments](Id),
[HireDate] DATETIME2 NOT NULL,
[Salary] DECIMAL (18,2) NOT NULL,
[AddressId] INT FOREIGN KEY REFERENCES [Addresses](Id)
)

INSERT INTO [Employees] ([FirstName], [MiddleName], [LastName],
[JobTitle],[DepartmentId], [HireDate], [Salary])
VALUES
('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013/01/01',3500.00),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004/03/02',4000.00),
('Maria','Petrova','Ivanov','Intern',5,'2016/08/28',525.25),
('Peter','Pan','Pan','Intern',3,'2016/08/28',599.88),
('Georgi','Teziev','Ivanov','CEO',2,'2007/12/09',3000.00)

