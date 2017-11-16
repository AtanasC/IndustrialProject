
create PROCEDURE [dbo].[GetYearsByLocation]  
@location varchar(255)
AS   

    SET NOCOUNT ON;  

    SELECT DISTINCT year([Date & Time])
  FROM [ip17team6db].[dbo].[YoyoDisbursals] WHERE [Outlet Name] = @location ORDER BY year([Date & Time]) ASC;