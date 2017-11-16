Create PROCEDURE [dbo].[InsertUser]   
    @username nvarchar(255),  
	@password nvarchar(2000), 
	@role nvarchar(255) 
AS   

    SET NOCOUNT ON;  
    Insert Into dbo.UserLogin([username],[password],[role]) Values(@username,@password,@role);