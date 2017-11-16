
CREATE PROCEDURE [dbo].[TotalSales] 
	@location varchar(255) = '',
	@startDate datetime = 0, 
	@endDate datetime = 0

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Total Amount]) FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate);
END