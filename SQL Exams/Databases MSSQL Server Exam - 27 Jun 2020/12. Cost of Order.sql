CREATE  FUNCTION udf_GetCost(@JobId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @Result DECIMAL(18,2) =
	        (
			 SELECT SUM(Price)
		     FROM  Parts      AS P
			 JOIN  OrderParts AS OP ON OP.PartId = P.PartId
			 JOIN  Orders     AS O  ON O.OrderId = OP.OrderId
			 JOIN  Jobs       AS J  ON O.JobId   = J.JobId
			 WHERE J.JobId = @JobId
			 )
	RETURN ISNULL(@Result,0)
END

SELECT dbo.udf_GetCost(1)