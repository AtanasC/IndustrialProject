
CREATE PROCEDURE [dbo].[MostPopularLocation]
		@startDate datetime = 0, 
		@endDate datetime = 0
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 [Outlet Name], COUNT([Transaction Type]) AS type
	FROM dbo.YoyoDisbursals A
	WHERE [Transaction Type] = 'Payment' OR [Transaction Type]= 'Discounted payment' OR [Transaction Type]= 'Redemption'
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	GROUP BY [Outlet Name]
	ORDER BY [type] DESC

END