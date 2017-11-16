create PROCEDURE [dbo].[DeleteUser]   
    @username nvarchar(255)  
AS   

    SET NOCOUNT ON;  
    Delete
    FROM dbo.UserLogin  
    WHERE username=@username;