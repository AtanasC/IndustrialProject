-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[GetCountsPerHour]
	-- Add the parameters for the stored procedure here
	@date datetime = 0
	--@p2 int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dateadd(hour, datediff(hour, 0, [Date & Time]), 0) as TimeStampHour, Count(*) AS NumberOfTransactions
	FROM dbo.YoyoDisbursals
	WHERE [Date & Time] >= @date
	AND [Date & Time] < dateadd(day, 1, @date)
	GROUP BY dateadd(hour, datediff(hour, 0, [Date & Time]), 0)
	ORDER BY dateadd(hour, datediff(hour, 0, [Date & Time]), 0);
END