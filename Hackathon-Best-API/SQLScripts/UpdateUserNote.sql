CREATE PROCEDURE [dbo].[UpdateUserNote]
    @NoteId INT,
    @NewNoteTitle NVARCHAR(MAX),
    @NewNoteText NVARCHAR(MAX),
    @Success INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @Success = 0;

    BEGIN TRY
        UPDATE [Hackathon-Best].[dbo].[Notes]
        SET [NoteTitle] = @NewNoteTitle,
            [NoteText] = @NewNoteText
        WHERE [IdNote] = @NoteId;

        IF @@ROWCOUNT > 0
            SET @Success = 1;
    END TRY
    BEGIN CATCH
        SET @Success = 0;
    END CATCH;
    
    RETURN @Success;
END;
