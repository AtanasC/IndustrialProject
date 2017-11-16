-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
create PROCEDURE [dbo].[Popularity_ThreeMonths] 
	-- Add the parameters for the stored procedure here
	--@p1 int = 0, 
	--@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT count([Total Amount]), [Outlet Name] FROM dbo.YoyoDisbursals A
		WHERE [Date & Time] <= '2016-10-20'
		AND [Date & Time] > dateadd(day, -90, '2016-10-20')

		GROUP BY [outlet name]
END