SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.TriggerIupCodeSp') IS NOT NULL
   DROP PROCEDURE dbo.TriggerIupCodeSp
GO

--  This routine generates a result set containing the code lines to
-- insert/update on the input table name.  It outputs multiple trigger creates, separated
-- by a "GO" on a line by itself.

/* $Header: ApplicationDB\Stored Procedures\TriggerIupCodeSp.sp 10.9.0.0 03/30/2018 14:27:37 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/TriggerIupCodeSp.sp $
 * CoreDev 64 MGD-2916 - mjbuenaventura Thu Sep 9, 2021 - Conditionally include Site Reference column in WHERE clause if it's part of a unique index along with RowPointer column 
 * CoreDev 63 MGD-1396 - mjbuenaventura Thu Jan 14, 2021 - Time zone is not considered properly when selectively regenerating replication triggers
 * CoreDev 62 MGD-996 - harroyo Fri Dec 11, 2020 -Send Email for the current Object throws "Insert failed" error.
 * CoreDev 61 MGD-996 - johndou Tue Nov 11, 2020 - Quote a column name in TOP 1 statement in case it is a reserved word.
 * CoreDev 60 MGD-1007 - smarcial Tue Nov 10 - Paas - Send an attached document through email is throwing dialog "Error converting datatype varchar to numeric"
 * CoreDev 59 MGD-575 - smarcial Wed Oct 14 - AUTONUMBER raised error during save data from Form.
 * CoreDev 58 261437 - johndou Fri Apr 24 - Temp table was created twice.
 * CoreDev 57 258232 - johndou Tues Nov 19 - Need bt alias on shadow column inserts to avoid ambiguous column references.
 * CoreDev 56 257877 - johndou Tues Nov 5, 2019 - Order by on insert trigger code.
 *
 * CoreDev 55 257658 mjbuenaventura Tue Oct 29 2019 - Removed hard-coded 'site_ref' column and replace it with @SiteColumn to use site ref col name from AppTable
 * CoreDev 54 RS8357 mjbuenaventura Fri Aug 30 2019 - Optimize trigger generation for replication triggers.
 * CoreDev 53 254372 johndou Fri Jul 12 2019 - Order by on various insert/select statements.
 * CoreDev 52 254098 johndou Wed Jul 03 2019 - Do not change the input audit column values if SkipBase was set.
 * CoreDev 51 253316 johndou Tue May 28 2019 - Mysterious lost code.
 * CoreDev 50 252211 johndou Fri Apr 12 08:23:40 2010
 * Issue #252211 - Temp table collation update.
 *
 * CoreDev 49 250261 - DJohnson Thu Jan 10, 2018 - Handle period inside table name.
 * CoreDev 48 249696 - DJohnson Thu Dec 06, 2018 - Continue to use harded coded @SiteRef for _all table updates if no AppTable reference given.
 * CoreDev 47 249416 - DJohnson Mon Nov 11, 2018
 * CoreDev 46 249046 DJohnson Fri Nov 12 2018
 * site_ref was hard coded for _all tables instead of taken from AppTable
 *
 * CoreDev 45 248350 DJohnson Fri Oct 12 2018
 * If sharing tables, use master site not local site.
 *
 * CoreDev 44 248405 DJohnson Thu Oct 04 2018
 * Add dbo. schema to path where missing.
 *
 * Core 43 247178 johndou Aug 23 2018
 * Putting in the performance tweak to use readuncommitted on inserted table
 *
 * Core90310 42 232111 Pgross Wed Sep 27 16:33:55 2017
 * Regenerate Replication Triggers getting this message:  (130) - Replication Management Cannot declare more than 10,000 local variables
 *
 * CoreDev 41 227317 Djohnson Mon Apr 17 17:35:34 2017
 * UET fields for coitem_mst and coitem_mst_all tables are not kept in sync when adding a new record
 * Issue #227317 - add an APP_ routine extension call if it exists.
 *
 * CoreDev 40 144940 Nthurn Wed Jan 04 12:53:24 2017
 * ConnectionInformationInsert trigger could be optimized
 * Let ConnectionInformationInsert avoid calling dbo.UserNameSp()
 *    when CreatedBy/UpdatedBy are set on the new ConnectionInformation row.  (Issue 144940)
 *
 * CoreDev 39 218600 Djohnson Fri Nov 18 15:27:35 2016
 * Redesign form to maintain current function without risk of SQL injection.
 * Issue #218600 - new next key code validation to prevent sql injection attacks.
 *
 * CoreDev 38 221046 Djohnson Thu Oct 20 12:34:56 2016
 * How to apply Next Key feature to a column which is not a part of primary keys
 * Issue #221046 - make it possible to put  a next key generator on a non-primary key column.
 *
 * CoreDev 37 218539 Jray Thu Aug 18 16:48:16 2016
 * Errors When Generating Triggers
 * Issue 218539: backed out sql injection remediation changes for the following 2 AppTable columns:
 * Update_AllWhen
 * UpdateRecordDateWhen
 *
 * CoreDev 36 216047 Mmarsolo Fri Jul 22 15:26:14 2016
 * Remediate SQL Injection Risk for RC4 List
 * 216047 - SQL injection rememdiation, use QUOTENAME, REPLACE.
 *
 * CoreDev 35 212710 Djohnson Mon Jun 06 14:23:19 2016
 * AUTONUMBER column in next key generator causes HOLDLOCK to code to be generated, which leads to blocking.
 * Issue #212710 - holdlock on autonumber caused blocking.
 *
 * CoreDev 34 198839 Pgross Thu Aug 06 11:00:57 2015
 * Multi-Site Copy generates error "The Customer, Ship To combination entered already exists"
 *
 * CoreDev 33 191023 Djohnson Fri Mar 06 09:29:25 2015
 * Trace review of Unit Create with replication not establishing the configuration Comp_ID
 *
 * CoreDev 32 186958 Djohnson Tue Oct 28 17:30:48 2014
 * ambiguous column name 'site_ref' during Trigger Management run.
 * Issue #186958 - ambiguous site_ref in multi-database setup.
 *
 * CoreDev 31 185293 Djohnson Mon Sep 22 19:06:34 2014
 * Incident Quick Create created new incident with TBD number
 * Issue 185293 - handle _all inserts from base table that is not mst table so has no site ref.
 *
 * CoreDev 30 182934 Nthurn Mon Sep 08 15:08:33 2014
 * Unsuccessful run trigger management when tables exist outside "dbo" schema
 * Ignore tables outside "dbo" schema.  (Issue 182934)
 *
 * CoreDev 29 184317 Djohnson Thu Aug 28 11:52:01 2014
 * Error Message Does not Exist: Object: PK_country_mst_all type 17.
 *
 * CoreDev 28 179734 Djohnson Tue May 27 13:11:49 2014
 * Get Arithmetic Overflow error saving numeric serial numbers greater than 19 digits.
 * Issue #179734 - use string maniuplation to see if big strings contain all blanks and zeros to avoid huge number overflow errors.
 *
 * CoreDev 27 174764 Djohnson Tue Jan 28 14:57:54 2014
 * Incorrect syntax near 'CInsert'. in TriggerManagement
 * Issue #174764 - handle a table name with a blank in it.
 *
 * CoreDev 26 170897 Djohnson Mon Oct 28 09:54:52 2013
 * VISUAL IQM - MG9 Not including stored procedure call in generated triggers.
 * Issue #170897 - Set view name to table name if no AppTable record exists at all.
 *
 * CoreDev 25 169325 Djohnson Fri Oct 25 14:00:00 2013
 * Update _All Tables message on launch
 * Issue #169325 - Handle case where _all is not site split.
 *
 * CoreDev 24 169606 Djohnson Thu Sep 26 14:24:57 2013
 * TriggerManagement form is erroring on generation
 * Issue #169606 - tweak to @Site variable name to avoid duplicate variable.
 *
 * CoreDev 23 164031 Pgross Fri Aug 09 14:53:01 2013
 * Application Schema Columns Metadata does not allow constants as Prefixes
 * allow the NextKey prefix to be a literal string
 *
 * CoreDev 22 RS5905 Djohnson Thu Mar 28 10:49:30 2013
 * RS5905 - tweak to ignore replication of table without a specified site column to be ignored rather than throw an error.
 *
 * CoreDev 21 RS5905 Djohnson Fri Mar 08 14:31:15 2013
 * RS5905 - _all views are on base table if all non external sites are in the same db.
 *
 * CoreDev 20 158757 Djohnson Mon Mar 04 11:31:31 2013
 * Unable to create new lot manually with Prefix.
 * Issue #158757 - if next keys are used, join back to the back table when inserting to an _all table to get the newly generated next key.
 *
 * CoreDev 19 159244 Djohnson Thu Feb 28 12:04:50 2013
 * Trigger management generates "Insert" triggers calling SetNextKey with table name rather than view name
 * Issue #159244 - SetNextKey should pass the AppViewName instead of the table name so that the key is based on the view (per site) as opposed to the base table (per database).
 *
 * CoreDev 18 RS5905 Djohnson Mon Feb 04 14:32:27 2013
 * RS5905 - Intranet shared users processing.
 *
 * CoreDev 17 RS5905 Djohnson Wed Jan 09 11:27:40 2013
 * RS5905 - modify next keys to use view name instead of table name if it exists for the InsertNewKey code.
 *
 * CoreDev 16 RS5905 Djohnson Thu Dec 13 11:23:41 2012
 * RS5905
 *
 * CoreDev 15 153315 Bbai Tue Nov 27 01:04:07 2012
 * Usage of GetErrorMessageSp should be removed
 * Issue 153315:
 * Replace GetErrorMessageSp with MsgAppSp.
 *
 * CoreDev 14 122210 Nthurn Thu Oct 18 15:50:26 2012
 * When two or more lines are added to a PO or CO on which a suspend event handler is applied, only one line is saved when both lines are approved.
 * Allow Auto-numbering.  (Issue 122210)
 *
 * CoreDev 13 152562 Bcummings Wed Aug 29 16:28:32 2012
 * 4 Upgrade errors
 * 152562
 *
 * CoreDev 12 152562 Bcummings Wed Aug 29 16:15:41 2012
 * 4 Upgrade errors
 * 152562
 *
 * CoreDev 11 144720 Djohnson Tue Nov 08 11:23:48 2011
 * Trigger generation fails if generator is used and key columns have no user defined datatype
 * Issue #144720 - make a datatype if a user defined datatype is not on the key columns.
 *
 * CoreDev 10 138334 Gmalakar Tue Jul 12 14:48:16 2011
 * Trigger Management - error when processing a custom table with an Identity Column that does NOT use a User Defined Data Type: Incorrect syntax near keyword Set
 *  Issue: 138334
 *
 * CoreDev 9 rs4588 Dahn Mon Mar 08 08:29:59 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 8 116783 Nthurn Mon Jan 12 16:09:04 2009
 * Trigger Generation Code does not generate all the necessary code to support Next Key functionality in cases where there is no associated prefix parameter.
 * Initialize KeyLength even when there is no Default Prefix.  (Issue 116783)
 *
 * CoreDev 7 114652 Pgross Fri Oct 31 16:07:55 2008
 * Deadlocking reduction / Performance improvements for Job related forms/utilities
 * added READUNCOMMITTED to JOINs in generated code
 *
 * CoreDev 6 rs3953 Dahn Tue Aug 26 16:39:18 2008
 * changing copyright header (rs3953)
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.TriggerIupCodeSp (
   @TableName  SYSNAME
   )
AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_TriggerIupCodeSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_TriggerIupCodeSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      EXEC @EXTGEN_SpName
         @TableName
 
      -- ETP routine must take over all desired functionality of this standard routine:
      RETURN 0
   END
   -- End of Generic External Touch Point code.
 
SET NOCOUNT ON

-- Get correct case of this table's name:
SELECT @TableName = TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = @TableName

DECLARE
  @ReplicationInSameDb TABLE (
  SourceSite SiteType
, TargetSite SiteType
, SiteFilter NVARCHAR(MAX) )

DECLARE
  ReplicationInSameDbCrs CURSOR LOCAL STATIC FOR
SELECT
  SourceSite
, TargetSite
, SiteFilter
FROM @ReplicationInSameDb

DECLARE
  @ReplicationExists tinyint = 0
, @Infobar           InfobarType
, @SiteColumn        sysname
, @SiteView          sysname
, @FromSite          SiteType
, @ToSite            SiteType
, @Filter            FilterType
, @UseLocalsite      tinyint = 0
, @Severity           INT = 0
, @MasterSite        SiteType

SELECT @SiteColumn = SiteColumnName
 , @SiteView = ISNULL(AppViewName, TableName)
FROM AppTable
WHERE TableName = @TableName


-- In case there is no AppTable record at all.
IF @SiteView IS NULL
   SET @SiteView = @TableName

--  If it's a shared and processed shared user intranet table, then the local site is always to be used on insert.
SELECT @UseLocalSite = 1
, @MasterSite = itr.MasterSite
FROM Site
INNER JOIN IntranetSharedUserTable ist ON
  ist.IntranetName = site.intranet_name
INNER JOIN intranet itr ON
  itr.intranet_name = ist.IntranetName
WHERE Site.site = dbo.DefaultToLocalSite(NULL)
AND ist.Shared = 1
AND ist.Processed = 1
AND TableName = @TableName

DECLARE @SectionReplicationExists NVARCHAR(MAX) = N' NOT EXISTS (SELECT 1 FROM <Table> rt WHERE rt.<SiteColumn> = #repl.to_site'

DECLARE @DbName LongListType
SET @DbName = db_name()

INSERT INTO @ReplicationInSameDb (SourceSite, TargetSite, SiteFilter)
SELECT DISTINCT
   rr.source_site
,  rr.target_site
, dbo.ReplicationFilters(rr.source_site, rr.target_site, @TableName)
  FROM rep_rule AS rr
  INNER JOIN rep_object_category AS roc ON
    roc.category = rr.category
  AND roc.object_name =  @TableName
  AND roc.object_type = 1 -- Table
  AND roc.to_object_name = roc.object_name
  AND (roc.skip_insert = 0 or roc.skip_update = 0)
and roc.retain_site = 0
INNER JOIN site ON
  site.site = rr.target_site
INNER JOIN site site2 ON
  site2.site = rr.source_site
LEFT OUTER JOIN site_link_info AS sll ON
  sll.from_site = site2.site
AND sll.to_site = rr.target_site
WHERE site2.app_db_name = @DbName
and site.app_db_name = @DbName
IF @@ROWCOUNT > 0
BEGIN
   SET @ReplicationExists = 1


   -- Instead of an error when attempting to replicate a table with no site column into the same database, just don't do it.
   IF @SiteColumn IS NULL
   BEGIN
      SET @ReplicationExists = 0
      DELETE @ReplicationInSameDb
   END
   ELSE
   SELECT @SectionReplicationExists = @SectionReplicationExists + N' AND bt.' + QUOTENAME(COLUMN_NAME) + N' = rt.' + QUOTENAME(COLUMN_NAME)
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
   LEFT OUTER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
      ON kcu.TABLE_NAME = tc.TABLE_NAME
      AND kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
   WHERE tc.TABLE_NAME = @TableName
   AND tc.CONSTRAINT_TYPE = N'PRIMARY KEY'
   AND kcu.COLUMN_NAME != @SiteColumn
   SET @SectionReplicationExists = @SectionReplicationExists + N')'
END

-- Obtain trigger generation MetaData for this table:
DECLARE
   @IgnoreInsert BIT,
   @IgnoreUpdate BIT,
   @DisallowUpdate BIT,
   @KeepClusteringKeys BIT,
   @UseRPOnInsert BIT,
   @UseRPOnUpdate BIT,
   @IupModifiesInsertedRows BIT,
   @Update_AllWhen LongListType,
   @UpdateRecordDateWhen LongListType,
   @RememberIdentity BIT,
   @Update_AllRegardlessOfBaseTableChanges BIT,

   @AutoNumber BIT,
   @AutoNumberKey sysname,
   @AutoNumberIncrement BIGINT,
   @AutoNumberBase BIGINT,
   @AutoNumberTBDValue BIGINT,

   @AlphaKey sysname,
   @NextKeyGenerator LongListType,
   @NextKeyPrefix sysname,
   @NextKeyLength LongListType,
   @NextKeyAddlKeys LongListType,
   @NextKeyPartitionCondition LongListType,
   @NextKeyPreGenerate LongListType, -- Intentionally not loaded any longer.
   @NextKeyPostGenerate LongListType,
   @NextKeyReverseKeyOrder BIT,
   @RegisterNewKey BIT,
   @CheckOutsideLockIfNewKeyExists BIT,
   @RegisterNewKeyAddlParms LongListType

-- Non-MetaData flags:
DECLARE
   @CursorRequired BIT
   , @InsertNeedSeverityOrInfobar BIT
   , @UpdateNeedSeverityOrInfobar BIT

-- Flag defaults:
SET @IgnoreInsert = 0
SET @IgnoreUpdate = 0
SET @DisallowUpdate = 0
SET @KeepClusteringKeys = 0
SET @UseRPOnInsert = 0
SET @UseRPOnUpdate = 0
SET @IupModifiesInsertedRows = 0
SET @CursorRequired = 0
SET @AutoNumber = 0
SET @NextKeyReverseKeyOrder = 0
SET @RegisterNewKey = 0
SET @CheckOutsideLockIfNewKeyExists = 0
SET @Update_AllRegardlessOfBaseTableChanges = 0

-- Constants:
DECLARE @EmptyString nvarchar(1)
SET @EmptyString = N''
DECLARE @comma nchar(1)
SET @comma = N','
DECLARE @Period nchar(1)
SET @Period = N'.'
DECLARE @Space nchar(1)
SET @Space = N' '

DECLARE @OpenSquare nchar(1)
SET @OpenSquare = N'['

DECLARE @CloseSquare nchar(1)
SET @CloseSquare = N']'

declare @SingleQuote nchar(1)
set @SingleQuote = N''''

-- ===============================
-- SyteLine Schema characteristics:
DECLARE @AllTableName sysname
SET @AllTableName = @TableName + N'_all'

DECLARE @AllValuePrefix sysname
SET @AllValuePrefix = @TableName + @Period

-- Names of auditing columns:
DECLARE @ColumnWhenInserted sysname, @ColumnWhoInserted sysname, @ColumnWhenUpdated sysname, @ColumnWhoUpdated sysname, @ColumnUtcWhenUpdated sysname
SET @ColumnWhenInserted = N'CreateDate'
SET @ColumnWhoInserted =  N'CreatedBy'
SET @ColumnWhenUpdated =  N'RecordDate'
SET @ColumnWhoUpdated  =  N'UpdatedBy'
SET @ColumnUtcWhenUpdated = N'UtcRecordDate'

-- Values to assign to auditing columns:
DECLARE @AuditWhen sysname, @AuditWho sysname, @AuditUtcWhen sysname
SET @AuditWhen = N'@Today'
SET @AuditWho = N'@Username'
SET @AuditUtcWhen = N'@UtcToday'

-- Special case (see Issue 144940):
DECLARE @AllowExplicitAuditWhoInsert bit
SET @AllowExplicitAuditWhoInsert = CASE WHEN @TableName IN (N'ConnectionInformation')
   THEN 1 ELSE 0 END

-- Name of cross-site column:
DECLARE @ColumnSiteRef sysname
SET @ColumnSiteRef = N'site_ref'

-- Names of other Toolset columns:
DECLARE @ColumnRowPointer sysname, @ColumnNoteExistsFlag sysname
SET @ColumnRowPointer = N'RowPointer'
SET @ColumnNoteExistsFlag = N'NoteExistsFlag'

-- Suffix of Shadow-columns:
DECLARE @ShadowSuffix sysname
SET @ShadowSuffix = N'shadow'

-- ===============================


-- Accumulation string to hold any inconsistent or unrecognized MetaData,
-- for later printing in the generated triggers:
DECLARE @MetaDataError LongListType
SET @MetaDataError = @EmptyString
DECLARE @crlf nchar(2)
SET @crlf = CHAR(13) + CHAR(10)


SELECT
   -- Determine flags:
   @IgnoreInsert = IgnoreInsert,
   @IgnoreUpdate = IgnoreUpdate,
   @DisallowUpdate = DisallowUpdate,
   @KeepClusteringKeys = KeepClusteringKeys,
   @UseRPOnInsert = UseRPOnInsert,
   @UseRPOnUpdate = UseRPOnUpdate,
   @IupModifiesInsertedRows = IupTriggerModifiesNewRows,
   @RememberIdentity = RememberIdentity,
   @RegisterNewKey = RegisterNewKey,
   @CheckOutsideLockIfNewKeyExists = TestOutsideLockForNewKey,
   @NextKeyReverseKeyOrder = NextKeyReverseKeyOrder,
   @Update_AllRegardlessOfBaseTableChanges = Update_AllRegardlessOfBaseTableChanges,
   
   -- Determine who updates _all information:
   @Update_AllWhen = Update_AllWhen,
   
   -- Determine when to update the RecordDate column:
   @UpdateRecordDateWhen = UpdateRecordDateWhen
FROM AppTable
WHERE TableName = @TableName

IF @Update_AllWhen IS NOT NULL
BEGIN
   EXEC @Severity = dbo.MakeUpdateWhenSp
     @UpdateList = @Update_AllWhen
   , @UpdateCode = @Update_AllWhen OUTPUT
   , @Infobar    = @Infobar        OUTPUT
END

IF @Severity <> 0
   GOTO EXIT_FAIL

IF @UPdateRecordDateWhen IS NOT NULL
BEGIN
   EXEC @Severity = dbo.MakeUpdateWhenSp
     @UpdateList = @UpdateRecordDateWhen
   , @UpdateCode = @UpdateRecordDateWhen OUTPUT
   , @Infobar    = @Infobar              OUTPUT
END

IF @Severity <> 0
   GOTO EXIT_FAIL

-- Check for existence of Custom Post-Insert/Update Code Generation routine:
IF OBJECT_ID(N'dbo.TriggerIupCustomPostCodeSp') IS NOT NULL
BEGIN
   DECLARE @CustomPostCode_SpName sysname
   SET @CustomPostCode_SpName = N'dbo.TriggerIupCustomPostCodeSp'
   -- Invoke the Custom routine, passing in (and out) appropriate parameters:
   DECLARE @CustomPostInsertCode LongListType
   DECLARE @CustomPostUpdateCode LongListType
   EXEC @CustomPostCode_SpName
      @TableName = @TableName,
      @CustomPostInsertCode = @CustomPostInsertCode OUTPUT,
      @CustomPostUpdateCode = @CustomPostUpdateCode OUTPUT,
      @InsertNeedSeverityOrInfobar = @InsertNeedSeverityOrInfobar OUTPUT,
      @UpdateNeedSeverityOrInfobar = @UpdateNeedSeverityOrInfobar OUTPUT 

END

IF @ReplicationExists = 1
   SET @InsertNeedSeverityOrInfobar = 1

IF EXISTS(SELECT 1 FROM AppColumn WHERE TableName = @TableName)
BEGIN
   -- Determine AlphaKey parameters:
   SELECT
      @AlphaKey = ColumnName,
      @NextKeyGenerator = NextKeyGenerator,
      @NextKeyPrefix = NextKeyPrefix,
      @NextKeyLength = NextKeyLength,
      @NextKeyAddlKeys = NextKeyAddlKeys,
      @NextKeyPartitionCondition = NextKeyPartitionCondition,
      @NextKeyPostGenerate = NextKeyPostGenerate,
      @NextKeyPreGenerate = NextKeyPreGenerate,
      @RegisterNewKeyAddlParms = RegisterNewKeyAddlParms
   FROM AppColumn
   WHERE TableName = @TableName

   -- To prevent SQL Injection attacks, extra validation is done on these values.
   EXEC @Severity = dbo.ValidateNextKeyRecordSp
     @Prefix       = @NextKeyPrefix
   , @Generator    = @NextKeyGenerator
   , @Length       = @NextKeyLength
   , @PostGenerate = @NextKeyPostGenerate
   , @AddlParms    = @RegisterNewKeyAddlParms
   , @AddlKeys     = @NextKeyAddlKeys
   , @Partition    = @NextKeyPartitionCondition
   , @TableName    = @TableName
   , @Infobar      = @Infobar OUTPUT
   , @PreGenerate  = @NextKeyPreGenerate

   IF @Severity <> 0
      GOTO EXIT_FAIL
 
  --  If there is a next key generator, the select back to the base table for the key is always done.
   IF @NextKeyGenerator IS NOT NULL
      SET @IupModifiesInsertedRows = 1

   IF @NextKeyGenerator = N'AUTONUMBER'
   BEGIN
      SET @AutoNumber = 1
      SET @AutoNumberKey = @AlphaKey

      BEGIN TRY
         -- Auto-convert nvarchar to bigint:
         SET @AutoNumberIncrement = @NextKeyLength
      END TRY
      BEGIN CATCH
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  NextKeyLength Attribute: ' + @NextKeyLength + N' in MetaData for table: ' + @TableName + N', column: ' + @AutoNumberKey
            + N' cannot be converted to an increment for Auto Number.'
      END CATCH

      IF ISNULL(@AutoNumberIncrement, 0) = 0
         -- Default is 1
         SET @AutoNumberIncrement = 1

      BEGIN TRY
         -- Auto-convert nvarchar to bigint:
         SET @AutoNumberBase = @NextKeyPreGenerate
      END TRY
      BEGIN CATCH
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  NextKeyPreGenerate Attribute: ' + @NextKeyPreGenerate + N' in MetaData for table: ' + @TableName + N', column: ' + @AutoNumberKey
            + N' cannot be converted to a starting value for Auto Number.'
      END CATCH

      IF ISNULL(@AutoNumberBase, 0) = 0
         -- Default is 1
         SET @AutoNumberBase = 1

      BEGIN TRY
         -- Auto-convert nvarchar to bigint:
         SET @AutoNumberTBDValue = @NextKeyPrefix
      END TRY
      BEGIN CATCH
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  NextKeyPreGenerate Attribute: ' + @NextKeyPreGenerate + N' in MetaData for table: ' + @TableName + N', column: ' + @AutoNumberKey
            + N' cannot be converted to a TBD value for Auto Number.'
      END CATCH

      IF @AutoNumberTBDValue IS NULL
         -- Default is 0
         SET @AutoNumberTBDValue = 0

      SET @RegisterNewKey = 0
      SET @AlphaKey = NULL
      SET @NextKeyGenerator = NULL
      SET @NextKeyPrefix = NULL
   END
   ELSE
   BEGIN
      -- Prefix requires a generator!  (but not vice-versa -- see lot).
      IF @NextKeyGenerator IS NULL AND @NextKeyPrefix IS NOT NULL
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  Missing attribute NextKeyGenerator in MetaData for table: ' + @TableName + N', column: ' + @AlphaKey

      -- Each NextKeyPrefix must be of the form: table.column
      IF @NextKeyPrefix IS NOT NULL 
      AND NOT (
         dbo.NumEntries(@NextKeyPrefix, @comma) = 1 AND dbo.NumEntries(@NextKeyPrefix, @Period) = 2
         or dbo.NumEntries(@NextKeyPrefix, @SingleQuote) = 3 -- match something like:  'ST'
         OR dbo.NumEntries(@NextKeyPrefix, @comma) = 2
            AND dbo.NumEntries(dbo.ENTRY(1, @NextKeyPrefix, @comma), @Period) = 2
            AND dbo.NumEntries(dbo.ENTRY(2, @NextKeyPrefix, @comma), @Period) = 2
         )
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  Attribute NextKeyPrefix in MetaData for table: ' + @TableName + N', column: ' + @AlphaKey
            + N' must be of the form: table.column[,table.column]'

      -- Multiple Prefixes or Generators require a Partition Condition!
      IF (dbo.NumEntries(@NextKeyGenerator, @comma) > 1 AND dbo.ENTRY(1, @NextKeyGenerator, @comma) <> N'SetNextKeySp' AND CHARINDEX(@Space, @NextKeyGenerator) = 0
         OR dbo.NumEntries(@NextKeyPrefix, @comma) > 1)
      AND @NextKeyPartitionCondition IS NULL 
         SET @MetaDataError = @MetaDataError + @crlf
            + N'-- ERROR:  Missing attribute NextKeyPartitionCondition in MetaData for table: ' + @TableName + N', column: ' + @AlphaKey
   END
END

IF @RegisterNewKey = 1 AND @AlphaKey IS NULL
   -- Determine the Alpha Key of the table:
   SELECT @AlphaKey = kcu.COLUMN_NAME
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
   LEFT OUTER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
      ON kcu.TABLE_NAME = tc.TABLE_NAME
      AND kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
   WHERE tc.TABLE_NAME = @TableName
   AND tc.CONSTRAINT_TYPE = N'PRIMARY KEY'
   AND NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu2
      WHERE kcu2.TABLE_NAME = kcu.TABLE_NAME
      AND kcu2.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
      AND kcu2.ORDINAL_POSITION > kcu.ORDINAL_POSITION)

DECLARE @SpecialKey sysname
SET @SpecialKey = ISNULL(@AlphaKey, @AutoNumberKey)

-- Determine UDDT of the Special Key:
DECLARE @AlphaKeyDataType sysname
DECLARE @AlphaKeyBaseDataType sysname
IF @SpecialKey IS NOT NULL
BEGIN
   DECLARE @AlphaKeyOrdinalPosition INT 
   SELECT
      @AlphaKeyBaseDataType = dbo.DataTypeString(NULL, c.DATA_TYPE
         , c.CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE)
      , @AlphaKeyDataType = c.DOMAIN_NAME
      , @AlphaKeyOrdinalPosition = kcu.ORDINAL_POSITION
   FROM syscolumns AS sc
   INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c
      ON c.TABLE_NAME = @TableName
      AND c.COLUMN_NAME = sc.name
   LEFT OUTER JOIN (INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
   INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
      ON kcu.TABLE_NAME = @TableName
      AND kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
      AND kcu.COLUMN_NAME = @SpecialKey) ON 
	  tc.TABLE_NAME = @TableName
      AND tc.CONSTRAINT_TYPE = N'PRIMARY KEY'
   WHERE sc.id = OBJECT_ID(QUOTENAME(@TableName))
   AND sc.name = @SpecialKey

   -- Workaround lack of UDDT:
   IF @AlphaKeyDataType IS NULL
      SET @AlphaKeyDataType = @AlphaKeyBaseDataType

      
   -- Determine any Leading/Trailing Primary Keys of the table:
   DECLARE @NonAlphaKeys TABLE (
      ColumnID INT IDENTITY,
      ColumnName sysname,
      DataType sysname,
      BaseDataType sysname,
      KeySequence INT
      , PRIMARY KEY (ColumnID)
      )

   INSERT INTO @NonAlphaKeys (ColumnName, DataType, BaseDataType, KeySequence)
   SELECT
      kcu.COLUMN_NAME,
       dbo.DataTypeString(c.DOMAIN_NAME, c.DATA_TYPE
       , c.CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE)
       , dbo.DataTypeString(NULL, c.DATA_TYPE
         , c.CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE)
      , kcu.ORDINAL_POSITION
   FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
   INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
      ON kcu.TABLE_NAME = tc.TABLE_NAME
      AND kcu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME
   INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c
      ON c.TABLE_NAME = @TableName
      AND c.COLUMN_NAME = kcu.COLUMN_NAME
   WHERE tc.TABLE_NAME = @TableName
   AND tc.CONSTRAINT_TYPE = N'PRIMARY KEY'
   AND (
      @NextKeyReverseKeyOrder = 0 AND kcu.ORDINAL_POSITION < @AlphaKeyOrdinalPosition
      OR @NextKeyReverseKeyOrder = 1 AND kcu.ORDINAL_POSITION > @AlphaKeyOrdinalPosition
      )

   IF @NextKeyAddlKeys IS NOT NULL
   -- Determine any other columns required during AlphaKey generation/registration:
   INSERT INTO @NonAlphaKeys (ColumnName, DataType, BaseDataType)
   SELECT
      c.COLUMN_NAME,
      dbo.DataTypeString(c.DOMAIN_NAME, c.DATA_TYPE
       , c.CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE)
       , dbo.DataTypeString(NULL, c.DATA_TYPE
         , c.CHARACTER_MAXIMUM_LENGTH, c.NUMERIC_PRECISION, c.NUMERIC_SCALE)
   FROM INFORMATION_SCHEMA.COLUMNS AS c
   WHERE c.TABLE_NAME = @TableName
   AND dbo.IsInList(@NextKeyAddlKeys, c.COLUMN_NAME) = 1
   AND NOT EXISTS(SELECT 1 FROM @NonAlphaKeys
      WHERE ColumnName = c.COLUMN_NAME)
      
END
   
-- Debugging:  SELECT @IgnoreInsert, @IgnoreUpdate, @DisallowUpdate, @KeepClusteringKeys, @RegisterNewKey, @CheckOutsideLockIfNewKeyExists, @UseRPOnInsert, @UseRPOnUpdate, @IupModifiesInsertedRows, @AlphaKey, @NextKeyGenerator, @NextKeyPrefix, @AlphaKeyDataType, @AlphaKeyBaseDataType, @Update_AllWhen, @UpdateRecordDateWhen, @NextKeyPreGenerate, @NextKeyPostGenerate -- return

-- We can't do anything here for tables not residing in the "dbo" schema:
IF OBJECT_ID(QUOTENAME(@TableName)) IS NULL
   RETURN 0

-- Determine column information for this table:
DECLARE @Columns TABLE (
   ColumnID INT IDENTITY,
   ColumnIDIgnoringIdentityColumn INT,
   ColumnName     SYSNAME
   , IsClusteringKey bit
   , IsIdentity BIT
   , WasUpdatedInit nvarchar(4000) NULL 
   , InsertExpression nvarchar(4000) null
   , UpdateExpression nvarchar(4000) null
   , PRIMARY KEY (ColumnID)
   )

INSERT INTO @Columns (ColumnName, IsClusteringKey, IsIdentity)
SELECT
   sc.name,
   CASE WHEN EXISTS (select 1
      from sysindexes idx
      inner join sysindexkeys idk
         ON idk.id = idx.id
         AND idk.indid = idx.indid
         AND idk.colid = sc.colid
      where idx.id = sc.id
      and idx.indid = 1)
   THEN 1 ELSE 0 END
	   AS IsClusteringKey,
   COLUMNPROPERTY (sc.id , sc.name , N'IsIdentity')
      AS IsIdentity
FROM syscolumns AS sc
INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c
   ON c.TABLE_NAME = @TableName
   AND c.COLUMN_NAME = sc.name
WHERE sc.id = OBJECT_ID(QUOTENAME(@TableName))
-- You can't insert or update computed columns.
AND COLUMNPROPERTY (sc.id , sc.name , N'IsComputed') = 0
-- You can't insert or update timestamp datatype columns.
AND sc.xtype NOT IN ( TYPE_ID('timestamp') )
ORDER BY sc.colid


-- Determine the name of the Identity column:
DECLARE @IdentityColumn sysname
SELECT @IdentityColumn = ColumnName
FROM @Columns
WHERE IsIdentity = 1

IF @IdentityColumn IS NOT NULL
BEGIN
   -- We need separate identity numbering on this subset,
   -- so we're sure when we're on the "first" row during generation looping:
   DECLARE @NonIdentityColumns TABLE (
      ColumnID INT IDENTITY,
      ColumnName SYSNAME
      , PRIMARY KEY (ColumnID)
      )

   INSERT INTO @NonIdentityColumns (ColumnName)
   SELECT ColumnName FROM @Columns
   WHERE IsIdentity = 0

   DECLARE @IdentityColumnDataType sysname
   SELECT
      --@IdentityColumnDataType = c.DOMAIN_NAME
      @IdentityColumnDataType = dbo.DataTypeString(c.DOMAIN_NAME,c.DATA_TYPE,c.CHARACTER_MAXIMUM_LENGTH,c.NUMERIC_PRECISION,c.NUMERIC_SCALE)
   FROM INFORMATION_SCHEMA.COLUMNS AS c
   WHERE c.TABLE_NAME = @TableName
   AND c.COLUMN_NAME = @IdentityColumn

   -- It's too much trouble to maintain separate generation loops,
   -- so we'll slap the separate ID on the first table and use a CASE to check the proper one.
   UPDATE col
   SET ColumnIDIgnoringIdentityColumn = nicol.ColumnID
   FROM @Columns col
   INNER JOIN @NonIdentityColumns nicol
      ON nicol.ColumnName = col.ColumnName
END
ELSE
BEGIN 
   SET @RememberIdentity = 0

   UPDATE @Columns
   SET ColumnIDIgnoringIdentityColumn = ColumnID
END


-- If there is an associated _all (cross-site) table, determine column information for it too:
DECLARE @AllColumns TABLE (
   ColumnID INT IDENTITY,
   ColumnName     SYSNAME,
   iiColumnName   SYSNAME
   , PRIMARY KEY (ColumnID)
   )

-- If all the sites are in the same db, then _all tables are not populated or kept up to date.  If no site column is defined for this
-- table, override the all sites in same db check.
IF dbo.AllSitesSameDb() = 0 OR NOT EXISTS (SELECT 1
  FROM AppTable
  WHERE TableName = @TableName
  AND SiteColumnName IS NOT NULL)
BEGIN
INSERT INTO @AllColumns (ColumnName, iiColumnName)
SELECT
   sc.name
   , CASE WHEN @UseLocalSite = 1 AND sc.name = @SiteColumn THEN N'@LocalSite' ELSE
@AllValuePrefix + @OpenSquare + sc.name + @CloseSquare END
FROM syscolumns AS sc
INNER JOIN INFORMATION_SCHEMA.COLUMNS AS c
   ON c.TABLE_NAME = @AllTableName
   AND c.COLUMN_NAME = sc.name
WHERE sc.id = OBJECT_ID(QUOTENAME(@AllTableName))
-- Would we ever use computed columns in an _all table?
AND COLUMNPROPERTY (sc.id , sc.name , N'IsComputed') = 0
-- You can't insert or update timestamp datatype columns.
AND sc.xtype NOT IN ( TYPE_ID('timestamp') )
ORDER BY sc.colid
END
-- Value to assign to cross-site column:
DECLARE @SiteWhere sysname
SET @SiteWhere = N'@SiteMs'

--  If _all comes from _mst, use the base table site, otherwise use the local site.
IF EXISTS (SELECT 1
   FROM @AllColumns aa
   WHERE aa.ColumnName = @ColumnSiteRef)
AND EXISTS (SELECT 1
  FROM sys.columns sc
  WHERE sc.object_id = object_id(QUOTENAME(@TableName))
  AND sc.name = @ColumnSiteRef)
   SET @SiteWhere = @ColumnSiteRef


-- Replacement constants, used below in "mostly constant trigger-sections":

DECLARE @SiteColumnName SYSNAME = N'<SiteColumn>'
DECLARE @SiteName SYSNAME = N'<Site>'

DECLARE @ReplaceFromSite sysname = N'<FromSite>'

DECLARE @ReplaceToSite sysname = N'<ToSite>'

DECLARE @ReplaceTableName sysname
SET @ReplaceTableName = N'<Table>'

DECLARE @ReplaceViewName sysname
SET @ReplaceViewName = N'<TableView>'

DECLARE @ReplaceAllTableName sysname
SET @ReplaceAllTableName = N'<AllTable>'

DECLARE @ReplaceColumn sysname
SET @ReplaceColumn = N'<Column>'

DECLARE @ReplaceHungarianizedColumn sysname
SET @ReplaceHungarianizedColumn = N'<HungarianizedColumn>'

DECLARE @ReplaceDataType sysname
SET @ReplaceDataType = N'<DataType>'

DECLARE @ReplaceBaseDataType sysname
SET @ReplaceBaseDataType = N'<BaseDataType>'

DECLARE @ReplaceDefaultPrefixTable sysname
SET @ReplaceDefaultPrefixTable = N'<DefaultPrefixTable>'

DECLARE @ReplaceDefaultPrefixColumn sysname
SET @ReplaceDefaultPrefixColumn = N'<DefaultPrefixColumn>'

DECLARE @ReplaceDefaultPrefixColumnAlternate sysname
SET @ReplaceDefaultPrefixColumnAlternate = N'<DefaultPrefixColumnAlternate>'

DECLARE @ReplaceNextKeyGenerator sysname
SET @ReplaceNextKeyGenerator = N'<NextKeyGenerator>'

DECLARE @ReplaceAlphaKeyRegisterAddlParms sysname
SET @ReplaceAlphaKeyRegisterAddlParms = N'<AlphaKeyRegisterAddlParms>'

DECLARE @ReplaceGenerateDeclarations sysname
SET @ReplaceGenerateDeclarations = N'<GenerateDeclarations>'

DECLARE @ReplaceOtherKeyColumnDeclarations sysname
SET @ReplaceOtherKeyColumnDeclarations = N'<OtherKeyColumnDeclarations>'

DECLARE @ReplaceTBDValue sysname
SET @ReplaceTBDValue = N'<TBDValue>'

DECLARE @ReplaceAutoNumberBase sysname
SET @ReplaceAutoNumberBase = N'<AutoNumberBase>'

DECLARE @ReplaceAutoNumberIncrement sysname
SET @ReplaceAutoNumberIncrement = N'<AutoNumberIncrement>'


DECLARE @SectionWasUpdatedInit LongListType
SET @SectionWasUpdatedInit = N'   DECLARE @<Column>_WasUpdated BIT
   IF UPDATE ( <Column> )
      SET @<Column>_WasUpdated = 1
   ELSE
      SET @<Column>_WasUpdated = 0
'

-- Initialize Insert/UpdateExpression, and declaration/initialization of @<Column>WasUpdated variable, for Shadowed columns:
UPDATE c
SET
   InsertExpression = REPLACE(N'CASE WHEN (LEN(bt.<Column>) = 0 OR bt.<Column> <> bt.<Column>shadow) AND bt.<Column>shadow IS NOT NULL THEN bt.<Column>shadow ELSE bt.<Column> END', @ReplaceColumn, c.ColumnName)
   , UpdateExpression = REPLACE(REPLACE(N'CASE WHEN @<Column>shadow_WasUpdated = 1 AND @<Column>_WasUpdated = 0 THEN ISNULL(<Table>.<Column>shadow, N'''') ELSE <Table>.<Column> END', @ReplaceColumn, c.ColumnName), @ReplaceTableName, @TableName)
   , WasUpdatedInit = REPLACE(@SectionWasUpdatedInit, @ReplaceColumn, c.ColumnName)
FROM @Columns c
INNER JOIN @Columns sc ON sc.ColumnName = c.ColumnName + @ShadowSuffix


-- Initialize Insert/UpdateExpression, and declaration/initialization of @<Column>WasUpdated variable, for Shadow columns:
UPDATE sc
SET
   InsertExpression = REPLACE(N'CASE WHEN LEN(bt.<Column>) > 0 AND bt.<Column>shadow IS NULL THEN bt.<Column> ELSE bt.<Column>shadow END', @ReplaceColumn, c.ColumnName)
   , UpdateExpression = REPLACE(REPLACE(N'CASE WHEN @<Column>shadow_WasUpdated = 0 AND @<Column>_WasUpdated = 1 THEN CASE WHEN LEN(<Table>.<Column>) = 0 THEN NULL ELSE <Table>.<Column> END ELSE <Table>.<Column>shadow END', @ReplaceColumn, c.ColumnName), @ReplaceTableName, @TableName)
   , WasUpdatedInit = REPLACE(@SectionWasUpdatedInit, @ReplaceColumn, sc.ColumnName)
FROM @Columns c
INNER JOIN @Columns sc ON sc.ColumnName = c.ColumnName + @ShadowSuffix

IF @UseLocalSite = 1
   UPDATE c
   SET InsertExpression = '@LocalSite'
   FROM @Columns c
   WHERE c.ColumnName = @SiteColumn


-- Constant trigger-sections:
DECLARE @SectionGO LongListType
SET @SectionGO = N'GO'

DECLARE @SectionBEGIN LongListType
SET @SectionBEGIN = N'BEGIN'

DECLARE @SectionEND LongListType
SET @SectionEND = N'END'

DECLARE @SectionELSE LongListType
SET @SectionELSE = N'ELSE'

DECLARE @SectionRETURN LongListType
SET @SectionRETURN = N'RETURN'

DECLARE @SectionWhitespace LongListType
SET @SectionWhitespace = @EmptyString

DECLARE @SectionCheckRowcount LongListType
SET @SectionCheckRowcount = N'
   IF @@ROWCOUNT = 0 RETURN
   
'

DECLARE @SectionCheckRowcountSlow LongListType
SET @SectionCheckRowcountSlow = N'
   DECLARE @TRIGGER_ROW_COUNT int
   SET @TRIGGER_ROW_COUNT = @@ROWCOUNT
   IF @TRIGGER_ROW_COUNT = 0 RETURN
   
'

DECLARE @SectionSetNocount LongListType
SET @SectionSetNocount = N'
   SET NOCOUNT ON

'

DECLARE @SectionLocalSite LongListType = N'
   DECLARE @LocalSite SiteType = ''' + @MasterSite + N'''
'

DECLARE @SectionSkipBase LongListType
SET @SectionSkipBase = N'
   DECLARE @SkipBase ListYesNoType
   SET @SkipBase = dbo.SkipBaseTrigger()

'
   DECLARE @SectionWhen LongListType
SET @SectionWhen = N'
   DECLARE @Today DateType
   SET @Today = dbo.GetSiteDate(GETDATE())

'

DECLARE @SectionWho LongListType
SET @SectionWho = N'
   DECLARE @UserName LongListType
   SET @UserName = dbo.UserNameSp()

'
DECLARE @SectionWhoInsertConditional LongListType
SET @SectionWhoInsertConditional = N'
   DECLARE @UserName LongListType
   IF NOT UPDATE([' + @ColumnWhoInserted + ']) OR NOT UPDATE([' + @ColumnWhoUpdated + '])
      SET @UserName = dbo.UserNameSp()

'

DECLARE @SectionUtcWhen LongListType
SET @SectionUtcWhen = N'
   DECLARE @UtcToday DateType
   SET @UtcToday = GETUTCDATE()

'

DECLARE @Indent1 LongListType
SET @Indent1 = REPLICATE(@Space, 3)

DECLARE @Indent2 LongListType
SET @Indent2 = @Indent1 + @Indent1

DECLARE @Indent3 LongListType
SET @Indent3 = @Indent2 + @Indent1

DECLARE @Indent4 LongListType
SET @Indent4 = @Indent3 + @Indent1

DECLARE @SectionInitializeRP LongListType
SET @SectionInitializeRP = N'
-- Create an indexed copy of the affected rows'' RowPointers,
-- for faster joining to the affected rows:
DECLARE @RP TABLE (RowPointer uniqueidentifier PRIMARY KEY)
INSERT INTO @RP SELECT RowPointer FROM inserted WITH (READUNCOMMITTED)

'

DECLARE @SectionInitializeSite LongListType
SET @SectionInitializeSite = N'
   DECLARE @SiteMs SiteType
   SELECT @SiteMs = site
   FROM parms WITH (READUNCOMMITTED)
   WHERE parm_key = 0

'

DECLARE @SectionInsert_AllCondition LongListType
SET @SectionInsert_AllCondition = N'
IF dbo.SkipAllUpdate() = 0
'


-- See Issue 86119:
DECLARE @SectionAllowReplication LongListType
SET @SectionAllowReplication = N'
   -- Always fire Replication triggers for local Site''s <Table>_all, even when <Table> data came from a remote Site:
   EXEC dbo.SetTriggerStateSp 0, 1, 0, @SavedState OUTPUT, @Infobar OUTPUT

'

DECLARE @SectionAllowReplicationRestore LongListType
SET @SectionAllowReplicationRestore = N'

   -- Restore trigger state:
   EXEC dbo.RestoreTriggerStateSp 0, @SavedState, @Infobar OUTPUT
'

DECLARE @SectionReplicationSiteVars LongListType =
N'   DECLARE @<FromSite>To<ToSite> FlagNyType = dbo.TransactionalReplication(N''<FromSite>'', N''<ToSite>'', N''<Table>'', 1)'

DECLARE @SectionReplicationSetSite LongListType = 
N'

   EXEC dbo.DefineVariableSp
     @VariableName  = ''ReplInsteadOfInsert''
   , @VariableValue = ''1''
   , @Infobar = @Infobar OUTPUT

'

DECLARE @SectionReplicationUnSetSite LongListType = 
N'

   EXEC dbo.UndefineVariableSp
     @VariableName  = ''ReplInsteadOfInsert''
   , @Infobar = @Infobar OUTPUT

'

DECLARE @SectionSeverityInfobarInit LongListType
SET @SectionSeverityInfobarInit = N'
DECLARE @Severity INT = 0
DECLARE @Infobar InfobarType
DECLARE @SavedState LongListType

'

DECLARE @SectionSeverityCheck LongListType
SET @SectionSeverityCheck = N'
IF @Severity <> 0
BEGIN
   EXEC dbo.RaiseErrorSp @Infobar, @Severity, 1

   EXEC @Severity = dbo.RollbackTransactionSp @Severity

   IF @Severity <> 0
   BEGIN
      ROLLBACK TRANSACTION
      RETURN
   END
END

'

-- ================================
-- Mostly constant trigger-sections:

DECLARE @SectionInsertDrop LongListType
SET @SectionInsertDrop = N'
IF OBJECT_ID(N''dbo.'' + QUOTENAME(N''<Table>Insert'')) IS NOT NULL
   DROP TRIGGER dbo.' + QUOTENAME(N'<Table>Insert') + N'
'

DECLARE @SectionInsertCreate LongListType
SET @SectionInsertCreate = N'
CREATE TRIGGER ' + QUOTENAME(N'<Table>Insert') + N'
ON ' + QUOTENAME(N'<Table>') + N'
INSTEAD OF INSERT
AS
'


-- AlphaKey generation / AutoNumber
IF @NextKeyGenerator IS NOT NULL OR @RegisterNewKey = 1
OR @AutoNumber = 1
BEGIN
   DECLARE @SectionAlphaKeyDeclaration LongListType
   -- Assume <Column> is a well-behaved name, not requiring []:
   SET @SectionAlphaKeyDeclaration = N'
   @<Column> <DataType>
'
   DECLARE @SectionAlphaKeyDeclarations LongListType
   SET @SectionAlphaKeyDeclarations = N'
DECLARE'
   + @SectionAlphaKeyDeclaration

   DECLARE @SectionAlphaKeyGenerateDeclarations LongListType
   SET @SectionAlphaKeyGenerateDeclarations = N'
   , @DefaultPrefix <DataType>
   , @Prefix <DataType>
   , @KeyLength INT'

   DECLARE @SectionKeyGenerateDeclarations LongListType
   SET @SectionKeyGenerateDeclarations = N'
DECLARE
   @RowPointer RowPointerType<GenerateDeclarations>

DECLARE @NewKeys TABLE (
   -- Use unique names to simplify INSERT statement:
   New_RowPointer uniqueidentifier,
   New_<Column> <BaseDataType>,<OtherKeyColumnDeclarations>
   PRIMARY KEY (New_RowPointer)
   )

'

   IF @NextKeyGenerator IS NOT NULL
   BEGIN
      DECLARE @SectionAlphaKeyGenerateInitLength LongListType
      SET @SectionAlphaKeyGenerateInitLength = N'
SET @KeyLength = TYPEPROPERTY(N''<DataType>'', N''Precision'')

'
      IF @NextKeyLength IS NOT NULL 
         IF dbo.IsInteger(@NextKeyLength) = 1
            -- Just a constant:
            SET @SectionAlphaKeyGenerateInitLength = N'
SET @KeyLength = '
               + REPLACE(@NextKeyLength,N'''',N'''''')
               + '

'
         ELSE
         BEGIN
            -- A table.column (retrieved just like a prefix):
            SET @SectionAlphaKeyGenerateInitLength = N'
IF @KeyLength = 0 OR @KeyLength IS NULL'
               + @SectionAlphaKeyGenerateInitLength 

            DECLARE @LengthTable sysname
            DECLARE @LengthColumn sysname
            SET @LengthTable = dbo.ENTRY(1, @NextKeyLength, @Period)
            SET @LengthColumn = dbo.ENTRY(2, @NextKeyLength, @Period)

            -- We'll grab the value below, after we know whether it's in the same table as the Default Prefix:
            DECLARE @NeedKeyLengthRetrieval BIT
            SET @NeedKeyLengthRetrieval = 1
         END    
   END
   
   IF @NextKeyPrefix IS NOT NULL
   BEGIN
      DECLARE @SectionAlphaKeyGenerateInitPrefix LongListType
      if dbo.NumEntries(@NextKeyPrefix, @SingleQuote) = 3
         SET @SectionAlphaKeyGenerateInitPrefix = N'
SET @DefaultPrefix = <DefaultPrefixColumn>

'
      else
         SET @SectionAlphaKeyGenerateInitPrefix = N'
SELECT @DefaultPrefix = <DefaultPrefixColumn>
FROM <DefaultPrefixTable> WITH (READUNCOMMITTED)

'

      IF dbo.NumEntries(@NextKeyPrefix, @comma) > 1
      BEGIN
         DECLARE @NextKeyPrefixAlternate sysname
         SET @NextKeyPrefixAlternate = dbo.ENTRY(2, @NextKeyPrefix, @comma)
         SET @NextKeyPrefix = dbo.ENTRY(1, @NextKeyPrefix, @comma)

         DECLARE @DefaultPrefixTableAlternate sysname
         DECLARE @DefaultPrefixColumnAlternate sysname
         SET @DefaultPrefixTableAlternate = dbo.ENTRY(1, @NextKeyPrefixAlternate, @Period)
         SET @DefaultPrefixColumnAlternate = dbo.ENTRY(2, @NextKeyPrefixAlternate, @Period)

         -- Also define 2nd prefix variable:
         SET @SectionAlphaKeyGenerateDeclarations = REPLACE(
            @SectionAlphaKeyGenerateDeclarations,
            N'@DefaultPrefix <DataType>',
            N'@DefaultPrefix <DataType>, @DefaultPrefix2 <DataType>'
            )
      END
      
      DECLARE @DefaultPrefixTable sysname
      DECLARE @DefaultPrefixColumn sysname
      SET @DefaultPrefixTable = dbo.ENTRY(1, @NextKeyPrefix, @Period)
      SET @DefaultPrefixColumn = dbo.ENTRY(2, @NextKeyPrefix, @Period)

      IF @DefaultPrefixTableAlternate = @DefaultPrefixTable
         -- Also initialize 2nd prefix variable:
         SET @SectionAlphaKeyGenerateInitPrefix = REPLACE(
            @SectionAlphaKeyGenerateInitPrefix,
            N'@DefaultPrefix = <DefaultPrefixColumn>',
            N'@DefaultPrefix = <DefaultPrefixColumn>, @DefaultPrefix2 = <DefaultPrefixColumnAlternate>'
            )
      ELSE IF @DefaultPrefixTableAlternate <> @DefaultPrefixTable
      BEGIN
         DECLARE @SectionAlphaKeyGenerateInitPrefixAlternate LongListType
         SET @SectionAlphaKeyGenerateInitPrefixAlternate = REPLACE(
            @SectionAlphaKeyGenerateInitPrefix,
            N'@DefaultPrefix',
            N'@DefaultPrefix2'
            )
      END
      ELSE IF @NeedKeyLengthRetrieval = 1
      BEGIN
         IF @LengthTable = @DefaultPrefixTable
            -- Also initialize length variable:
            SET @SectionAlphaKeyGenerateInitPrefix = REPLACE(
               @SectionAlphaKeyGenerateInitPrefix,
               N'@DefaultPrefix = <DefaultPrefixColumn>',
               N'@DefaultPrefix = <DefaultPrefixColumn>, @KeyLength = ' + REPLACE(@LengthColumn,N'''',N'''''') 
               )
         ELSE
         -- Also initialize length variable:
         SET @SectionAlphaKeyGenerateInitLength = N'
SELECT @KeyLength = ' + REPLACE(@LengthColumn,N'''',N'''''') + N'
FROM ' + REPLACE(@LengthTable,N'''',N'''''') + N' WITH (READUNCOMMITTED)
'
               + @SectionAlphaKeyGenerateInitLength
      END
   END

   -- Flag special code to initialize @TRIGGER_ROW_COUNT
   SET @CursorRequired = 1

   -- Local Replacement keywords:
   DECLARE @ReplaceAssignColumn sysname, @ReplaceAssignRowPointer sysname
   SET @ReplaceAssignColumn = N'<AssignColumn>'
   SET @ReplaceAssignRowPointer = N'<AssignRowPointer>'

   DECLARE @SectionAlphaKeySelect LongListType
   IF @NextKeyGenerator IS NOT NULL
   OR @AutoNumber = 1
      SET @SectionAlphaKeySelect = N'
   SELECT <AssignColumn><Column>, <AssignRowPointer>RowPointer
'
   ELSE
      SET @SectionAlphaKeySelect = N'
   SELECT <AssignColumn><Column>
'

   DECLARE @SectionAlphaKeyFrom LongListType
   SET @SectionAlphaKeyFrom = N'
   FROM inserted bt WITH (READUNCOMMITTED)

'

   DECLARE @SectionAlphaKeyCursor LongListType
   SET @SectionAlphaKeyCursor = N'
IF @TRIGGER_ROW_COUNT > 1
BEGIN
   DECLARE AlphaKey CURSOR LOCAL STATIC READ_ONLY FOR'
      + replace(replace(@SectionAlphaKeySelect, @ReplaceAssignColumn, @EmptyString), @ReplaceAssignRowPointer, @EmptyString)


   DECLARE @SectionAlphaKeyOpen LongListType
   SET @SectionAlphaKeyOpen = N'
   OPEN AlphaKey
END

WHILE @Severity = 0
BEGIN
'

   SET @InsertNeedSeverityOrInfobar = 1

   DECLARE @SectionAlphaKeyFetch LongListType
   SET @SectionAlphaKeyFetch = N'
   IF @TRIGGER_ROW_COUNT > 1
   BEGIN
      FETCH AlphaKey INTO @<Column>, @RowPointer
'

   DECLARE @SectionAlphaKeyFetchSelect LongListType
   SET @SectionAlphaKeyFetchSelect = N'

      IF @@FETCH_STATUS = -1
         BREAK
   END
   ELSE'
      + replace(replace(@SectionAlphaKeySelect, @ReplaceAssignColumn, N'@<Column> = '), @ReplaceAssignRowPointer, N'@RowPointer = ')

   IF @NextKeyGenerator IS NULL
   AND @AutoNumber = 0
      SET @SectionAlphaKeyFetch = REPLACE(@SectionAlphaKeyFetch, N', @RowPointer', @EmptyString)

   DECLARE @SectionAlphaKeyGenerateParameters LongListType
   IF dbo.ENTRY(1, @NextKeyGenerator, @comma) = N'SetNextKeySp'
   BEGIN
      -- Special case for SetNextKeySp:
      SET @SectionAlphaKeyGenerateParameters = N'
 	    @TableName  = N''<TableView>''
	   , @ColumnName = N''<Column>''
	   , @Prefix     = @Prefix
	   , @KeyLength  = @KeyLength
	   , @Type       = ' + dbo.ENTRY(2, @NextKeyGenerator, @comma) + '
	   , @KeyStr     = @<Column> OUTPUT
	   , @Infobar    = @Infobar OUTPUT
'
      SET @NextKeyGenerator = dbo.ENTRY(1, @NextKeyGenerator, @comma)
   END
   ELSE
   IF CHARINDEX(@Space, @NextKeyGenerator) = 0
   BEGIN
      IF dbo.NumEntries(@NextKeyGenerator, @comma) > 1
      BEGIN
         DECLARE @NextKeyGeneratorAlternate sysname
         SET @NextKeyGeneratorAlternate = dbo.ENTRY(2, @NextKeyGenerator, @comma)
         SET @NextKeyGenerator = dbo.ENTRY(1, @NextKeyGenerator, @comma)
      END
      
      -- General case for most of Next*Sp:
      SET @SectionAlphaKeyGenerateParameters = N'
      @Context = NULL
      , @Prefix = @Prefix
      , @KeyLength = @KeyLength
      , @Key = @<Column> OUTPUT
      , @Infobar = @Infobar OUTPUT
'

      IF EXISTS(SELECT 1 FROM syscolumns parm
         INNER JOIN sysobjects sp ON sp.id = parm.id
         WHERE sp.name = @NextKeyGenerator
         AND parm.name = N'@PContext')
         -- Special case for NextWoSp, NextEjSp, NextSjbSp:
         SET @SectionAlphaKeyGenerateParameters = N'
      @PContext = NULL
      , @PPrefix = @Prefix
      , @PKeyLength = @KeyLength
      , @PKey = @<Column> OUTPUT
      , @Infobar = @Infobar OUTPUT
'

   END 
   ELSE
   BEGIN
      -- Special case: MetaData specifies all parameters:
      SET @SectionAlphaKeyGenerateParameters = @EmptyString
      -- Split each parameter out to its own line:
      -- Does not seem to work!
      --SET @NextKeyGenerator = REPLACE(@NextKeyGenerator, @comma, @crlf + @Indent2 + @comma)
   END
   
   DECLARE @SectionAlphaKeyPreGenerate LongListType
   SET @SectionAlphaKeyPreGenerate = N'
-- If <Column> is To Be Determined, or is a <Prefix> followed by question-mark,
IF @<Column> = N''TBD'' OR @<Column> LIKE N''%?''
-- Or is all zeroes:
OR dbo.IsInteger(@<Column>) = 1 AND REPLACE(REPLACE(@<Column>, '' '', ''''), ''0'', '''') = '''' 
BEGIN
   -- Generate (& register, if appropriate) a new key:
   SET @Prefix = ISNULL(dbo.StripPrefix(@<Column>), @DefaultPrefix)

'

   -- Handle alternate Prefix:
   IF @NextKeyPrefixAlternate IS NOT NULL
      SET @SectionAlphaKeyPreGenerate = REPLACE(
         @SectionAlphaKeyPreGenerate,
         N'@DefaultPrefix',
         N'CASE WHEN (' + REPLACE(REPLACE(@NextKeyPartitionCondition,N')',N'))'),N'(',N'((') + N') THEN @DefaultPrefix2 ELSE @Defaultprefix END'
         )

      
   DECLARE @SectionAlphaKeyGenerate LongListType
   SET @SectionAlphaKeyGenerate = N'
   EXEC @Severity = dbo.<NextKeyGenerator>'
      + REPLACE(@SectionAlphaKeyGenerateParameters, @ReplaceViewName, @SiteView)

   DECLARE @SectionAlphaKeyPostGenerate LongListType
   SET @SectionAlphaKeyPostGenerate = N'
   IF @Severity <> 0
      BREAK

   -- Remember it for insertion into the appropriate row below:
   INSERT INTO @NewKeys VALUES (@RowPointer, @<Column>)

   IF @TRIGGER_ROW_COUNT = 1 BREAK

   CONTINUE
END

'

   IF @NextKeyPrefix IS NULL
      SET @SectionAlphaKeyPreGenerate = REPLACE(REPLACE(@SectionAlphaKeyPreGenerate, N'ISNULL(', @EmptyString), N', @DefaultPrefix)', @EmptyString)
      
   DECLARE @SectionAlphaKeyRegister LongListType
   SET @SectionAlphaKeyRegister = N'
-- Register a new key:
EXEC @Severity = dbo.InsertNewKeySp
     @TableName  = N''<TableView>''
   , @ColumnName = N''<Column>''
   , @Key        = @<Column>
   , @Infobar    = @Infobar OUTPUT
   <AlphaKeyRegisterAddlParms>
'

   DECLARE @SectionAlphaKeyExitLoop LongListType
   SET @SectionAlphaKeyExitLoop = N'
IF @Severity <> 0 OR @TRIGGER_ROW_COUNT = 1
   BREAK
'

   DECLARE @AlphaKeyRegisterAddlParms LongListType
   IF @CheckOutsideLockIfNewKeyExists = 1
      SET @AlphaKeyRegisterAddlParms = N', @CheckOutsideLockIfExists = 1
'
   ELSE
   SET @AlphaKeyRegisterAddlParms = N''

   IF @RegisterNewKeyAddlParms IS NOT NULL
      SET @AlphaKeyRegisterAddlParms = @AlphaKeyRegisterAddlParms + N', ' + REPLACE(@RegisterNewKeyAddlParms,N'''',N'''''') + N'
'

   -- Debugging:  PRINT @AlphaKeyRegisterAddlParms

   DECLARE @SectionAlphaKeyClose LongListType
   SET @SectionAlphaKeyClose = N'
END

IF @TRIGGER_ROW_COUNT > 1
BEGIN
   CLOSE AlphaKey
   DEALLOCATE AlphaKey
END

'

   DECLARE @SectionAlphaKeyGenerateJoin LongListType
   SET @SectionAlphaKeyGenerateJoin = N'
   LEFT OUTER JOIN @NewKeys nk
      ON nk.New_RowPointer = bt.RowPointer
'

END

IF @AutoNumber = 1
BEGIN

DECLARE @SectionAutoNumberNullOrEmptyCheck LongListType
   SET @SectionAutoNumberNullOrEmptyCheck = N'
-- If <Column> is NULL or Empty:
IF  @<Column> IS NULL OR LEN(@<Column>) = 0
	SET @<Column> = 0

'

   DECLARE @SectionAutoNumberExistingRowCheck LongListType
   SET @SectionAutoNumberExistingRowCheck = N'
-- If <Column> is NOT To Be Determined:
IF @<Column> <> <TBDValue>
   -- Check for collision with existing row:
   IF EXISTS(SELECT 1 FROM ' + QUOTENAME(N'<Table>') + N' WITH (NOLOCK)
      WHERE '

   DECLARE @SectionAutoNumberExistingRowKeyCompare LongListType
   SET @SectionAutoNumberExistingRowKeyCompare = N'<Column> = @<Column>'

   DECLARE @SectionAutoNumberReservedRowCheck LongListType
   SET @SectionAutoNumberReservedRowCheck = @Indent2 + N')
   -- Check for collision with reserved row:
   OR EXISTS(SELECT 1 FROM @NewKeys nk
      WHERE '

   DECLARE @SectionAutoNumberReservedRowKeyCompare LongListType
   SET @SectionAutoNumberReservedRowKeyCompare = N'nk.New_<Column> = @<Column>'

   DECLARE @SectionAutoNumberCollision LongListType
   SET @SectionAutoNumberCollision = @Indent2 + N')
      -- Collision detected!  Treat as TBD:
      SET @<Column> = <TBDValue>

'

   DECLARE @SectionAutoNumberFindExistingLast LongListType
   SET @SectionAutoNumberFindExistingLast = REPLACE(REPLACE(N'
-- If <Column> IS To Be Determined:
IF @<Column> = <TBDValue>
BEGIN
   -- Default when no rows exist:
   SET @<Column> = <AutoNumberBase>
   -- Find the next unused value:
   SELECT TOP 1 @<Column> = <AutoNumberIncrement> + [<Column>]
   FROM ' + QUOTENAME(N'<Table>') + N' WITH (NOLOCK)'
      , @ReplaceAutoNumberBase, CAST(@AutoNumberBase AS nvarchar))
      , @ReplaceAutoNumberIncrement, CAST(@AutoNumberIncrement AS nvarchar))

   DECLARE @SectionAutoNumberReservedRowCheck2 LongListType
   SET @SectionAutoNumberReservedRowCheck2 = N'
   ORDER BY <Column> DESC
         
   IF EXISTS(SELECT 1 FROM @NewKeys nk
      WHERE '

   DECLARE @SectionAutoNumberFindReservedLast LongListType
   SET @SectionAutoNumberFindReservedLast = REPLACE(@Indent2 + N')
      SELECT TOP 1 @<Column> = <AutoNumberIncrement> + [New_<Column>]
      FROM @NewKeys nk'
      , @ReplaceAutoNumberIncrement, CAST(@AutoNumberIncrement AS nvarchar))

   DECLARE @SectionAutoNumberTBDEnd LongListType
   SET @SectionAutoNumberTBDEnd = N'
      ORDER BY New_<Column> DESC
END
'

   DECLARE @SectionAutoNumberRememberKey LongListType
   SET @SectionAutoNumberRememberKey = N'

-- Remember it for insertion into the appropriate row below:
INSERT INTO @NewKeys VALUES (@RowPointer, @<Column>'

   DECLARE @SectionAutoNumberEnd LongListType
   SET @SectionAutoNumberEnd = N'   )
'


END


DECLARE @SectionInsertIdentityCheck LongListType
SET @SectionInsertIdentityCheck = N'
   IF (SELECT TOP 1 [<Column>] FROM inserted WITH (READUNCOMMITTED)) = 0
'

DECLARE @SectionInsertIdentityComment LongListType
SET @SectionInsertIdentityComment = N'
      -- INSERT did not specify value(s) for the Identity column <Column>,
      -- so we let the database manager automatically generate values here.
'


DECLARE @SectionInsertInsert LongListType
SET @SectionInsertInsert = N'
   INSERT ' + QUOTENAME(N'<Table>') + N' (
'

DECLARE @SectionInsertSelect LongListType
SET @SectionInsertSelect = N'
      )
   SELECT
'

DECLARE @SectionInsertFrom LongListType
SET @SectionInsertFrom = N'
   FROM inserted bt WITH (READUNCOMMITTED)
'

DECLARE @SectionInsertIdentityRemember LongListType
SET @SectionInsertIdentityRemember = N'

   IF @TRIGGER_ROW_COUNT = 1
   AND dbo.SessionIdentityIsAwaited(N''<Table>'') = 1
   BEGIN
      -- Save last <Column> value for retrieval by the program doing this INSERT (via RetrieveSessionIdentitySp).
      DECLARE @Last_<Column> <DataType>
      SET @Last_<Column> = SCOPE_IDENTITY()
      EXEC dbo.RememberSessionIdentitySp
           @TableName = N''<Table>''
         , @Identity = @Last_<Column>
   END
'

DECLARE @SectionInsertIdentityElse LongListType
SET @SectionInsertIdentityElse = N'
   ELSE
      -- INSERT did specify value(s) for the Identity column <Column>.
      -- (Inserter must have already SET IDENTITY_INSERT correctly, to avoid error 544.)
'


DECLARE @SectionInsertAfter LongListType
SET @SectionInsertAfter = N'

   -- The AFTER INSERT Triggers fire now, in the following order:
   --   <Table>Iup First (if exists; manually maintained)
   --   <Table>InsAudit and/or any custom triggers (if exist; generated by AuditLoggingGenCodeSp and/or manually maintained)
   --   <Table>IupReplicate Last (if exists; generated by ReplicationTriggerIupCodeSp)

'


IF EXISTS(SELECT 1 FROM @AllColumns)
   SET @InsertNeedSeverityOrInfobar = 1   -- For SetTriggerStateSp call
   

DECLARE @SectionInsert_AllInsert LongListType
SET @SectionInsert_AllInsert = N'
   -- Any local changes for this site are duplicated in the _all table.
   INSERT INTO ' + QUOTENAME(N'<Table>_all') + N' (
'

DECLARE @SectionInsert_AllFromFast LongListType
SET @SectionInsert_AllFromFast = N'
   FROM inserted AS ' + QUOTENAME(N'<Table>') + N' WITH (READUNCOMMITTED)
   -- Since the <Table>Iup trigger has not modified the new rows after we inserted them above,
   -- our copy of the "inserted" data is still fresh.
   -- Therefore there is no need to access data from the new rows in the affected table.
'

DECLARE @CommentInsert_AllFromSlowDirtyReason LongListType
SET @CommentInsert_AllFromSlowDirtyReason = N'because the <Table>Iup trigger might have modified the new rows after we inserted them above,
   -- which would have rendered our copy of the "inserted" data dirty'

DECLARE @CommentInsert_AllFromSlowIdentityReason LongListType
SET @CommentInsert_AllFromSlowIdentityReason = N'because we need their newly generated Identity column values'

DECLARE @CommentInsert_AllFromSlowReason LongListType
IF @IupModifiesInsertedRows = 1 AND @IdentityColumn IS NOT NULL
   SET @CommentInsert_AllFromSlowReason = @CommentInsert_AllFromSlowIdentityReason + N',
   -- and '
   + @CommentInsert_AllFromSlowDirtyReason
ELSE
IF @IupModifiesInsertedRows = 1
   SET @CommentInsert_AllFromSlowReason = @CommentInsert_AllFromSlowDirtyReason
ELSE
IF @IdentityColumn IS NOT NULL
   SET @CommentInsert_AllFromSlowReason = @CommentInsert_AllFromSlowIdentityReason

DECLARE @SectionInsert_AllFromSlow LongListType
SET @SectionInsert_AllFromSlow = REPLACE(N'
   FROM inserted AS ii WITH (READUNCOMMITTED)
   -- Join back by RowPointer to the new rows in the affected table,
   -- <Reason>.
   INNER JOIN ' + QUOTENAME(N'<Table>') + N' WITH (READUNCOMMITTED) ON ' + QUOTENAME(N'<Table>') + N'.RowPointer = ii.RowPointer
'
   , N'<Reason>', @CommentInsert_AllFromSlowReason)


DECLARE @SectionInsert_AllFrom LongListType
IF @IupModifiesInsertedRows = 1
BEGIN
   IF @UseRPOnInsert = 1
   BEGIN
      DECLARE @NeedInitializeRPInsert bit
      SET @NeedInitializeRPInsert = 1
      SET @SectionInsert_AllFrom = REPLACE(@SectionInsert_AllFromSlow, N'FROM inserted WITH (READUNCOMMITTED)', N'FROM @RP')
   END
   ELSE
   SET @SectionInsert_AllFrom = @SectionInsert_AllFromSlow
END
ELSE
BEGIN
   SET @SectionInsert_AllFrom = @SectionInsert_AllFromFast

   DECLARE @SectionInsert_AllFromIdentityInsert LongListType
   IF @IdentityColumn IS NOT NULL
      SET @SectionInsert_AllFromIdentityInsert = @SectionInsert_AllFromSlow 
END

DECLARE @SectionUpdateDrop LongListType
SET @SectionUpdateDrop = N'
IF OBJECT_ID(N''dbo.'' + QUOTENAME(N''<Table>UpdatePenultimate'')) IS NOT NULL
   DROP TRIGGER dbo.' + QUOTENAME(N'<Table>UpdatePenultimate') + N'
'

DECLARE @SectionUpdateCreate LongListType
SET @SectionUpdateCreate = N'
CREATE TRIGGER ' + QUOTENAME(N'<Table>UpdatePenultimate') + N'
ON ' + QUOTENAME(N'<Table>') + N'
AFTER Update
AS
'

DECLARE @RowPointerIx SYSNAME,
        @SiteRefAndRpIx SYSNAME,
        @UseRpIx BIT = 1,
        @UseSiteRefAndRpIx BIT = 0

SELECT TOP 1 @RowPointerIx = ix1.name
FROM sys.indexes AS ix1
INNER JOIN sys.index_columns AS ic1
         ON ix1.object_id = ic1.object_id AND ix1.index_id = ic1.index_id
WHERE ix1.object_id = OBJECT_ID(@TableName) AND ix1.is_unique = 1 AND 
(SELECT COUNT(ic2.object_id)
        FROM sys.indexes AS ix2
        INNER JOIN sys.index_columns AS ic2
        ON ix2.object_id = ic2.object_id AND ix2.index_id = ic2.index_id
        WHERE ix2.name = ix1.name) = 1 -- Filters indexes that have 1 column.
AND COL_NAME(ic1.object_id, ic1.column_id) = 'RowPointer' -- Filters indexes that only have RowPointer column.

IF @SiteColumn IS NOT NULL AND (@RowPointerIx IS NULL OR LEN(@RowPointerIx) <= 0)
BEGIN
--Get index if there's any for RowPointer and SiteRef
SELECT TOP 1 @SiteRefAndRpIx = ix1.name
FROM sys.indexes AS ix1
INNER JOIN sys.index_columns AS ic1
         ON ix1.object_id = ic1.object_id AND ix1.index_id = ic1.index_id
WHERE ix1.object_id = OBJECT_ID(@TableName) AND ix1.is_unique = 1 AND 
(SELECT COUNT(ic2.object_id)
        FROM sys.indexes AS ix2
        INNER JOIN sys.index_columns AS ic2
        ON ix2.object_id = ic2.object_id AND ix2.index_id = ic2.index_id
        WHERE ix2.name = ix1.name) = 2 -- Filters indexes that have 2 columns.
AND COL_NAME(ic1.object_id, ic1.column_id) IN ('RowPointer', @SiteColumn) -- Filters indexes that contains the RowPointer and Site Reference columns.
GROUP BY ix1.name
HAVING COUNT(ix1.name) = 2 -- Filters index that contains both columns above.

IF @SiteRefAndRpIx IS NOT NULL AND LEN(@SiteRefAndRpIx) > 0
   BEGIN
      SET @UseSiteRefAndRpIx = 1
      SET @UseRpIx = 0
   END
END


DECLARE @SectionUpdateSkipFast LongListType
SET @SectionUpdateSkipFast = N'
IF TRIGGER_NESTLEVEL(OBJECT_ID(N''dbo.<Table>Iup'')) > 0
   RETURN
'


-- We need separate identity numbering on these subsets,
-- so we're sure when we're on the "first" row during generation looping:
DECLARE @UpdateAllColumns TABLE (
   ColumnID INT IDENTITY,
   ColumnName SYSNAME
   , PRIMARY KEY (ColumnID)
   )

INSERT INTO @UpdateAllColumns (ColumnName)
SELECT ColumnName FROM @AllColumns
-- NoteExistsFlag, UpdatedBy, RecordDate, or any non-Toolset column except site_ref:
WHERE ColumnName NOT IN (@ColumnSiteRef, @ColumnRowPointer, @ColumnWhoInserted, @ColumnWhenInserted)


DECLARE @UpdateAllColumnsCheckModification TABLE (
   ColumnID INT IDENTITY,
   ColumnName SYSNAME
   , PRIMARY KEY (ColumnID)
   )

INSERT INTO @UpdateAllColumnsCheckModification (ColumnName)
SELECT c.ColumnName
FROM @UpdateAllColumns uac
-- Exclude computed columns:
INNER JOIN @Columns c ON c.ColumnName = uac.ColumnName
-- All of the above except RecordDate:
WHERE uac.ColumnName NOT IN (@ColumnWhenUpdated)


DECLARE @SectionUpdateSkipSlow LongListType
IF EXISTS(SELECT 1 FROM @UpdateAllColumns)
BEGIN
   SET @SectionUpdateSkipSlow = N'
-- Skip trigger operations as required.
DECLARE @SkipBaseTrigger bit
SET @SkipBaseTrigger = dbo.SkipBaseTrigger()
IF @SkipBaseTrigger = 1 AND dbo.SkipAllUpdate() = 1
   RETURN

'
   DECLARE @SectionUpdateSkipSlow2 LongListType
   SET @SectionUpdateSkipSlow2 = N'
IF @SkipBaseTrigger = 1
   GOTO UPDATE_ALL

'
END
ELSE
   SET @SectionUpdateSkipSlow = N'
IF dbo.SkipBaseTrigger() = 1
   RETURN

'




IF @DisallowUpdate = 1
BEGIN
   SET @UpdateNeedSeverityOrInfobar = 1

   -- Do we need to provide more MetaData options here?
   DECLARE @SectionUpdateDisallow LongListType
   SET @SectionUpdateDisallow = N'
-- Disallow any Updates to rows in this table:
EXEC @Severity = dbo.MsgAppSp
                 @Infobar OUTPUT
                ,N''<Table>''

'

END


IF @KeepClusteringKeys = 1
BEGIN
   SET @UpdateNeedSeverityOrInfobar = 1

   -- Do we need to provide more MetaData options here?
   DECLARE @SectionUpdateKeepClusteringKey LongListType
   SET @SectionUpdateKeepClusteringKey = N'
-- Disallow Updates to Clustering key:
IF UPDATE ( <Column> )
   EXEC @Severity = dbo.MsgAppSp
                    @Infobar    OUTPUT
                   ,N''<HungarianizedColumn>''

'

END


DECLARE @UpdateAuditColumns TABLE (
   ColumnID INT IDENTITY,
   ColumnName SYSNAME
   , PRIMARY KEY (ColumnID)
   )

IF EXISTS(SELECT 1 FROM @Columns WHERE ColumnName = @ColumnRowPointer)
   INSERT INTO @UpdateAuditColumns (ColumnName)
   SELECT ColumnName FROM @Columns
   WHERE ColumnName IN (@ColumnWhenUpdated, @ColumnWhoUpdated, @ColumnUtcWhenUpdated)
   OR UpdateExpression IS NOT NULL
-- Else we have no way to join base table with inserted/@RP!

IF EXISTS(SELECT * FROM @UpdateAuditColumns)
BEGIN
   DECLARE @NeedWhoUpdate bit
   SET @NeedWhoUpdate = CASE WHEN EXISTS(SELECT * FROM @UpdateAuditColumns
      WHERE ColumnName = @ColumnWhoUpdated) THEN 1 ELSE 0 END

   DECLARE @NeedWhenUpdate bit
   SET @NeedWhenUpdate = CASE WHEN EXISTS(SELECT * FROM @UpdateAuditColumns
      WHERE ColumnName = @ColumnWhenUpdated) THEN 1 ELSE 0 END

   DECLARE @SectionUpdateUpdate LongListType
   SET @SectionUpdateUpdate = N'
UPDATE ' + QUOTENAME(N'<Table>') + N'
SET
'

   DECLARE @SectionUpdateAuditFromSlow LongListType
   SET @SectionUpdateAuditFromSlow = N'
FROM inserted AS ii WITH (READUNCOMMITTED)
WHERE ii.RowPointer = ' + QUOTENAME(N'<Table>') + N'.RowPointer
'

   IF @SiteColumn IS NOT NULL AND @UseSiteRefAndRpIx = 1
      SET @SectionUpdateAuditFromSlow = CONCAT(@SectionUpdateAuditFromSlow, N'AND ii.' + @SiteColumn + ' = ' + QUOTENAME(N'<Table>') + N'.' + @SiteColumn + N'
')

   SET @SectionUpdateAuditFromSlow = CONCAT(@SectionUpdateAuditFromSlow, 
N'
-- The other AFTER UPDATE Triggers fire now, in the following order:
--   <Table>Iup First (if exists; manually maintained)
--   <Table>UpdAudit and/or any custom triggers (if exist; generated by AuditLoggingGenCodeSp and/or manually maintained)
--   <Table>IupReplicate Last (if exists; generated by ReplicationTriggerIupCodeSp)
-- However, each of these immediately RETURNs without doing anything
-- after first checking "IF TRIGGER_NESTLEVEL(OBJECT_ID(N''dbo.<Table>UpdatePenultimate'')) > 0",
-- because indeed we (dbo.<Table>UpdatePenultimate) are currently on the call-stack.

')

   DECLARE @SectionUpdateAuditFrom LongListType
   IF @UseRPOnUpdate = 1
   BEGIN
      DECLARE @NeedInitializeRPUpdate bit
      SET @NeedInitializeRPUpdate = 1
      SET @SectionUpdateAuditFrom = REPLACE(@SectionUpdateAuditFromSlow, N'FROM inserted WITH (READUNCOMMITTED)', N'FROM @RP')
   END
   ELSE
   SET @SectionUpdateAuditFrom = @SectionUpdateAuditFromSlow
END


DECLARE @SectionUpdate_AllLabel LongListType
SET @SectionUpdate_AllLabel = N'
UPDATE_ALL:

'


IF EXISTS(SELECT 1 FROM @UpdateAllColumns)
   SET @UpdateNeedSeverityOrInfobar = 1   -- For SetTriggerStateSp call
   

DECLARE @NeedUpdate_AllCheck bit
IF @Update_AllRegardlessOfBaseTableChanges = 1
   -- Flag is set to indicate that the _all table UPDATE(<column>) check should be skipped.
   SET @NeedUpdate_AllCheck = 0
ELSE
   SET @NeedUpdate_AllCheck = CASE WHEN
      EXISTS(SELECT * FROM @Columns c
        WHERE NOT EXISTS(SELECT * FROM @AllColumns ac WHERE ac.ColumnName = c.ColumnName)
        )
         -- Some base columns are not in the _all table,
         -- so we could be in an UPDATE that would not affect the _all table.
         THEN 1
         -- All base columns are in the _all table,
         -- so every UPDATE affects the _all table.
         -- (Therefore, no need to check IF UPDATE(...) for every _all column.)
         ELSE 0
      END

DECLARE @SectionUpdate_AllPrelude LongListType
IF @NeedUpdate_AllCheck = 1
   SET @SectionUpdate_AllPrelude = N'
   -- Unless one or more cross-Site columns has been modified,
   -- there is no need to update the _all row(s).
'
ELSE IF @Update_AllRegardlessOfBaseTableChanges = 1
   SET @SectionUpdate_AllPrelude = N'
   -- For this table, we need to keep the _all rows RecordDate in synch
   -- with those of the base rows, for comparison with a former snapshot.
   -- Therefore we update the _all row(s) regardless of which columns changed.

'
ELSE
   SET @SectionUpdate_AllPrelude = N'
   -- Every base column is present in the _all table,
   -- so every UPDATE is guaranteed to require updating the _all rows.
   -- Therefore we do not waste time testing IF UPDATE(...) here.

'


IF EXISTS(SELECT 1 FROM @UpdateAllColumns WHERE ColumnName = @ColumnWhenUpdated)
   SET @NeedWhenUpdate = 1

-- For backward compatibility case where no AppTable record exists, continue to use the hard coded value.
DECLARE
  @TempSiteColumn SiteType= ISNULL(@SiteColumn, 'site_ref')

DECLARE @SectionUpdate_AllFromFast LongListType
SET @SectionUpdate_AllFromFast = N'
   FROM ' + QUOTENAME(N'<AllTable>') + N'
   INNER JOIN inserted AS ' + QUOTENAME(N'<Table>') + N' ON ' + QUOTENAME(N'<Table>') + N'.RowPointer = ' + QUOTENAME(N'<AllTable>') + N'.RowPointer' +
   (CASE WHEN @UseSiteRefAndRpIx = 1 THEN N' AND ' + QUOTENAME(N'<Table>') + N'.' + @TempSiteColumn + N' = ' + QUOTENAME(N'<AllTable>') + N'.' + @TempSiteColumn ELSE N'' END) + N'
   -- Since the <Table>Iup trigger has not re-modified the modified row(s) before this trigger began,
   -- our copy of the "inserted" data is still fresh.
   -- Therefore there is no need to access data from the modified row(s) in the <Table> table.
   WHERE <AllTable>.' + quotename(@TempSiteColumn) + ' = @SiteMs
'

DECLARE @CommentUpdate_AllFromSlowReason LongListType
SET @CommentUpdate_AllFromSlowReason = N'because the <Table>Iup trigger might have re-modified the same rows before this trigger began,
   -- which would have rendered our copy of the "inserted" data dirty.'

DECLARE @SectionUpdate_AllFromSlow LongListType
SET @SectionUpdate_AllFromSlow = REPLACE(N'
   FROM <AllTable>
   INNER JOIN inserted AS ii ON ii.RowPointer = <AllTable>.RowPointer '
   + (CASE WHEN @UseRPOnUpdate <> 1 AND @UseSiteRefAndRpIx = 1 THEN N'AND ii.' + @TempSiteColumn + N' = <AllTable>.' + @TempSiteColumn  ELSE N'' END)  +
   N'-- Join back by RowPointer to the modified rows in the affected table,
   -- <Reason>
   INNER JOIN ' + QUOTENAME(N'<Table>') + N' WITH (READUNCOMMITTED) ON ' + QUOTENAME(N'<Table>') + N'.RowPointer = ii.RowPointer '
   + (CASE WHEN @UseRPOnUpdate <> 1 AND @UseSiteRefAndRpIx = 1 THEN N'AND ' + QUOTENAME(N'<Table>') + N'.' + @TempSiteColumn + N' = ii.' + @TempSiteColumn + N' ' ELSE N' ' END)  +
   N'WHERE <AllTable>.' + quotename(@TempSiteColumn) + ' = @SiteMs'
   , N'<Reason>', @CommentUpdate_AllFromSlowReason)

DECLARE @SectionUpdate_AllFrom LongListType
DECLARE @Update_AllNeedsRP BIT 

IF @IupModifiesInsertedRows = 1
BEGIN
   IF @UseRPOnUpdate = 1
   BEGIN
      SET @NeedInitializeRPUpdate = 1
      SET @SectionUpdate_AllFrom = REPLACE(@SectionUpdate_AllFromSlow, N'JOIN inserted', N'JOIN @RP')
      SET @Update_AllNeedsRP = 1
   END
   ELSE
   BEGIN
      SET @SectionUpdate_AllFrom = @SectionUpdate_AllFromSlow
      SET @Update_AllNeedsRP = 0
   END    
END
ELSE
BEGIN 
   SET @SectionUpdate_AllFrom = @SectionUpdate_AllFromFast
   SET @Update_AllNeedsRP = 0
END


-- ===========
-- Holding table for built lines:
DECLARE @TriggerCode TABLE (
   LineNum  INT IDENTITY,
   CodeLine NVARCHAR(4000) NOT NULL
   )
DECLARE @ReplicationInserts TABLE (
  LineNum INT IDENTITY,
  CodeLine NVARCHAR(MAX) NOT NULL
  )
DECLARE
  @SaveLineIdx  INT
, @SaveLineIdx2 INT

-- Standard batch settings:
INSERT INTO @TriggerCode (CodeLine)
SELECT N'SET ANSI_NULLS ON'
INSERT INTO @TriggerCode (CodeLine)
SELECT @SectionGO
INSERT INTO @TriggerCode (CodeLine)
SELECT N'SET QUOTED_IDENTIFIER ON'
INSERT INTO @TriggerCode (CodeLine)
SELECT @SectionGO
-- Cannot use UNION because it wants to sort them!


-- ======================
-- INSTEAD Insert trigger
-- ======================

-- Drop existing trigger:
INSERT INTO @TriggerCode (CodeLine)
SELECT Line FROM dbo.StringLines (@SectionInsertDrop, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
ORDER BY LineNumber

-- GO (required by CREATE following)
INSERT INTO @TriggerCode (CodeLine) VALUES (@SectionGO)

-- Show any MetaData anomalies:
INSERT INTO @TriggerCode (CodeLine)
SELECT Line FROM dbo.StringLines (@MetaDataError, 0, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

IF @IgnoreInsert = 0
BEGIN

   -- Create statement:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionInsertCreate, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   IF @RememberIdentity = 1 OR @CursorRequired = 1
      -- Rowcount check:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionCheckRowcountSlow, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ELSE
      -- Rowcount check:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionCheckRowcount, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   -- Set nocount on:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionSetNocount, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   IF EXISTS(SELECT * FROM @Columns WHERE ColumnName IN (@ColumnWhenInserted, @ColumnWhenUpdated, @ColumnWhoInserted, @ColumnWhoUpdated))
   -- Declare and set @SkipBase.
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionSkipBase, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   IF EXISTS(SELECT * FROM @Columns WHERE ColumnName IN (@ColumnWhenInserted, @ColumnWhenUpdated))
   -- @NeedWhenInsert = 1
      -- Declare and set @Today
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionWhen, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)


   IF @UseLocalSite = 1
   BEGIN
      INSERT INTO @TriggerCode (CodeLine) 
      SELECT Line FROM dbo.StringLines (@SectionLocalSite, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   END

   IF EXISTS(SELECT * FROM @Columns WHERE ColumnName IN (@ColumnWhoInserted, @ColumnWhoUpdated))
   -- @NeedWhoInsert = 1
      -- Declare and set @Username:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (
         CASE WHEN @AllowExplicitAuditWhoInsert = 1 THEN @SectionWhoInsertConditional ELSE @SectionWho END,
         1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   IF @InsertNeedSeverityOrInfobar = 1
      -- Declare @Severity & @Infobar:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionSeverityInfobarInit, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)

   -- AlphaKey generation and registration / AutoNumbering:
   IF @NextKeyGenerator IS NOT NULL OR @RegisterNewKey = 1
   OR @AutoNumber = 1
   BEGIN
      -- Declare trailing key variable:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyDeclarations, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)

      -- Declare any other key variables:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent2
         + @comma + @Space
         + N'@' + ColumnName + @Space + DataType
      FROM @NonAlphaKeys 
      WHERE ColumnName <> @SpecialKey -- Avoid duplicate in non-PK case.

      -- Blank line:
      INSERT INTO @TriggerCode (CodeLine) VALUES (@EmptyString)
   END
      
   IF @NextKeyGenerator IS NOT NULL
   OR @AutoNumber = 1
   BEGIN
      SET @SectionKeyGenerateDeclarations = REPLACE(@SectionKeyGenerateDeclarations, @ReplaceGenerateDeclarations, CASE WHEN @NextKeyGenerator IS NOT NULL THEN @SectionAlphaKeyGenerateDeclarations ELSE N'' END)

      DECLARE @OtherKeyColumnDeclarations LongListType
      SET @OtherKeyColumnDeclarations = N''
      IF @AutoNumber = 1
      SELECT
         @OtherKeyColumnDeclarations = @OtherKeyColumnDeclarations
            + @Space + N'New_' + ColumnName + @Space + BaseDataType + @comma
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      ORDER BY KeySequence

      -- Declare variables for generator / AutoNumbering:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT REPLACE(Line, @ReplaceDataType, @AlphaKeyDataType)
      FROM dbo.StringLines (@SectionKeyGenerateDeclarations, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceOtherKeyColumnDeclarations, @OtherKeyColumnDeclarations, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      IF @NextKeyPrefix IS NOT NULL
      BEGIN
         -- Initialize default prefix variable(s) for generator:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerateInitPrefix, 1, @Indent1, @ReplaceDefaultPrefixColumn, @DefaultPrefixColumn, @ReplaceDefaultPrefixColumnAlternate, @DefaultPrefixColumnAlternate, @ReplaceDefaultPrefixTable, @DefaultPrefixTable)
         ORDER BY LineNumber

         IF @SectionAlphaKeyGenerateInitPrefixAlternate IS NOT NULL 
            -- Initialize alternate default prefix variable for generator:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerateInitPrefixAlternate, 1, @Indent1, @ReplaceDefaultPrefixColumn, @DefaultPrefixColumnAlternate, @ReplaceDefaultPrefixTable, @DefaultPrefixTableAlternate, @EmptyString, @EmptyString)
			ORDER BY LineNumber
      END

      IF @NextKeyGenerator IS NOT NULL
      -- Initialize key length variable for generator:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerateInitLength, 1, @Indent1, @ReplaceDefaultPrefixColumn, @DefaultPrefixColumn, @ReplaceDefaultPrefixTable, @DefaultPrefixTable, @ReplaceDataType, @AlphaKeyDataType)
      ORDER BY LineNumber
   END

   IF @NextKeyGenerator IS NOT NULL OR @RegisterNewKey = 1
   OR @AutoNumber = 1
   BEGIN
      -- Declare cursor top:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyCursor, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      -- End of SELECT phrase, for any other keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent3
         + @comma + @Space
         + ColumnName
      FROM @NonAlphaKeys 

      -- Declare cursor bottom:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyFrom, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      -- Open cursor:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyOpen, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      -- Fetch from cursor:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyFetch, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      -- Also fetch any other keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + @comma + @Space
         + N'@' + ColumnName
      FROM @NonAlphaKeys 

      -- Check Fetch status and single-row select:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyFetchSelect, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber

      -- End of SELECT phrase, for any other keys of a single row:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent3
         + @comma + @Space
         + N'@' + ColumnName
         + N' = ' + ColumnName
      FROM @NonAlphaKeys 

      -- SELECT statement bottom:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyFrom, 1, @Indent1, @ReplaceColumn, @SpecialKey, @ReplaceDataType, @AlphaKeyDataType, @ReplaceBaseDataType, @AlphaKeyBaseDataType)
      ORDER BY LineNumber
   END

   IF @NextKeyGenerator IS NOT NULL
   BEGIN
      -- Prepare to generate a new key:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyPreGenerate, 1, @Indent2, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGenerator, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      IF @NextKeyPreGenerate IS NOT NULL
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@NextKeyPreGenerate, 1, @Indent3, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGenerator, @ReplaceTableName, @TableName)
         ORDER BY LineNumber

      DECLARE @GenerateIndent LongListType

      IF @NextKeyGeneratorAlternate IS NOT NULL
      BEGIN
         SET @GenerateIndent = @Indent3

         -- Check the Partition Condition:
         INSERT INTO @TriggerCode (CodeLine) VALUES (@GenerateIndent + N'IF ' + @NextKeyPartitionCondition)

         -- Generate a new key alternately:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerate, 1, @GenerateIndent, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGeneratorAlternate, @ReplaceTableName, @TableName)
         ORDER BY LineNumber

         -- ELSE
         INSERT INTO @TriggerCode (CodeLine) VALUES (@GenerateIndent + @SectionELSE)
      END
      ELSE
         SET @GenerateIndent = @Indent2
      
      -- Generate a new key:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerate, 1, @GenerateIndent, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGenerator, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      IF @NextKeyPostGenerate IS NOT NULL
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@NextKeyPostGenerate, 1, @Indent3, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGenerator, @ReplaceTableName, @TableName)
         ORDER BY LineNumber

      -- Recover from generating a new key:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyPostGenerate, 1, @Indent2, @ReplaceColumn, @SpecialKey, @ReplaceNextKeyGenerator, @NextKeyGenerator, @ReplaceTableName, @TableName)
      ORDER BY LineNumber
   END
   
   IF @RegisterNewKey = 1
      -- Register non-generated key:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT REPLACE(Line, @ReplaceViewName, @SiteView) FROM dbo.StringLines (@SectionAlphaKeyRegister, 1, @Indent2, @ReplaceColumn, @SpecialKey, @ReplaceAlphaKeyRegisterAddlParms, @AlphaKeyRegisterAddlParms, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

   IF @AutoNumber = 1
   BEGIN

      -- Column is Null or Empty:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberNullOrEmptyCheck, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- Check for collision with existing row:
      ; WITH SectionLines(LineNumber, Line)
      AS (
         SELECT *
         FROM dbo.StringLines (@SectionAutoNumberExistingRowCheck, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      )
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
         + CASE WHEN EXISTS(SELECT 1 FROM SectionLines later
            WHERE later.LineNumber > sl.LineNumber)
            THEN ''
            -- Compare AutoNumber key:
            ELSE REPLACE(@SectionAutoNumberExistingRowKeyCompare, @ReplaceColumn, @AutoNumberKey)
         END
      FROM SectionLines sl
      ORDER BY LineNumber

      -- Also compare any other leading keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + N'AND' + @Space
         + REPLACE(@SectionAutoNumberExistingRowKeyCompare, @ReplaceColumn, ColumnName)
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      AND KeySequence <> @AlphaKeyOrdinalPosition

      -- Check for collision with reserved row:
      ; WITH SectionLines(LineNumber, Line)
      AS (
         SELECT *
         FROM dbo.StringLines (@SectionAutoNumberReservedRowCheck, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      )
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
         + CASE WHEN EXISTS(SELECT 1 FROM SectionLines later
            WHERE later.LineNumber > sl.LineNumber)
            THEN ''
            -- Compare AutoNumber key:
            ELSE REPLACE(@SectionAutoNumberReservedRowKeyCompare, @ReplaceColumn, @AutoNumberKey)
         END
      FROM SectionLines sl
      ORDER BY LineNumber

      -- Also compare any other leading keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + N'AND' + @Space
         + REPLACE(@SectionAutoNumberReservedRowKeyCompare, @ReplaceColumn, ColumnName)
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      AND KeySequence <> @AlphaKeyOrdinalPosition

      -- Collision detected!  Treat as TBD:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberCollision, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- TBD setup:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberFindExistingLast, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- Compare any other leading keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + CASE WHEN ROW_NUMBER() OVER(ORDER BY KeySequence) = 1
            THEN N'WHERE'
            ELSE N'AND'
            END + @Space
         + REPLACE(@SectionAutoNumberExistingRowKeyCompare, @ReplaceColumn, ColumnName)
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      AND KeySequence <> @AlphaKeyOrdinalPosition
      ORDER BY KeySequence

      -- Check for collision with reserved row:
      ; WITH SectionLines(LineNumber, Line)
      AS (
         SELECT *
         FROM dbo.StringLines (@SectionAutoNumberReservedRowCheck2, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      )
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
         + CASE WHEN EXISTS(SELECT 1 FROM SectionLines later
            WHERE later.LineNumber > sl.LineNumber)
            THEN ''
            -- Compare AutoNumber key:
            ELSE REPLACE(@SectionAutoNumberReservedRowKeyCompare, @ReplaceColumn, @AutoNumberKey)
         END
      FROM SectionLines sl
      ORDER BY LineNumber

      -- Also compare any other leading keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + N'AND' + @Space
         + REPLACE(@SectionAutoNumberReservedRowKeyCompare, @ReplaceColumn, ColumnName)
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      AND KeySequence <> @AlphaKeyOrdinalPosition

      -- Increment from highest reserved row:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberFindReservedLast, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- Compare any other leading keys:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent4
         + CASE WHEN ROW_NUMBER() OVER(ORDER BY KeySequence) = 1
            THEN N'WHERE'
            ELSE N'AND'
            END + @Space
         + N'New_' + REPLACE(@SectionAutoNumberExistingRowKeyCompare, @ReplaceColumn, ColumnName)
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      AND KeySequence <> @AlphaKeyOrdinalPosition
      ORDER BY KeySequence

      -- End block:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberTBDEnd, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- Remember new key for insertion into the appropriate row later:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberRememberKey, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

      -- Also store any other leading keys (for possible existence checks on other rows having same leading keys):
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent3
         + @comma + @Space
         + N'@' + ColumnName
      FROM @NonAlphaKeys
      WHERE KeySequence IS NOT NULL
      ORDER BY KeySequence

      -- End remember:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line
      FROM dbo.StringLines (@SectionAutoNumberEnd, 1, @Indent2, @ReplaceColumn, @AutoNumberKey, @ReplaceTBDValue, @AutoNumberTBDValue, @ReplaceTableName, @TableName)
      ORDER BY LineNumber

   END
      
   IF @NextKeyGenerator IS NOT NULL OR @RegisterNewKey = 1
   OR @AutoNumber = 1
   BEGIN
      -- Exit loop if finished:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyExitLoop, 1, @Indent2, @ReplaceColumn, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Loop back until done, then close cursor:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAlphaKeyClose, 1, @Indent1, @ReplaceColumn, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Check @Severity:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionSeverityCheck, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

   END

   DECLARE @InsertWithIdentityColumn BIT
   DECLARE @ReplTableCreated INT = 0
   SET @InsertWithIdentityColumn = 0
   WHILE @InsertWithIdentityColumn <= 1
   BEGIN
      DECLARE @IndentInsert sysname

      IF @ReplicationExists = 1 AND @ReplTableCreated = 0
      BEGIN
         SET @ReplTableCreated = 1 -- Do not create the table more than once.
         INSERT INTO @TriggerCode (CodeLine)
         values('CREATE TABLE #repl (
  from_site NVARCHAR(10) collate database_default
, to_site NVARCHAR(10) collate database_default
, is_trans bit
)
DECLARE @DbName LongListType
SET @DbName = db_name()
INSERT INTO #repl
SELECT DISTINCT source_site, target_site, 0
  FROM rep_rule AS rr
  INNER JOIN rep_object_category AS roc ON
    roc.category = rr.category
  AND roc.object_name = N''' + @TableName + N'''
  AND roc.object_type = 1 -- Table
  AND roc.to_object_name = roc.object_name
  AND (roc.skip_insert = 0 or roc.skip_update = 0)
  AND roc.retain_site = 0
INNER JOIN site ON
  site.site = rr.target_site
INNER JOIN site site2 ON
  site2.site = rr.source_site
LEFT OUTER JOIN site_link_info AS sll ON
  sll.from_site = site2.site
AND sll.to_site = rr.target_site
WHERE site2.app_db_name = @DbName
AND site.app_db_name = @DbName')
    IF @SiteColumn IS NOT NULL
        INSERT INTO @TriggerCode (CodeLine)
        VALUES('AND rr.source_site IN (SELECT DISTINCT ' + @SiteColumn + ' FROM inserted)')

    INSERT INTO @TriggerCode (CodeLine)
    VALUES('UPDATE #repl SET is_trans = dbo.TransactionalReplication(from_site, to_site, N''' + @TableName + N''', 1)')

         INSERT INTO @TriggerCode (CodeLine) VALUES (N'')
      END

      IF @IdentityColumn IS NOT NULL
         IF @InsertWithIdentityColumn = 0
         BEGIN 
            -- Check whether the INSERT leaves out the Identity column:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityCheck, 1, @EmptyString, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
            ORDER BY LineNumber

            SET @IndentInsert = @Indent1

            IF @RememberIdentity = 1
               -- BEGIN
               INSERT INTO @TriggerCode (CodeLine) VALUES (@IndentInsert + @SectionBEGIN)

            -- Reason for the additional INSERT statement:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityComment, 1, @EmptyString, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
            ORDER BY LineNumber

         END
         ELSE
         -- ELSE
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInsertIdentityElse, 1, @EmptyString, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
         ORDER BY LineNumber
         -- We already set @IndentInsert on the first iteration.
      ELSE
      SET @IndentInsert = @EmptyString

      SELECT @SaveLineIdx = MAX(LineNum)
      FROM @TriggerCode

      -- Top of INSERT statement:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInsertInsert, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Target columns:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent2 + @IndentInsert
         + CASE WHEN (CASE WHEN @InsertWithIdentityColumn = 1 THEN ColumnID ELSE ColumnIDIgnoringIdentityColumn END) > 1 THEN @comma + @Space ELSE @EmptyString END
         + @OpenSquare + ColumnName + @CloseSquare
      FROM @Columns
      WHERE (@InsertWithIdentityColumn = 1 OR IsIdentity = 0)

      -- Middle of INSERT statement:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInsertSelect, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      SELECT @SaveLineIdx2 = MAX(LineNum) 
	  FROM @TriggerCode
	  SET @SaveLineIdx2 -= @SaveLineIdx

      -- Source values:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT
         @Indent2 + @IndentInsert
         + CASE WHEN (CASE WHEN @InsertWithIdentityColumn = 1 THEN ColumnID ELSE ColumnIDIgnoringIdentityColumn END) > 1 THEN @comma + @Space ELSE @EmptyString END
         + CASE ColumnName
            WHEN @ColumnWhenInserted THEN N'CASE WHEN @SkipBase = 1 THEN bt.' + ColumnName + N' ELSE ' + @AuditWhen + N' END'
            WHEN @ColumnWhoInserted THEN
               CASE @AllowExplicitAuditWhoInsert
               WHEN 1 THEN 'CASE WHEN UPDATE(' + @OpenSquare + ColumnName + @CloseSquare + ') THEN '
                  + 'bt.' + @OpenSquare + ColumnName + @CloseSquare
                  + ' ELSE ' + @AuditWho + ' END'
               ELSE N'CASE WHEN @SkipBase = 1 THEN bt.' + ColumnName + N' ELSE ' + @AuditWho + N' END'
               END
            WHEN @ColumnWhenUpdated THEN 'CASE WHEN @SkipBase = 1 THEN bt.' + ColumnName + N' ELSE ' + @AuditWhen + N' END'
            WHEN @ColumnWhoUpdated THEN
               CASE @AllowExplicitAuditWhoInsert
               WHEN 1 THEN 'CASE WHEN UPDATE(' + @OpenSquare + ColumnName + @CloseSquare + ') THEN '
                  + 'bt.' + @OpenSquare + ColumnName + @CloseSquare
                  + ' ELSE ' + @AuditWho + ' END'
               ELSE N'CASE WHEN @SkipBase = 1 THEN bt.' + ColumnName + N' ELSE ' + @AuditWho + N' END'
               END
            -- AlphaKey generation / AutoNumber:
            WHEN @SpecialKey THEN
               CASE WHEN @NextKeyGenerator IS NOT NULL
               OR @AutoNumber = 1
                  THEN N'ISNULL(New_' + ColumnName + N', bt.' + ColumnName + N')'
                  ELSE ColumnName
               END
            ELSE
               CASE WHEN InsertExpression IS NOT NULL
                  THEN InsertExpression
                  ELSE  'bt.' + @OpenSquare + ColumnName + @CloseSquare
               END
           END
      FROM @Columns
      WHERE (@InsertWithIdentityColumn = 1 OR IsIdentity = 0)


      -- Bottom of INSERT statement:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInsertFrom, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Join to generated AlphaKeys:
      IF @NextKeyGenerator IS NOT NULL
      OR @AutoNumber = 1
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionAlphaKeyGenerateJoin, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      IF @IdentityColumn IS NOT NULL
         IF @InsertWithIdentityColumn = 0
            INSERT INTO @ReplicationInserts (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityCheck, 1, @EmptyString, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
            ORDER BY LineNumber

      IF @IdentityColumn IS NOT NULL
         IF @InsertWithIdentityColumn = 1
            INSERT INTO @ReplicationInserts (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityElse, 1, @EmptyString, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
            ORDER BY LineNumber

      INSERT INTO @ReplicationInserts (CodeLine)
      SELECT REPLACE( CodeLine, 'FROM inserted bt WITH (READUNCOMMITTED)', 'FROM #repl, inserted ii
' + @IndentInsert + 'INNER JOIN ' + QUOTENAME(@TableName) + ' bt ON
bt.RowPointer = ii.RowPointer')
      FROM @TriggerCode
      WHERE LineNum > @SaveLineIdx
	  ORDER BY LineNum

      IF @IdentityColumn IS NOT NULL
      BEGIN
         IF @InsertWithIdentityColumn = 1
            BREAK

         IF @RememberIdentity = 1
         BEGIN 
            -- When inserting a single row, remember the last IDENTITY value:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityRemember, 1, @IndentInsert, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @ReplaceDataType, @IdentityColumnDataType)
            ORDER BY LineNumber

            -- END
            INSERT INTO @TriggerCode (CodeLine) VALUES (@IndentInsert + @SectionEND)
         END

         -- Do it all again, without the Identity column:
         SET @InsertWithIdentityColumn = 1
      END
      ELSE
      BREAK
   END

   IF @ReplicationExists = 1
   BEGIN
      -- Comment after INSERT statement to show trigger order of preceding base table insert.
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInsertAfter, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      INSERT INTO @TriggerCode (CodeLine) VALUES (N'')

      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionReplicationSetSite, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      INSERT INTO @TriggerCode (CodeLine) VALUES (N'
   -- Skip firing all triggers on replicated row inserts.
   EXEC dbo.SetTriggerStateSp 1, 1, 0, @SavedState OUTPUT, @Infobar OUTPUT

')

      INSERT INTO @TriggerCode (CodeLine)
      SELECT CodeLine
      FROM @ReplicationInserts
      WHERE LineNum < @SaveLineIdx2
      ORDER BY LineNum

      -- The site column will be replaced with a particular target site
      -- literal later.
      UPDATE @ReplicationInserts
      SET CodeLine = REPLACE(CodeLine, N'bt.' + QUOTENAME(@SiteColumn), '#repl.to_site')
      WHERE LineNum > @SaveLineIdx2

      --  When replicating rows transactionally, a unique new rowpointer value
      -- is necessary since RowPointer is unique in the table.
      UPDATE @ReplicationInserts
      SET CodeLine = REPLACE(CodeLine, N'bt.' + QUOTENAME(@ColumnRowPointer), 'NEWID()')
      WHERE LineNum > @SaveLineIdx2

      INSERT INTO @ReplicationInserts (CodeLine) VALUES (N'   WHERE ' +
@SectionReplicationExists)

      DECLARE @CrsIdx INT = 0
      OPEN ReplicationInSameDbCrs
      WHILE 1=1
      BEGIN
         FETCH ReplicationInSameDbCrs INTO @FromSite, @ToSite, @Filter

         IF @@FETCH_STATUS <> 0
            BREAK

         SET @CrsIdx = @CrsIdx + 1
         IF @CrsIdx > 1
            INSERT INTO @TriggerCode (CodeLine) VALUES (N'   UNION')

         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line 
         FROM @ReplicationInserts 
         CROSS APPLY dbo.StringLines (CodeLine, 1, @EmptyString, @ReplaceTableName, @TableName, @SiteColumnName, @SiteColumn, @ReplaceToSite, N'''' + @ToSite + N'''')
         WHERE LineNum >= @SaveLineIdx2
         ORDER BY LineNum

         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line
         FROM dbo.StringLines(N'AND bt.<SiteColumn> = #repl.from_site
AND #repl.is_trans = 1', 1, @Indent1, @SiteColumnName, @SiteColumn
, @ReplaceFromSite, @FromSite, @ReplaceToSite, @ToSite)
         ORDER BY LineNumber
         IF ISNULL(@Filter, N'') <> N''
         BEGIN
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line
            FROM dbo.StringLines(N'AND ' + @Filter, 1, @Indent1, @EmptyString, @EmptyString
              , @EmptyString, @EmptyString, @EmptyString, @EmptyString)
            ORDER BY LineNumber
         END
         BREAK
      END
      CLOSE ReplicationInSameDbCrs
      DEALLOCATE ReplicationInSameDbCrs

      IF @ReplicationExists = 1
         INSERT INTO @TriggerCode (CodeLine)
         VALUES (N'DROP TABLE #repl')

      INSERT INTO @TriggerCode (CodeLine) VALUES (N'
   -- Restore trigger state:
   EXEC dbo.RestoreTriggerStateSp 0, @SavedState, @Infobar OUTPUT
')
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionReplicationUnSetSite, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

   END

   -- Comment after INSERT statement:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionInsertAfter, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ORDER BY LineNumber


   -- Custom Post-Insert section:
   IF @CustomPostInsertCode IS NOT NULL
   BEGIN
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@CustomPostInsertCode, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Blank line:
      INSERT INTO @TriggerCode (CodeLine) VALUES (@EmptyString)
   END
   
   -- _all (cross-site) section:
   IF EXISTS(SELECT 1 FROM @AllColumns)
   BEGIN
      -- Check dbo.SkipAllUpdate()
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInsert_AllCondition, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Check any additional condition(s)
      IF @Update_AllWhen IS NOT NULL
         INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + N'AND (' + @Update_AllWhen + N')')

      -- BEGIN
      INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionBEGIN)

      -- Call SetTriggerStateSp:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAllowReplication, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Initialize @Site:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionInitializeSite, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Initialize @RP:
      IF @NeedInitializeRPInsert = 1
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInitializeRP, 1, @Indent2, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber
      -- ELSE we are assured that @SectionInsert_AllFromIdentityInsert IS NULL,
      -- so there is no need to roll this down after the @SectionInsertIdentityCheck.

      DECLARE @NormalMode bit
      SET @NormalMode = 0
      WHILE @NormalMode <= 1
      BEGIN
         IF @SectionInsert_AllFromIdentityInsert IS NOT NULL
            IF @NormalMode = 0
            BEGIN
               -- Check whether the INSERT leaves out the Identity column:
               INSERT INTO @TriggerCode (CodeLine)
               SELECT Line FROM dbo.StringLines (@SectionInsertIdentityCheck, 1, @Indent1, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
               ORDER BY LineNumber

               SET @IndentInsert = @Indent2
            END
            ELSE
            -- ELSE
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsertIdentityElse, 1, @Indent1, @ReplaceTableName, @TableName, @ReplaceColumn, @IdentityColumn, @EmptyString, @EmptyString)
            ORDER BY LineNumber
            -- We already set @IndentInsert on the first iteration.
         ELSE
         SET @IndentInsert = @Indent1

         -- Top of INSERT statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInsert_AllInsert, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Target columns:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT
            @IndentInsert + @Indent2
            + CASE WHEN ColumnID > 1 THEN @comma + @Space ELSE @EmptyString END
            + @OpenSquare + ColumnName + @CloseSquare
         FROM @AllColumns

         -- Middle of INSERT statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInsertSelect, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Source values:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT
            @IndentInsert + @Indent2
            + CASE WHEN ColumnID > 1 THEN @comma + @Space ELSE @EmptyString END
            + CASE
               WHEN ColumnName = @ColumnSiteRef AND @SiteWhere != @ColumnSiteRef THEN @SiteWhere
               WHEN @IupModifiesInsertedRows = 0 AND ColumnName = @ColumnWhenInserted THEN @AuditWhen
               WHEN @IupModifiesInsertedRows = 0 AND ColumnName = @ColumnWhoInserted THEN @AuditWho
               WHEN @IupModifiesInsertedRows = 0 AND ColumnName = @ColumnWhenUpdated THEN @AuditWhen
               WHEN @IupModifiesInsertedRows = 0 AND ColumnName = @ColumnWhoUpdated THEN @AuditWho
               ELSE iiColumnName
              END
         FROM @AllColumns

         IF @SectionInsert_AllFromIdentityInsert IS NOT NULL AND @NormalMode = 0
         BEGIN
            -- Bottom of INSERT statement:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsert_AllFromIdentityInsert, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
            ORDER BY LineNumber

            -- Do it all again, normally:
            SET @NormalMode = 1
         END
         ELSE
         BEGIN
            -- Bottom of INSERT statement:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line FROM dbo.StringLines (@SectionInsert_AllFrom, 1, @IndentInsert, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
            ORDER BY LineNumber

            BREAK
         END
      END

      -- Call RestoreTriggerStateSp:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionAllowReplicationRestore, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- END
      INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionEND)

   END

   -- RETURN for good measure:
   INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionRETURN)

   -- GO to finish it off:
   INSERT INTO @TriggerCode (CodeLine) VALUES (@SectionGO)
END


-- ======================
-- AFTER Update trigger
-- ======================

-- Drop existing trigger:
INSERT INTO @TriggerCode (CodeLine)
SELECT Line FROM dbo.StringLines (@SectionUpdateDrop, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
ORDER BY LineNumber

-- GO (required by CREATE following)
INSERT INTO @TriggerCode (CodeLine) VALUES (@SectionGO)

-- Show any MetaData anomalies:
INSERT INTO @TriggerCode (CodeLine)
SELECT Line FROM dbo.StringLines (@MetaDataError, 0, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
ORDER BY LineNumber

IF @DisallowUpdate = 0
AND @KeepClusteringKeys = 0
AND NOT EXISTS(SELECT * FROM @UpdateAuditColumns)
AND NOT EXISTS(SELECT * FROM @UpdateAllColumns)
   -- Nothing to do!!
   SET @IgnoreUpdate = 1

IF @IgnoreUpdate = 0
BEGIN
   -- Create statement:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionUpdateCreate, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ORDER BY LineNumber

   -- Rowcount check:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionCheckRowcount, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ORDER BY LineNumber

   -- Avoid recursion:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionUpdateSkipFast, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ORDER BY LineNumber

   -- Set nocount on:
   INSERT INTO @TriggerCode (CodeLine)
   SELECT Line FROM dbo.StringLines (@SectionSetNocount, 1, @EmptyString, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
   ORDER BY LineNumber

   IF @DisallowUpdate = 1
   BEGIN
      IF @UpdateNeedSeverityOrInfobar = 1
         -- Declare @Severity & @Infobar:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionSeverityInfobarInit, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      -- Set @Severity & @Infobar
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionUpdateDisallow, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- Check @Severity:
      INSERT INTO @TriggerCode (CodeLine)
      SELECT Line FROM dbo.StringLines (@SectionSeverityCheck, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
      ORDER BY LineNumber

      -- That's All, Folks!
   END
   ELSE
   BEGIN
	   -- Avoid recursion:
	   INSERT INTO @TriggerCode (CodeLine)
	   SELECT Line FROM dbo.StringLines (@SectionUpdateSkipSlow, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
       ORDER BY LineNumber

      IF @UpdateNeedSeverityOrInfobar = 1
         -- Declare @Severity & @Infobar:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionSeverityInfobarInit, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      IF @KeepClusteringKeys = 1
      BEGIN
         DECLARE ClusteringKey CURSOR LOCAL STATIC FOR
         SELECT ColumnName
         FROM @Columns AS col
         WHERE col.IsClusteringKey = 1

         OPEN ClusteringKey
         WHILE 1=1
         BEGIN
            DECLARE @ClusteringKey sysname
            FETCH ClusteringKey INTO @ClusteringKey
            IF @@FETCH_STATUS < 0 BREAK

            DECLARE @HungarianizedKey sysname
            SET @HungarianizedKey = dbo.Hungarianize(@ClusteringKey)

            INSERT INTO @TriggerCode (CodeLine)
            SELECT Line
            FROM dbo.StringLines (@SectionUpdateKeepClusteringKey, 1, @Indent1, @ReplaceColumn, @ClusteringKey, @ReplaceHungarianizedColumn, @HungarianizedKey, @EmptyString, @EmptyString) AS sl
            ORDER BY LineNumber

         END
         CLOSE ClusteringKey
         DEALLOCATE ClusteringKey

         -- Check @Severity:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionSeverityCheck, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      END

      IF @NeedWhenUpdate = 1
	  BEGIN
         -- Declare and set @Today
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionWhen, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

		 IF EXISTS (SELECT 1 FROM @Columns WHERE ColumnName = @ColumnUtcWhenUpdated)
            -- Declare and set @UtcToday
			INSERT INTO @TriggerCode (CodeLine)
			SELECT Line FROM dbo.StringLines (@SectionUtcWhen, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
			ORDER BY LineNumber
      END

      -- Initialize @RP if needed by Audit-Column update as well as _all update:
      IF @NeedInitializeRPUpdate = 1 AND @Update_AllNeedsRP = 1
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInitializeRP, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      IF @SectionUpdateSkipSlow2 IS NOT NULL
         -- Skip base trigger
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdateSkipSlow2, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      -- Initialize @RP if needed by Audit-Column update but not by _all update (saves time when Skipping Base Trigger):
      IF @NeedInitializeRPUpdate = 1 AND @Update_AllNeedsRP = 0
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInitializeRP, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      -- Custom Post-Update section:
      IF @CustomPostUpdateCode IS NOT NULL
      BEGIN
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@CustomPostUpdateCode, 1, @Indent1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Blank line:
         INSERT INTO @TriggerCode (CodeLine) VALUES (@EmptyString)
      END
   
      IF @NeedWhoUpdate = 1
         -- Declare and set @Username:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionWho, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

      IF EXISTS(SELECT * FROM @UpdateAuditColumns)
      BEGIN
         IF @UpdateRecordDateWhen IS NOT NULL
         BEGIN
            -- Place special RecordDate condition in a variable,
            -- in case it contains a function-call that would be executed once per row being Updated:
            -- We'll assume that the condition is row-independent!
            INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + N'DECLARE @UpdateRecordDate bit')
            INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + N'SET @UpdateRecordDate = CASE WHEN ' + @UpdateRecordDateWhen + N' THEN 1 ELSE 0 END')

            -- Blank line:
            INSERT INTO @TriggerCode (CodeLine) VALUES (@EmptyString)

            -- Now we can just refer to the variable's being One:
            SET @UpdateRecordDateWhen = N'@UpdateRecordDate = 1'
         END

         -- Workaround brain-dead T-SQL (2K) limitation where UPDATE() blows up inside CASE expressions!
         INSERT INTO @TriggerCode (CodeLine)
         SELECT
            WasUpdatedInit
         FROM @UpdateAuditColumns uac
         INNER JOIN @Columns c ON c.ColumnName = uac.ColumnName
         WHERE WasUpdatedInit IS NOT NULL
         
         -- Top of UPDATE Audit-columns / Shadow-columns statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdateUpdate, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Update Audit-columns and/or Shadow(ed)-columns:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT
            @Indent2
            + CASE WHEN uac.ColumnID > 1 THEN @comma + @Space ELSE @EmptyString END
            + uac.ColumnName
            + N' = '
            + CASE uac.ColumnName
               WHEN @ColumnWhenUpdated THEN
                  CASE WHEN @UpdateRecordDateWhen IS NOT NULL
                     THEN N'CASE WHEN ' + @UpdateRecordDateWhen + N' THEN ' + @AuditWhen + N' ELSE ' + QUOTENAME(@TableName) + N'.' + @ColumnWhenUpdated + N' END'
                     ELSE @AuditWhen
                  END    
               WHEN @ColumnWhoUpdated THEN @AuditWho
			   WHEN @ColumnUtcWhenUpdated THEN @AuditUtcWhen
               ELSE UpdateExpression
              END
         FROM @UpdateAuditColumns uac
         INNER JOIN @Columns c ON c.ColumnName = uac.ColumnName

         -- Bottom of UPDATE Audit-columns / Shadow-columns statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdateAuditFrom, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber
      END

      -- _all (cross-site) section:
      IF EXISTS(SELECT 1 FROM @UpdateAllColumns)
      BEGIN
         -- UPDATE_ALL label:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdate_AllLabel, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Top of UPDATE _all statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdate_AllPrelude, 1, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         DECLARE @IndentUpdate_All LongListType
         SET @IndentUpdate_All = @EmptyString

         -- Check any additional condition(s)
         IF @Update_AllWhen IS NOT NULL
         BEGIN
            INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + N'IF (' + @Update_AllWhen + N')')
            SET @IndentUpdate_All = @Indent1 + @IndentUpdate_All 
         END

         IF @NeedUpdate_AllCheck = 1
         BEGIN
            -- Protect from harmless (non-cross-site) UPDATEs by checking each non-trivial, non-asserted _all column for modification:
            INSERT INTO @TriggerCode (CodeLine)
            SELECT
               @Indent1
               + CASE WHEN ColumnID > 1 THEN N'OR' ELSE N'IF' END
               + N' UPDATE ( '
               + QUOTENAME(ColumnName)
               + N' )'
            FROM @UpdateAllColumnsCheckModification

            -- BEGIN
            INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionBEGIN)

            SET @IndentUpdate_All = @Indent1 + @IndentUpdate_All
         END

         -- Call SetTriggerStateSp:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionAllowReplication, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Initialize @Site:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionInitializeSite, 1, @IndentUpdate_All, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Workaround brain-dead inability to pass expressions into functions:
         DECLARE @OhWell LongListType
         SET @OhWell = @IndentUpdate_All + @Indent1

         -- Top of UPDATE _all statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdateUpdate, 1, @OhWell, @ReplaceTableName, @AllTableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Update _all columns:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT
            @IndentUpdate_All + @Indent2
            + CASE WHEN uac.ColumnID > 1 THEN @comma + @Space ELSE @EmptyString END
            + uac.ColumnName
            + N' = '
            + CASE uac.ColumnName
               WHEN @ColumnWhenUpdated THEN @AuditWhen
               ELSE iiColumnName
              END
         FROM @UpdateAllColumns uac
         INNER JOIN @AllColumns ac ON ac.ColumnName = uac.ColumnName

         -- Bottom of UPDATE _all statement:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionUpdate_AllFrom, 1, @IndentUpdate_All, @ReplaceTableName, @TableName, @ReplaceAllTableName, @AllTableName, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         -- Call RestoreTriggerStateSp:
         INSERT INTO @TriggerCode (CodeLine)
         SELECT Line FROM dbo.StringLines (@SectionAllowReplicationRestore, 1, @Indent1, @ReplaceTableName, @TableName, @EmptyString, @EmptyString, @EmptyString, @EmptyString)
         ORDER BY LineNumber

         IF @NeedUpdate_AllCheck = 1
            -- END
            INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionEND)

         -- Blank line:
         INSERT INTO @TriggerCode (CodeLine) VALUES (@EmptyString)

      END
   END

   -- RETURN for good measure:
   INSERT INTO @TriggerCode (CodeLine) VALUES (@Indent1 + @SectionRETURN)

   -- GO to finish it off:
   INSERT INTO @TriggerCode (CodeLine) VALUES (@SectionGO)
END


-- =========================================
-- Make sure the Iup trigger executes first
-- =========================================
DECLARE @IupName sysname
SET @IupName = @Tablename + 'Iup'
IF EXISTS (SELECT 1 FROM sysobjects WHERE name = @IupName)
BEGIN
   IF OBJECTPROPERTY(OBJECT_ID(@IupName), 'ExecIsUpdateTrigger') = 1
   BEGIN
      INSERT INTO @TriggerCode (CodeLine) VALUES('EXEC sp_settriggerorder @triggername = ''' + QUOTENAME(@IupName) + ''', @order = ''First'', @stmttype = ''UPDATE''')
      INSERT INTO @TriggerCode (CodeLine) VALUES('GO')
   END

   IF OBJECTPROPERTY(OBJECT_ID(@IupName), 'ExecIsInsertTrigger') = 1
   BEGIN
      INSERT INTO @TriggerCode (CodeLine) VALUES('EXEC sp_settriggerorder @triggername = ''' + QUOTENAME(@IupName) + ''', @order = ''First'', @stmttype = ''INSERT''')
      INSERT INTO @TriggerCode (CodeLine) VALUES('GO')
   END
END

--  The application might want to generate some code of its own.
IF OBJECT_ID(N'dbo.APP_TriggerIupCodeSp') IS NOT NULL
BEGIN
   DECLARE @App_SpName sysname
   SET @App_SpName = N'dbo.APP_TriggerIupCodeSp'
   -- Invoke the ETP routine, passing in (and out) this routine's parameters:
   EXEC @App_SpName @TableName
END

-- ======================
-- Send back the results:
-- ======================

SELECT CodeLine FROM @TriggerCode ORDER BY LineNum
EXIT_FAIL:
IF @Severity <> 0 
BEGIN
   EXEC dbo.MsgAppSp @Infobar OUTPUT, N'I=TableName', @TableName
   EXEC dbo.RaiseErrorSp @Infobar, @Severity, 3
   EXEC @Severity = dbo.RollbackTransactionSp @Severity
   RETURN @Severity
END

RETURN 0
GO
