CREATE PROCEDURE [dbo].[CheckLoginCredentials] 
    @Email NVARCHAR(100),
    @Password NVARCHAR(100),
    @UserID INT OUTPUT 
AS
BEGIN 
    SET NOCOUNT ON

    SELECT @UserID = IdUser
    FROM Users
    WHERE EmailAdress = @Email AND Password = @Password 

    IF @UserID IS NULL
    BEGIN
        SET @UserID = -1 
    END
END;
