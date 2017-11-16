CREATE PROCEDURE [dbo].[UpdateUserDetails] 
    @oldUsername nvarchar(255), 
    @newUsername nvarchar(255),  
	@password nvarchar(2000), 
	@role nvarchar(255) 
AS   

    SET NOCOUNT ON;  
    UPDATE UserLogin SET username = @newUsername, password= @password , role = @role 
    WHERE username = @oldUsername;