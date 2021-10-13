CREATE TRIGGER tr_DeleteProducts
ON Products
INSTEAD OF DELETE AS 
BEGIN 
	DECLARE @DeletedProducts INT = 
		(SELECT p.Id
			  FROM Products AS p 
					JOIN deleted AS d
						ON d.Id = p.Id)
	DELETE 
		FROM Feedbacks
		WHERE ProductId = @DeletedProducts

	DELETE
        FROM ProductsIngredients
        WHERE ProductId = @deletedProducts

    DELETE Products
        WHERE Id = @deletedProducts
END


DELETE FROM Products WHERE Id = 7