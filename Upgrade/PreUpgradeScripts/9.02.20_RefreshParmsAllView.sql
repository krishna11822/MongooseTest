SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID(N'[dbo].[parms_all]', N'V') is not null
BEGIN
DECLARE @sql nvarchar(500)
SET @sql = 'DROP VIEW [dbo].[parms_all]'
EXEC (@sql)
END
GO
DECLARE @sql2 nvarchar(500)
IF OBJECT_ID(N'[dbo].[parms_mst]',N'U') is not null
BEGIN
SET @sql2 = 'CREATE VIEW [dbo].[parms_all]
AS SELECT [site_ref],[parm_key],[site],[NoteExistsFlag],[RecordDate],[RowPointer],[site_group],[CreatedBy],[UpdatedBy],[CreateDate],[default_ending_from_starting]
FROM [parms_mst]'
EXEC (@sql2)
END
GO


