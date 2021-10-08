CREATE FUNCTION ufn_IsWordComprised (@setOfLetters NVARCHAR(25), @word NVARCHAR(25))
RETURNS BIT
AS
BEGIN
		DECLARE @wordLen INT= LEN(@word)
		DECLARE @index INT= 1
		WHILE (@index<=@wordLen)
			BEGIN
					IF(CHARINDEX(SUBSTRING(@word, @Index, 1), @setOfLetters) = 0)
						RETURN 0
					SET @index+=1
			END
		RETURN 1
END


CREATE TABLE WordContain
(
   SetOfLetters NVARCHAR(25) NOT NULL,
   Word NVARCHAR(25) NOT NULL
)

INSERT INTO WordContain (SetOfLetters,Word)
VALUES 
('oistmiahf','Sofia'),
('oistmiahf','halves'),
('bobr','Rob'),
('pppp','Guy')

SELECT wc.SetOfLetters,
	   wc.Word,
	   dbo.ufn_IsWordComprised(wc.SetOfLetters,wc.Word) AS [Result]
FROM [WordContain] AS wc

