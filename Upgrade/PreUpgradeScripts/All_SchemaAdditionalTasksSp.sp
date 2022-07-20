SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.SchemaAdditionalTasksSp') IS NOT NULL
   DROP PROCEDURE dbo.SchemaAdditionalTasksSp
GO

/* $Header: ApplicationDB\Stored Procedures\SchemaAdditionalTasksSp.sp 10.1.0.1 03/30/2018 14:27:37 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/SchemaAdditionalTasksSp.sp $
 * CoreDev 6 MGD-423 DJohnson Thu Sep 24 2020
 * New parameter for AppTable add in non-mst table.
 *
 * CoreDev 5 RS7966 Mmarsolo Fri Mar 10 11:48:05 2017
 * RS7966 - Call TriggerIupCodeWrapperSp for tables passed into sp.
 *
 * CoreDev 4 206055 Mmarsolo Tue Jan 19 14:13:20 2016
 * Need ability to Skip View Generation when calling SchemaAdditionalTasksSp
 * 206055 - Add parameter to allow view generation logic to be skipped.
 *
 * CoreDev 3 204651 Mmarsolo Mon Nov 30 14:46:02 2015
 * Fix SchemaAdditionalTasksSp table select to only include _mst tables.
 * 204651 - Add where clause to only select _mst tables.
 *
 * CoreDev 2 203975 Mmarsolo Mon Nov 02 14:27:45 2015
 * Need to set parameter in loop to NULL in SchemaAdditionalTasksSp
 * 203975 - Set AppTableRowPointer = NULL in loop so it resets for each table.
 *
 * CoreDev 1 203775 Jray Tue Oct 27 13:13:16 2015
 * New Sp to call within schema changes to perform additional tasks, as applicable
 * Issue 203775: New Sp to call within schema changes to perform additional tasks, as applicable.
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE [dbo].[SchemaAdditionalTasksSp] (
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
   )
AS
-- Check for existence of Generic External Touch Point routine 
IF OBJECT_ID(N'dbo.EXTGEN_SchemaAdditionalTasksSp') IS NOT NULL  
BEGIN  
   DECLARE @EXTGEN_SpName sysname  
   SET @EXTGEN_SpName = N'dbo.EXTGEN_SchemaAdditionalTasksSp'  
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

   -- ETP routine must take over all desired functionality of this standard routine: 
   RETURN 0 
END 
-- End of Generic External Touch Point code

DECLARE
   @Severity INT = 0

EXEC @Severity = SchemaAdditionalTasks2Sp
        @PStartingTable
      , @PEndingTable
      , @Infobar OUTPUT
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

RETURN @Severity

GO
