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
*   (c) COPYRIGHT 2013 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
Disable Trigger ALL on AppTable;

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AccountAuthorizations')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AccountAuthorizations_mst')
DELETE FROM AppTable WHERE TableName = N'AccountAuthorizations'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AccountAuthorizations' ,N'AccountAuthorizations_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AccountAuthorizations_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'AccountAuthorizations', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AccountAuthorizations')
   UPDATE AppTable
   SET [TableName] = 'AccountAuthorizations_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'AccountAuthorizations',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'AccountAuthorizations'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveBGTasks')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveBGTasks_mst')
DELETE FROM AppTable WHERE TableName = N'ActiveBGTasks'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ActiveBGTasks' ,N'ActiveBGTasks_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ActiveBGTasks_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', N'ActiveBGTasks', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ActiveBGTasks')
   UPDATE AppTable
   SET [TableName] = 'ActiveBGTasks_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'ActiveBGTasks',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'ActiveBGTasks'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AppColumn'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AppColumn',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'AppColumn'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ApplicationMessages'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ApplicationMessages',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ApplicationMessages'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AppModule'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AppModule',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'AppModule'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AppTable'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AppTable',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'AppTable'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AuditLog'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AuditLog',
      NULL , NULL, 1, 0, 0,
      1, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'AuditLog'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'AuditLogTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'AuditLogTypes',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'AuditLogTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'BGTaskDefinitions'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'BGTaskDefinitions',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'BGTaskDefinitions'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'BGTaskHistory')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'BGTaskHistory_mst')
DELETE FROM AppTable WHERE TableName = N'BGTaskHistory'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'BGTaskHistory' ,N'BGTaskHistory_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'BGTaskHistory_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'BGTaskHistory', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'BGTaskHistory')
   UPDATE AppTable
   SET [TableName] = 'BGTaskHistory_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'BGTaskHistory',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'BGTaskHistory'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'BPProduct'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'BPProduct',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'BPProduct'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ClassNotes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ClassNotes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ClassNotes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ConfigParms'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ConfigParms',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ConfigParms'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ConnectionInformation'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ConnectionInformation',
      NULL , NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ConnectionInformation'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'COR_INBOX_ENTRY'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'COR_INBOX_ENTRY',
      NULL , NULL, 1, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'COR_INBOX_ENTRY'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'COR_INBOX_HEADERS'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'COR_INBOX_HEADERS',
      NULL , NULL, 1, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'COR_INBOX_HEADERS'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'COR_OUTBOX_ENTRY'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'COR_OUTBOX_ENTRY',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'COR_OUTBOX_ENTRY'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'COR_OUTBOX_HEADERS'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'COR_OUTBOX_HEADERS',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'COR_OUTBOX_HEADERS'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'COR_PROPERTY'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'COR_PROPERTY',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'COR_PROPERTY'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'CountryPack'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'CountryPack',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'CountryPack'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'DefaultTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DefaultTypes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'DefaultTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'DefineVariables'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DefineVariables',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'DefineVariables'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'DocumentObject'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DocumentObject',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'DocumentObject'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'DocumentObjectReference'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DocumentObjectReference',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'DocumentObjectReference'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'DocumentType'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DocumentType',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'DocumentType'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'Event'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Event',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'Event'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventAction'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventAction',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventAction'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventActionState'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventActionState',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventActionState'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventActionVariableAccess'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventActionVariableAccess',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventActionVariableAccess'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventGlobalConstant')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventGlobalConstant_mst')
DELETE FROM AppTable WHERE TableName = N'EventGlobalConstant'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventGlobalConstant' ,N'EventGlobalConstant_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventGlobalConstant_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'EventGlobalConstant', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventGlobalConstant')
   UPDATE AppTable
   SET [TableName] = 'EventGlobalConstant_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'EventGlobalConstant',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'EventGlobalConstant'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventHandler'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventHandler',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventHandler'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventHandlerState'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventHandlerState',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventHandlerState'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventInitialState'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventInitialState',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventInitialState'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventInitialVariable'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventInitialVariable',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventInitialVariable'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventInputParameter'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventInputParameter',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventInputParameter'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventMessage'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventMessage',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventMessage'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventOutputParameter'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventOutputParameter',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventOutputParameter'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventParameter'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventParameter',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventParameter'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventQueue')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventQueue_mst')
