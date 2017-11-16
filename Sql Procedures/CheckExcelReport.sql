CREATE PROCEDURE CheckExcelReport
    @Filename varchar(300)
AS
BEGIN
    Select * from dbo.ImportedReports where ExcelName = @Filename;
END