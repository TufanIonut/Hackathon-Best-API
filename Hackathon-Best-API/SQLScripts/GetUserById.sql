CREATE PROCEDURE [dbo].[GetUserById]
    @IdUser INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdUser],
        [EmailAdress],
        [IdRole],
        [LastName],
        [FirstName],
        [Gender]
    FROM
        [Hackathon-Best].[dbo].[Users]
    WHERE
        [IdUser] = @IdUser;
END;
