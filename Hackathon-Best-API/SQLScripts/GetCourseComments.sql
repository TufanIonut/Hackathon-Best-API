CREATE PROCEDURE [dbo].[GetCourseComments]
    @IdCourse INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CC.[IdComment],
        CC.[IdCourse],
        CC.[IdUser],
        CC.[CommentText],
        U.[FirstName] + ' ' + U.[LastName] AS FullName
    FROM
        [Hackathon-Best].[dbo].Comments CC
    JOIN
        [Hackathon-Best].[dbo].[Users] U ON CC.[IdUser] = U.[IdUser]
    WHERE
        CC.[IdCourse] = @IdCourse;

END;
