CREATE PROCEDURE [dbo].[UpdateUserRole]
    @IdUser INT,
    @RoleId INT,
    @Success INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Success = 0;

    UPDATE Users
    SET IdRole = @RoleId
    WHERE IdUser = @IdUser;

    IF @@ROWCOUNT > 0
    BEGIN
        SET @Success = 1;
    END;
END;
