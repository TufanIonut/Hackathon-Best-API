CREATE PROCEDURE [dbo].[GetTopUsers]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 5
        U.FirstName + ' ' + U.LastName AS FullName,
        EP.PointsEarned
    FROM
        [Hackathon-Best].[dbo].[Users] U
    JOIN
        [Hackathon-Best].[dbo].UserPoints EP ON U.IdUser = EP.IdUser
    ORDER BY
        EP.PointsEarned DESC;

END;