DELETE FROM AppTable WHERE TableName = N'EventQueue'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventQueue' ,N'EventQueue_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventQueue_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'EventQueue', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventQueue')
   UPDATE AppTable
   SET [TableName] = 'EventQueue_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'EventQueue',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'EventQueue'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventState'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventState',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventState'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventStateGroup'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventStateGroup',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventStateGroup'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTrigger')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTrigger_mst')
DELETE FROM AppTable WHERE TableName = N'EventTrigger'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventTrigger' ,N'EventTrigger_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventTrigger_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'EventTrigger', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTrigger')
   UPDATE AppTable
   SET [TableName] = 'EventTrigger_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'EventTrigger',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'EventTrigger'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTriggerParameter')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTriggerParameter_mst')
DELETE FROM AppTable WHERE TableName = N'EventTriggerParameter'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventTriggerParameter', N'EventTriggerParameter_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventTriggerParameter_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'EventTriggerParameter', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EventTriggerParameter')
   UPDATE AppTable
   SET [TableName] = 'EventTriggerParameter_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'EventTriggerParameter',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'EventTriggerParameter'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'EventVariable'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EventVariable',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'EventVariable'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ExtSystemTransLog'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ExtSystemTransLog',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ExtSystemTransLog'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'GroupNames'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'GroupNames',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'GroupNames'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'IDOAliases'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'IDOAliases',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'IDOAliases'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'intranet'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'intranet',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'intranet'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'IntranetSharedTable'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'IntranetSharedTable',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'IntranetSharedTable'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'IntranetSharedUserTable'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'IntranetSharedUserTable',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'IntranetSharedUserTable'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'IntranetSharedUserTableDefault'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'IntranetSharedUserTableDefault',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'IntranetSharedUserTableDefault'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'LanguageIDs'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'LanguageIDs',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'LanguageIDs'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'License'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'License',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'License'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'LoginCfg'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'LoginCfg',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'LoginCfg'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'MessageTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'MessageTypes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'MessageTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'MGDataSourceMaps'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'MGDataSourceMaps',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'MGDataSourceMaps'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'MGDataSources'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'MGDataSources',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'MGDataSources'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ModuleMembers'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ModuleMembers',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ModuleMembers'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'Modules'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Modules',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'Modules'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NextKeys')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NextKeys_mst')
DELETE FROM AppTable WHERE TableName = N'NextKeys'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'NextKeys' ,N'NextKeys_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NextKeys_mst',
      NULL , NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'NextKeys', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NextKeys')
   UPDATE AppTable
   SET [TableName] = 'NextKeys_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'NextKeys',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'NextKeys'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'NoteHeaders'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NoteHeaders',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'NoteHeaders'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'NotesContentShadow'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NotesContentShadow',
      NULL , NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'NotesContentShadow'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'NotesSiteMap'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NotesSiteMap',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'NotesSiteMap'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'NoteTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NoteTypes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'NoteTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ObjectBuildMessages'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjectBuildMessages',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ObjectBuildMessages'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ObjectMainMessages'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjectMainMessages',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ObjectMainMessages'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ObjectNotes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjectNotes',
      NULL , NULL, 1, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core', [IgnoreInsert] = 1
   WHERE TableName = N'ObjectNotes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ObjectTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ObjectTypes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ObjectTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ODTColumns'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ODTColumns',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ODTColumns'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ODTObjectDepends'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ODTObjectDepends',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ODTObjectDepends'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ODTObjects'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ODTObjects',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ODTObjects'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ODTTableColumns'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ODTTableColumns',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ODTTableColumns'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ODTTables'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ODTTables',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ODTTables'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms_mst')
