IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjFilters]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [dbo].[sysindexes]
   WHERE [id] = OBJECT_ID(N'[dbo].[ObjFilters]')
   AND   [name] = N'PK_ObjFilters')
   DROP INDEX [dbo].[ObjFilters].[PK_ObjFilters]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjFilters]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[ObjFilters]')
   AND [syscol].[name] = N'UserName' )
   ALTER TABLE [dbo].[ObjFilters] ALTER COLUMN 
      [UserName] SYSNAME NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ObjFilters]'), N'IsUserTable') = 1
   CREATE UNIQUE CLUSTERED INDEX [PK_ObjFilters] ON [dbo].[ObjFilters] 
   (
      CollectionName, UserName, GroupName, DevelopmentFlag
   ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO
