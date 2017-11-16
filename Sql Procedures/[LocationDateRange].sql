-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[LocationDateRange] 
	-- Add the parameters for the stored procedure here
	@outletRef int = 0,
	@startDate datetime = 0, 
	@endDate datetime = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT([Outlet Ref]) FROM dbo.YoyoDisbursals A
	WHERE [Outlet Ref] = @outletRef
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate);
END