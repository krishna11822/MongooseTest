SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_QuickDictionaryReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_QuickDictionaryReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'Quick Dictionary Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'QuickDictionaryReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'QuickDictionaryReport'
WHERE ViewName = N'Quick Dictionary Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'Quick Dictionary Report' AND IDOName = N'QuickDictionaryReport' AND IDOAlias = 'QuickDictionaryReport')
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
   N'Quick Dictionary Report',--ViewName
   N'QuickDictionaryReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'QuickDictionaryReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_QuickDictionarySp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'ClassName',--PropertyName
   1,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'DataType',--PropertyName
   2,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'FieldName',--PropertyName
   3,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'FldDecimals',--PropertyName
   4,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'FldPrec',--PropertyName
   5,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'FldUDT',--PropertyName
   6,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'IndexFieldName',--PropertyName
   7,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'IndexName',--PropertyName
   8,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'TableName',--PropertyName
   9,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'TableRule',--PropertyName
   10,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'UserFieldImpactSchema',--PropertyName
   11,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 12)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'UserIndexAsc',--PropertyName
   12,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 13)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'UserIndexUnique',--PropertyName
   13,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Quick Dictionary Report' AND Seq = 14)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Quick Dictionary Report',--ViewName
   N'Word',--PropertyName
   14,--Seq
   N'QuickDictionaryReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingUserFieldName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingUserFieldName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   5,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingIndexName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   6,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingIndexName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   7,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSchemaImpactStatus'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   8,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sPageBetweenClasses'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   9,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayReportHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   10,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSessionID'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Quick Dictionary Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Quick Dictionary Report',--ViewName
   11,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'Quick Dictionary Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
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
   N'Quick Dictionary Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><_ItemId>PBT=[WBDataViewLayout] dvl.ID=[c1efde7c-ce61-4727-8b82-2beed308a20e] dvl.DT=[2016-02-25 02:00:53.940]</_ItemId><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>QuickDictionaryReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>651</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_ClassName</_ref><Key>ClassName</Key><ID>ClassName</ID><IsBound>true</IsBound><ColumnChooserCaption>Class Name</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>165</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_ClassName</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_DataType</_ref><Key>DataType</Key><ID>DataType</ID><IsBound>true</IsBound><ColumnChooserCaption>Data Type</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>211</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_DataType</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_FieldName</_ref><Key>FieldName</Key><ID>FieldName</ID><IsBound>true</IsBound><ColumnChooserCaption>Field Name</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>202</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_FieldName</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_FldDecimals</_ref><Key>FldDecimals</Key><ID>FldDecimals</ID><IsBound>true</IsBound><ColumnChooserCaption>Decimals</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>78</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_FldDecimals</Ref></ColumnInfo></value></item><item><key><int>5</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_FldPrec</_ref><Key>FldPrec</Key><ID>FldPrec</ID><IsBound>true</IsBound><ColumnChooserCaption>Precision</ColumnChooserCaption><VisiblePosition>200</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>84</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>4</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_FldPrec</Ref></ColumnInfo></value></item><item><key><int>6</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_FldUDT</_ref><Key>FldUDT</Key><ID>FldUDT</ID><IsBound>true</IsBound><ColumnChooserCaption>User Data Type</ColumnChooserCaption><VisiblePosition>250</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>199</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>5</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_FldUDT</Ref></ColumnInfo></value></item><item><key><int>7</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_IndexFieldName</_ref><Key>IndexFieldName</Key><ID>IndexFieldName</ID><IsBound>true</IsBound><ColumnChooserCaption>Index Fields</ColumnChooserCaption><VisiblePosition>550</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>146</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>11</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_IndexFieldName</Ref></ColumnInfo></value></item><item><key><int>8</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_IndexName</_ref><Key>IndexName</Key><ID>IndexName</ID><IsBound>true</IsBound><ColumnChooserCaption>Index Name</ColumnChooserCaption><VisiblePosition>350</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>120</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>7</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_IndexName</Ref></ColumnInfo></value></item><item><key><int>9</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_TableName</_ref><Key>TableName</Key><ID>TableName</ID><IsBound>true</IsBound><ColumnChooserCaption>Table Name</ColumnChooserCaption><VisiblePosition>600</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>152</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>12</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_TableName</Ref></ColumnInfo></value></item><item><key><int>10</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_TableRule</_ref><Key>TableRule</Key><ID>TableRule</ID><IsBound>true</IsBound><ColumnChooserCaption>Table Rule</ColumnChooserCaption><VisiblePosition>650</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>166</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>13</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_TableRule</Ref></ColumnInfo></value></item><item><key><int>11</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_UserFieldImpactSchema</_ref><Key>UserFieldImpactSchema</Key><ID>UserFieldImpactSchema</ID><IsBound>true</IsBound><ColumnChooserCaption>Impact Schema Status</ColumnChooserCaption><VisiblePosition>300</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>161</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>6</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_UserFieldImpactSchema</Ref></ColumnInfo></value></item><item><key><int>12</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_UserIndexAsc</_ref><Key>UserIndexAsc</Key><ID>UserIndexAsc</ID><IsBound>true</IsBound><ColumnChooserCaption>Ascending</ColumnChooserCaption><VisiblePosition>500</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>86</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>10</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_UserIndexAsc</Ref></ColumnInfo></value></item><item><key><int>13</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_UserIndexUnique</_ref><Key>UserIndexUnique</Key><ID>UserIndexUnique</ID><IsBound>true</IsBound><ColumnChooserCaption>Unique</ColumnChooserCaption><VisiblePosition>400</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>73</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>8</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_UserIndexUnique</Ref></ColumnInfo></value></item><item><key><int>14</int></key><value><ColumnInfo><_ref>QuickDictionaryReport_Word</_ref><Key>Word</Key><ID>Word</ID><IsBound>true</IsBound><ColumnChooserCaption>Word</ColumnChooserCaption><VisiblePosition>450</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>72</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>9</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>QuickDictionaryReport_Word</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>QuickDictionaryReport</Ref><KeyID>QuickDictionaryReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   NULL,--ReportOrientation
   1 --DefaultView
)

