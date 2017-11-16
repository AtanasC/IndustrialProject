-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Dashboard_Users
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT count(DISTINCT[New user id])
	FROM [ip17team6db].[dbo].[YoyoDisbursals]
	WHERE [Date & Time] <= '2017-08-13 01:37:00.000' and [Date & Time] >= '2017-08-07 01:37:00.000'

END