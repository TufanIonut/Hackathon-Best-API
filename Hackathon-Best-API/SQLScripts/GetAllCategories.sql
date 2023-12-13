CREATE PROCEDURE [dbo].[GetAllCategories]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [CategoryName]
    FROM [Hackathon-Best].[dbo].[Categories]
    
END;
