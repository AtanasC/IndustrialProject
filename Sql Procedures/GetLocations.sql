
CREATE PROCEDURE [dbo].GetLocations  
AS   

    SET NOCOUNT ON;  

    SELECT DISTINCT [Outlet Name]
  FROM [ip17team6db].[dbo].[YoyoDisbursals]