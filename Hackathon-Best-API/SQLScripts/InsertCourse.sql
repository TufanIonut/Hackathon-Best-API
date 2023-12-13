CREATE PROCEDURE [dbo].[InsertCourse]
    @CourseTitle NVARCHAR(MAX),
    @Duration INT,
    @Description NVARCHAR(MAX),
    @CategoryName NVARCHAR(MAX),
    @IdUser INT,
    @Link NVARCHAR(MAX),
    @CourseLanguage NVARCHAR(MAX),
    @Difficulty NVARCHAR(MAX),
    @Points INT,
    @ImageURL NVARCHAR(MAX),
    @IsPublic INT,
    @Success INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CategoryId INT;

    SELECT @CategoryId = IdCategory
    FROM [Hackathon-Best].[dbo].[Categories]
    WHERE CategoryName = @CategoryName;

    IF @CategoryId IS NULL
    BEGIN
        SET @Success = 0;
        RETURN;
    END

    INSERT INTO [Hackathon-Best].[dbo].[Courses]
        ([CourseTitle], [Duration], [Description], [IdCategory], [PostDate],
         [IdUser], [Link], [CouseLanguage], [Difficulty], [Points],
         [ImageURL], [IsPublic])
    VALUES
        (@CourseTitle, @Duration, @Description, @CategoryId, GETDATE(),
         @IdUser, @Link, @CourseLanguage, @Difficulty, @Points,
         @ImageURL, @IsPublic);

    SET @Success = 1;
END;
