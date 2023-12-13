CREATE PROCEDURE [dbo].[AddUserPoints]
    @IdUser INT,
    @PointsEarned INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [Hackathon-Best].[dbo].UserPoints WHERE [IdUser] = @IdUser)
    BEGIN
        INSERT INTO [Hackathon-Best].[dbo].UserPoints([IdUser], [PointsEarned])
        VALUES (@IdUser, @PointsEarned);
    END
    ELSE
    BEGIN
        UPDATE [Hackathon-Best].[dbo].UserPoints
        SET [PointsEarned] = [PointsEarned] + @PointsEarned
        WHERE [IdUser] = @IdUser;
    END

    SELECT 1 AS [Result];
END;
