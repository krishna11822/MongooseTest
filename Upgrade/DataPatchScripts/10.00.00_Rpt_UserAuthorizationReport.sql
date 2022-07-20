SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_UserAuthorizationReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_UserAuthorizationReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'User Authorization Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'User Authorization Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'UserAuthorizationReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'UserAuthorizationReport'
WHERE ViewName = N'User Authorization Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'User Authorization Report' AND IDOName = N'UserAuthorizationReport' AND IDOAlias = 'UserAuthorizationReport')
INSERT INTO dbo.WBDataViewIDO (
   ViewName,
   IDOName,
   ParentIDO,
   Filter,
   ParentLinks,
   OrderBy,
   IDOAlias,
   LinkType,
   RecordCap,
   SourceType,
   SourceName,
   IsSystemRecord,
   ShowInternalNotes,
   ShowExternalNotes
) VALUES (
   N'User Authorization Report',--ViewName
   N'UserAuthorizationReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'UserAuthorizationReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_UserAuthorizationSp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'Active',--PropertyName
   1,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'BulkUpdatePrivilege',--PropertyName
   2,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'CollectionName',--PropertyName
   3,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'DeletePrivilege',--PropertyName
   4,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'EditLevel',--PropertyName
   5,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'EditPrivilege',--PropertyName
   6,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ExecutePrivilege',--PropertyName
   7,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'Filter',--PropertyName
   8,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'GroupDesc',--PropertyName
   9,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'GroupId',--PropertyName
   10,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'GroupName',--PropertyName
   11,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 12)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'InsertPrivilege',--PropertyName
   12,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 13)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'Level',--PropertyName
   13,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 14)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ModuleName',--PropertyName
   14,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 15)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ObjectName',--PropertyName
   15,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 16)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ObjectName1',--PropertyName
   16,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 17)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ObjectName2',--PropertyName
   17,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 18)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ObjectType',--PropertyName
   18,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 19)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'ReadPrivilege',--PropertyName
   19,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 20)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'Status',--PropertyName
   20,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 21)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'SuperUserFlag',--PropertyName
   21,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 22)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'UpdatePrivilege',--PropertyName
   22,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 23)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'UserDesc',--PropertyName
   23,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 24)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'UserId',--PropertyName
   24,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Authorization Report' AND Seq = 25)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Authorization Report',--ViewName
   N'UserName',--PropertyName
   25,--Seq
   N'UserAuthorizationReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingUsername'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingUsername'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingGroupName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingGroupName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   5,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sUserStatus'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   6,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEditLevel'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   7,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowOnlySuperUsers'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   8,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowUserObjectAuthorizations'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   9,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowUserRowAuthorizations'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   10,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowUserGroups'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   11,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowGroupObjectAuthorizations'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 12)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   12,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowGroupRowAuthorizations'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 13)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   13,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sShowUserModules'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 14)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   14,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 15)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   15,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sObjectType'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 16)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   16,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingObjectName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 17)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   17,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingObjectName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Authorization Report' AND Seq = 18)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Authorization Report',--ViewName
   18,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'User Authorization Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
