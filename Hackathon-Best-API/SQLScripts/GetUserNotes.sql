CREATE PROCEDURE [dbo].[GetUserNotes]
    @IdUser INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdNote], [IdUser], [NoteTitle], [NoteText]
    FROM [Hackathon-Best].[dbo].[Notes]
    WHERE [IdUser] = @IdUser;
END;