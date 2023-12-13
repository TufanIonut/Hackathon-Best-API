CREATE PROCEDURE [dbo].[GenerateCourseCode]
    @IdUser INT,
    @IdCourse INT,
    @Result INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExistingCodeCount INT;
    DECLARE @Code NVARCHAR(4);

    SET @Code = RIGHT('000' + CAST(CAST(1000 + RAND() * (8999) AS INT) AS NVARCHAR(4)), 4);


    SELECT @ExistingCodeCount = COUNT(*)
    FROM [Hackathon-Best].[dbo].[Codes]
    WHERE [Code] = @Code;

    WHILE @ExistingCodeCount > 0
    BEGIN
        SET @Code = RIGHT('000' + CAST(CAST(1000 + RAND() * (8999) AS INT) AS NVARCHAR(4)), 4);
        SELECT @ExistingCodeCount = COUNT(*)
        FROM [Hackathon-Best].[dbo].[Codes]
        WHERE [Code] = @Code;
    END


    BEGIN TRY
        INSERT INTO [Hackathon-Best].[dbo].[Codes] ([IdUser], [IdCourse], [Code])
        VALUES (@IdUser, @IdCourse, @Code);


        SET @Result = 1;
    END TRY
    BEGIN CATCH

        SET @Result = 0;
    END CATCH;
END;
