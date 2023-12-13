CREATE PROCEDURE [dbo].[RegisterUser]
    @Email varchar(200),
    @Password varchar(200),
	@LastName varchar(200),
	@FirstName varchar(200),
	@Gender varchar(200),
    @UserID int OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Users WHERE EmailAdress = @Email)
    BEGIN
        SET @UserID = -1;
    END
    ELSE
    BEGIN
        INSERT INTO Users (EmailAdress, Password, IdRole, LastName, FirstName, Gender)
        VALUES (@Email, @Password, 1, @LastName, @FirstName, @Gender);

        SET @UserID = SCOPE_IDENTITY();
    END
END;
