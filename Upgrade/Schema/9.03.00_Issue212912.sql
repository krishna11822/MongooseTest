IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AuditLog]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'NewValue' 
   AND OBJECT_NAME(id) = N'AuditLog')
   ALTER TABLE [dbo].[AuditLog]
      ALTER COLUMN [NewValue] [dbo].[VeryLongListType] NULL
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AuditLog]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'OldValue' 
   AND OBJECT_NAME(id) = N'AuditLog')
   ALTER TABLE [dbo].[AuditLog]
      ALTER COLUMN [OldValue] [dbo].[VeryLongListType] NULL
GO
