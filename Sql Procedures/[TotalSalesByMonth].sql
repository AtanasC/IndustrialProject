-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[TotalSalesByMonth] 
	-- Add the parameters for the stored procedure here
	--@p1 int = 0, 
	--@p2 int = 0
	@month int = 0,
	@year int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM([Total Amount])
	FROM dbo.YoyoDisbursals
	WHERE DATEPART(MONTH, [Date & Time]) = @month
	AND DATEPART(YEAR, [Date & Time]) = @year
END