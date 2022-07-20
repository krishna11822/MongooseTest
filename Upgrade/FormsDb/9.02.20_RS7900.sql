CREATE PROCEDURE #DropStat (@Table SYSNAME, @Column SYSNAME)
AS
DECLARE @SQL NVARCHAR(MAX) = N''
SELECT @SQL = @SQL + 
N'DROP STATISTICS ' + OBJECT_NAME(s.[object_id]) + N'.' + s.name + N'
'
FROM sys.stats s 
INNER JOIN sys.objects so on
so.object_id = s.object_id
WHERE EXISTS (SELECT 1
FROM sys.stats_columns sc
INNER JOIN sys.columns c ON c.object_id = sc.object_id AND c.column_id = sc.column_id
WHERE  sc.object_id = s.object_id AND sc.stats_id = s.stats_id
AND c.name = @Column
)
and so.name = @Table 
IF LEN(@SQL) > 0
EXECUTE(@SQL)
GO


IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UsernameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[UsernameType] FROM [nvarchar](128) NULL
GO
DECLARE StringsCrs CURSOR LOCAL STATIC FOR
SELECT name FROM AdditionalStringTables
DECLARE @Table SYSNAME
DECLARE @SQL NVARCHAR(MAX)
OPEN StringsCrs
WHILE 1=1
BEGIN
   FETCH StringsCrs INTO @Table
   IF @@fetch_status <> 0
      BREAK

      IF OBJECTPROPERTY(OBJECT_ID(@Table), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(@Table)
   AND [name] = N'LockedBy')
      BEGIN
         EXEC #DropStat @Table, N'LockedBy'
         SET @SQL = N'ALTER TABLE [dbo].[' + @Table + N']
      ALTER COLUMN [LockedBy] UsernameType NULL'
	     EXECUTE(@SQL)
	  END
END
CLOSE StringsCrs
DEALLOCATE StringsCrs

EXEC #DropStat N'Forms', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Forms]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Forms]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Forms]
      ALTER COLUMN [LockedBy] UsernameType NULL

EXEC #DropStat N'Menus', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Menus]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Menus]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Menus]
      ALTER COLUMN [LockedBy] UsernameType NULL

EXEC #DropStat N'PropertyDefaults01', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyDefaults01]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[PropertyDefaults01]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[PropertyDefaults01]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Scripts', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Scripts]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Scripts]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Scripts]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Strings', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Strings]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Strings]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Strings]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Validators', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Validators]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Validators]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Validators]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Variables', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Variables]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Variables]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Variables]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'HelpIDs', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[HelpIDs]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[HelpIDs]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[HelpIDs]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Images', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Images]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Images]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Images]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'WebUserControls', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WebUserControls]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[WebUserControls]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[WebUserControls]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'WebUserControlElements', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[WebUserControlElements]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[WebUserControlElements]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[WebUserControlElements]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'Themes', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Themes]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[Themes]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[Themes]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'ActiveXScripts', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ActiveXScripts]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[ActiveXScripts]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[ActiveXScripts]
      ALTER COLUMN [LockedBy] UsernameType NULL
EXEC #DropStat N'ExplorerObjects', N'LockedBy'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ExplorerObjects]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[ExplorerObjects]')
   AND [name] = N'LockedBy')
   ALTER TABLE [dbo].[ExplorerObjects]
      ALTER COLUMN [LockedBy] UsernameType NULL
IF EXISTS (SELECT 1 FROM [dbo].[sysobjects]
           WHERE [name] = N'PK_RuntimeChanges'
           AND [xtype] = N'PK'
           AND [parent_obj] = OBJECT_ID(N'[dbo].[RuntimeChanges]'))
   ALTER TABLE [dbo].[RuntimeChanges] DROP CONSTRAINT [PK_RuntimeChanges]
GO
EXEC #DropStat N'RuntimeChanges', N'UserName'
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[RuntimeChanges]'), N'IsUserTable') = 1
AND EXISTS (SELECT 1 FROM [dbo].[syscolumns]
   WHERE [id] = OBJECT_ID(N'[dbo].[RuntimeChanges]')
   AND [name] = N'UserName')
   ALTER TABLE [dbo].[RuntimeChanges]
      ALTER COLUMN [UserName] UsernameType NOT NULL

IF NOT EXISTS (SELECT 1 FROM [dbo].[sysobjects]
           WHERE [name] = N'PK_RuntimeChanges'
           AND [xtype] = N'PK'
           AND [parent_obj] = OBJECT_ID(N'[dbo].[RuntimeChanges]'))
   ALTER TABLE [dbo].[RuntimeChanges] ADD
   CONSTRAINT [PK_RuntimeChanges] PRIMARY KEY NONCLUSTERED
   (
        [FormName]
      , [UserName]
   ) WITH FILLFACTOR = 90
GO

DROP PROCEDURE #DropStat
GO

