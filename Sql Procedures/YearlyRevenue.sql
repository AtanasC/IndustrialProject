

CREATE PROCEDURE YearlyRevenue
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT
	(
	SELECT COUNT([Transaction Type]) FROM YoyoDisbursals WHERE [Date & Time] <= '2016-01-01' and [Date & Time] >= '2015-01-01'
	) 
	as [2015/16],
	(
	 SELECT COUNT([Transaction Type]) FROM YoyoDisbursals WHERE [Date & Time] <= '2017-01-01' and [Date & Time] >= '2016-01-01'
	 )
	 as [2016/17],
	 (
	 SELECT COUNT([Transaction Type]) FROM YoyoDisbursals WHERE [Date & Time] <= '2018-01-01' and [Date & Time] >= '2017-01-01'
	 )
	 as [2017/18];

END