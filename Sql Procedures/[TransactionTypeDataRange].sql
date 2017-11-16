
create PROCEDURE [dbo].[TransactionTypeDataRange] 
	@location varchar(255) = '',
	@startDate datetime = 0, 
	@endDate datetime = 0

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


    CREATE TABLE #mytemptable (Payments int);  

	Insert into #mytemptable Select COALESCE(count([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	AND A.[Transaction Type] = 'Discounted payment';

   Insert into #mytemptable Select COALESCE(count([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	AND A.[Transaction Type] = 'Payment';

	Insert into #mytemptable Select COALESCE(count([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	AND A.[Transaction Type] = 'Redemption';

	Insert into #mytemptable Select COALESCE(count([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	AND A.[Transaction Type] = 'Refund';

	Insert into #mytemptable Select COALESCE(count([Total Amount]),0)  FROM dbo.YoyoDisbursals A
	WHERE [Outlet Name] = @location
	AND A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate)
	AND A.[Transaction Type] = 'Reversal';

-- view the data  
select * from #mytemptable  ;
  
-- drop the table if you want to  
drop table #mytemptable;

END