INSERT INTO dbo.WBDataViewLayout (
   LayoutName,
   SourceType,
   SourceName,
   ScopeName,
   ScopeType,
   ComponentName,
   Layout,
   ReportOrientation,
   DefaultView
) VALUES (
   N'ReportOutput',--LayoutName
   N'V',--SourceType
   N'User Authorization Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><_ItemId>PBT=[WBDataViewLayout] dvl.ID=[e02bf66f-c197-44b3-82f1-03f289b66c43] dvl.DT=[2016-02-24 04:24:04.363]</_ItemId><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>UserAuthorizationReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>901</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_Active</_ref><Key>Active</Key><ID>Active</ID><IsBound>true</IsBound><ColumnChooserCaption>Active</ColumnChooserCaption><VisiblePosition>902</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_Active</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_BulkUpdatePrivilege</_ref><Key>BulkUpdatePrivilege</Key><ID>BulkUpdatePrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Bulk</ColumnChooserCaption><VisiblePosition>650</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>68</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>13</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_BulkUpdatePrivilege</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_CollectionName</_ref><Key>CollectionName</Key><ID>CollectionName</ID><IsBound>true</IsBound><ColumnChooserCaption>IDO</ColumnChooserCaption><VisiblePosition>750</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>15</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_CollectionName</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_DeletePrivilege</_ref><Key>DeletePrivilege</Key><ID>DeletePrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Delete</ColumnChooserCaption><VisiblePosition>400</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>67</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>8</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_DeletePrivilege</Ref></ColumnInfo></value></item><item><key><int>5</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_EditLevel</_ref><Key>EditLevel</Key><ID>EditLevel</ID><IsBound>true</IsBound><ColumnChooserCaption>Editing Permissions</ColumnChooserCaption><VisiblePosition>200</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>4</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_EditLevel</Ref></ColumnInfo></value></item><item><key><int>6</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_EditPrivilege</_ref><Key>EditPrivilege</Key><ID>EditPrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Edit</ColumnChooserCaption><VisiblePosition>450</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>72</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>9</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_EditPrivilege</Ref></ColumnInfo></value></item><item><key><int>7</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ExecutePrivilege</_ref><Key>ExecutePrivilege</Key><ID>ExecutePrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Execute</ColumnChooserCaption><VisiblePosition>500</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>75</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>10</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ExecutePrivilege</Ref></ColumnInfo></value></item><item><key><int>8</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_Filter</_ref><Key>Filter</Key><ID>Filter</ID><IsBound>true</IsBound><ColumnChooserCaption>Filter</ColumnChooserCaption><VisiblePosition>800</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>231</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>16</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_Filter</Ref></ColumnInfo></value></item><item><key><int>9</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_GroupDesc</_ref><Key>GroupDesc</Key><ID>GroupDesc</ID><IsBound>true</IsBound><ColumnChooserCaption>GroupDesc</ColumnChooserCaption><VisiblePosition>903</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>8</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_GroupDesc</Ref></ColumnInfo></value></item><item><key><int>10</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_GroupId</_ref><Key>GroupId</Key><ID>GroupId</ID><IsBound>true</IsBound><ColumnChooserCaption>GroupId</ColumnChooserCaption><VisiblePosition>904</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Decimal</DataType><FormulaHeader /><OriginX>9</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_GroupId</Ref></ColumnInfo></value></item><item><key><int>11</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_GroupName</_ref><Key>GroupName</Key><ID>GroupName</ID><IsBound>true</IsBound><ColumnChooserCaption>Authorization</ColumnChooserCaption><VisiblePosition>350</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>7</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_GroupName</Ref></ColumnInfo></value></item><item><key><int>12</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_InsertPrivilege</_ref><Key>InsertPrivilege</Key><ID>InsertPrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Insert</ColumnChooserCaption><VisiblePosition>550</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>68</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>11</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_InsertPrivilege</Ref></ColumnInfo></value></item><item><key><int>13</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_Level</_ref><Key>Level</Key><ID>Level</ID><IsBound>true</IsBound><ColumnChooserCaption>Level</ColumnChooserCaption><VisiblePosition>905</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>12</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_Level</Ref></ColumnInfo></value></item><item><key><int>14</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ModuleName</_ref><Key>ModuleName</Key><ID>ModuleName</ID><IsBound>true</IsBound><ColumnChooserCaption>Module Name</ColumnChooserCaption><VisiblePosition>900</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>18</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ModuleName</Ref></ColumnInfo></value></item><item><key><int>15</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ObjectName</_ref><Key>ObjectName</Key><ID>ObjectName</ID><IsBound>true</IsBound><ColumnChooserCaption>Object Name</ColumnChooserCaption><VisiblePosition>906</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>14</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ObjectName</Ref></ColumnInfo></value></item><item><key><int>16</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ObjectName1</_ref><Key>ObjectName1</Key><ID>ObjectName1</ID><IsBound>true</IsBound><ColumnChooserCaption>Form / IDO</ColumnChooserCaption><VisiblePosition>250</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>5</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ObjectName1</Ref></ColumnInfo></value></item><item><key><int>17</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ObjectName2</_ref><Key>ObjectName2</Key><ID>ObjectName2</ID><IsBound>true</IsBound><ColumnChooserCaption>Object Name</ColumnChooserCaption><VisiblePosition>850</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>17</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ObjectName2</Ref></ColumnInfo></value></item><item><key><int>18</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ObjectType</_ref><Key>ObjectType</Key><ID>ObjectType</ID><IsBound>true</IsBound><ColumnChooserCaption>Component</ColumnChooserCaption><VisiblePosition>300</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>6</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ObjectType</Ref></ColumnInfo></value></item><item><key><int>19</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_ReadPrivilege</_ref><Key>ReadPrivilege</Key><ID>ReadPrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Read</ColumnChooserCaption><VisiblePosition>600</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>72</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>12</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_ReadPrivilege</Ref></ColumnInfo></value></item><item><key><int>20</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_Status</_ref><Key>Status</Key><ID>Status</ID><IsBound>true</IsBound><ColumnChooserCaption>User Login Status</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_Status</Ref></ColumnInfo></value></item><item><key><int>21</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_SuperUserFlag</_ref><Key>SuperUserFlag</Key><ID>SuperUserFlag</ID><IsBound>true</IsBound><ColumnChooserCaption>Super User</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_SuperUserFlag</Ref></ColumnInfo></value></item><item><key><int>22</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_UpdatePrivilege</_ref><Key>UpdatePrivilege</Key><ID>UpdatePrivilege</ID><IsBound>true</IsBound><ColumnChooserCaption>Update</ColumnChooserCaption><VisiblePosition>700</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>68</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>14</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_UpdatePrivilege</Ref></ColumnInfo></value></item><item><key><int>23</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_UserDesc</_ref><Key>UserDesc</Key><ID>UserDesc</ID><IsBound>true</IsBound><ColumnChooserCaption>User Description</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>126</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_UserDesc</Ref></ColumnInfo></value></item><item><key><int>24</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_UserId</_ref><Key>UserId</Key><ID>UserId</ID><IsBound>true</IsBound><ColumnChooserCaption>UserId</ColumnChooserCaption><VisiblePosition>907</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Decimal</DataType><FormulaHeader /><OriginX>23</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_UserId</Ref></ColumnInfo></value></item><item><key><int>25</int></key><value><ColumnInfo><_ref>UserAuthorizationReport_UserName</_ref><Key>UserName</Key><ID>UserName</ID><IsBound>true</IsBound><ColumnChooserCaption>User ID</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserAuthorizationReport_UserName</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>UserAuthorizationReport</Ref><KeyID>UserAuthorizationReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   N'L',--ReportOrientation
   1 --DefaultView
)

