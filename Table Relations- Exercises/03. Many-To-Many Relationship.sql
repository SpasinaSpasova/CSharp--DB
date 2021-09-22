CREATE TABLE [Students]
(
[StudentID] INT PRIMARY KEY IDENTITY NOT NULL,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE [Exams]
(
[ExamID] INT PRIMARY KEY IDENTITY(101,1) NOT NULL,
[Name] VARCHAR(50) NOT NULL
)


CREATE TABLE [StudentsExams]
(
[ID] INT PRIMARY KEY  ([StudentID],[ExamID]) IDENTITY NOT NULL,
[StudentID] INT FOREIGN KEY REFERENCES [Students]([StudentID]) NOT NULL,
[ExamID] INT FOREIGN KEY REFERENCES [Exams]([ExamID]) NOT NULL
)
 
INSERT INTO [Students] ([Name])
VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO [Exams] ([Name])
VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO [StudentsExams] ([StudentID],[ExamID])
VALUES
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103)