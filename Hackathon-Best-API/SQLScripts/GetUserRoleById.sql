CREATE PROCEDURE [dbo].[GetUserRoleById]
    @IdUser INT,
    @UserRole INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @UserRole = 0;

    SELECT @UserRole = IdRole
    FROM Users
    WHERE IdUser = @IdUser;
END;
