SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.PartitionDatabaseForSiteSp') IS NOT NULL
   DROP PROCEDURE dbo.PartitionDatabaseForSiteSp
GO

/* $Header: ApplicationDB\Stored Procedures\PartitionDatabaseForSiteSp.sp 10.1.0.1 03/30/2018 14:27:36 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/PartitionDatabaseForSiteSp.sp $
 *
 * CoreDev 4 248405 DJohnson Thu Oct 04
 * Add dbo. schema to path where missing.
 *
 * Core90310 3 RS8175 Nthurn Thu Nov 09 09:00:53 2017
 * Added an optional parameter for re-entrant Migration calls.  (RS8175)
 *
 * CoreDev 2 RS5905 Jray Fri May 31 09:39:00 2013
 * RS5905: Uncomment code that modifies Site Partition Function if it exists
 *
 * CoreDev 1 RS5905 Jray Thu May 16 16:08:09 2013
 * RS5905: Sp that will handle partitioning a database for a specified Site
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.PartitionDatabaseForSiteSp (
  @PSite SiteType = NULL
  , @SingleSiteDatabase bit = 0   -- Migration passes 1 here to avoid re-entry
)
AS
BEGIN
-- Check for existence of Generic External Touch Point routine 
IF OBJECT_ID(N'dbo.EXTGEN_PartitionDatabaseForSiteSp') IS NOT NULL  
BEGIN  
   DECLARE @EXTGEN_SpName sysname  
   SET @EXTGEN_SpName = N'dbo.EXTGEN_PartitionDatabaseForSiteSp'  
   -- Invoke the ETP routine, passing in (and out) this routine's parameters: 
   EXEC @EXTGEN_SpName
        @PSite  
      , @SingleSiteDatabase
   -- ETP routine must take over all desired functionality of this standard routine: 
   RETURN 0 
END 
-- End of Generic External Touch Point code

DECLARE
   @Severity INT = 0
 , @REMessage NVARCHAR(MAX)
 , @ShowMessages TINYINT = 0
 , @NeedToDropAndRecreateFKs ListYesNoType = 0
 , @FKDropCode NVARCHAR(MAX)
 , @FKAddCode NVARCHAR(MAX)
 , @Table TableNameType
 , @TableToPartition TableNameType
 , @DatabaseSchema ObjectNameType = N'dbo'
 , @SitePartitionFunction NVARCHAR(13) = N'SitePFunction'
 , @SitePartitionScheme NVARCHAR(11) = N'SitePScheme'
 , @SitePartitioningColumn ColumnNameType
 , @Infobar InfobarType = NULL
 , @ErrorMessage NVARCHAR(MAX) = NULL
 , @SitePFunctionExists ListYesNoType = 0
 , @SitePSchemeExists ListYesNoType = 0

SET @SitePFunctionExists = dbo.SitePartitionFunctionExists(@SitePartitionFunction)
SET @SitePSchemeExists = dbo.SitePartitionSchemeExists(@SitePartitionScheme)

IF @SitePFunctionExists + @SitePSchemeExists > 0 AND @SingleSiteDatabase = 1
   RETURN

-- A non-existent Site Partition Scheme is being used as an indicator
-- that the multi-site tables need to be changed to use the Site Partition Scheme
SET @NeedToDropAndRecreateFKs = CASE
                                   WHEN @SitePSchemeExists = 0 THEN 1
                                   ELSE 0
                                END

IF @NeedToDropAndRecreateFKs = 1
BEGIN
   SET @REMessage=N'BEGIN: Drop Foreign Keys for Multi-Site Tables'
   IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

   -- Capture Drop and Create statements for Foreign-Keys referencing non-'_all', Multi-Site Tables
   DECLARE @FKTable TABLE (
      TableName   SYSNAME
    , DROPLine    NVARCHAR(MAX)
    , ADDLine     NVARCHAR(MAX)
    , PRIMARY KEY (TableName)
   )

   DECLARE FKCrs CURSOR LOCAL STATIC FOR
   SELECT DISTINCT
      TABLE_NAME
   FROM INFORMATION_SCHEMA.TABLES IST
   WHERE IST.TABLE_TYPE = 'BASE TABLE'
     AND IST.TABLE_NAME LIKE '%[_]mst'

   OPEN FKCrs
   FETCH FKCrs INTO @Table

   WHILE @@FETCH_STATUS = 0
   BEGIN

      SET @FKDropCode  = NULL
      SET @FKAddCode   = NULL
      EXEC dbo.FKOneSp
         @Table = @Table
       , @FKDropCode = @FKDropCode OUTPUT
       , @FKAddCode = @FKAddCode OUTPUT
       , @IncludeNOCHECKForAdd = 1

      INSERT INTO @FKTable (
         TableName
       , DROPLine
       , ADDLine
      )
      VALUES(
         @Table
       , @FKDropCode
       , @FKAddCode
      )

      FETCH FKCrs INTO @Table

      IF @@FETCH_STATUS = -1
         BREAK
   END
   CLOSE FKCrs
   DEALLOCATE FKCrs

   --SET @REMessage=N'BEGIN: Drop Foreign Keys for Multi-Site Tables'
   --IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT
   
   -- Drop Foreign-Keys referencing non-'_all', Multi-Site Tables
   DECLARE FKCrs CURSOR LOCAL STATIC FOR
   SELECT TableName, DROPLine
     FROM @FKTable

   OPEN FKCrs
   FETCH FKCrs INTO @Table, @FKDropCode

   WHILE @@FETCH_STATUS = 0
   BEGIN
      IF @FKDropCode IS NOT NULL
      BEGIN
         SET @REMessage=N'Drop FKs Code for: ' + @Table
         IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT
         SET @REMessage=@FKDropCode
         IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

         EXEC sys.sp_executesql @FKDropCode
      END

      FETCH FKCrs INTO @Table, @FKDropCode

      IF @@FETCH_STATUS = -1
         BREAK
   END
   CLOSE FKCrs
   DEALLOCATE FKCrs

   SET @REMessage=N'END: Drop Foreign Keys for Multi-Site Tables'
   IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

END

--If partition function does not exist
IF @SitePFunctionExists = 0 
BEGIN
   
   EXECUTE @Severity = [dbo].[MaintainSitePartitionFunctionAndSchemeSp] 
      @PSite = @PSite
    , @PAddSite = 1

   SET @SitePSchemeExists = dbo.SitePartitionSchemeExists(@SitePartitionScheme)
   
   --Cursor through list of partitionable tables and exec dbo.PartitionTableSp
   --IF EXISTS (SELECT * FROM sys.partition_schemes WHERE name = @SitePartitionScheme)
   IF @SitePSchemeExists = 1
   BEGIN
      DECLARE PartitionableTableCrs CURSOR LOCAL STATIC FOR
         SELECT IST.TABLE_NAME, AppTable.SiteColumnName From INFORMATION_SCHEMA.TABLES IST
         INNER JOIN AppTable ON AppTable.TableName = IST.TABLE_NAME
            WHERE 1 = 1
              AND IST.TABLE_NAME LIKE '%[_]mst'
         ORDER BY IST.TABLE_NAME

      OPEN PartitionableTableCrs
      FETCH NEXT FROM PartitionableTableCrs INTO @TableToPartition, @SitePartitioningColumn
      WHILE @@FETCH_STATUS = 0
      BEGIN

      BEGIN TRY
         BEGIN TRANSACTION

            EXECUTE @Severity = [dbo].[PartitionTableSp] 
               @PTableName = @TableToPartition
              ,@PDatabaseSchema = @DatabaseSchema
              ,@PSitePartitionScheme = @SitePartitionScheme
              ,@PSitePartitioningColumn = @SitePartitioningColumn
              ,@Infobar = @Infobar OUTPUT

            IF @Severity != 0
            BEGIN
               SET @ErrorMessage = N'Error Processing Table: ' + @TableToPartition + N'; ERROR: ' + @Infobar
               RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT
            END
            COMMIT TRANSACTION
         END TRY
         BEGIN CATCH
         -- Test XACT_STATE for 1 or -1.
         -- XACT_STATE = 0 means there is no transaction and
         -- a commit or rollback operation would generate an error.

            IF (XACT_STATE()) <> 0
               ROLLBACK TRANSACTION

            IF @Severity = 0 --not an application error so need to display error number, message, and current table being processed
            BEGIN
               SET @ErrorMessage = N'Error Processing Table: ' + @TableToPartition + N'; ERROR: ' + CAST(ERROR_NUMBER() AS NVARCHAR(MAX)) + ' ' + ERROR_MESSAGE()
               RAISERROR(@ErrorMessage, 16, 1) WITH NOWAIT
            END
         END CATCH

         FETCH NEXT FROM PartitionableTableCrs INTO @TableToPartition, @SitePartitioningColumn
      END

      CLOSE PartitionableTableCrs
      DEALLOCATE PartitionableTableCrs
   END
END
ELSE --If partition function exists
BEGIN
   SET @REMessage=N'SitePartitionFunction exists; Modifying Site Partition Function'
   IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

   EXECUTE @Severity = [dbo].[MaintainSitePartitionFunctionAndSchemeSp] 
      @PSite = @PSite
    , @PAddSite = 1

END


IF @NeedToDropAndRecreateFKs = 1
BEGIN

   -- Recreate Foreign-Keys referencing non-'_all', Multi-Site Tables
   DECLARE FKCrs CURSOR LOCAL STATIC FOR
   SELECT
      TableName,
      ADDLine
   FROM @FKTable
   ORDER BY 1

   OPEN FKCrs
   FETCH FKCrs INTO @Table, @FKAddCode

   WHILE @@FETCH_STATUS = 0
   BEGIN
      IF @FKAddCode is NOT NULL
      BEGIN
         SET @REMessage=N'ADD FKs Code for: ' + @Table
         IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT
         SET @REMessage=@FKAddCode
         IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT

         EXEC sys.sp_executesql @FKAddCode
      END

      FETCH FKCrs INTO @Table, @FKAddCode

      IF @@FETCH_STATUS = -1
         BREAK
   END
   CLOSE FKCrs
   DEALLOCATE FKCrs

   SET @REMessage=N'Recreated Foreign Keys'
   IF @ShowMessages=1 RAISERROR(@REMessage, 0, 1) WITH NOWAIT
END

RETURN @Severity
END
GO

