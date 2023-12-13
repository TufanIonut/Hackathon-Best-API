CREATE PROCEDURE [dbo].[GetCodeByCourseId]
    @IdCourse INT,
    @Code NVARCHAR(4) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Code = NULL;

    SELECT @Code = [Code]
    FROM [Hackathon-Best].[dbo].[Codes]
    WHERE [IdCourse] = @IdCourse;
END;
