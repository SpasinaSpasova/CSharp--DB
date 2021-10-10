CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(30)) 
RETURNS INT
AS
BEGIN
	DECLARE @RES INT
	SET @RES =
     (SELECT COUNT(*) 
                           FROM [Commits] AS c
                           LEFT JOIN [Users] AS u ON c.ContributorId=u.Id
                          WHERE u.Username= @username
                         )
	RETURN @RES
END     
SELECT dbo.udf_AllUserCommits('UnderSinduxrein')




