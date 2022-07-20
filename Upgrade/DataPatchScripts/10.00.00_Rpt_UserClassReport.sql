SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_UserClassReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_UserClassReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'User Class Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'User Class Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'UserClassReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'UserClassReport'
WHERE ViewName = N'User Class Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'User Class Report' AND IDOName = N'UserClassReport' AND IDOAlias = 'UserClassReport')
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
   N'User Class Report',--ViewName
   N'UserClassReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'UserClassReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_UserClassSp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Class Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Class Report',--ViewName
   N'UserClassClassDesc',--PropertyName
   1,--Seq
   N'UserClassReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Class Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Class Report',--ViewName
   N'UserClassClassLabel',--PropertyName
   2,--Seq
   N'UserClassReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Class Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Class Report',--ViewName
   N'UserClassClassName',--PropertyName
   3,--Seq
   N'UserClassReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Class Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Class Report',--ViewName
   N'UserClassSysApply',--PropertyName
   4,--Seq
   N'UserClassReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSchemaImpactStatus'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   5,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSessionID'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Class Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Class Report',--ViewName
   6,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'User Class Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
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
   N'User Class Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>UserClassReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>UserClassReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>151</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserClassReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>UserClassReport_UserClassClassDesc</_ref><Key>UserClassClassDesc</Key><ID>UserClassClassDesc</ID><IsBound>true</IsBound><ColumnChooserCaption>Description</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>316</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserClassReport_UserClassClassDesc</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>UserClassReport_UserClassClassLabel</_ref><Key>UserClassClassLabel</Key><ID>UserClassClassLabel</ID><IsBound>true</IsBound><ColumnChooserCaption>Label</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>308</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserClassReport_UserClassClassLabel</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>UserClassReport_UserClassClassName</_ref><Key>UserClassClassName</Key><ID>UserClassClassName</ID><IsBound>true</IsBound><ColumnChooserCaption>Class Name</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>234</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserClassReport_UserClassClassName</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>UserClassReport_UserClassSysApply</_ref><Key>UserClassSysApply</Key><ID>UserClassSysApply</ID><IsBound>true</IsBound><ColumnChooserCaption>Schema-Impact Status</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>292</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserClassReport_UserClassSysApply</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>UserClassReport</Ref><KeyID>UserClassReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   NULL,--ReportOrientation
   1 --DefaultView
)

