
CREATE PROCEDURE [dbo].[TotalSalesPieChart] 
	@startDate datetime = 0, 
	@endDate datetime = 0

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #mytemptable (TotalAmount float, Location varchar(255));
	CREATE TABLE #locations (id INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,Location varchar(255));
	Declare @LocationCount int;
	Declare @Location varchar(255);

	SELECT @LocationCount =  Count( Distinct [Outlet Name])  FROM dbo.YoyoDisbursals A
	WHERE A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND A.[Date & Time] < Convert(datetime, @endDate);

	Insert Into #locations (Location) SELECT Distinct [Outlet Name] FROM dbo.YoyoDisbursals A
	    Where A.[Date & Time] >= CONVERT(datetime, @startDate)
		AND A.[Date & Time] < Convert(datetime, @endDate);

	DECLARE @cnt INT = 1;

	WHILE @cnt <= @LocationCount
	BEGIN

	Select @Location = Location from #locations where id = @cnt;

		Insert Into #mytemptable (TotalAmount,Location) 
		SELECT SUM([Total Amount]),@Location FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= CONVERT(datetime, @startDate)
		AND A.[Date & Time] < Convert(datetime, @endDate);
	     SET @cnt = @cnt + 1;
	END;
    -- Insert statements for procedure here
	-- view the data  
select * from #mytemptable  ;
  
-- drop the table if you want to  
drop table #mytemptable;

-- drop the table if you want to  
drop table #locations;
END