DELETE FROM AppTable WHERE TableName = N'parms'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'parms' ,N'parms_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'parms_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'parms', N'site_ref')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms')
   UPDATE AppTable
   SET [TableName] = 'parms_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'parms',
       [SiteColumnName] = N'site_ref'
   WHERE TableName = N'parms'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms_all')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms_mst_all')
DELETE FROM AppTable WHERE TableName = N'parms_all'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'parms_all' ,N'parms_mst_all'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'parms_mst_all',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'parms_all', N'site_ref')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'parms_all')
   UPDATE AppTable
   SET [TableName] = 'parms_mst_all',
       [ModuleName] = N'Core',
       [AppViewName] = N'parms_all',
       [SiteColumnName] = N'site_ref'
   WHERE TableName = N'parms_all'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'PasswordParameters'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PasswordParameters',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'PasswordParameters'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'Printer'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Printer',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'Printer'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ProcessErrorLog'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProcessErrorLog',
      NULL , NULL, 0, 0, 1,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ProcessErrorLog'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ProcessLineNumbers'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProcessLineNumbers',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ProcessLineNumbers'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ProductDbFiles'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductDbFiles',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ProductDbFiles'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ProductPatches'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductPatches',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ProductPatches'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ProductVersion'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ProductVersion',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ProductVersion'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'Publication'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'Publication',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'Publication'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'PublicationCategory'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PublicationCategory',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'PublicationCategory'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'PublicationCategoryPublication'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PublicationCategoryPublication',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'PublicationCategoryPublication'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'PublicationSubscriber'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PublicationSubscriber',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'PublicationSubscriber'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'QueuedEvent')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'QueuedEvent_mst')
DELETE FROM AppTable WHERE TableName = N'QueuedEvent'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'QueuedEvent' ,N'QueuedEvent_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'QueuedEvent_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'QueuedEvent', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'QueuedEvent')
   UPDATE AppTable
   SET [TableName] = 'QueuedEvent_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'QueuedEvent',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'QueuedEvent'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'QueuedEventHandler'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'QueuedEventHandler',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'QueuedEventHandler'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'rep_category'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'rep_category',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'rep_category'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'rep_object_category'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'rep_object_category',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'rep_object_category'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'rep_rule'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'rep_rule',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'rep_rule'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocAttribute'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocAttribute',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocAttribute'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocElement'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocElement',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocElement'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocInbound'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocInbound',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocInbound'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocOutbound'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocOutbound',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocOutbound'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocOutboundFilter'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocOutboundFilter',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocOutboundFilter'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplDocument'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplDocument',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplDocument'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRows3')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRows3_mst')
DELETE FROM AppTable WHERE TableName = N'ReplicatedRows3'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplicatedRows3' ,N'ReplicatedRows3_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplicatedRows3_mst',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'ReplicatedRows3', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRows3')
   UPDATE AppTable
   SET [TableName] = 'ReplicatedRows3_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'ReplicatedRows3',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'ReplicatedRows3'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRowsErrors')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRowsErrors_mst')
DELETE FROM AppTable WHERE TableName = N'ReplicatedRowsErrors'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplicatedRowsErrors' ,N'ReplicatedRowsErrors_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplicatedRowsErrors_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', N'ReplicatedRowsErrors', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRowsErrors')
   UPDATE AppTable
   SET [TableName] = 'ReplicatedRowsErrors_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'ReplicatedRowsErrors',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'ReplicatedRowsErrors'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReplicationOperationCounter'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplicationOperationCounter',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReplicationOperationCounter'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReportOptions')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReportOptions_mst')
DELETE FROM AppTable WHERE TableName = N'ReportOptions'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReportOptions' ,N'ReportOptions_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReportOptions_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', N'ReportOptions', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReportOptions')
   UPDATE AppTable
   SET [TableName] = 'ReportOptions_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'ReportOptions',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'ReportOptions'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ReusableNotesToSite'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReusableNotesToSite',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ReusableNotesToSite'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'rpt_opt'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'rpt_opt',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'rpt_opt'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'rpt_opt_values'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'rpt_opt_values',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'rpt_opt_values'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'SessionContextNames'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SessionContextNames',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'SessionContextNames'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ShadowValues'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ShadowValues',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'ShadowValues'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ShadowValuesErrors')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ShadowValuesErrors_mst')
