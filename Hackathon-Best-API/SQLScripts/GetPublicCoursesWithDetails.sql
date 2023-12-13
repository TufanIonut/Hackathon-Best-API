ALTER PROCEDURE [dbo].[GetPublicCoursesWithDetails]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        C.[IdCourse],
        C.[CourseTitle],
        C.[Duration],
        C.[Description],
        C.[IdCategory],
        CAT.[CategoryName],
        C.[PostDate],
        U.[LastName] + ' ' + U.[FirstName] AS [Author], 
        C.[Link],
        C.[CouseLanguage],
        C.[Difficulty],
        C.[Points],
        C.[ImageURL],
        C.[IsPublic]
    FROM 
        [Hackathon-Best].[dbo].[Courses] C
    JOIN
        [Hackathon-Best].[dbo].[Categories] CAT ON C.[IdCategory] = CAT.[IdCategory]
    JOIN
        [Hackathon-Best].[dbo].[Users] U ON C.[IdUser] = U.[IdUser]
    WHERE 
        C.[IsPublic] = 1; 
END;
