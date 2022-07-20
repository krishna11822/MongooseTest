SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_UserIndexReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_UserIndexReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'User Index Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'User Index Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'UserIndexReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'UserIndexReport'
WHERE ViewName = N'User Index Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'User Index Report' AND IDOName = N'UserIndexReport' AND IDOAlias = 'UserIndexReport')
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
   N'User Index Report',--ViewName
   N'UserIndexReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'UserIndexReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_UserIndexSp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'FldName',--PropertyName
   1,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'IndexAscending',--PropertyName
   2,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'IndexName',--PropertyName
   3,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'IndexUnique',--PropertyName
   4,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'IndexWord',--PropertyName
   5,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'SysApply',--PropertyName
   6,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Index Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Index Report',--ViewName
   N'UserClassName',--PropertyName
   7,--Seq
   N'UserIndexReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingUserIndex'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingUserIndex'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   5,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSchemaImpactStatus'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   6,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sPageBetweenClasses'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   7,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Index Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Index Report',--ViewName
   8,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'User Index Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
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
   N'User Index Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><_ItemId>PBT=[WBDataViewLayout] dvl.ID=[6272c1b4-f934-479d-a636-aa7607839156] dvl.DT=[2016-02-24 22:31:00.017]</_ItemId><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>UserIndexReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>UserIndexReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>301</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>UserIndexReport_FldName</_ref><Key>FldName</Key><ID>FldName</ID><IsBound>true</IsBound><ColumnChooserCaption>Field Name</ColumnChooserCaption><VisiblePosition>250</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>173</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>5</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_FldName</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>UserIndexReport_IndexAscending</_ref><Key>IndexAscending</Key><ID>IndexAscending</ID><IsBound>true</IsBound><ColumnChooserCaption>Ascending</ColumnChooserCaption><VisiblePosition>200</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>168</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>4</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_IndexAscending</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>UserIndexReport_IndexName</_ref><Key>IndexName</Key><ID>IndexName</ID><IsBound>true</IsBound><ColumnChooserCaption>Index Name</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>169</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_IndexName</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>UserIndexReport_IndexUnique</_ref><Key>IndexUnique</Key><ID>IndexUnique</ID><IsBound>true</IsBound><ColumnChooserCaption>IndexUnique</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>183</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_IndexUnique</Ref></ColumnInfo></value></item><item><key><int>5</int></key><value><ColumnInfo><_ref>UserIndexReport_IndexWord</_ref><Key>IndexWord</Key><ID>IndexWord</ID><IsBound>true</IsBound><ColumnChooserCaption>Word</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>168</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Boolean</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_IndexWord</Ref></ColumnInfo></value></item><item><key><int>6</int></key><value><ColumnInfo><_ref>UserIndexReport_SysApply</_ref><Key>SysApply</Key><ID>SysApply</ID><IsBound>true</IsBound><ColumnChooserCaption>Impact Schema Status</ColumnChooserCaption><VisiblePosition>300</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>227</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>6</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_SysApply</Ref></ColumnInfo></value></item><item><key><int>7</int></key><value><ColumnInfo><_ref>UserIndexReport_UserClassName</_ref><Key>UserClassName</Key><ID>UserClassName</ID><IsBound>true</IsBound><ColumnChooserCaption>Class Name</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>223</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserIndexReport_UserClassName</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>UserIndexReport</Ref><KeyID>UserIndexReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   NULL,--ReportOrientation
   1 --DefaultView
)

