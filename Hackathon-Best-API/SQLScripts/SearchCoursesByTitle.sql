CREATE PROCEDURE [dbo].[SearchCoursesByTitle]
    @TitleSequence NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        co.[IdCourse],
        co.[CourseTitle],
        co.[Duration],
        co.[Description],
        c.[CategoryName] AS [CategoryName],
        co.[PostDate],
        u.[LastName] + ' ' + u.[FirstName] AS [Author],
        co.[Link],
        co.[CouseLanguage],
        co.[Difficulty],
        co.[Points],
        co.[ImageURL],
        co.[IsPublic]
    FROM 
        [Hackathon-Best].[dbo].[Courses] as co
        INNER JOIN [Hackathon-Best].[dbo].[Categories] as c ON c.[IdCategory] = co.[IdCategory]
        INNER JOIN [Hackathon-Best].[dbo].[Users] as u ON co.[IdUser] = u.[IdUser]
    WHERE 
        co.[CourseTitle] LIKE '%' + @TitleSequence + '%';
END;
