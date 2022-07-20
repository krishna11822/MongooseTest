IF NOT EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[FormAppsInfo]')
   AND   [name] = N'IX_FormAppsInfo_ID')
CREATE INDEX IX_FormAppsInfo_ID ON FormAppsInfo(ID)
GO
