CREATE PROCEDURE [dbo].[InsertCourseRating]
    @IdUser INT,
	@IdCourse INT,
    @Rating INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [Hackathon-Best].[dbo].CourseReviews
                   WHERE [IdCourse] = @IdCourse AND [IdUser] = @IdUser)
    BEGIN
        INSERT INTO [Hackathon-Best].[dbo].CourseReviews([IdCourse], [IdUser], [Rating])
        VALUES (@IdCourse, @IdUser, @Rating);

        SELECT 1 AS [Result];
    END
    ELSE
    BEGIN
        SELECT 0 AS [Result];
    END
END;
