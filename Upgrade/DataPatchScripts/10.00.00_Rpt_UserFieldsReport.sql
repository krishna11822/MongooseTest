SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: ApplicationDB\DataPatchScripts\Rpt_UserFieldsReport.sql 10.1.0.1 03/30/2018 14:27:22 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/DataPatchScripts/Rpt_UserFieldsReport.sql $ */

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataView WHERE ViewName = N'User Fields Report')
INSERT INTO dbo.WBDataView (
   ViewName,
   ReportOrientation,
   IsSystemRecord,
   CriteriaForm
) VALUES (
   N'User Fields Report',--ViewName
   N'L',--ReportOrientation
   1,
   N'UserFieldsReport'
)

UPDATE dbo.WBDataView
SET CriteriaForm = N'UserFieldsReport'
WHERE ViewName = N'User Fields Report'
AND CriteriaForm IS NULL

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewIDO WHERE ViewName = N'User Fields Report' AND IDOName = N'UserFieldsReport' AND IDOAlias = 'UserFieldsReport')
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
   N'User Fields Report',--ViewName
   N'UserFieldsReport',--IDOName
   NULL,--ParentIDO
   NULL,--Filter
   NULL,--ParentLinks
   NULL,--OrderBy
   N'UserFieldsReport',--IDOAlias
   N'M',--LinkType
   -9,--RecordCap
   N'M',--SourceType
   N'Rpt_UserFieldsSp',--SourceName
   1,--IsSystemRecord
   0,--ShowInternalNotes
   0 --ShowExternalNotes
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldDataType',--PropertyName
   1,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldDecimals',--PropertyName
   2,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldDescription',--PropertyName
   3,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldInitial',--PropertyName
   4,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldName',--PropertyName
   5,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldPrecision',--PropertyName
   6,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'FldUDT',--PropertyName
   7,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'UserClassDesc',--PropertyName
   8,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 9)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'UserClassLabel',--PropertyName
   9,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 10)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'UserClassName',--PropertyName
   10,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 11)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'UserClassSysApply',--PropertyName
   11,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewColumn WHERE ViewName = N'User Fields Report' AND Seq = 12)
INSERT INTO dbo.WBDataViewColumn (
   ViewName,
   PropertyName,
   Seq,
   IDOAlias,
   ColumnHeaderOverride,
   IsSystemRecord
) VALUES (
   N'User Fields Report',--ViewName
   N'UserFieldsSysApply',--PropertyName
   12,--Seq
   N'UserFieldsReport',--IDOAlias
   NULL,--ColumnHeaderOverride
   1 --IsSystemRecord
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 1)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   1,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 2)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   2,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingClassName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 3)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   3,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sStartingUserFieldName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 4)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   4,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sEndingUserFieldName'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 5)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   5,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSchemaImpactStatus'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 6)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   6,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sPageBetweenClasses'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 7)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   7,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sDisplayHeader'--Description
)
IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewParameter WHERE ViewName = N'User Fields Report' AND Seq = 8)
INSERT INTO dbo.WBDataViewParameter (
   ViewName,   
   Seq,
   PropertyName,
   Operator,
   Description
) VALUES (
   N'User Fields Report',--ViewName
   8,--Seq
   NULL,--PropertyName
   'MP',--Operator
   N'sSite'--Description
)

