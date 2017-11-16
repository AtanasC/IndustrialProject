-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Dashboard_MostPopular]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 [Outlet Name] AS mostPopular FROM [ip17team6db].[dbo].[YoyoDisbursals]
	WHERE [Date & Time] <= '2017-08-13 01:37:00.000' and [Date & Time] >= '2017-08-07 01:37:00.000'
	ORDER BY [Total Amount] DESC


END