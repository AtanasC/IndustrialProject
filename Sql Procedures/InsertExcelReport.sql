CREATE PROCEDURE InsertExcelReport
    @Filename varchar(300)
AS
BEGIN
    Insert Into dbo.ImportedReports ([ExcelName]) Values(@Filename);
END