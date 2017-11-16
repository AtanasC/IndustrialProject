CREATE PROCEDURE DeleteExcelReport
    @FileName varchar(300)
AS
BEGIN
    Delete from dbo.ImportedReports where ExcelName = @FileName;
END