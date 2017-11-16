
CREATE PROCEDURE [dbo].[TotalSalesPerMonthOfDataRange] 
	@location varchar(255) = '',
	@startDate datetime = 0, 
	@endDate datetime = 0

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @tempDate datetime = @startDate;
    CREATE TABLE #mytemptable (TotalAmount float);  

WHILE @startDate < @endDate
BEGIN
   Select @tempDate = DATEADD(month,1, @tempDate); 
    
	Insert into #mytemptable Select COALESCE(SUM([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @tempDate);
   Select @startDate = DATEADD(month,1, @startDate); 
END;

-- view the data  
select * from #mytemptable  ;
  
-- drop the table if you want to  
drop table #mytemptable;

END