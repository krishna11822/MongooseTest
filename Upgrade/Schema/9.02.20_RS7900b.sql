IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ConnectionInformation]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ConnectionInformation]')
   AND   [name] = N'IX_ConnectionInformation_UserName')
   DROP INDEX [dbo].[ConnectionInformation].[IX_ConnectionInformation_UserName]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ConnectionInformation]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol, [sys].[types] systype
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[ConnectionInformation]')
   AND [syscol].[name] = N'UserName'
   And [syscol].[user_type_id] = [systype].[user_type_id]   
   AND [systype].[Name] = 'sysname' )
   ALTER TABLE [dbo].[ConnectionInformation] ALTER COLUMN 
      [UserName] [dbo].[UsernameType] NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ConnectionInformation]'), N'IsUserTable') = 1
   CREATE INDEX [IX_ConnectionInformation_UserName] ON [dbo].[ConnectionInformation]
   (
      [UserName]
   ) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

