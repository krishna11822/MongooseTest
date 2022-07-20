SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_DatabaseSchemaReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_DatabaseSchemaReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'Database Schema Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'Database Schema Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'DatabaseSchemaReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'DatabaseSchemaReport'
WHERE ViewName = N'Database Schema Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'Database Schema Report' AND IDOName = N'DatabaseSchemaReport' AND IDOAlias = 'DatabaseSchemaReport')
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
   N'Database Schema Report',--ViewName
   N'DatabaseSchemaReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'DatabaseSchemaReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_DatabaseSchemaSp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Field',--PropertyName
   1,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'FieldDescription',--PropertyName
   2,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'IndexFields',--PropertyName
   3,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'IndexName',--PropertyName
   4,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Length',--PropertyName
   5,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Precision',--PropertyName
   6,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Scale',--PropertyName
   7,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Table',--PropertyName
   8,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'TableDescription',--PropertyName
   9,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'Type',--PropertyName
   10,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'Database Schema Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'Database Schema Report',--ViewName
   N'UserDefinedDataType',--PropertyName
   11,--Seq
   N'DatabaseSchemaReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Database Schema Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Database Schema Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingTable'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Database Schema Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Database Schema Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingTable'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Database Schema Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Database Schema Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayReportHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'Database Schema Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'Database Schema Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'Database Schema Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
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
   N'Database Schema Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><_ItemId>PBT=[WBDataViewLayout] dvl.ID=[9f46d1a7-0f17-4938-ac5c-ead58185e46e] dvl.DT=[2016-02-25 00:52:01.283]</_ItemId><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>DatabaseSchemaReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>501</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Field</_ref><Key>Field</Key><ID>Field</ID><IsBound>true</IsBound><ColumnChooserCaption>Field</ColumnChooserCaption><VisiblePosition>200</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>123</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>4</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Field</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_FieldDescription</_ref><Key>FieldDescription</Key><ID>FieldDescription</ID><IsBound>true</IsBound><ColumnChooserCaption>Field Description</ColumnChooserCaption><VisiblePosition>500</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>221</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>10</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_FieldDescription</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_IndexFields</_ref><Key>IndexFields</Key><ID>IndexFields</ID><IsBound>true</IsBound><ColumnChooserCaption>Index Fields</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>117</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_IndexFields</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_IndexName</_ref><Key>IndexName</Key><ID>IndexName</ID><IsBound>true</IsBound><ColumnChooserCaption>Index Name</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>563</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_IndexName</Ref></ColumnInfo></value></item><item><key><int>5</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Length</_ref><Key>Length</Key><ID>Length</ID><IsBound>true</IsBound><ColumnChooserCaption>Length</ColumnChooserCaption><VisiblePosition>350</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>64</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>7</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Length</Ref></ColumnInfo></value></item><item><key><int>6</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Precision</_ref><Key>Precision</Key><ID>Precision</ID><IsBound>true</IsBound><ColumnChooserCaption>Precision</ColumnChooserCaption><VisiblePosition>400</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>74</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>8</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Precision</Ref></ColumnInfo></value></item><item><key><int>7</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Scale</_ref><Key>Scale</Key><ID>Scale</ID><IsBound>true</IsBound><ColumnChooserCaption>Scale</ColumnChooserCaption><VisiblePosition>450</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>64</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>9</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Scale</Ref></ColumnInfo></value></item><item><key><int>8</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Table</_ref><Key>Table</Key><ID>Table</ID><IsBound>true</IsBound><ColumnChooserCaption>Table</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>220</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Table</Ref></ColumnInfo></value></item><item><key><int>9</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_TableDescription</_ref><Key>TableDescription</Key><ID>TableDescription</ID><IsBound>true</IsBound><ColumnChooserCaption>Description</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>227</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_TableDescription</Ref></ColumnInfo></value></item><item><key><int>10</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_Type</_ref><Key>Type</Key><ID>Type</ID><IsBound>true</IsBound><ColumnChooserCaption>Type</ColumnChooserCaption><VisiblePosition>300</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>111</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>6</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_Type</Ref></ColumnInfo></value></item><item><key><int>11</int></key><value><ColumnInfo><_ref>DatabaseSchemaReport_UserDefinedDataType</_ref><Key>UserDefinedDataType</Key><ID>UserDefinedDataType</ID><IsBound>true</IsBound><ColumnChooserCaption>User-Defined Data Types</ColumnChooserCaption><VisiblePosition>250</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>196</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>5</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>DatabaseSchemaReport_UserDefinedDataType</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>DatabaseSchemaReport</Ref><KeyID>DatabaseSchemaReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   N'L',--ReportOrientation
   1 --DefaultView
)

