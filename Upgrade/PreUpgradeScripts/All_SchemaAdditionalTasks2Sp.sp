SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.SchemaAdditionalTasks2Sp') IS NOT NULL
   DROP PROCEDURE dbo.SchemaAdditionalTasks2Sp
GO

/* $Header: ApplicationDB\Stored Procedures\SchemaAdditionalTasks2Sp.sp 10.1.0.1 03/30/2018 14:27:37 */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/SchemaAdditionalTasks2Sp.sp $
 *
 * CoreDev 6 MGD-423 DJohnson Wed Sep 23 30 2020
 * MGD-423 - Added code for non-MultiSite tables to add rows in AppTable, with a flag that says whether to do it.
 *
 * CoreDev 5 RS7966 Mmarsolo Fri Mar 10 11:48:05 2017
 * RS7966 - Call TriggerIupCodeWrapperSp for tables passed into sp.
 *
 * CoreDev 4 206055 Mmarsolo Tue Jan 19 14:13:20 2016
 * Need ability to Skip View Generation when calling SchemaAdditionalTasks2Sp
 * 206055 - Add parameter to allow view generation logic to be skipped.
 *
 * CoreDev 3 204651 Mmarsolo Mon Nov 30 14:46:02 2015
 * Fix SchemaAdditionalTasks2Sp table select to only include _mst tables.
 * 204651 - Add where clause to only select _mst tables.
 *
 * CoreDev 2 203975 Mmarsolo Mon Nov 02 14:27:45 2015
 * Need to set parameter in loop to NULL in SchemaAdditionalTasks2Sp
 * 203975 - Set AppTableRowPointer = NULL in loop so it resets for each table.
 *
 * CoreDev 1 203775 Jray Tue Oct 27 13:13:16 2015
 * New Sp to call within schema changes to perform additional tasks, as applicable
 * Issue 203775: New Sp to call within schema changes to perform additional tasks, as applicable.
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE [dbo].[SchemaAdditionalTasks2Sp] (
     @PStartingTable TableNameType
   , @PEndingTable TableNameType
   , @Infobar InfobarType OUTPUT
   , @PModuleName AppModuleType = NULL
   , @PSiteColumnName ColumnNameType = NULL
   , @PUpdate_AllWhen LongListType = NULL
   , @PUpdateRecordDateWhen LongListType = NULL 
   , @PIgnoreInsert ListYesNoType = 0
   , @PIgnoreUpdate ListYesNoType = 0
   , @PDisallowUpdate ListYesNoType = 0
   , @PKeepClusteringKeys ListYesNoType = 0
   , @PUseRPOnInsert ListYesNoType = 0
   , @PUseRPOnUpdate ListYesNoType = 0
   , @PIupTriggerModifiesNewRows ListYesNoType = 0
   , @PRememberIdentity ListYesNoType = 0
   , @PRegisterNewKey ListYesNoType = 0
   , @PTestOutsideLockForNewKey ListYesNoType = 0
   , @PNextKeyReverseKeyOrder ListYesNoType = 0
   , @PInheritorTableList LongListType = NULL
   , @PSkipViewGen ListYesNoType = 0
   , @PSkipTriggerGen ListYesNoType = 0
   , @AddAppTableRow ListYesNoType = 0
   )
AS
-- Check for existence of Generic External Touch Point routine 
IF OBJECT_ID(N'dbo.EXTGEN_SchemaAdditionalTasks2Sp') IS NOT NULL  
BEGIN  
   DECLARE @EXTGEN_SpName sysname  
   SET @EXTGEN_SpName = N'dbo.EXTGEN_SchemaAdditionalTasks2Sp'  
   -- Invoke the ETP routine, passing in (and out) this routine's parameters: 
   EXEC @EXTGEN_SpName
        @PStartingTable
      , @PEndingTable
      , @Infobar
      , @PModuleName
      , @PSiteColumnName
      , @PUpdate_AllWhen
      , @PUpdateRecordDateWhen
      , @PIgnoreInsert
      , @PIgnoreUpdate
      , @PDisallowUpdate
      , @PKeepClusteringKeys
      , @PUseRPOnInsert
      , @PUseRPOnUpdate
      , @PIupTriggerModifiesNewRows
      , @PRememberIdentity
      , @PRegisterNewKey
      , @PTestOutsideLockForNewKey
      , @PNextKeyReverseKeyOrder
      , @PInheritorTableList
      , @PSkipViewGen
      , @PSkipTriggerGen
      , @AddAppTableRow

   -- ETP routine must take over all desired functionality of this standard routine: 
   RETURN 0 
END 
-- End of Generic External Touch Point code

DECLARE
   @Severity INT = 0
 , @MultiSiteTableName ObjectNameType
 , @DatabaseSchema ObjectNameType = N'dbo'
 , @SitePartitionScheme NVARCHAR(11) = N'SitePScheme'
 , @SitePSchemeExists ListYesNoType
 , @AppViewName ObjectNameType
 , @TablesProcessed INT
 , @AppTableRowPointer RowPointerType
 , @IncludeSiteRefFilter ListYesNoType
 , @NonMultiSiteTableName ObjectNameType

SET @SitePSchemeExists = dbo.SitePartitionSchemeExists(@SitePartitionScheme)

SELECT TABLE_NAME
INTO #SchemaTables
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME BETWEEN @PStartingTable AND @PEndingTable
  AND TABLE_TYPE = 'BASE TABLE'
  AND TABLE_NAME like '%[_]mst%'
ORDER BY TABLE_NAME

SELECT TOP 1 @MultiSiteTableName = TABLE_NAME
FROM #SchemaTables
WHILE @MultiSiteTableName IS NOT NULL
BEGIN

   SET @AppTableRowPointer = NULL

   SELECT @AppTableRowPointer = RowPointer
   FROM AppTable 
   WHERE TableName = @MultiSiteTableName

   IF @AppTableRowPointer IS NULL
   BEGIN
      SET @AppViewName = REPLACE(@MultiSiteTableName, N'_mst', '')

      IF @PSiteColumnName IS NULL
      BEGIN
      SELECT @PSiteColumnName = COLUMN_NAME 
      FROM INFORMATION_SCHEMA.COLUMNS
      WHERE TABLE_NAME = @MultiSiteTableName
        AND (COLUMN_NAME = N'SiteRef' OR COLUMN_NAME = N'site_ref')
      END

      INSERT INTO AppTable (TableName, Update_AllWhen, UpdateRecordDateWhen, IgnoreInsert, IgnoreUpdate, DisallowUpdate, KeepClusteringKeys,
         UseRPOnInsert, UseRPOnUpdate, IupTriggerModifiesNewRows, RememberIdentity, RegisterNewKey, TestOutsideLockForNewKey, 
         NextKeyReverseKeyOrder, InheritorTableList, ModuleName, AppViewName, SiteColumnName)
      VALUES (@MultiSiteTableName, @PUpdate_AllWhen, @PUpdateRecordDateWhen, @PIgnoreInsert, @PIgnoreUpdate, @PDisallowUpdate, @PKeepClusteringKeys,
        @PUseRPOnInsert, @PUseRPOnUpdate, @PIupTriggerModifiesNewRows, @PRememberIdentity, @PRegisterNewKey, @PTestOutsideLockForNewKey, 
        @PNextKeyReverseKeyOrder, @PInheritorTableList, @PModuleName, @AppViewName, @PSiteColumnName)

      IF @SitePSchemeExists = 1 AND @MultiSiteTableName NOT LIKE N'%_all'
      BEGIN
         EXEC @Severity = [dbo].[PartitionTableSp]
           @PTableName = @MultiSiteTableName
          ,@PDatabaseSchema = @DatabaseSchema
          ,@PSitePartitionScheme = @SitePartitionScheme
          ,@PSitePartitioningColumn = @PSiteColumnName
          ,@Infobar = @Infobar OUTPUT

         IF @Severity <> 0
            RETURN @Severity
      END
   END

   SET @MultiSiteTableName = (SELECT TOP 1 TABLE_NAME 
                              FROM #SchemaTables
                              WHERE TABLE_NAME > @MultiSiteTableName)
END

IF @AddAppTableRow = 1
BEGIN
   SELECT TABLE_NAME
   INTO #NonMultiSiteSchemaTables
   FROM INFORMATION_SCHEMA.TABLES
   WHERE TABLE_NAME BETWEEN @PStartingTable AND @PEndingTable
     AND TABLE_TYPE = 'BASE TABLE'
     AND TABLE_NAME NOT LIKE '%[_]mst%'
   ORDER BY TABLE_NAME

   SELECT TOP 1 @NonMultiSiteTableName = TABLE_NAME
   FROM #NonMultiSiteSchemaTables

   SET @AppViewName = NULL
   SET @PSiteColumnName = NULL

   WHILE @NonMultiSiteTableName IS NOT NULL
   BEGIN
      IF NOT EXISTS(SELECT TableName FROM AppTable WHERE TableName = @NonMultiSiteTableName)
      BEGIN
         INSERT INTO AppTable (TableName, Update_AllWhen, UpdateRecordDateWhen, IgnoreInsert, IgnoreUpdate, DisallowUpdate, KeepClusteringKeys,
           UseRPOnInsert, UseRPOnUpdate, IupTriggerModifiesNewRows, RememberIdentity, RegisterNewKey, TestOutsideLockForNewKey, 
           NextKeyReverseKeyOrder, InheritorTableList, ModuleName, AppViewName, SiteColumnName)
         VALUES (@NonMultiSiteTableName, @PUpdate_AllWhen, @PUpdateRecordDateWhen, @PIgnoreInsert, @PIgnoreUpdate, @PDisallowUpdate, @PKeepClusteringKeys,
           @PUseRPOnInsert, @PUseRPOnUpdate, @PIupTriggerModifiesNewRows, @PRememberIdentity, @PRegisterNewKey, @PTestOutsideLockForNewKey, 
           @PNextKeyReverseKeyOrder, @PInheritorTableList, @PModuleName, @AppViewName, @PSiteColumnName)
   END

   SET @NonMultiSiteTableName = (SELECT TOP 1 TABLE_NAME
      FROM #NonMultiSiteSchemaTables
      WHERE TABLE_NAME > @NonMultiSiteTableName)
   END
END

IF @PSkipViewGen = 0
BEGIN
   EXECUTE @Severity = [dbo].[CreateViewsOverMultiSiteTabsSp] 
      @PStartingTable
    , @PEndingTable
    , @Infobar OUTPUT

   IF @Severity <> 0
      RETURN @Severity
END

IF @PSkipTriggerGen = 0
BEGIN
   EXECUTE @Severity = [dbo].[TriggerIupCodeWrapperSp]
     @StartingTableName = @PStartingTable
   , @EndingTableName = @PEndingTable
   , @Infobar = @Infobar OUTPUT

   IF @Severity <> 0
      RETURN @Severity
END

RETURN @Severity

GO