DELETE FROM AppTable WHERE TableName = N'ShadowValuesErrors'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'ShadowValuesErrors' ,N'ShadowValuesErrors_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ShadowValuesErrors_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'ShadowValuesErrors', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ShadowValuesErrors')
   UPDATE AppTable
   SET [TableName] = 'ShadowValuesErrors_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'ShadowValuesErrors',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'ShadowValuesErrors'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'site'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'site',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'site'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'site_group'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'site_group',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'site_group'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'site_hierarchy'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'site_hierarchy',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'site_hierarchy'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'site_link_info'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'site_link_info',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'site_link_info'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'SiteUserMap'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SiteUserMap',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'SiteUserMap'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'SpecificNotes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SpecificNotes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'SpecificNotes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'StartupMethod'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'StartupMethod',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'StartupMethod'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'system_type'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'system_type',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'system_type'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'SystemNotes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SystemNotes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'SystemNotes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'SystemProcessDefaults'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SystemProcessDefaults',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'SystemProcessDefaults'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'table_class'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'table_class',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'table_class'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'table_class_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'table_class_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'table_class_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'table_class_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'table_class_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'table_class_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'TaskExclusion'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'TaskExclusion',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'TaskExclusion'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'TaskTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'TaskTypes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'TaskTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'TrackRows'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'TrackRows',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'TrackRows'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_fld'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_fld',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_fld'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_fld_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_fld_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_fld_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_fld_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_fld_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_fld_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_class_record_assoc'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_class_record_assoc',
      NULL , NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_class_record_assoc'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_fld'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_fld',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_fld'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_fld_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_fld_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_fld_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_fld_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_fld_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_fld_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index_fld'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index_fld',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index_fld'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index_fld_committed'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index_fld_committed',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index_fld_committed'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index_fld_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index_fld_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index_fld_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'user_index_impacted'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'user_index_impacted',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'user_index_impacted'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserCalendar'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserCalendar',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserCalendar'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserDefinedFields'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserDefinedFields',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserDefinedFields'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserDefinedTypes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserDefinedTypes',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserDefinedTypes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserDefinedTypeValues'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserDefinedTypeValues',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserDefinedTypeValues'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserEmail'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserEmail',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserEmail'

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UserGroupMap')
   AND EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UserGroupMap_mst')
DELETE FROM AppTable WHERE TableName = N'UserGroupMap'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserGroupMap' ,N'UserGroupMap_mst'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserGroupMap_mst',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'UserGroupMap', N'SiteRef')

ELSE IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UserGroupMap')
   UPDATE AppTable
   SET [TableName] = 'UserGroupMap_mst',
       [ModuleName] = N'Core',
       [AppViewName] = N'UserGroupMap',
       [SiteColumnName] = N'SiteRef'
   WHERE TableName = N'UserGroupMap'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserModules'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserModules',
      NULL , NULL, 0, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserModules'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserNames'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserNames',
      NULL , NULL, 0, 0, 0,
      1, 0, 1, 1,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserNames'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserNotes'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserNotes',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      1, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserNotes'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserPasswordHistory'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserPasswordHistory',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserPasswordHistory'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserProcessDefaults'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserProcessDefaults',
      NULL , NULL, 0, 0, 0,
      1, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserProcessDefaults'

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName IN (N'UserTask'))
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'UserTask',
      NULL , NULL, 0, 0, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

ELSE 
   UPDATE AppTable
   SET [ModuleName] = N'Core'
   WHERE TableName = N'UserTask'

--Remove the tables that no longer exist.
DELETE FROM AppTable WHERE TableName = 'ConcurrentLoginInformation'
DELETE FROM AppTable WHERE TableName = 'OutputFormats'
DELETE FROM AppTable WHERE TableName = 'PrintPreview'
GO

Enable Trigger ALL on AppTable;
GO