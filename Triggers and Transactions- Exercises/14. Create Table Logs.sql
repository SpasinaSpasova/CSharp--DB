CREATE TABLE Logs
(
   LogId INT PRIMARY KEY IDENTITY, 
   AccountId INT FOREIGN KEY REFERENCES Accounts(Id) , 
   OldSum DECIMAL(15,2) NOT NULL,
   NewSum DECIMAL(15,2) NOT NULL,
   UpdaetdOn DATETIME2
)

CREATE OR ALTER TRIGGER tr_AccountsChanges
ON Accounts FOR UPDATE
AS
	DECLARE @AccountId INT = (SELECT Id FROM inserted)
	DECLARE @NewSum DECIMAL(12,2) = (SELECT Balance FROM inserted)
	DECLARE @OldSum DECIMAL(12,2) = (SELECT Balance FROM deleted)

	INSERT INTO Logs(AccountId,NewSum,OldSum) VALUES
	(@AccountId,@NewSum,@OldSum)


UPDATE Accounts 
SET Balance +=100
WHERE Id = 4

SELECT * FROM Accounts
SELECT * FROM Logs