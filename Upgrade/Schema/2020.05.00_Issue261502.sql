IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = N'dbo'
AND TABLE_NAME = N'EventQueue_mst')
AND NOT EXISTS (SELECT 1 FROM sys.indexes 
WHERE object_id = OBJECT_ID(N'[dbo].[EventQueue_mst]') 
AND name = N'IX_EventQueue_mst_Attempts')
CREATE NONCLUSTERED INDEX [IX_EventQueue_mst_Attempts]
ON [dbo].[EventQueue_mst] ([SiteRef],[ConfigurationName],[TimesAttempted],[LastAttemptDate],[InProcess])
GO
