CREATE PROCEDURE [dbo].[InsertCourseComment]
    @IdCourse INT,
    @IdUser INT,
    @CommentText NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [Hackathon-Best].[dbo].Comments([IdCourse], [IdUser], [CommentText])
    VALUES (@IdCourse, @IdUser, @CommentText);

END;
