SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.10_BGTaskDefinitions.sql 1     8/02/17 1:08p Jmorris $ */
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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'DatabaseSchemaReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'DatabaseSchemaReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'DatabaseSchemaReport'
, 'RPT'
, 'Database Schema Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO
 
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'QuickDictionaryReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'QuickDictionaryReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'QuickDictionaryReport'
, 'RPT'
, 'Quick Dictionary Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserAuthorizationReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserAuthorizationReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'UserAuthorizationReport'
, 'RPT'  
, 'User Authorization Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserClassReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserClassReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'UserClassReport'
, 'RPT'  
, 'User Class Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO
 
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserFieldsReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserFieldsReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'UserFieldsReport'
, 'RPT'
, 'User Fields Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserIndexReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserIndexReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent,ReportType
) VALUES (
  'UserIndexReport'
, 'RPT'
, 'User Index Report-ReportOutput'
, NULL
, 0
, 20
, 'DATAVIEW'
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'WBEmailGeneration')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'WBEmailGeneration'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'WBEmailGeneration'
, 'IDOMTH'
, 'WBKPIs.EmailGeneration'
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'WBSnapshotGeneration')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'WBSnapshotGeneration'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'WBSnapshotGeneration'
, 'IDOMTH'
, 'WBSnapshots.SnapshotGeneration'
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'DeleteAuditLogs')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'DeleteAuditLogs'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'DeleteAuditLogs'
, 'IDOMTH'
, 'AuditLogs.DeleteAuditLogEntrySp'
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'PurgeBodInformation')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'PurgeBodInformation'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'PurgeBodInformation'
, 'IDOMTH'
, 'CorInboxEntries.PurgeBodInformationSp'
, 0
, 1
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'PurgeNextKeysSp')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'PurgeNextKeysSp'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'PurgeNextKeysSp'
, 'IDOMTH'
, 'NextKeyDefinitions.PurgeNextKeysSp'
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'ReplDocInboxOutboxPurgeUtlity')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'ReplDocInboxOutboxPurgeUtlity'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'ReplDocInboxOutboxPurgeUtlity'
, 'IDOMTH'
, 'CorInboxEntries.ReplDocInboxOutboxPurgeUtlitySp'
, 0
, 20
)
GO