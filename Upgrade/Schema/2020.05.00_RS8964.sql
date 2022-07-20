IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AuditLog]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[AuditLog]')
   AND   [syscol].[system_type_id] = 231 -- nvarchar
   AND   [syscol].[max_length] = 144     -- MediumDescType : nvarchar(72)
   AND   [syscol].[name] = N'MessageDesc')
   ALTER TABLE [dbo].[AuditLog] ALTER COLUMN 
     [MessageDesc] [LongDescType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AuditLogTypes]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[AuditLogTypes]')
   AND   [syscol].[system_type_id] = 231 -- nvarchar
   AND   [syscol].[max_length] = 72      -- ShortDescType : nvarchar(36)
   AND   [syscol].[name] = N'MessageDesc')
   ALTER TABLE [dbo].[AuditLogTypes] ALTER COLUMN 
     [MessageDesc] [LongDescType] NOT NULL
GO
