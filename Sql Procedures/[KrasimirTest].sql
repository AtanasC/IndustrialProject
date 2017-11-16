
CREATE PROCEDURE [dbo].[KrasimirTest] 
	@startDate datetime = 0

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #mytemptable (Location varchar(255),Monday float,Tuesday float, Wednesday float, Thursday float, Friday float, Saturday float, Sunday float );
	CREATE TABLE #locations (id INTEGER NOT NULL IDENTITY(1, 1) PRIMARY KEY,Location varchar(255));
	Declare @LocationCount int;
	Declare @Location varchar(255);

	SELECT @LocationCount =  Count( Distinct [Outlet Name])  FROM dbo.YoyoDisbursals A
	WHERE A.[Date & Time] >= CONVERT(datetime, @startDate)
	AND [Date & Time] < dateadd(day, 7, @startDate)

	Insert Into #locations (Location) SELECT Distinct [Outlet Name] FROM dbo.YoyoDisbursals A
	    Where A.[Date & Time] >= CONVERT(datetime, @startDate)
		AND [Date & Time] < dateadd(day, 7, @startDate)

	DECLARE @cnt INT = 1;

	WHILE @cnt <= @LocationCount
	BEGIN

	Select @Location = Location from #locations where id = @cnt;

		Insert Into #mytemptable (Location,Monday ,Tuesday , Wednesday , Thursday , Friday, Saturday, Sunday) 
		SELECT (Select(@Location)) as Location,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= CONVERT(datetime, @startDate)
		AND [Date & Time] < dateadd(day, 1, @startDate)) as Monday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 1, @startDate)
		AND [Date & Time] < dateadd(day, 2, @startDate)) as Tuesday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 2, @startDate)
		AND [Date & Time] < dateadd(day, 3, @startDate)) as Wednesday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 3, @startDate)
		AND [Date & Time] < dateadd(day, 4, @startDate)) as Thursday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 4, @startDate)
		AND [Date & Time] < dateadd(day, 5, @startDate)) as Friday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 5, @startDate)
		AND [Date & Time] < dateadd(day, 6, @startDate)) as Saturday,
		(Select COUNT(*) FROM dbo.YoyoDisbursals A
		WHERE [Outlet Name] = @Location
		AND A.[Date & Time] >= dateadd(day, 6, @startDate)
		AND [Date & Time] < dateadd(day, 7, @startDate)) as Sunday;
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