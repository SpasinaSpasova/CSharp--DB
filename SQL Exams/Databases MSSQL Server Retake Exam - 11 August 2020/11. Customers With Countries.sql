CREATE VIEW v_UserWithCountries 
AS
   SELECT CONCAT (c.FirstName,' ',c.LastName) AS CustomerName 
          ,c.Age
		  ,c.Gender
		  ,cntr.Name AS CountryName
   FROM Customers AS c
   JOIN Countries AS cntr ON c.CountryId=cntr.Id

SELECT TOP 5 *
  FROM v_UserWithCountries
 ORDER BY Age
