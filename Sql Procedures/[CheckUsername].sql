CREATE PROCEDURE [dbo].[CheckUsername]   
    @username nvarchar(255)  
AS   

    SET NOCOUNT ON;  
    SELECT * 
    FROM dbo.UserLogin  
    WHERE username=@username;