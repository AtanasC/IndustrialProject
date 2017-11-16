Create PROCEDURE [dbo].[GetUsersDetailsByUsername] 
 @username varchar(300)   
AS   

    SET NOCOUNT ON;  
    SELECT *
  FROM [ip17team6db].[dbo].UserLogin where username = @username;