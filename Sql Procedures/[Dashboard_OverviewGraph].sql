-- =============================================
-- Author:		Shaun
-- Create date: 
-- Description:	Returns total transactions per day for the most recent week. System takes in initial date as parameter and automatically counts 7 days ahead
-- =============================================
CREATE PROCEDURE [dbo].[Dashboard_OverviewGraph] 
	-- Add the parameters for the stored procedure here
	@date datetime = '2016-08-17'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*), CONVERT(date, [Date & Time])FROM dbo.YoyoDisbursals
	WHERE [Date & Time] >= @date
	AND [Date & Time] < dateadd(day, 7, @date)

	GROUP BY CAST([Date & Time] AS DATE)
	ORDER BY CAST([Date & Time] AS DATE)

END