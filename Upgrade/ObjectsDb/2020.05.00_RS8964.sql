IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjTables]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[ObjTables]')
   AND   [syscol].[system_type_id] = 231 -- nvarchar
   AND   [syscol].[max_length] = 160     -- nvarchar(80)
   AND   [syscol].[name] = N'TableName')
   ALTER TABLE [dbo].[ObjTables] ALTER COLUMN 
     [TableName] nvarchar(128) NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjProperties]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[ObjProperties]')
   AND   [syscol].[system_type_id] = 231 -- nvarchar
   AND   [syscol].[max_length] = 160     -- nvarchar(80)
   AND   [syscol].[name] = N'ColumnName')
   ALTER TABLE [dbo].[ObjProperties] ALTER COLUMN 
     [ColumnName] nvarchar(128) NULL
GO
