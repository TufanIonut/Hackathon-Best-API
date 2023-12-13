CREATE PROCEDURE [dbo].[InsertUserNote]
    @UserId INT,
    @NoteTitle NVARCHAR(MAX),
    @NoteText NVARCHAR(MAX),
    @Success INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Success = 0;

    BEGIN TRY
        INSERT INTO [Hackathon-Best].[dbo].[Notes] ([IdUser], [NoteTitle], [NoteText])
        VALUES (@UserId, @NoteTitle, @NoteText);

        SET @Success = 1;
    END TRY
    BEGIN CATCH
        SET @Success = 0;
    END CATCH;
END;
