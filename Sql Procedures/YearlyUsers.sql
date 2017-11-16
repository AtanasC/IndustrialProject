-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE YearlyUsers
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		 SELECT
	(
	SELECT COUNT(DISTINCT[New user id]) FROM YoyoDisbursals WHERE [Date & Time] <= '2016-01-01' and [Date & Time] >= '2015-01-01'
	) 
	as [2015/16],
	(
	 SELECT COUNT(DISTINCT[New user id]) FROM YoyoDisbursals WHERE [Date & Time] <= '2017-01-01' and [Date & Time] >= '2016-01-01'
	 )
	 as [2016/17],
	 (
	 SELECT COUNT(DISTINCT[New user id]) FROM YoyoDisbursals WHERE [Date & Time] <= '2018-01-01' and [Date & Time] >= '2017-01-01'
	 )
	 as [2017/18];


END