IF NOT EXISTS (SELECT 1 FROM dbo.WBDataViewLayout WHERE LayoutName = N'ReportOutput' AND SourceType = N'V' AND SourceName = N'User Fields Report' AND ScopeName = N'[NULL]' AND ScopeType = 0)
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
   N'User Fields Report',--SourceName
   N'[NULL]',--ScopeName
   0,--ScopeType
   N'WBDataViewResults',--ComponentName
   N'<DataViewLayout xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><LayoutName>ReportOutput</LayoutName><ScopeType>0</ScopeType><ScopeName>[NULL]</ScopeName><DefaultView>true</DefaultView><_ItemId>PBT=[WBDataViewLayout] dvl.ID=[6879af2a-06c3-4818-8779-f8ae41530ae3] dvl.DT=[2016-02-24 20:54:01.730]</_ItemId><BandCount>1</BandCount><Bands><item><key><int>0</int></key><value><BandInfo><Key>UserFieldsReport</Key><Index>0</Index><ParentIndex>-1</ParentIndex><Caption /><Columns><item><key><int>0</int></key><value><ColumnInfo><_ref>UserFieldsReport_RowPointer</_ref><Key>RowPointer</Key><ID>RowPointer</ID><IsBound>true</IsBound><ColumnChooserCaption>Row Pointer</ColumnChooserCaption><VisiblePosition>551</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>0</Width><Hidden>true</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Guid</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_RowPointer</Ref></ColumnInfo></value></item><item><key><int>1</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldDataType</_ref><Key>FldDataType</Key><ID>FldDataType</ID><IsBound>true</IsBound><ColumnChooserCaption>Data Type</ColumnChooserCaption><VisiblePosition>300</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>154</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>6</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldDataType</Ref></ColumnInfo></value></item><item><key><int>2</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldDecimals</_ref><Key>FldDecimals</Key><ID>FldDecimals</ID><IsBound>true</IsBound><ColumnChooserCaption>Decimals</ColumnChooserCaption><VisiblePosition>500</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>168</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>10</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldDecimals</Ref></ColumnInfo></value></item><item><key><int>3</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldDescription</_ref><Key>FldDescription</Key><ID>FldDescription</ID><IsBound>true</IsBound><ColumnChooserCaption>Description</ColumnChooserCaption><VisiblePosition>250</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>229</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>5</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldDescription</Ref></ColumnInfo></value></item><item><key><int>4</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldInitial</_ref><Key>FldInitial</Key><ID>FldInitial</ID><IsBound>true</IsBound><ColumnChooserCaption>Initial Value</ColumnChooserCaption><VisiblePosition>400</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>187</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>8</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldInitial</Ref></ColumnInfo></value></item><item><key><int>5</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldName</_ref><Key>FldName</Key><ID>FldName</ID><IsBound>true</IsBound><ColumnChooserCaption>Field Name</ColumnChooserCaption><VisiblePosition>200</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>178</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>4</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldName</Ref></ColumnInfo></value></item><item><key><int>6</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldPrecision</_ref><Key>FldPrecision</Key><ID>FldPrecision</ID><IsBound>true</IsBound><ColumnChooserCaption>Precision</ColumnChooserCaption><VisiblePosition>550</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>165</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.Int64</DataType><FormulaHeader /><OriginX>11</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldPrecision</Ref></ColumnInfo></value></item><item><key><int>7</int></key><value><ColumnInfo><_ref>UserFieldsReport_FldUDT</_ref><Key>FldUDT</Key><ID>FldUDT</ID><IsBound>true</IsBound><ColumnChooserCaption>User Data Type</ColumnChooserCaption><VisiblePosition>350</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>175</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>7</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_FldUDT</Ref></ColumnInfo></value></item><item><key><int>8</int></key><value><ColumnInfo><_ref>UserFieldsReport_UserClassDesc</_ref><Key>UserClassDesc</Key><ID>UserClassDesc</ID><IsBound>true</IsBound><ColumnChooserCaption>Class Description</ColumnChooserCaption><VisiblePosition>50</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>237</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>1</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_UserClassDesc</Ref></ColumnInfo></value></item><item><key><int>9</int></key><value><ColumnInfo><_ref>UserFieldsReport_UserClassLabel</_ref><Key>UserClassLabel</Key><ID>UserClassLabel</ID><IsBound>true</IsBound><ColumnChooserCaption>Label</ColumnChooserCaption><VisiblePosition>100</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>181</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>2</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_UserClassLabel</Ref></ColumnInfo></value></item><item><key><int>10</int></key><value><ColumnInfo><_ref>UserFieldsReport_UserClassName</_ref><Key>UserClassName</Key><ID>UserClassName</ID><IsBound>true</IsBound><ColumnChooserCaption>Class Name</ColumnChooserCaption><VisiblePosition>0</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>229</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>0</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_UserClassName</Ref></ColumnInfo></value></item><item><key><int>11</int></key><value><ColumnInfo><_ref>UserFieldsReport_UserClassSysApply</_ref><Key>UserClassSysApply</Key><ID>UserClassSysApply</ID><IsBound>true</IsBound><ColumnChooserCaption>Schema-Impact Status</ColumnChooserCaption><VisiblePosition>150</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>238</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>3</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_UserClassSysApply</Ref></ColumnInfo></value></item><item><key><int>12</int></key><value><ColumnInfo><_ref>UserFieldsReport_UserFieldsSysApply</_ref><Key>UserFieldsSysApply</Key><ID>UserFieldsSysApply</ID><IsBound>true</IsBound><ColumnChooserCaption>User Fields Schema-Impact Status</ColumnChooserCaption><VisiblePosition>450</VisiblePosition><Fixed>false</Fixed><FixOnRight>-1</FixOnRight><Width>250</Width><Hidden>false</Hidden><Style>-1</Style><Format /><Formula /><DataType>System.String</DataType><FormulaHeader /><OriginX>9</OriginX><OriginY>0</OriginY><SpanX>1</SpanX><SpanY>1</SpanY><Ref>UserFieldsReport_UserFieldsSysApply</Ref></ColumnInfo></value></item></Columns><SortedColumns /><SummarySettings /><ColumnFilters /><Ref>UserFieldsReport</Ref><KeyID>UserFieldsReport</KeyID><ColumnsRef /><HeaderRef /><SortedColsRef /><SummarySettingsRef /><ColumnFiltersRef /></BandInfo></value></item></Bands><ColumnTypes /></DataViewLayout>',--Layout
   NULL,--ReportOrientation
   1 --DefaultView
)

