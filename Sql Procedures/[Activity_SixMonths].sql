-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Activity_SixMonths] 
	-- Add the parameters for the stored procedure here
	--@p1 int = 0, 
	--@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(DISTINCT([New user id])), [Outlet Name] FROM dbo.YoyoDisbursals A
		WHERE [Date & Time] <= '2016-10-20'
		AND [Date & Time] > dateadd(day, -180, '2016-10-20')

		GROUP BY [outlet name]
END