--============================================================================================
--============================================================================================
--Note: Each application database will be upgraded independently

--Upgrade:

--  Verify Database Recovery Mode is Simple
--  Determine Site of Database to upgrade

--1. Store List of Original Tables that will be converted to Multi-Site Tables
--  a. A hardcoded list of tables will be used as a basis

--2. Capture Foreign Key Constraints for Set of Multi-Site Tables
--   referencing Original Tables that will be converted to Multi-Site Tables

--3. Drop all Foreign Key Constraints referencing Original Tables that will be converted to Multi-Site Tables

--4. Loop through List of Original Tables to be converted to Multi-Site Tables 
--  a. Exec Sp to Convert Single Original Table to Multi-Site Table passing in Original Table
--    i. Generate and Exec dynamic sql script(s) to create new Multi-Site (*_mst/*_mst_all) Table
--       with new site_ref column using Original Table as basis
--      1. Columns
--         a. This would include any uet columns as well
--      2. Default Constraints
--      3. Check Constraints
--      4. Primary Key Constraint
--      5. Unique Key Constraints
--      6. Non-Unique Indexes
--      7. Full-Text Index
--    ii. Copy data from Original Table to new Multi-Site (_mst) Table for all non '_all' tables
--   iii. Drop Original Table
--    iv. Create view, using RegenerateSiteViewSp, over the new Multi-Site table
--      1. This requires AppTable to have TableName populated with the appropriate Multi-Site table and the
--         following 2 new columns, AppViewName and SiteColumnName, also correctly populated
-- End Loop

--The following steps need to be performed after this script is executed
-- From VSS scripts,(Re)Create All Foreign Key Constraints on Multi-Site Tables referencing other Tables
-- From VSS scripts,(Re)Create All Foreign Key Constraints referencing Multi-Site Tables
-- From VSS scripts, Create *Iup, *Del, and *PreDel triggers
--   Dependent upon triggers being updated to reflect the Multi-Site Table names
-- Generate *Insert and *UpdatePenultimate triggers
--   Dependent upon updated Application Metadata
-- Repopulate _all Tables using Update _All Table Utility logic

--============================================================================================
--============================================================================================

DECLARE
   @Severity INT = 0
 , @Infobar InfobarType = NULL
 , @OrigDatabaseRecoveryMode NVARCHAR(MAX)
 , @DatabaseName ObjectNameType
 , @DatabaseSchema ObjectNameType = N'dbo'
 , @Site SiteType
 , @OrigTableName ObjectNameType
 , @ReferencedObject ObjectNameType
 , @FKConstraintName NVARCHAR(MAX)
 , @SQL NVARCHAR(MAX)
 , @SiteColumn ColumnNameType
 , @FullTextIndexString NVARCHAR(MAX) = NULL
 , @NonApplicationErrorMessage NVARCHAR(MAX) = NULL

SET @DatabaseName = DB_NAME()

----============================================================================================
----============================================================================================

----Verify Database Recovery Mode and set to 'Simple' if not already set to 'Simple'============

SET @OrigDatabaseRecoveryMode = CAST(DATABASEPROPERTYEX(@DatabaseName,'RECOVERY') AS NVARCHAR(MAX)) 

IF DATABASEPROPERTYEX(@DatabaseName, 'RECOVERY') <> N'Simple'
BEGIN
   SET @SQL = N'ALTER DATABASE ' + @DatabaseName + N' SET RECOVERY SIMPLE'
   EXEC sp_executesql @SQL
END

----============================================================================================
----============================================================================================

---- Determine Site of Database to upgrade======================================================
IF EXISTS(SELECT 1 FROM sysobjects so
                WHERE so.xtype in ('U') AND so.id = object_id(N'parms_mst'))
                   SELECT TOP 1 @Site = [site] FROM [dbo].[parms_mst]
             ELSE
                SELECT TOP 1 @Site = [site] FROM [dbo].[parms]

IF @Site IS NULL
BEGIN
   SET @Infobar= N'Database ''site'' not found!'
   RAISERROR(@Infobar, 0, 1) WITH NOWAIT
END

----============================================================================================
----============================================================================================

---- Store List of Original Tables that will be converted to Multi-Site Tables

IF EXISTS(SELECT 1 FROM tempdb.dbo.sysobjects o 
WHERE o.xtype in ('U') AND o.id = object_id(N'tempdb.dbo.#TableToBeConvertedToMultiSiteTable'))
DROP TABLE #TableToBeConvertedToMultiSiteTable;

CREATE TABLE #TableToBeConvertedToMultiSiteTable(
   [TableName] NVARCHAR (128) NOT NULL
)

INSERT INTO #TableToBeConvertedToMultiSiteTable
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES IST
   WHERE 1 = 1
     AND IST.TABLE_TYPE = N'BASE TABLE'
     AND IST.TABLE_NAME IN (
    N'parms', N'parms_all', N'AccountAuthorizations', N'ActiveBGTasks', N'BGTaskHistory',
    N'EventGlobalConstant', N'EventQueue', N'EventTrigger', N'EventTriggerParameter', N'NextKeys', N'QueuedEvent',
    N'ReplicatedRows3', N'ReplicatedRowsErrors', N'ReportOptions', N'ShadowValuesErrors',
    N'UserGroupMap'
   )

----============================================================================================
----============================================================================================

IF EXISTS(SELECT 1 FROM tempdb.dbo.sysobjects o 
WHERE o.xtype in (N'U') AND o.id = object_id(N'tempdb.dbo.#TableConstraint'))
DROP TABLE #TableConstraint;

CREATE TABLE #TableConstraint(
   [ObjectID] [bigint] NULL
 , [ConstraintCatalog] [nvarchar](100) NULL
 , [ConstraintSchema] [nvarchar](100) NULL
 , [ConstraintName] [nvarchar](100) NULL
 , [TableCatalog] [nvarchar](100) NULL
 , [TableSchema] [nvarchar](100) NULL
 , [TableName] [nvarchar](100) NULL
 , [ConstraintType] [nvarchar](100) NULL
 , [IsDeferrable] [nchar](10) NULL
 , [InitiallyDeferrable] [nchar](10) NULL
 , [ColumnName] [nvarchar](100) NULL
 , [OrdinalPosition] [int] NULL
 , [TypeDesc] [nvarchar](100) NULL
 , [IsUnique] [nvarchar](50) NULL
 , [IsUniqueConstraint] [nvarchar](50) NULL
 , [ParentObjectID] [bigint] NULL
 , [ParentObject] [nvarchar](100) NULL
 , [ReferenceObjectID] [bigint] NULL
 , [ReferenceObject] [nvarchar](100) NULL
 , [ReferenceColumnID] [bigint] NULL
 , [ReferenceColumn] [nvarchar](100) NULL
)

----============================================================================================
----============================================================================================

---- Capture Foreign Key Constraints for Set of Multi-Site Tables

TRUNCATE TABLE #TableConstraint

INSERT INTO #TableConstraint (
   ObjectID
 , ConstraintCatalog
 , ConstraintSchema
 , ConstraintName
 , TableCatalog
 , TableSchema
 , TableName
 , ConstraintType
 , IsDeferrable
 , InitiallyDeferrable
 , ColumnName
 , OrdinalPosition
 , TypeDesc
 , ParentObjectID
 , ParentObject
 , ReferenceObjectID
 , ReferenceObject
 , ReferenceColumnID
 , ReferenceColumn)
(SELECT Distinct SO.Object_ID
 , ISTC.Constraint_Catalog
 , ISTC.Constraint_Schema
 , ISTC.Constraint_Name
 , ISTC.Table_Catalog
 , ISTC.Table_Schema
 , ISTC.Table_Name
 , ISTC.Constraint_Type
 , ISTC.Is_Deferrable
 , ISTC.Initially_Deferred
 , ISKC.Column_Name
 , ISKC.Ordinal_Position 
 , si.type_desc 
 , so.parent_object_id
 , po.name AS ParentObject
 , sfk.referenced_object_id
 , ro.name AS ReferenceObject
 , sc.colid
 , sc.name AS Ref_column
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS ISTC
   INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE ISKC ON ISKC.CONSTRAINT_NAME = ISTC.CONSTRAINT_NAME 
      AND ISKC.CONSTRAINT_CATALOG = ISTC.CONSTRAINT_CATALOG
      AND ISKC.TABLE_NAME =ISTC.TABLE_NAME
   INNER JOIN sys.objects so ON so.name = ISTC.CONSTRAINT_NAME 
   LEFT JOIN sys.indexes si ON si.name = ISTC.CONSTRAINT_NAME 
   LEFT JOIN sys.foreign_keys sfk ON sfk.object_id = so.object_id
   LEFT JOIN (SELECT name, object_id from sys.objects) po ON po.OBJECT_ID = so.parent_object_id
   LEFT JOIN (SELECT name, object_id from sys.objects) ro ON ro.OBJECT_ID = sfk.referenced_object_id
   --LEFT JOIN sys.foreign_key_columns FKC ON FKC.referenced_object_id = SFK.referenced_object_id
   LEFT JOIN SYSCOLUMNS SC ON SC.id = SFK.referenced_object_id AND SC.name = ISKC.Column_Name --AND SC.colid = FKC.referenced_column_id 
   WHERE ISTC.CONSTRAINT_CATALOG = @DatabaseName AND ISTC.CONSTRAINT_SCHEMA = @DatabaseSchema
     AND ro.name IN (SELECT TableName FROM #TableToBeConvertedToMultiSiteTable)) --Any FK Constraints referencing any Multi-Site Tables

----============================================================================================
----============================================================================================

---- Drop all Foreign Key Constraints referencing Original Tables that will be converted to Multi-Site Tables
---- Note: Look into doing this using INFORMATION_SCHEMA which would eliminate need for temp table and logic to populate temp table

SET @SQL = ''

DECLARE [GetFKRefs] CURSOR LOCAL STATIC FOR
   SELECT 
      DISTINCT (ConstraintName)
    , TableName
    , ReferenceObject
   FROM #TableConstraint
   WHERE 1 = 1
     AND ConstraintType = N'FOREIGN KEY'
     AND ReferenceObject IN (SELECT TableName FROM #TableToBeConvertedToMultiSiteTable)
   ORDER BY [TableName]

OPEN [GetFKRefs]
FETCH NEXT FROM [GetFKRefs] INTO @FKConstraintName, @OrigTableName, @ReferencedObject 
WHILE @@FETCH_STATUS = 0
BEGIN
   IF EXISTS (SELECT 1 FROM sys.foreign_keys 
      WHERE name = (@FKConstraintName) 
        AND referenced_object_id = OBJECT_ID(@ReferencedObject))
   BEGIN
      SELECT @SQL = N'ALTER TABLE ' + @OrigTableName + N' DROP CONSTRAINT [' + @FKConstraintName + '];'
      EXEC sp_executesql @SQL
   END
   FETCH NEXT FROM [GetFKRefs] INTO @FKConstraintName, @OrigTableName, @ReferencedObject
END
CLOSE [GetFKRefs]
DEALLOCATE [GetFKRefs] 

----============================================================================================
----============================================================================================

----Loop through List of Original Tables to be converted to Multi-Site Tables 
----And call routine to convert Original Table to Multi-Site Table

DECLARE OriginalTableToConvertCrs CURSOR LOCAL STATIC FOR
   SELECT TableName From #TableToBeConvertedToMultiSiteTable
      WHERE NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES IST
                           WHERE 1 = 1
                             AND IST.TABLE_TYPE = 'BASE TABLE'
                             AND IST.TABLE_NAME =
                                CASE
                                   WHEN TableName LIKE '%[_]all' THEN
                                      REPLACE(TableName, N'_all', N'_mst_all')
                                   ELSE
                                      TableName + N'_mst'
                                END)

OPEN OriginalTableToConvertCrs
FETCH NEXT FROM OriginalTableToConvertCrs INTO @OrigTableName
WHILE @@FETCH_STATUS = 0
BEGIN

   SELECT @SiteColumn = SiteColumnName FROM AppTable
      WHERE TableName = CASE
                           WHEN @OrigTableName LIKE '%[_]all' THEN
                              REPLACE(@OrigTableName, N'_all', N'_mst_all')
                           ELSE
                              @OrigTableName + N'_mst'
                        END

   BEGIN TRY
      BEGIN TRANSACTION
      IF @OrigTableName = N'parms'
      BEGIN
         EXECUTE @Severity = [dbo].[MG8.00_ConvertParmsTableToMultiSiteTableSp] 
            @DatabaseName
          , @DatabaseSchema
          , @OrigTableName
          , @Site
          , @SiteColumn
          , @FullTextIndexString OUTPUT
          , @Infobar OUTPUT
      END
      ELSE
      BEGIN
         EXECUTE @Severity = [dbo].[ConvertTableToMultiSiteTableSp] 
            @DatabaseName
          , @DatabaseSchema
          , @OrigTableName
          , @Site
          , @SiteColumn
          , @FullTextIndexString OUTPUT
          , @Infobar OUTPUT
      END    
      IF @Severity != 0
      BEGIN
         SET @NonApplicationErrorMessage = N'Error Processing Table: ' + @OrigTableName + N'; ERROR: ' + @Infobar
         RAISERROR(@NonApplicationErrorMessage, 16, 1) WITH NOWAIT
      END
      COMMIT TRANSACTION
      IF @FullTextIndexString IS NOT NULL
      BEGIN
         EXEC sp_executesql @FullTextIndexString
         SET @FullTextIndexString = NULL
      END
   END TRY
   BEGIN CATCH
      -- Test XACT_STATE for 1 or -1.
      -- XACT_STATE = 0 means there is no transaction and
      -- a commit or rollback operation would generate an error.

      IF (XACT_STATE()) <> 0
         ROLLBACK TRANSACTION

      IF @Severity = 0 --not an application error so need to display error number, message, and current table being processed
      BEGIN
         SET @NonApplicationErrorMessage = N'Error Processing Table: ' + @OrigTableName + N'; ERROR: ' + CAST(ERROR_NUMBER() AS NVARCHAR(MAX)) + ' ' + ERROR_MESSAGE()
         RAISERROR(@NonApplicationErrorMessage, 16, 1) WITH NOWAIT
      END
   END CATCH

   FETCH NEXT FROM OriginalTableToConvertCrs INTO @OrigTableName
END

CLOSE OriginalTableToConvertCrs
DEALLOCATE OriginalTableToConvertCrs

----============================================================================================
----============================================================================================

----Set Database Recovery Mode back to original mode  ==========================================

SET @SQL = N'ALTER DATABASE ' + @DatabaseName + N' SET RECOVERY ' + @OrigDatabaseRecoveryMode
EXEC sp_executesql @SQL

----============================================================================================
----============================================================================================
GO

--Drop Conversion-Use-Only Sps
IF OBJECT_ID('dbo.[MG8.00_ConvertParmsTableToMultiSiteTableSp]') IS NOT NULL
   DROP PROCEDURE dbo.[MG8.00_ConvertParmsTableToMultiSiteTableSp]
GO
IF OBJECT_ID('dbo.[MG8.00_RegenerateSiteViewForParmsSp]') IS NOT NULL
    DROP PROCEDURE dbo.[MG8.00_RegenerateSiteViewForParmsSp]
GO