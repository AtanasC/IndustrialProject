CREATE PROCEDURE [dbo].[GetUsersDetails]    
AS   

    SET NOCOUNT ON;  
    SELECT [username],[role]
  FROM [ip17team6db].[dbo].UserLogin;