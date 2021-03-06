-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE Report_OneYear 
	-- Add the parameters for the stored procedure here
	--@p1 int = 0, 
	--@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Total Amount]), [Outlet Name] FROM dbo.YoyoDisbursals A
		WHERE [Date & Time] <= '2016-10-20'
		AND [Date & Time] > dateadd(day, -365, '2016-10-20')

		GROUP BY [outlet name]
END