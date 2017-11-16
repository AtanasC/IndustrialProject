
CREATE PROCEDURE [dbo].[Comparison_Activity]
@location varchar(255) = '',
@year int = 0
AS 
Begin  

	SET NOCOUNT ON;  

	DECLARE @startDate datetime;
	SELECT @startDate = datefromparts(@year, 1, 1);
	DECLARE @endDate datetime;
	SELECT @endDate = DATEADD(year,1, @startDate);
	CREATE TABLE #mytemptable (TotalAmount float); 
	DECLARE @tempDate datetime = @startDate; 

WHILE @startDate < @endDate
BEGIN
	Select @tempDate = DATEADD(month,1, @tempDate); 

	Insert into #mytemptable Select COALESCE(COUNT(DISTINCT([New user id])),0) FROM dbo.YoyoDisbursals A
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