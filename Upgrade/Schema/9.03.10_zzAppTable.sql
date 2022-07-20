SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/

-- RS5957
IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NextKeyDefinition_mst')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NextKeyDefinition_mst',
      NULL, NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'NextKeyDefinition', N'SiteRef')
GO
UPDATE AppTable
SET IgnoreUpdate = 1
WHERE TableName = 'UserNames'
GO

UPDATE AppTable
SET UpdateRecordDateWhen = N'SkipRecordDate'
WHERE TableName = 'UserNames'
GO
IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveXComponentProperties')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ActiveXComponentProperties',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveXScriptLines')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ActiveXScriptLines',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveXScripts')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ActiveXScripts',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AdditionalStringTables')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AdditionalStringTables',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DerivedFormOverrides')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DerivedFormOverrides',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DeviceTypes')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DeviceTypes',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ExplorerObjects')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ExplorerObjects',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Explorers')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Explorers',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FilterAdditionalCriteria')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FilterAdditionalCriteria',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FilterAdditionalProperties')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FilterAdditionalProperties',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FilterPrimaryCriteria')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FilterPrimaryCriteria',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FilterPropertyAttributes')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FilterPropertyAttributes',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Filters')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Filters',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormAppsInfo')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormAppsInfo',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormComponentDragDropEvents')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormComponentDragDropEvents',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormComponents01')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormComponents01',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormComponents02')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormComponents02',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormControlData')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormControlData',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormEventHandlers')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormEventHandlers',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormNamedCollections')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormNamedCollections',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Forms')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Forms',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FormSyncLog')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FormSyncLog',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtFormManActivityLog')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtFormManActivityLog',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtFormManAuthorizedUsers')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtFormManAuthorizedUsers',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtFormManTranLog')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtFormManTranLog',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtForms')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtForms',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtLinks')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtLinks',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtLocalLog')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtLocalLog',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrtProperties')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrtProperties',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'HelpIDs')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'HelpIDs',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Images')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Images',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Menus')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Menus',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjAccessAs')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjAccessAs',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjCollectionRules')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjCollectionRules',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjCollections')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjCollections',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjCustomAssembly')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjCustomAssembly',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjFilters')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjFilters',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjMethodParameters')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjMethodParameters',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjMethodResultSets')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjMethodResultSets',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjMethods')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjMethods',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjProperties')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjProperties',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjPropertyClasses')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjPropertyClasses',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjServers')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjServers',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjSubColFilterProperties')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjSubColFilterProperties',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjSysParameters')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjSysParameters',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ObjTables')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjTables',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductDbFiles')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductDbFiles',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductInfo')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductInfo',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductPatchItems')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductPatchItems',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductSchemaInfo')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductSchemaInfo',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductSchemaObjectInfo')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductSchemaObjectInfo',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ProductVersion')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductVersion',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'PropertyDefaultDragDropEvents')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PropertyDefaultDragDropEvents',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'PropertyDefaults01')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PropertyDefaults01',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'PropertyDefaults02')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PropertyDefaults02',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'RuntimeChanges')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'RuntimeChanges',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'SchemaVersion')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SchemaVersion',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ScriptLines')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ScriptLines',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Scripts')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Scripts',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Strings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Strings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Styles')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Styles',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ThemeAttributes')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ThemeAttributes',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Themes')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Themes',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UsesFound')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UsesFound',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Validators')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Validators',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'Variables')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Variables',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'WebUserControlElements')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'WebUserControlElements',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'WebUserControls')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'WebUserControls',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)
GO

