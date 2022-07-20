--DataTypes
SET NOCOUNT ON

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBCategoryType')
   CREATE TYPE WBCategoryType FROM NVARCHAR(20) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBKPINumType')
   CREATE TYPE WBKPINumType FROM INT NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBOperatorType')
   CREATE TYPE WBOperatorType FROM NVARCHAR(2) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBProgNameType')
   CREATE TYPE WBProgNameType FROM NVARCHAR(80) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBColorType')
   CREATE TYPE WBColorType FROM NVARCHAR(11) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBSymbolType')
   CREATE TYPE WBSymbolType FROM NCHAR(1) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBEmailTypeType')
   CREATE TYPE WBEmailTypeType FROM NVARCHAR(10) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBProfileType')
   CREATE TYPE WBProfileType FROM NVARCHAR(40) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDrillNumType')
   CREATE TYPE WBDrillNumType FROM INT NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBSourceTypeType')
   CREATE TYPE WBSourceTypeType FROM NVARCHAR(1) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBSourceNameType')
   CREATE TYPE WBSourceNameType FROM NVARCHAR(500) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBSourceParmsType')
   CREATE TYPE WBSourceParmsType FROM NVARCHAR(500) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDetailTypeType')
   CREATE TYPE WBDetailTypeType FROM NVARCHAR(1) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDetailNameType')
   CREATE TYPE WBDetailNameType FROM NVARCHAR(500) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDetailParmsType')
   CREATE TYPE WBDetailParmsType FROM NVARCHAR(500) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDrillColNameType')
   CREATE TYPE WBDrillColNameType FROM NCHAR(6) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBDisplayTypeType')
   CREATE TYPE WBDisplayTypeType FROM NCHAR(2) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBFooterFormatType')
   CREATE TYPE WBFooterFormatType FROM NCHAR(1) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBAggregateNameType')
   CREATE TYPE WBAggregateNameType FROM NVARCHAR(10) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBPropertyNameType')
   CREATE TYPE WBPropertyNameType FROM NVARCHAR(80) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBFilterType')
   CREATE TYPE WBFilterType FROM NVARCHAR(MAX) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBLinkType')
   CREATE TYPE WBLinkType FROM nchar(1) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBScopeTypeType')
   CREATE TYPE WBScopeTypeType FROM smallint NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBScopeNameType')
   CREATE TYPE WBScopeNameType FROM NVARCHAR(50) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBRecordCapType')
   CREATE TYPE WBRecordCapType FROM int NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBPropertyClassNameType')
   CREATE TYPE WBPropertyClassNameType FROM NVARCHAR(50) NULL

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS WHERE DOMAIN_SCHEMA = N'dbo' AND DOMAIN_NAME = N'WBActionTypeType')
   CREATE TYPE WBActionTypeType FROM NCHAR(1) NULL
GO

--Tables
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cat')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBCategory')
BEGIN
   CREATE TABLE [WBCategory]
   (
      [Category] [WBCategoryType] NOT NULL,
      [Description] [DescriptionType] NULL,
      [RequiredTables] [LongListType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cat_users')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBCategoryUser')
BEGIN
   CREATE TABLE [WBCategoryUser]
   (
      [Category] [WBCategoryType] NOT NULL,
      [Username] [UsernameType] NOT NULL,
      [CanDrilldown] [ListYesNoType] NOT NULL,
      [CanRun] [ListYesNoType] NOT NULL,
      [CanUpdateParameters] [ListYesNoType] NOT NULL,
      [CanUser] [ListYesNoType] NOT NULL,
      [ReceiveDrilldown] [ListYesNoType] NOT NULL,
      [ReceiveEmail] [ListYesNoType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cr_cat')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPICategory')
BEGIN
   CREATE TABLE [WBKPICategory]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [Category] [WBCategoryType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cr_drilldown')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPIDrilldown')
BEGIN
   CREATE TABLE [WBKPIDrilldown]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [DrillNum] [WBDrillNumType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cr_filter')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPIFilter')
BEGIN
   CREATE TABLE [WBKPIFilter]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [Seq] [SequenceType] NOT NULL,
      [Description] [DescriptionType] NULL,
      [PropertyName] [WBPropertyNameType] NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cr_num')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPI')
BEGIN
   CREATE TABLE [WBKPI]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [Active] [ListYesNoType] NOT NULL,
      [AlertOperator] [WBOperatorType] NULL,
      [AlertUse] [ListYesNoType] NOT NULL,
      [AlertValue] [AmountType] NULL,
      [CannedKPINum] [WBKPINumType] NULL,
      [Description] [DescriptionType] NULL,
      [GoalOperator] [WBOperatorType] NULL,
      [GoalUse] [ListYesNoType] NOT NULL,
      [GoalValue] [AmountType] NULL,
      [ShortDescription] [DescriptionType] NULL,
      [SnapshotUse] [ListYesNoType] NOT NULL,
      [SourceType] [WBSourceTypeType] NOT NULL,
      [SourceName] [WBSourceNameType] NULL,
      [RequiredTables] [LongListType] NULL,
      [AggregateName] [WBAggregateNameType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NULL,
      [Filter] [WBFilterType] NULL,
      [GroupPropertyName] [WBPropertyNameType] NULL,
      [DatePropertyName] [WBPropertyNameType] NULL,
      [Rolling] [ListYesNoType] NOT NULL,
      [RollingLength] [GenericIntType] NULL,
      [RollingStart] [GenericIntType] NULL,
      [RollingAlertValue] [AmountType] NULL,
      [RollingGoalValue] [AmountType] NULL,
      [RollingDescription] [DescriptionType] NULL,
      [Ytd] [ListYesNoType] NOT NULL,
      [YtdAlertValue] [AmountType] NULL,
      [YtdGoalValue] [AmountType] NULL,
      [YtdDescription] [DescriptionType] NULL,
      [Ptd] [ListYesNoType] NOT NULL,
      [PtdAlertValue] [AmountType] NULL,
      [PtdGoalValue] [AmountType] NULL,
      [PtdDescription] [DescriptionType] NULL,
      [Wtd] [ListYesNoType] NOT NULL,
      [WtdAlertValue] [AmountType] NULL,
      [WtdGoalValue] [AmountType] NULL,
      [WtdDescription] [DescriptionType] NULL,
      [Today] [ListYesNoType] NOT NULL,
      [TodayAlertValue] [AmountType] NULL,
      [TodayGoalValue] [AmountType] NULL,
      [TodayDescription] [DescriptionType] NULL,
      [Lytd] [ListYesNoType] NOT NULL,
      [LytdAlertValue] [AmountType] NULL,
      [LytdGoalValue] [AmountType] NULL,
      [LytdDescription] [DescriptionType] NULL,
      [Lyptd] [ListYesNoType] NOT NULL,
      [LyptdAlertValue] [AmountType] NULL,
      [LyptdGoalValue] [AmountType] NULL,
      [LyptdDescription] [DescriptionType] NULL,
      [Ly] [ListYesNoType] NOT NULL,
      [LyAlertValue] [AmountType] NULL,
      [LyGoalValue] [AmountType] NULL,
      [LyDescription] [DescriptionType] NULL,
      [Lp] [ListYesNoType] NOT NULL,
      [LpAlertValue] [AmountType] NULL,
      [LpGoalValue] [AmountType] NULL,
      [LpDescription] [DescriptionType] NULL,
      [Lw] [ListYesNoType] NOT NULL,
      [LwAlertValue] [AmountType] NULL,
      [LwGoalValue] [AmountType] NULL,
      [LwDescription] [DescriptionType] NULL,
      [Yesterday] [ListYesNoType] NOT NULL,
      [YesterdayAlertValue] [AmountType] NULL,
      [YesterdayGoalValue] [AmountType] NULL,
      [YesterdayDescription] [DescriptionType] NULL,
      [DisplayBlank] [ListYesNoType] NOT NULL,
      [CalculationDescription] [Infobar] NULL,
      [Divisor] [AmountType] NOT NULL,
      [Places] [GenericIntType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_cr_parms')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPIParameter')
BEGIN
   CREATE TABLE [WBKPIParameter]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [Name] [NameType] NOT NULL,
      [Value] [DescriptionType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataView')
BEGIN
   CREATE TABLE [WBDataView]
   (
      [ViewName] [NameType] NOT NULL,
      [AccessAs] [AccessAsType] NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_action')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewAction')
BEGIN
   CREATE TABLE [WBDataViewAction]
   (
      [ScopeType] [WBScopeTypeType] NOT NULL,
      [ScopeName] [WBScopeNameType] NOT NULL,
      [ClassName] [WBPropertyClassNameType] NULL,
      [IDOName] [ObjectNameType] NULL,
      [PropertyName] [WBPropertyNameType] NULL,
      [ActionType] [WBActionTypeType] NOT NULL,
      [ActionName] [NameType] NOT NULL,
      [ActionParameters] [WBDetailParmsType] NULL,
      [ActionFilter] [WBFilterType] NULL,
      [ActionInitialMode] [NameType] NULL,
      [ActionProperty] [WBPropertyNameType] NULL,
      [Active] [ListYesNoType] NOT NULL,
      [Caption] [NameType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_column')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewColumn')
BEGIN
   CREATE TABLE [WBDataViewColumn]
   (
      [ViewName] [NameType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NOT NULL,
      [Seq] [SequenceType] NOT NULL,
      [IDOAlias] [ObjectNameType] NOT NULL,
      [ColumnHeaderOverride] [DescriptionType] NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_group')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewGroup')
BEGIN
   CREATE TABLE [WBDataViewGroup]
   (
      [GroupName] [GroupNameType] NOT NULL,
      [ViewName] [NameType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_ido')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewIDO')
BEGIN
   CREATE TABLE [WBDataViewIDO]
   (
      [ViewName] [NameType] NOT NULL,
      [IDOName] [ObjectNameType] NOT NULL,
      [ParentIDO] [ObjectNameType] NULL,
      [Filter] [WBFilterType] NULL,
      [ParentLinks] [WBFilterType] NULL,
      [OrderBy] [WBFilterType] NULL,
      [IDOAlias] [ObjectNameType] NOT NULL,
      [LinkType] [WBLinkType] NOT NULL,
      [RecordCap] [WBRecordCapType] NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_layout')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewLayout')
BEGIN
   CREATE TABLE [WBDataViewLayout]
   (
      [LayoutName] [NameType] NOT NULL,
      [SourceType] [WBSourceTypeType] NOT NULL,
      [SourceName] [NameType] NOT NULL,
      [ScopeName] [WBScopeNameType] NOT NULL,
      [ScopeType] [WBScopeTypeType] NOT NULL,
      [ComponentName] [FormNameType] NOT NULL,
      [Layout] [xml] NOT NULL,
      [DefaultView] [ListYesNoType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_data_view_user')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewUser')
BEGIN
   CREATE TABLE [WBDataViewUser]
   (
      [ViewName] [NameType] NOT NULL,
      [Username] [UsernameType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [DateTimeType] NOT NULL,
      [CreateDate] [DateTimeType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_drilldown')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDrilldown')
BEGIN
   CREATE TABLE [WBDrilldown]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [AlertOperator] [WBOperatorType] NULL,
      [AlertUse] [ListYesNoType] NOT NULL,
      [AlertValue] [AmountType] NULL,
      [DetailType] [WBDetailTypeType] NOT NULL,
      [DetailName] [WBDetailNameType] NULL,
      [DetailParameters] [WBDetailParmsType] NULL,
      [Description] [DescriptionType] NULL,
      [EmailDrilldown] [ListYesNoType] NOT NULL,
      [GoalOperator] [WBOperatorType] NULL,
      [GoalUse] [ListYesNoType] NOT NULL,
      [GoalValue] [AmountType] NULL,
      [SourceType] [WBSourceTypeType] NOT NULL,
      [SourceName] [WBSourceNameType] NULL,
      [RequiredTables] [LongListType] NULL,
      [Filter] [WBFilterType] NULL,
      [GoalAlertPropertyName] [WBPropertyNameType] NULL,
      [DatePropertyName] [WBPropertyNameType] NULL,
      [RecordCap] [WBRecordCapType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_drilldown_column')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDrilldownColumn')
BEGIN
   CREATE TABLE [WBDrilldownColumn]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [Seq] [SequenceType] NOT NULL,
      [ColumnHeader] [DescriptionType] NOT NULL,
      [ColumnName] [WBDrillColNameType] NOT NULL,
      [ColumnSize] [AmountType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL 
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_drill_cat')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDrilldownCategory')
BEGIN
   CREATE TABLE [WBDrilldownCategory]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [Category] [WBCategoryType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_drill_filter')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDrilldownFilter')
BEGIN
   CREATE TABLE [WBDrilldownFilter]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [Seq] [SequenceType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NULL,
      [Description] [DescriptionType] NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_drill_parms')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDrilldownParameter')
BEGIN
   CREATE TABLE [WBDrilldownParameter]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [Name] [NameType] NOT NULL,
      [Value] [DescriptionType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_permits')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPIUser')
BEGIN
   CREATE TABLE [WBKPIUser]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [Username] [UsernameType] NOT NULL,
      [CanDrilldown] [ListYesNoType] NOT NULL,
      [CanRun] [ListYesNoType] NOT NULL,
      [CanUpdateParameters] [ListYesNoType] NOT NULL,
      [CanUser] [ListYesNoType] NOT NULL,
      [ReceiveEmail] [ListYesNoType] NOT NULL,
      [ReceiveDrilldown] [ListYesNoType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_search_source')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSource')
BEGIN
   CREATE TABLE [WBSearchSource]
   (
      [SourceName] [NameType] NOT NULL,
      [IDOName] [ObjectNameType] NOT NULL,
      [Filter] [WBFilterType] NULL,
      [RecordCap] [WBRecordCapType] NULL,
      [Caption] [NameType] NULL,
      [OrderBy] [WBFilterType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_search_source_column')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSourceColumn')
BEGIN
   CREATE TABLE [WBSearchSourceColumn]
   (
      [SourceName] [NameType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NOT NULL,
      [ColumnHeaderOverride] [DescriptionType] NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_search_source_group')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSourceGroup')
BEGIN
   CREATE TABLE [WBSearchSourceGroup]
   (
      [SourceName] [NameType] NOT NULL,
      [GroupName] [GroupNameType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_search_source_item')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSourceItem')
BEGIN
   CREATE TABLE [WBSearchSourceItem]
   (
      [SourceName] [NameType] NOT NULL,
      [PropertyName] [WBPropertyNameType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_search_source_user')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSourceUser')
BEGIN
   CREATE TABLE [WBSearchSourceUser]
   (
      [SourceName] [NameType] NOT NULL,
      [Username] [UsernameType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_snapshot')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSnapshot')
BEGIN
   CREATE TABLE [WBSnapshot]
   (
      [Seq] [SequenceType]  IDENTITY (1, 1) NOT NULL,
      [ActualValue] [AmountType] NULL,
      [AlertDescription] [DescriptionType] NULL,
      [AlertOperator] [WBOperatorType] NULL,
      [AlertUse] [ListYesNoType] NOT NULL,
      [AlertValue] [AmountType] NULL,
      [Description] [LongDescType] NULL,
      [Category] [WBCategoryType] NULL,
      [GoalDescription] [DescriptionType] NULL,
      [GoalOperator] [WBOperatorType] NULL,
      [GoalUse] [ListYesNoType] NOT NULL,
      [GoalValue] [AmountType] NULL,
      [KPINum] [WBKPINumType] NOT NULL,
      [Color] [WBColorType] NULL,
      [Symbol] [WBSymbolType] NULL,
      [ShortDescription] [DescriptionType] NULL,
      [SnapshotDate] [DateTimeType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_sub_drilldown')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSubDrilldown')
BEGIN
   CREATE TABLE [WBSubDrilldown]
   (
      [DrillNum] [WBDrillNumType] NOT NULL,
      [SubDrillNum] [WBDrillNumType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_tmp_cr_nums')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBTmpKPIs')
BEGIN
   CREATE TABLE [WBTmpKPIs]
   (
      [SessionID] [RowPointerType] NOT NULL,
      [KPINum] [WBKPINumType] NOT NULL,
      [Category] [WBCategoryType] NULL,
      [Description] [LongDescType] NULL,
      [GoalOperator] [WBOperatorType] NULL,
      [GoalValue] [AmountType] NULL,
      [AlertOperator] [WBOperatorType] NULL,
      [AlertValue] [AmountType] NULL,
      [ActualValue] [AmountType] NULL,
      [SourceType] [WBSourceTypeType] NULL,
      [SourceName] [WBSourceNameType] NULL,
      [Symbol] [WBSymbolType] NULL,
      [ID] [LongDescType] NULL,
      [FirstDrillNum] [WBDrillNumType] NULL,
      [MessageText] [InfobarType] NULL,
      [Processed] [ListYesNoType] NOT NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_tmp_drill_results')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBTmpDrilldowns')
BEGIN
   CREATE TABLE [WBTmpDrilldowns]
   (
      [SessionID] [RowPointerType] NOT NULL,
      [Symbol] [WBSymbolType] NULL,
      [GoalValue] [AmountType] NULL,
      [AlertValue] [AmountType] NULL,
      [Amount] [AmountType] NOT NULL,
      [CHAR01] [FilterType] NULL,
      [CHAR02] [FilterType] NULL,
      [CHAR03] [FilterType] NULL,
      [CHAR04] [FilterType] NULL,
      [CHAR05] [FilterType] NULL,
      [CHAR06] [FilterType] NULL,
      [CHAR07] [FilterType] NULL,
      [CHAR08] [FilterType] NULL,
      [CHAR09] [FilterType] NULL,
      [CHAR10] [FilterType] NULL,
      [CHAR11] [FilterType] NULL,
      [CHAR12] [FilterType] NULL,
      [CHAR13] [FilterType] NULL,
      [CHAR14] [FilterType] NULL,
      [CHAR15] [FilterType] NULL,
      [CHAR16] [FilterType] NULL,
      [CHAR17] [FilterType] NULL,
      [CHAR18] [FilterType] NULL,
      [CHAR19] [FilterType] NULL,
      [CHAR20] [FilterType] NULL,
      [DATE01] [DateTimeType] NULL,
      [DATE02] [DateTimeType] NULL,
      [DATE03] [DateTimeType] NULL,
      [DATE04] [DateTimeType] NULL,
      [DATE05] [DateTimeType] NULL,
      [DATE06] [DateTimeType] NULL,
      [DATE07] [DateTimeType] NULL,
      [DATE08] [DateTimeType] NULL,
      [DATE09] [DateTimeType] NULL,
      [DATE10] [DateTimeType] NULL,
      [INTE01] [GenericIntType] NULL,
      [INTE02] [GenericIntType] NULL,
      [INTE03] [GenericIntType] NULL,
      [INTE04] [GenericIntType] NULL,
      [INTE05] [GenericIntType] NULL,
      [INTE06] [GenericIntType] NULL,
      [INTE07] [GenericIntType] NULL,
      [INTE08] [GenericIntType] NULL,
      [INTE09] [GenericIntType] NULL,
      [INTE10] [GenericIntType] NULL,
      [DECI01] [AmountType] NULL,
      [DECI02] [AmountType] NULL,
      [DECI03] [AmountType] NULL,
      [DECI04] [AmountType] NULL,
      [DECI05] [AmountType] NULL,
      [DECI06] [AmountType] NULL,
      [DECI07] [AmountType] NULL,
      [DECI08] [AmountType] NULL,
      [DECI09] [AmountType] NULL,
      [DECI10] [AmountType] NULL,
      [RefRowPointer] [RowPointerType] NULL,
      [RowPointer] [RowPointerType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NOT NULL,
      [RecordDate] [CurrentDateType] NOT NULL,
      [CreatedBy] [UsernameType] NOT NULL,
      [UpdatedBy] [UsernameType] NOT NULL,
      [CreateDate] [CurrentDateType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL
   ) ON [PRIMARY]
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'wb_parms')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBParameters')
BEGIN
   CREATE TABLE [WBParameters]
   (
      [ParmKey] [ParmKeyType] NOT NULL,
      [AlertColor] [WBColorType] NULL,
      [AlertSymbol] [WBSymbolType] NULL,
      [GoalColor] [WBColorType] NULL,
      [GoalSymbol] [WBSymbolType] NULL,
      [WarningColor] [WBColorType] NULL,
      [WarningSymbol] [WBSymbolType] NULL,
      [LoadBatchSize] [GenericIntType] NOT NULL,
      [NoteExistsFlag] [FlagNyType] NULL,
      [RecordDate] [CurrentDateType] NULL,
      [RowPointer] [RowPointerType] NULL,
      [CreatedBy] [UsernameType] NULL,
      [UpdatedBy] [UsernameType] NULL,
      [CreateDate] [CurrentDateType] NULL,
      [InWorkflow] [FlagNyType] NULL,
   ) ON [PRIMARY]
END
GO

--Drop Old Indexes prior to renaming tables/columns
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_charfld1')
   DROP INDEX wb_cat.IX_wb_cat_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_description')
   DROP INDEX wb_cat.IX_wb_cat_description
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_RowPointer')
   DROP INDEX wb_cat.IX_wb_cat_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_users_charfld1')
   DROP INDEX wb_cat_users.IX_wb_cat_users_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_users_recv_email')
   DROP INDEX wb_cat_users.IX_wb_cat_users_recv_email
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cat_users_RowPointer')
   DROP INDEX wb_cat_users.IX_wb_cat_users_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_cat_RowPointer')
   DROP INDEX wb_cr_cat.IX_wb_cr_cat_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_cat_wb_cat')
   DROP INDEX wb_cr_cat.IX_wb_cr_cat_wb_cat
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_drilldown_drill_num')
   DROP INDEX wb_cr_drilldown.IX_wb_cr_drilldown_drill_num
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_drilldown_RowPointer')
   DROP INDEX wb_cr_drilldown.IX_wb_cr_drilldown_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_filter')
   DROP INDEX wb_cr_filter.IX_wb_cr_filter
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_active')
   DROP INDEX wb_cr_num.IX_wb_cr_num_active
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_can_cr_num')
   DROP INDEX wb_cr_num.IX_wb_cr_num_can_cr_num
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_charfld1')
   DROP INDEX wb_cr_num.IX_wb_cr_num_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_description')
   DROP INDEX wb_cr_num.IX_wb_cr_num_description
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_RowPointer')
   DROP INDEX wb_cr_num.IX_wb_cr_num_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_num_short_desc')
   DROP INDEX wb_cr_num.IX_wb_cr_num_short_desc
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_parms_charfld1')
   DROP INDEX wb_cr_parms.IX_wb_cr_parms_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_cr_parms_RowPointer')
   DROP INDEX wb_cr_parms.IX_wb_cr_parms_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drill_cat_cr_cat')
   DROP INDEX wb_drill_cat.IX_wb_drill_cat_cr_cat
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drill_cat_RowPointer')
   DROP INDEX wb_drill_cat.IX_wb_drill_cat_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drill_parms_charfld1')
   DROP INDEX wb_drill_parms.IX_wb_drill_parms_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drill_parms_RowPointer')
   DROP INDEX wb_drill_parms.IX_wb_drill_parms_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drilldown_charfld1')
   DROP INDEX wb_drilldown.IX_wb_drilldown_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drilldown_column_display_seq')
   DROP INDEX wb_drilldown_column.IX_wb_drilldown_column_display_seq
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drilldown_column_drill_num')
   DROP INDEX wb_drilldown_column.IX_wb_drilldown_column_drill_num
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_drilldown_RowPointer')
   DROP INDEX wb_drilldown.IX_wb_drilldown_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_parms_charfld1')
   DROP INDEX wb_parms.IX_wb_parms_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_parms_RowPointer')
   DROP INDEX wb_parms.IX_wb_parms_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_permits_charfld1')
   DROP INDEX wb_permits.IX_wb_permits_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_permits_recv_email')
   DROP INDEX wb_permits.IX_wb_permits_recv_email
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_permits_RowPointer')
   DROP INDEX wb_permits.IX_wb_permits_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_snapshot_charfld1')
   DROP INDEX wb_snapshot.IX_wb_snapshot_charfld1
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_snapshot_description')
   DROP INDEX wb_snapshot.IX_wb_snapshot_description
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_snapshot_RowPointer')
   DROP INDEX wb_snapshot.IX_wb_snapshot_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_snapshot_short_desc')
   DROP INDEX wb_snapshot.IX_wb_snapshot_short_desc
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_snapshot_wb_cat')
   DROP INDEX wb_snapshot.IX_wb_snapshot_wb_cat
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_sub_drilldown_RowPointer')
   DROP INDEX wb_sub_drilldown.IX_wb_sub_drilldown_RowPointer
IF EXISTS (SELECT 1 FROM sysindexes si WHERE si.name = N'IX_wb_sub_drilldown_sub_drill_num')
   DROP INDEX wb_sub_drilldown.IX_wb_sub_drilldown_sub_drill_num

--Drop Default Constraints for Rename
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_CreateDate')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_CreatedBy')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_decifld1')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_decifld2')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_decifld3')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_InWorkflow')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_logifld')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_RecordDate')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_RowPointer')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'DF_wb_cat_UpdatedBy')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [DF_wb_cat_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_can_drill_down')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_can_drill_down]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_can_run')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_can_run]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_can_update_parms')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_can_update_parms]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_can_user')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_can_user]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_CreateDate')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_CreatedBy')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_decifld1')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_decifld2')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_decifld3')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_InWorkflow')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_logifld')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_RecordDate')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_recv_drill')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_recv_drill]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_recv_email')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_recv_email]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_RowPointer')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'DF_wb_cat_users_UpdatedBy')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [DF_wb_cat_users_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_CreateDate')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_CreatedBy')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_InWorkflow')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_RecordDate')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_RowPointer')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'DF_wb_cr_cat_UpdatedBy')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [DF_wb_cr_cat_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_CreateDate')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_CreatedBy')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_InWorkflow')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_RecordDate')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_RowPointer')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'DF_wb_cr_drilldown_UpdatedBy')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [DF_wb_cr_drilldown_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_CreateDate')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_CreatedBy')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_InWorkflow')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_RecordDate')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_RowPointer')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'DF_wb_cr_filter_UpdatedBy')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [DF_wb_cr_filter_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_active')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_active]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_aggregate_name')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_aggregate_name]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_alert_use')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_alert_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_alert_val')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_alert_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_can_cr_num')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_can_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_cr_num')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_CreateDate')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_CreatedBy')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_decifld1')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_decifld2')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_decifld3')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_display_blank')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_display_blank]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_display_header')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_display_header]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_divisor')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_divisor]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_footer_format')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_footer_format]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_goal_use')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_goal_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_goal_val')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_goal_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_InWorkflow')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_logifld')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_lp')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_lp]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_lw')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_lw]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_ly')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_ly]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_lyptd')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_lyptd]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_lytd')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_lytd]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_places')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_places]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_ptd')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_ptd]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_RecordDate')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_rolling')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_rolling]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_RowPointer')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_scale_increment')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_scale_increment]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_scale_max')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_scale_max]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_scale_min')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_scale_min]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_show_cr_num')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_show_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_snap_use')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_snap_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_source_type')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_source_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_today')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_today]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_UpdatedBy')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_wtd')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_wtd]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_yesterday')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_yesterday]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'DF_wb_cr_num_ytd')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [DF_wb_cr_num_ytd]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_cr_num')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_CreateDate')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_CreatedBy')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_decifld1')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_decifld2')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_decifld3')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_InWorkflow')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_logifld')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_RecordDate')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_RowPointer')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'DF_wb_cr_parms_UpdatedBy')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [DF_wb_cr_parms_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_active')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_active]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'DF_wb_data_view_action_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [DF_wb_data_view_action_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'DF_wb_data_view_column_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [DF_wb_data_view_column_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_CreateDate')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'DF_wb_data_view_group_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [DF_wb_data_view_group_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_link_type')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_link_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'DF_wb_data_view_ido_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [DF_wb_data_view_ido_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_default_view')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_default_view]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'DF_wb_data_view_layout_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [DF_wb_data_view_layout_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_RecordDate')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_RowPointer')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_active')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_active]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_use_alt_row')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_use_alt_row]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'DF_wb_data_view_style_use_system_settings')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [DF_wb_data_view_style_use_system_settings]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'DF_wb_data_view_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [DF_wb_data_view_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_CreateDate')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_CreatedBy')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_InWorkflow')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_RecordDate')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_RowPointer')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'DF_wb_data_view_user_UpdatedBy')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [DF_wb_data_view_user_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_CreateDate')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_CreatedBy')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_InWorkflow')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_RecordDate')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_RowPointer')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'DF_wb_drill_cat_UpdatedBy')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [DF_wb_drill_cat_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_CreateDate')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_CreatedBy')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_InWorkflow')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_RecordDate')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_RowPointer')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_seq')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_seq]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'DF_wb_drill_filter_UpdatedBy')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [DF_wb_drill_filter_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_CreateDate')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_CreatedBy')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_decifld1')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_decifld2')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_decifld3')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_drill_num')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_drill_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_InWorkflow')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_logifld')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_RecordDate')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_RowPointer')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'DF_wb_drill_parms_UpdatedBy')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [DF_wb_drill_parms_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_alert_use')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_alert_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_alert_val')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_alert_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_column_size')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_column_size]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_CreateDate')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_CreatedBy')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_display_seq')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_display_seq]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_drill_num')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_drill_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_InWorkflow')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_RecordDate')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_RowPointer')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'DF_wb_drilldown_column_UpdatedBy')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [DF_wb_drilldown_column_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_CreateDate')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_CreatedBy')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_decifld1')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_decifld2')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_decifld3')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_detail_type')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_detail_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_drill_num')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_drill_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_email_drill')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_email_drill]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_goal_use')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_goal_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_goal_val')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_goal_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_InWorkflow')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_logifld')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_record_cap')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_record_cap]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_RecordDate')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_RowPointer')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_source_type')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_source_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_std_display')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_std_display]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'DF_wb_drilldown_UpdatedBy')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [DF_wb_drilldown_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_alert_color')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_alert_color]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_CreateDate')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_CreatedBy')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_decifld1')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_decifld2')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_decifld3')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_goal_color')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_goal_color]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_InWorkflow')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_local_batch_size')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_local_batch_size]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_logifld')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_parm_key')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_parm_key]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_RecordDate')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_RowPointer')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_show_snap')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_show_snap]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_UpdatedBy')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'DF_wb_parms_warning_color')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [DF_wb_parms_warning_color]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_can_drill_down')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_can_drill_down]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_can_run')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_can_run]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_can_update_parms')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_can_update_parms]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_can_user')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_can_user]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_cr_num')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_CreateDate')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_CreatedBy')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_decifld1')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_decifld2')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_decifld3')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_InWorkflow')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_logifld')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_RecordDate')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_recv_drill')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_recv_drill]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_recv_email')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_recv_email]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_RowPointer')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'DF_wb_permits_UpdatedBy')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [DF_wb_permits_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_CreateDate')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_CreatedBy')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_InWorkflow')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_RecordDate')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'DF_wb_search_source_column_UpdatedBy')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [DF_wb_search_source_column_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_CreateDate')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_CreatedBy')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_CreateDate')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_CreatedBy')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_InWorkflow')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_RecordDate')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'DF_wb_search_source_group_UpdatedBy')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [DF_wb_search_source_group_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_InWorkflow')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_CreateDate')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_CreatedBy')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_InWorkflow')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_RecordDate')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'DF_wb_search_source_item_UpdatedBy')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [DF_wb_search_source_item_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_RecordDate')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_RowPointer')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'DF_wb_search_source_UpdatedBy')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [DF_wb_search_source_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_CreateDate')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_CreatedBy')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_InWorkflow')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_RecordDate')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'DF_wb_search_source_user_UpdatedBy')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [DF_wb_search_source_user_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_actual_val')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_actual_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_alert_use')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_alert_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_alert_val')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_alert_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_cr_num')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_CreateDate')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_CreatedBy')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_decifld1')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_decifld1]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_decifld2')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_decifld2]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_decifld3')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_decifld3]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_goal_use')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_goal_use]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_goal_val')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_goal_val]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_InWorkflow')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_logifld')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_logifld]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_r_color')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_r_color]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_RecordDate')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_RowPointer')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'DF_wb_snapshot_UpdatedBy')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [DF_wb_snapshot_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_CreateDate')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_CreatedBy')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_InWorkflow')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_RecordDate')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_RowPointer')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'DF_wb_sub_drilldown_UpdatedBy')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [DF_wb_sub_drilldown_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_CreateDate')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_CreatedBy')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_InWorkflow')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_processed')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_processed]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_RecordDate')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_RowPointer')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'DF_wb_tmp_cr_nums_UpdatedBy')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [DF_wb_tmp_cr_nums_UpdatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_amount')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_amount]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_CreateDate')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_CreateDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_CreatedBy')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_CreatedBy]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_InWorkflow')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_InWorkflow]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_NoteExistsFlag')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_NoteExistsFlag]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_RecordDate')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_RecordDate]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_RowPointer')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'DF_wb_tmp_drill_results_UpdatedBy')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [DF_wb_tmp_drill_results_UpdatedBy]

--Drop Check Constraints for Rename
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'CK_wb_data_view_action_action_type')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [CK_wb_data_view_action_action_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'CK_wb_data_view_action_active')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [CK_wb_data_view_action_active]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'CK_wb_data_view_action_scope_type')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [CK_wb_data_view_action_scope_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'CK_wb_data_view_style_active')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [CK_wb_data_view_style_active]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'CK_wb_data_view_style_use_alt_row')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [CK_wb_data_view_style_use_alt_row]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'CK_wb_data_view_style_use_system_settings')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [CK_wb_data_view_style_use_system_settings]

--Drop Unique Constraints
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'IX_wb_data_view_action_scope_type')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [IX_wb_data_view_action_scope_type]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'IX_wb_search_source_column_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [IX_wb_search_source_column_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'IX_wb_search_source_group_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [IX_wb_search_source_group_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'IX_wb_search_source_item_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [IX_wb_search_source_item_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'IX_wb_search_source_RowPointer')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [IX_wb_search_source_RowPointer]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'IX_wb_search_source_user_RowPointer')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [IX_wb_search_source_user_RowPointer]

--Drop FK Constraints
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'FK_wb_data_view_layout_style')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [FK_wb_data_view_layout_style]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'FK_wb_parms_style')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [FK_wb_parms_style]

--Drop PK Constraints for rename
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat]')
           AND   so.name = N'PK_wb_cat')
   ALTER TABLE [dbo].[wb_cat] DROP CONSTRAINT [PK_wb_cat]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cat_users]')
           AND   so.name = N'PK_wb_cat_users')
   ALTER TABLE [dbo].[wb_cat_users] DROP CONSTRAINT [PK_wb_cat_users]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_cat]')
           AND   so.name = N'PK_wb_cr_cat')
   ALTER TABLE [dbo].[wb_cr_cat] DROP CONSTRAINT [PK_wb_cr_cat]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_drilldown]')
           AND   so.name = N'PK_wb_cr_drilldown')
   ALTER TABLE [dbo].[wb_cr_drilldown] DROP CONSTRAINT [PK_wb_cr_drilldown]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_filter]')
           AND   so.name = N'PK_wb_cr_filter')
   ALTER TABLE [dbo].[wb_cr_filter] DROP CONSTRAINT [PK_wb_cr_filter]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_num]')
           AND   so.name = N'PK_wb_cr_num')
   ALTER TABLE [dbo].[wb_cr_num] DROP CONSTRAINT [PK_wb_cr_num]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_cr_parms]')
           AND   so.name = N'PK_wb_cr_parms')
   ALTER TABLE [dbo].[wb_cr_parms] DROP CONSTRAINT [PK_wb_cr_parms]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view]')
           AND   so.name = N'PK_wb_data_view')
   ALTER TABLE [dbo].[wb_data_view] DROP CONSTRAINT [PK_wb_data_view]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_action]')
           AND   so.name = N'PK_wb_data_view_action')
   ALTER TABLE [dbo].[wb_data_view_action] DROP CONSTRAINT [PK_wb_data_view_action]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_column]')
           AND   so.name = N'PK_wb_data_view_column')
   ALTER TABLE [dbo].[wb_data_view_column] DROP CONSTRAINT [PK_wb_data_view_column]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_group]')
           AND   so.name = N'PK_wb_data_view_group')
   ALTER TABLE [dbo].[wb_data_view_group] DROP CONSTRAINT [PK_wb_data_view_group]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_ido]')
           AND   so.name = N'PK_wb_data_view_ido')
   ALTER TABLE [dbo].[wb_data_view_ido] DROP CONSTRAINT [PK_wb_data_view_ido]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_layout]')
           AND   so.name = N'PK_wb_data_view_layout')
   ALTER TABLE [dbo].[wb_data_view_layout] DROP CONSTRAINT [PK_wb_data_view_layout]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_style]')
           AND   so.name = N'PK_wb_data_view_style')
   ALTER TABLE [dbo].[wb_data_view_style] DROP CONSTRAINT [PK_wb_data_view_style]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_data_view_user]')
           AND   so.name = N'PK_wb_data_view_user')
   ALTER TABLE [dbo].[wb_data_view_user] DROP CONSTRAINT [PK_wb_data_view_user]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_cat]')
           AND   so.name = N'PK_wb_drill_cat')
   ALTER TABLE [dbo].[wb_drill_cat] DROP CONSTRAINT [PK_wb_drill_cat]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_filter]')
           AND   so.name = N'PK_wb_drill_filter')
   ALTER TABLE [dbo].[wb_drill_filter] DROP CONSTRAINT [PK_wb_drill_filter]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drill_parms]')
           AND   so.name = N'PK_wb_drill_parms')
   ALTER TABLE [dbo].[wb_drill_parms] DROP CONSTRAINT [PK_wb_drill_parms]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown]')
           AND   so.name = N'PK_wb_drilldown')
   ALTER TABLE [dbo].[wb_drilldown] DROP CONSTRAINT [PK_wb_drilldown]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_drilldown_column]')
           AND   so.name = N'PK_wb_drilldown_column')
   ALTER TABLE [dbo].[wb_drilldown_column] DROP CONSTRAINT [PK_wb_drilldown_column]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_parms]')
           AND   so.name = N'PK_wb_parms')
   ALTER TABLE [dbo].[wb_parms] DROP CONSTRAINT [PK_wb_parms]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_permits]')
           AND   so.name = N'PK_wb_permits')
   ALTER TABLE [dbo].[wb_permits] DROP CONSTRAINT [PK_wb_permits]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source]')
           AND   so.name = N'PK_wb_search_source')
   ALTER TABLE [dbo].[wb_search_source] DROP CONSTRAINT [PK_wb_search_source]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_column]')
           AND   so.name = N'PK_wb_search_source_column')
   ALTER TABLE [dbo].[wb_search_source_column] DROP CONSTRAINT [PK_wb_search_source_column]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_group]')
           AND   so.name = N'PK_wb_search_source_group')
   ALTER TABLE [dbo].[wb_search_source_group] DROP CONSTRAINT [PK_wb_search_source_group]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_item]')
           AND   so.name = N'PK_wb_search_source_item')
   ALTER TABLE [dbo].[wb_search_source_item] DROP CONSTRAINT [PK_wb_search_source_item]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_search_source_user]')
           AND   so.name = N'PK_wb_search_source_user')
   ALTER TABLE [dbo].[wb_search_source_user] DROP CONSTRAINT [PK_wb_search_source_user]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_snapshot]')
           AND   so.name = N'PK_wb_snapshot')
   ALTER TABLE [dbo].[wb_snapshot] DROP CONSTRAINT [PK_wb_snapshot]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_sub_drilldown]')
           AND   so.name = N'PK_wb_sub_drilldown')
   ALTER TABLE [dbo].[wb_sub_drilldown] DROP CONSTRAINT [PK_wb_sub_drilldown]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_cr_nums]')
           AND   so.name = N'PK_wb_tmp_cr_nums')
   ALTER TABLE [dbo].[wb_tmp_cr_nums] DROP CONSTRAINT [PK_wb_tmp_cr_nums]
IF EXISTS (SELECT 1 FROM sysconstraints sc
           INNER JOIN sysobjects so
           ON so.id = sc.constid
           WHERE so.parent_obj = OBJECT_ID(N'[dbo].[wb_tmp_drill_results]')
           AND   so.name = N'PK_wb_tmp_drill_results')
   ALTER TABLE [dbo].[wb_tmp_drill_results] DROP CONSTRAINT [PK_wb_tmp_drill_results]
GO

--Rename Tables
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat')
   EXEC sp_rename N'dbo.wb_cat', N'WBCategory'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cat_users')
   EXEC sp_rename N'dbo.wb_cat_users', N'WBCategoryUser'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_cat')
   EXEC sp_rename N'dbo.wb_cr_cat', N'WBKPICategory'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_drilldown')
   EXEC sp_rename N'dbo.wb_cr_drilldown', N'WBKPIDrilldown'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_filter')
   EXEC sp_rename N'dbo.wb_cr_filter', N'WBKPIFilter'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_num')
   EXEC sp_rename N'dbo.wb_cr_num', N'WBKPI'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_cr_parms')
   EXEC sp_rename N'dbo.wb_cr_parms', N'WBKPIParameter'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view')
   EXEC sp_rename N'dbo.wb_data_view', N'WBDataView'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_action')
   EXEC sp_rename N'dbo.wb_data_view_action', N'WBDataViewAction'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_column')
   EXEC sp_rename N'dbo.wb_data_view_column', N'WBDataViewColumn'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_group')
   EXEC sp_rename N'dbo.wb_data_view_group', N'WBDataViewGroup'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_ido')
   EXEC sp_rename N'dbo.wb_data_view_ido', N'WBDataViewIDO'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_layout')
   EXEC sp_rename N'dbo.wb_data_view_layout', N'WBDataViewLayout'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_data_view_user')
   EXEC sp_rename N'dbo.wb_data_view_user', N'WBDataViewUser'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown')
   EXEC sp_rename N'dbo.wb_drilldown', N'WBDrilldown'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drilldown_column')
   EXEC sp_rename N'dbo.wb_drilldown_column', N'WBDrilldownColumn'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_cat')
   EXEC sp_rename N'dbo.wb_drill_cat', N'WBDrilldownCategory'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_filter')
   EXEC sp_rename N'dbo.wb_drill_filter', N'WBDrilldownFilter'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_drill_parms')
   EXEC sp_rename N'dbo.wb_drill_parms', N'WBDrilldownParameter'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_permits')
   EXEC sp_rename N'dbo.wb_permits', N'WBKPIUser'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_search_source')
   EXEC sp_rename N'dbo.wb_search_source', N'WBSearchSource'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_search_source_column')
   EXEC sp_rename N'dbo.wb_search_source_column', N'WBSearchSourceColumn'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_search_source_group')
   EXEC sp_rename N'dbo.wb_search_source_group', N'WBSearchSourceGroup'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_search_source_item')
   EXEC sp_rename N'dbo.wb_search_source_item', N'WBSearchSourceItem'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_search_source_user')
   EXEC sp_rename N'dbo.wb_search_source_user', N'WBSearchSourceUser'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_snapshot')
   EXEC sp_rename N'dbo.wb_snapshot', N'WBSnapshot'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_sub_drilldown')
   EXEC sp_rename N'dbo.wb_sub_drilldown', N'WBSubDrilldown'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_cr_nums')
   EXEC sp_rename N'dbo.wb_tmp_cr_nums', N'WBTmpKPIs'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_tmp_drill_results')
   EXEC sp_rename N'dbo.wb_tmp_drill_results', N'WBTmpDrilldowns'

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'wb_parms')
   EXEC sp_rename N'dbo.wb_parms', N'WBParameters'
GO


--Add Columns
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDrilldown'
              AND   (COLUMN_NAME = N'RecordCap' OR COLUMN_NAME = N'record_cap'))
BEGIN
   ALTER TABLE [dbo].[WBDrilldown]
   ADD [RecordCap] [WBRecordCapType] NOT NULL CONSTRAINT DF_WBDrilldown_RecordCap DEFAULT(0)
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBKPI'
              AND   COLUMN_NAME = N'Places')
BEGIN
   ALTER TABLE [dbo].[WBKPI]
   ADD [Places] [GenericIntType] NOT NULL CONSTRAINT DF_WBKPI_Places DEFAULT(2)
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBTmpDrilldowns'
               AND   COLUMN_NAME = N'RefRowPointer')
BEGIN
   ALTER TABLE [dbo].[WBTmpDrilldowns]
   ADD [RefRowPointer] [RowPointerType] NULL
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewIDO'
              AND   (COLUMN_NAME = N'LinkType' OR COLUMN_NAME = N'link_type'))
BEGIN
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD [LinkType] [WBLinkType] NOT NULL CONSTRAINT DF_WBDataViewIDO_LinkType DEFAULT('M')
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewColumn'
              AND   (COLUMN_NAME = N'ColumnHeaderOverride' OR COLUMN_NAME = N'column_header_override'))
BEGIN
   ALTER TABLE [dbo].[WBDataViewColumn]
   ADD [ColumnHeaderOverride] [DescriptionType] NULL
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBParameters'
              AND   (COLUMN_NAME = N'LoadBatchSize' OR COLUMN_NAME = N'load_batch_size'))
BEGIN
   ALTER TABLE [dbo].[WBParameters]
   ADD [LoadBatchSize] [GenericIntType] NOT NULL CONSTRAINT [DF_WBParameters_LoadBatchSize] DEFAULT(10000)
END

GO

--Rename Columns
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBCategory].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBCategory].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'required_tables')
   EXEC sp_rename N'[dbo].[WBCategory].[required_tables]', N'RequiredTables', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'can_drill_down')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[can_drill_down]', N'CanDrilldown', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'can_run')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[can_run]', N'CanRun', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'can_update_parms')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[can_update_parms]', N'CanUpdateParameters', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'can_user')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[can_user]', N'CanUser', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'recv_drill')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[recv_drill]', N'ReceiveDrilldown', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'recv_email')
   EXEC sp_rename N'[dbo].[WBCategoryUser].[recv_email]', N'ReceiveEmail', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBKPICategory].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPICategory].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIDrilldown'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPIDrilldown].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIDrilldown'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBKPIDrilldown].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPIFilter].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPIFilter].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBKPIFilter].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'seq' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPIFilter].[seq]', N'Seq', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'active' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[active]', N'Active', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'aggregate_name')
   EXEC sp_rename N'[dbo].[WBKPI].[aggregate_name]', N'AggregateName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'alert_oper')
   EXEC sp_rename N'[dbo].[WBKPI].[alert_oper]', N'AlertOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'alert_use')
   EXEC sp_rename N'[dbo].[WBKPI].[alert_use]', N'AlertUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[alert_val]', N'AlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'calc_description')
   EXEC sp_rename N'[dbo].[WBKPI].[calc_description]', N'CalculationDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'can_cr_num')
   EXEC sp_rename N'[dbo].[WBKPI].[can_cr_num]', N'CannedKPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPI].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'date_property_name')
   EXEC sp_rename N'[dbo].[WBKPI].[date_property_name]', N'DatePropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'display_blank')
   EXEC sp_rename N'[dbo].[WBKPI].[display_blank]', N'DisplayBlank', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'divisor' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[divisor]', N'Divisor', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'filter' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[filter]', N'Filter', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'goal_oper')
   EXEC sp_rename N'[dbo].[WBKPI].[goal_oper]', N'GoalOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'goal_use')
   EXEC sp_rename N'[dbo].[WBKPI].[goal_use]', N'GoalUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[goal_val]', N'GoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'group_property_name')
   EXEC sp_rename N'[dbo].[WBKPI].[group_property_name]', N'GroupPropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lp' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[lp]', N'Lp', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lp_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lp_alert_val]', N'LpAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lp_description')
   EXEC sp_rename N'[dbo].[WBKPI].[lp_description]', N'LpDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lp_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lp_goal_val]', N'LpGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lw' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[lw]', N'Lw', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lw_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lw_alert_val]', N'LwAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lw_description')
   EXEC sp_rename N'[dbo].[WBKPI].[lw_description]', N'LwDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lw_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lw_goal_val]', N'LwGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ly' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[ly]', N'Ly', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ly_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ly_alert_val]', N'LyAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ly_description')
   EXEC sp_rename N'[dbo].[WBKPI].[ly_description]', N'LyDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ly_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ly_goal_val]', N'LyGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lyptd' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[lyptd]', N'Lyptd', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lyptd_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lyptd_alert_val]', N'LyptdAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lyptd_description')
   EXEC sp_rename N'[dbo].[WBKPI].[lyptd_description]', N'LyptdDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lyptd_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lyptd_goal_val]', N'LyptdGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lytd' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[lytd]', N'Lytd', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lytd_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lytd_alert_val]', N'LytdAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lytd_description')
   EXEC sp_rename N'[dbo].[WBKPI].[lytd_description]', N'LytdDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'lytd_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[lytd_goal_val]', N'LytdGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'places' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[places]', N'Places', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBKPI].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ptd' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[ptd]', N'Ptd', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ptd_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ptd_alert_val]', N'PtdAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ptd_description')
   EXEC sp_rename N'[dbo].[WBKPI].[ptd_description]', N'PtdDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ptd_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ptd_goal_val]', N'PtdGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'required_tables')
   EXEC sp_rename N'[dbo].[WBKPI].[required_tables]', N'RequiredTables', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[rolling]', N'Rolling', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[rolling_alert_val]', N'RollingAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling_description')
   EXEC sp_rename N'[dbo].[WBKPI].[rolling_description]', N'RollingDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[rolling_goal_val]', N'RollingGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling_length')
   EXEC sp_rename N'[dbo].[WBKPI].[rolling_length]', N'RollingLength', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'rolling_start')
   EXEC sp_rename N'[dbo].[WBKPI].[rolling_start]', N'RollingStart', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'short_desc')
   EXEC sp_rename N'[dbo].[WBKPI].[short_desc]', N'ShortDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'snap_use')
   EXEC sp_rename N'[dbo].[WBKPI].[snap_use]', N'SnapshotUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBKPI].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'source_type')
   EXEC sp_rename N'[dbo].[WBKPI].[source_type]', N'SourceType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'today' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[today]', N'Today', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'today_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[today_alert_val]', N'TodayAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'today_description')
   EXEC sp_rename N'[dbo].[WBKPI].[today_description]', N'TodayDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'today_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[today_goal_val]', N'TodayGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'wtd' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[wtd]', N'Wtd', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'wtd_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[wtd_alert_val]', N'WtdAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'wtd_description')
   EXEC sp_rename N'[dbo].[WBKPI].[wtd_description]', N'WtdDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'wtd_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[wtd_goal_val]', N'WtdGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'yesterday' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[yesterday]', N'Yesterday', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'yesterday_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[yesterday_alert_val]', N'YesterdayAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'yesterday_description')
   EXEC sp_rename N'[dbo].[WBKPI].[yesterday_description]', N'YesterdayDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'yesterday_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[yesterday_goal_val]', N'YesterdayGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ytd' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPI].[ytd]', N'Ytd', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ytd_alert_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ytd_alert_val]', N'YtdAlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ytd_description')
   EXEC sp_rename N'[dbo].[WBKPI].[ytd_description]', N'YtdDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'ytd_goal_val')
   EXEC sp_rename N'[dbo].[WBKPI].[ytd_goal_val]', N'YtdGoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPIParameter].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'name' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBKPIParameter].[name]', N'Name', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'val')
   EXEC sp_rename N'[dbo].[WBKPIParameter].[val]', N'Value', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataView'
           AND   COLUMN_NAME = N'access_as')
   EXEC sp_rename N'[dbo].[WBDataView].[access_as]', N'AccessAs', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataView'
           AND   COLUMN_NAME = N'view_name')
   EXEC sp_rename N'[dbo].[WBDataView].[view_name]', N'ViewName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_filter')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_filter]', N'ActionFilter', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_initial_mode')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_initial_mode]', N'ActionInitialMode', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_name]', N'ActionName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_parms')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_parms]', N'ActionParameters', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_property')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_property]', N'ActionProperty', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'action_type')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[action_type]', N'ActionType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'active' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewAction].[active]', N'Active', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'caption' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewAction].[caption]', N'Caption', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'class_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[class_name]', N'ClassName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'ido_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[ido_name]', N'IDOName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'scope_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[scope_name]', N'ScopeName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'scope_type')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[scope_type]', N'ScopeType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction'
           AND   COLUMN_NAME = N'source_type')
   EXEC sp_rename N'[dbo].[WBDataViewAction].[source_type]', N'SourceType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'column_header_override')
   EXEC sp_rename N'[dbo].[WBDataViewColumn].[column_header_override]', N'ColumnHeaderOverride', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'ido_alias')
   EXEC sp_rename N'[dbo].[WBDataViewColumn].[ido_alias]', N'IDOAlias', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBDataViewColumn].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'seq' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewColumn].[seq]', N'Seq', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'view_name')
   EXEC sp_rename N'[dbo].[WBDataViewColumn].[view_name]', N'ViewName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewGroup'
           AND   COLUMN_NAME = N'group_name')
   EXEC sp_rename N'[dbo].[WBDataViewGroup].[group_name]', N'GroupName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewGroup'
           AND   COLUMN_NAME = N'view_name')
   EXEC sp_rename N'[dbo].[WBDataViewGroup].[view_name]', N'ViewName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'filter' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[filter]', N'Filter', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'ido_alias')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[ido_alias]', N'IDOAlias', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'ido_name')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[ido_name]', N'IDOName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'link_type')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[link_type]', N'LinkType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'order_by')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[order_by]', N'OrderBy', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'parent_ido')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[parent_ido]', N'ParentIDO', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'parent_links')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[parent_links]', N'ParentLinks', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'recordcap' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[recordcap]', N'RecordCap', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO'
           AND   COLUMN_NAME = N'view_name')
   EXEC sp_rename N'[dbo].[WBDataViewIDO].[view_name]', N'ViewName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'component_name')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[component_name]', N'ComponentName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'default_view')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[default_view]', N'DefaultView', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'layout' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[layout]', N'Layout', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'layout_name')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[layout_name]', N'LayoutName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'scope_name')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[scope_name]', N'ScopeName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'scope_type')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[scope_type]', N'ScopeType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'source_type')
   EXEC sp_rename N'[dbo].[WBDataViewLayout].[source_type]', N'SourceType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewUser'
           AND   COLUMN_NAME = N'user_name')
   EXEC sp_rename N'[dbo].[WBDataViewUser].[user_name]', N'Username', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewUser'
           AND   COLUMN_NAME = N'view_name')
   EXEC sp_rename N'[dbo].[WBDataViewUser].[view_name]', N'ViewName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownCategory'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBDrilldownCategory].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownCategory'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBDrilldownCategory].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDrilldownFilter].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBDrilldownFilter].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBDrilldownFilter].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter'
           AND   COLUMN_NAME = N'seq' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDrilldownFilter].[seq]', N'Seq', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBDrilldownParameter].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'name' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDrilldownParameter].[name]', N'Name', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'val')
   EXEC sp_rename N'[dbo].[WBDrilldownParameter].[val]', N'Value', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'alert_oper')
   EXEC sp_rename N'[dbo].[WBDrilldown].[alert_oper]', N'AlertOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'alert_use')
   EXEC sp_rename N'[dbo].[WBDrilldown].[alert_use]', N'AlertUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'alert_val')
   EXEC sp_rename N'[dbo].[WBDrilldown].[alert_val]', N'AlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'date_property_name')
   EXEC sp_rename N'[dbo].[WBDrilldown].[date_property_name]', N'DatePropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDrilldown].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'detail_name')
   EXEC sp_rename N'[dbo].[WBDrilldown].[detail_name]', N'DetailName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'detail_parms')
   EXEC sp_rename N'[dbo].[WBDrilldown].[detail_parms]', N'DetailParameters', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'detail_type')
   EXEC sp_rename N'[dbo].[WBDrilldown].[detail_type]', N'DetailType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBDrilldown].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'email_drill')
   EXEC sp_rename N'[dbo].[WBDrilldown].[email_drill]', N'EmailDrilldown', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'filter' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBDrilldown].[filter]', N'Filter', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'goal_alert_property_name')
   EXEC sp_rename N'[dbo].[WBDrilldown].[goal_alert_property_name]', N'GoalAlertPropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'goal_oper')
   EXEC sp_rename N'[dbo].[WBDrilldown].[goal_oper]', N'GoalOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'goal_use')
   EXEC sp_rename N'[dbo].[WBDrilldown].[goal_use]', N'GoalUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'goal_val')
   EXEC sp_rename N'[dbo].[WBDrilldown].[goal_val]', N'GoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'record_cap')
   EXEC sp_rename N'[dbo].[WBDrilldown].[record_cap]', N'RecordCap', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'required_tables')
   EXEC sp_rename N'[dbo].[WBDrilldown].[required_tables]', N'RequiredTables', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBDrilldown].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'source_type')
   EXEC sp_rename N'[dbo].[WBDrilldown].[source_type]', N'SourceType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'column_header')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[column_header]', N'ColumnHeader', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'column_name')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[column_name]', N'ColumnName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'column_size')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[column_size]', N'ColumnSize', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'display_seq')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[display_seq]', N'Seq', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBDrilldownColumn].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'can_drill_down')
   EXEC sp_rename N'[dbo].[WBKPIUser].[can_drill_down]', N'CanDrilldown', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'can_run')
   EXEC sp_rename N'[dbo].[WBKPIUser].[can_run]', N'CanRun', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'can_update_parms')
   EXEC sp_rename N'[dbo].[WBKPIUser].[can_update_parms]', N'CanUpdateParameters', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'can_user')
   EXEC sp_rename N'[dbo].[WBKPIUser].[can_user]', N'CanUser', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBKPIUser].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'recv_drill')
   EXEC sp_rename N'[dbo].[WBKPIUser].[recv_drill]', N'ReceiveDrilldown', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'recv_email')
   EXEC sp_rename N'[dbo].[WBKPIUser].[recv_email]', N'ReceiveEmail', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'caption' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBSearchSource].[caption]', N'Caption', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'filter' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBSearchSource].[filter]', N'Filter', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'ido_name')
   EXEC sp_rename N'[dbo].[WBSearchSource].[ido_name]', N'IDOName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'order_by')
   EXEC sp_rename N'[dbo].[WBSearchSource].[order_by]', N'OrderBy', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'recordcap' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBSearchSource].[recordcap]', N'RecordCap', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBSearchSource].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceColumn'
           AND   COLUMN_NAME = N'column_header_override')
   EXEC sp_rename N'[dbo].[WBSearchSourceColumn].[column_header_override]', N'ColumnHeaderOverride', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceColumn'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceColumn].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceColumn'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceColumn].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceGroup'
           AND   COLUMN_NAME = N'group_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceGroup].[group_name]', N'GroupName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceGroup'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceGroup].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceItem'
           AND   COLUMN_NAME = N'property_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceItem].[property_name]', N'PropertyName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceItem'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceItem].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceUser'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceUser].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceUser'
           AND   COLUMN_NAME = N'user_name')
   EXEC sp_rename N'[dbo].[WBSearchSourceUser].[user_name]', N'Username', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'actual_val')
   EXEC sp_rename N'[dbo].[WBSnapshot].[actual_val]', N'ActualValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'alert_desc')
   EXEC sp_rename N'[dbo].[WBSnapshot].[alert_desc]', N'AlertDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'alert_oper')
   EXEC sp_rename N'[dbo].[WBSnapshot].[alert_oper]', N'AlertOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'alert_use')
   EXEC sp_rename N'[dbo].[WBSnapshot].[alert_use]', N'AlertUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'alert_val')
   EXEC sp_rename N'[dbo].[WBSnapshot].[alert_val]', N'AlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBSnapshot].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBSnapshot].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBSnapshot].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'goal_desc')
   EXEC sp_rename N'[dbo].[WBSnapshot].[goal_desc]', N'GoalDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'goal_oper')
   EXEC sp_rename N'[dbo].[WBSnapshot].[goal_oper]', N'GoalOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'goal_use')
   EXEC sp_rename N'[dbo].[WBSnapshot].[goal_use]', N'GoalUse', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'goal_val')
   EXEC sp_rename N'[dbo].[WBSnapshot].[goal_val]', N'GoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'r_color')
   EXEC sp_rename N'[dbo].[WBSnapshot].[r_color]', N'Color', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'r_symbol')
   EXEC sp_rename N'[dbo].[WBSnapshot].[r_symbol]', N'Symbol', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'seq' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBSnapshot].[seq]', N'Seq', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'short_desc')
   EXEC sp_rename N'[dbo].[WBSnapshot].[short_desc]', N'ShortDescription', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'snap_date')
   EXEC sp_rename N'[dbo].[WBSnapshot].[snap_date]', N'SnapshotDate', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSubDrilldown'
           AND   COLUMN_NAME = N'drill_num')
   EXEC sp_rename N'[dbo].[WBSubDrilldown].[drill_num]', N'DrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSubDrilldown'
           AND   COLUMN_NAME = N'sub_drill_num')
   EXEC sp_rename N'[dbo].[WBSubDrilldown].[sub_drill_num]', N'SubDrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'actual')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[actual]', N'ActualValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'alert_oper')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[alert_oper]', N'AlertOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'alert_val')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[alert_val]', N'AlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'cr_cat')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[cr_cat]', N'Category', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'cr_num')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[cr_num]', N'KPINum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'description' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[description]', N'Description', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'first_drill_num')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[first_drill_num]', N'FirstDrillNum', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'goal_oper')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[goal_oper]', N'GoalOperator', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'goal_val')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[goal_val]', N'GoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'id' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[id]', N'ID', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'message_txt')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[message_txt]', N'MessageText', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'processed' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[processed]', N'Processed', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'source_name')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[source_name]', N'SourceName', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'source_type')
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[source_type]', N'SourceType', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'symbol' Collate SQL_Latin1_General_CP1_CS_AS)
   EXEC sp_rename N'[dbo].[WBTmpKPIs].[symbol]', N'Symbol', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpDrilldowns'
           AND   COLUMN_NAME = N'AlertVal')
   EXEC sp_rename N'[dbo].[WBTmpDrilldowns].[AlertVal]', N'AlertValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpDrilldowns'
           AND   COLUMN_NAME = N'GoalVal')
   EXEC sp_rename N'[dbo].[WBTmpDrilldowns].[GoalVal]', N'GoalValue', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'alert_color')
   EXEC sp_rename N'[dbo].[WBParameters].[alert_color]', N'AlertColor', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'alert_symbol')
   EXEC sp_rename N'[dbo].[WBParameters].[alert_symbol]', N'AlertSymbol', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'goal_color')
   EXEC sp_rename N'[dbo].[WBParameters].[goal_color]', N'GoalColor', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'goal_symbol')
   EXEC sp_rename N'[dbo].[WBParameters].[goal_symbol]', N'GoalSymbol', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'load_batch_size')
   EXEC sp_rename N'[dbo].[WBParameters].[load_batch_size]', N'LoadBatchSize', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'parm_key')
   EXEC sp_rename N'[dbo].[WBParameters].[parm_key]', N'ParmKey', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'warning_color')
   EXEC sp_rename N'[dbo].[WBParameters].[warning_color]', N'WarningColor', N'COLUMN'
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'warning_symbol')
   EXEC sp_rename N'[dbo].[WBParameters].[warning_symbol]', N'WarningSymbol', N'COLUMN'
GO

--Nullable Fixes
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategory'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategory] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CanDrilldown'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CanDrilldown] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CanRun'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CanRun] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CanUpdateParameters'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CanUpdateParameters] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CanUser'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CanUser] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'ReceiveDrilldown'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [ReceiveDrilldown] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'ReceiveEmail'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [ReceiveEmail] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBCategoryUser] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPICategory'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPICategory] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIDrilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIDrilldown] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIFilter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIFilter] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIFilter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIFilter] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIFilter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIFilter] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIFilter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIFilter] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'Active'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [Active] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'AlertUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [AlertUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'GoalUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [GoalUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'show_KPINum'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [show_KPINum] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPI] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIParameter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIParameter] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownCategory'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownCategory] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownFilter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownFilter] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownFilter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownFilter] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownFilter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownFilter] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownFilter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownFilter] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownParameter'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownParameter] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'AlertUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [AlertUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'GoalUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [GoalUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'std_display'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [std_display] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldown] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldownColumn'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBDrilldownColumn] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBParameters'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBParameters] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CanDrilldown'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CanDrilldown] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CanRun'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CanRun] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CanUpdateParameters'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CanUpdateParameters] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CanUser'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CanUser] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'ReceiveDrilldown'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [ReceiveDrilldown] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'ReceiveEmail'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [ReceiveEmail] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBKPIUser] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'AlertUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [AlertUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'GoalUse'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [GoalUse] [ListYesNoType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSnapshot] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'InWorkflow'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [InWorkflow] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'NoteExistsFlag'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [NoteExistsFlag] [FlagNyType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'RowPointer'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [RowPointer] [RowPointerType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSubDrilldown'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBSubDrilldown] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpKPIs'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpKPIs] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpKPIs'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpKPIs] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpKPIs'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpKPIs] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpKPIs'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpKPIs] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpDrilldowns'
            AND COLUMN_NAME = N'CreateDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpDrilldowns] ALTER COLUMN [CreateDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpDrilldowns'
            AND COLUMN_NAME = N'CreatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpDrilldowns] ALTER COLUMN [CreatedBy] [UsernameType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpDrilldowns'
            AND COLUMN_NAME = N'RecordDate'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpDrilldowns] ALTER COLUMN [RecordDate] [CurrentDateType] NOT NULL
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBTmpDrilldowns'
            AND COLUMN_NAME = N'UpdatedBy'
            AND IS_NULLABLE = N'YES')
   ALTER TABLE [dbo].[WBTmpDrilldowns] ALTER COLUMN [UpdatedBy] [UsernameType] NOT NULL


--Column DataType Changes
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'AlertOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBKPI]
   ALTER COLUMN [AlertOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'AlertOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBDrilldown]
   ALTER COLUMN [AlertOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'AlertOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [AlertOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'AlertOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [AlertOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'GoalOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBKPI]
   ALTER COLUMN [GoalOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'GoalOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBDrilldown]
   ALTER COLUMN [GoalOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'GoalOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [GoalOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'GoalOperator'
           AND   DOMAIN_NAME = N'WBOperType')
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [GoalOperator] [WBOperatorType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'CannedKPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPI]
   ALTER COLUMN [CannedKPINum] [WBKPINumType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBCategory]
   ALTER COLUMN [Category] [WBCategoryType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBCategoryUser]
   ALTER COLUMN [Category] [WBCategoryType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBKPICategory]
   ALTER COLUMN [Category] [WBCategoryType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownCategory'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBDrilldownCategory]
   ALTER COLUMN [Category] [WBCategoryType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [Category] [WBCategoryType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'Category'
           AND   DOMAIN_NAME = N'WBCatType')
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [Category] [WBCategoryType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPICategory]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIDrilldown'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPIDrilldown]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPIFilter]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPI]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPIParameter]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBKPIUser]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME IS NULL)
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'KPINum'
           AND   DOMAIN_NAME = N'WBCrNumType')
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [KPINum] [WBKPINumType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'ID'
           AND   DOMAIN_NAME IS NULL)
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [ID] [LongDescType] NULL
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'Description'
           AND   DOMAIN_NAME IS NULL)
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [Description] [LongDescType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'Description'
           AND   DOMAIN_NAME IS NULL)
   ALTER TABLE [dbo].[WBTmpKPIs]
   ALTER COLUMN [Description] [LongDescType] NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'FSSeqType')
OR EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'WBSeqType')
   ALTER TABLE [dbo].[WBDataViewColumn]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'WBSeqType')
   ALTER TABLE [dbo].[WBDrilldownColumn]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'WBSeqType')
   ALTER TABLE [dbo].[WBKPIFilter]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'WBSeqType')
   ALTER TABLE [dbo].[WBDrilldownFilter]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'Seq'
           AND   DOMAIN_NAME = N'WBSeqType')
   ALTER TABLE [dbo].[WBSnapshot]
   ALTER COLUMN [Seq] [SequenceType] NOT NULL

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'Places'
           AND   DOMAIN_NAME = N'DecimalPlacesType')
   ALTER TABLE [dbo].[WBKPI]
   ALTER COLUMN [Places] [GenericIntType] NOT NULL

--Add PK Constraints
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBCategory]')
                AND   name = N'PK_WBCategory')
   ALTER TABLE [WBCategory] ADD
   CONSTRAINT [PK_WBCategory] PRIMARY KEY CLUSTERED
   (
      [Category]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBCategoryUser]')
                AND   name = N'PK_WBCategoryUser')
   ALTER TABLE [WBCategoryUser] ADD
   CONSTRAINT [PK_WBCategoryUser] PRIMARY KEY CLUSTERED
   (
      [Category],
      [Username]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPICategory]')
                AND   name = N'PK_WBKPICategory')
   ALTER TABLE [WBKPICategory] ADD
   CONSTRAINT [PK_WBKPICategory] PRIMARY KEY CLUSTERED
   (
      [KPINum],
      [Category]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIDrilldown]')
                AND   name = N'PK_WBKPIDrilldown')
   ALTER TABLE [WBKPIDrilldown] ADD
   CONSTRAINT [PK_WBKPIDrilldown] PRIMARY KEY CLUSTERED
   (
      [KPINum],
      [DrillNum]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIFilter]')
                AND   name = N'PK_WBKPIFilter')
   ALTER TABLE [WBKPIFilter] ADD
   CONSTRAINT [PK_WBKPIFilter] PRIMARY KEY CLUSTERED
   (
      [KPINum],
      [Seq]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPI]')
                AND   name = N'PK_WBKPI')
   ALTER TABLE [WBKPI] ADD
   CONSTRAINT [PK_WBKPI] PRIMARY KEY CLUSTERED
   (
      [KPINum]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIParameter]')
                AND   name = N'PK_WBKPIParameter')
   ALTER TABLE [WBKPIParameter] ADD
   CONSTRAINT [PK_WBKPIParameter] PRIMARY KEY CLUSTERED
   (
      [KPINum],
      [Name]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataView')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataView]')
                AND   name = N'PK_WBDataView')
   ALTER TABLE [WBDataView] ADD
   CONSTRAINT [PK_WBDataView] PRIMARY KEY CLUSTERED
   (
      [ViewName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewAction]')
                AND   name = N'PK_WBDataViewAction')
   ALTER TABLE [WBDataViewAction] ADD
   CONSTRAINT [PK_WBDataViewAction] PRIMARY KEY NONCLUSTERED
   (
      [RowPointer]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewColumn]')
                AND   name = N'PK_WBDataViewColumn')
   ALTER TABLE [WBDataViewColumn] ADD
   CONSTRAINT [PK_WBDataViewColumn] PRIMARY KEY CLUSTERED
   (
      [ViewName],
      [Seq]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewGroup')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewGroup]')
                AND   name = N'PK_WBDataViewGroup')
   ALTER TABLE [WBDataViewGroup] ADD
   CONSTRAINT [PK_WBDataViewGroup] PRIMARY KEY CLUSTERED
   (
      [ViewName],
      [GroupName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewIDO]')
                AND   name = N'PK_WBDataViewIDO')
   ALTER TABLE [WBDataViewIDO] ADD
   CONSTRAINT [PK_WBDataViewIDO] PRIMARY KEY CLUSTERED
   (
      [ViewName],
      [IDOAlias]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewLayout]')
                AND   name = N'PK_WBDataViewLayout')
   ALTER TABLE [WBDataViewLayout] ADD
   CONSTRAINT [PK_WBDataViewLayout] PRIMARY KEY CLUSTERED
   (
      [SourceType],
      [SourceName],
      [ScopeType],
      [ScopeName],
      [LayoutName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewUser]')
                AND   name = N'PK_WBDataViewUser')
   ALTER TABLE [WBDataViewUser] ADD
   CONSTRAINT [PK_WBDataViewUser] PRIMARY KEY CLUSTERED
   (
      [ViewName],
      [Username]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldown]')
                AND   name = N'PK_WBDrilldown')
   ALTER TABLE [WBDrilldown] ADD
   CONSTRAINT [PK_WBDrilldown] PRIMARY KEY CLUSTERED
   (
      [DrillNum]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownColumn]')
                AND   name = N'PK_WBDrilldownColumn')
   ALTER TABLE [WBDrilldownColumn] ADD
   CONSTRAINT [PK_WBDrilldownColumn] PRIMARY KEY CLUSTERED
   (
      [DrillNum],
      [Seq]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownCategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownCategory]')
                AND   name = N'PK_WBDrilldownCategory')
   ALTER TABLE [WBDrilldownCategory] ADD
   CONSTRAINT [PK_WBDrilldownCategory] PRIMARY KEY CLUSTERED
   (
      [DrillNum],
      [Category]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownFilter]')
                AND   name = N'PK_WBDrilldownFilter')
   ALTER TABLE [WBDrilldownFilter] ADD
   CONSTRAINT [PK_WBDrilldownFilter] PRIMARY KEY CLUSTERED
   (
      [DrillNum],
      [Seq]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownParameter]')
                AND   name = N'PK_WBDrilldownParameter')
   ALTER TABLE [WBDrilldownParameter] ADD
   CONSTRAINT [PK_WBDrilldownParameter] PRIMARY KEY CLUSTERED
   (
      [DrillNum],
      [Name]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIUser]')
                AND   name = N'PK_WBKPIUser')
   ALTER TABLE [WBKPIUser] ADD
   CONSTRAINT [PK_WBKPIUser] PRIMARY KEY CLUSTERED
   (
      [KPINum],
      [Username]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSource]')
                AND   name = N'PK_WBSearchSource')
   ALTER TABLE [WBSearchSource] ADD
   CONSTRAINT [PK_WBSearchSource] PRIMARY KEY CLUSTERED
   (
      [SourceName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceColumn]')
                AND   name = N'PK_WBSearchSourceColumn')
   ALTER TABLE [WBSearchSourceColumn] ADD
   CONSTRAINT [PK_WBSearchSourceColumn] PRIMARY KEY CLUSTERED
   (
      [SourceName],
      [PropertyName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceGroup')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceGroup]')
                AND   name = N'PK_WBSearchSourceGroup')
   ALTER TABLE [WBSearchSourceGroup] ADD
   CONSTRAINT [PK_WBSearchSourceGroup] PRIMARY KEY CLUSTERED
   (
      [SourceName],
      [GroupName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceItem')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceItem]')
                AND   name = N'PK_WBSearchSourceItem')
   ALTER TABLE [WBSearchSourceItem] ADD
   CONSTRAINT [PK_WBSearchSourceItem] PRIMARY KEY CLUSTERED
   (
      [SourceName],
      [PropertyName]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceUser]')
                AND   name = N'PK_WBSearchSourceUser')
   ALTER TABLE [WBSearchSourceUser] ADD
   CONSTRAINT [PK_WBSearchSourceUser] PRIMARY KEY CLUSTERED
   (
      [SourceName],
      [Username]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot]')
                AND   name = N'PK_WBSnapshot')
   ALTER TABLE [WBSnapshot] ADD
   CONSTRAINT [PK_WBSnapshot] PRIMARY KEY CLUSTERED
   (
      [Seq]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSubDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSubDrilldown]')
                AND   name = N'PK_WBSubDrilldown')
   ALTER TABLE [WBSubDrilldown] ADD
   CONSTRAINT [PK_WBSubDrilldown] PRIMARY KEY CLUSTERED
   (
      [DrillNum],
      [SubDrillNum]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBTmpKPIs]')
                AND   name = N'PK_WBTmpKPIs')
   ALTER TABLE [WBTmpKPIs] ADD
   CONSTRAINT [PK_WBTmpKPIs] PRIMARY KEY NONCLUSTERED
   (
      [RowPointer]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpDrilldowns')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBTmpDrilldowns]')
                AND   name = N'PK_WBTmpDrilldowns')
   ALTER TABLE [WBTmpDrilldowns] ADD
   CONSTRAINT [PK_WBTmpDrilldowns] PRIMARY KEY NONCLUSTERED
   (
      [RowPointer]
   )  ON [PRIMARY]

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBParameters]')
                AND   name = N'PK_WBParameters')
   ALTER TABLE [WBParameters] ADD
   CONSTRAINT [PK_WBParameters] PRIMARY KEY NONCLUSTERED
   (
      [ParmKey]
   )  ON [PRIMARY]

--Add Unique Constraints
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBCategory]')
                AND   name = N'IX_WBCategory_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBCategory] ADD
   CONSTRAINT [IX_WBCategory_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBCategoryUser]')
                AND   name = N'IX_WBCategoryUser_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBCategoryUser] ADD
   CONSTRAINT [IX_WBCategoryUser_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPICategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPICategory]')
                AND   name = N'IX_WBKPICategory_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPICategory] ADD
   CONSTRAINT [IX_WBKPICategory_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIDrilldown]')
                AND   name = N'IX_WBKPIDrilldown_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPIDrilldown] ADD
   CONSTRAINT [IX_WBKPIDrilldown_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIFilter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIFilter]')
                AND   name = N'IX_WBKPIFilter_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPIFilter] ADD
   CONSTRAINT [IX_WBKPIFilter_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPI]')
                AND   name = N'IX_WBKPI_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPI] ADD
   CONSTRAINT [IX_WBKPI_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIParameter]')
                AND   name = N'IX_WBKPIParameter_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPIParameter] ADD
   CONSTRAINT [IX_WBKPIParameter_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataView')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataView]')
                AND   name = N'IX_WBDataView_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataView] ADD
   CONSTRAINT [IX_WBDataView_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewAction')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewAction]')
                AND   name = N'IX_WBDataViewAction_ScopeType')
BEGIN
   ALTER TABLE [dbo].[WBDataViewAction] ADD
   CONSTRAINT [IX_WBDataViewAction_ScopeType] UNIQUE CLUSTERED
   (
      [ScopeType],
      [ScopeName],
      [ClassName],
      [IDOName],
      [PropertyName],
      [Caption]
   )
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewColumn]')
                AND   name = N'IX_WBDataViewColumn_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataViewColumn] ADD
   CONSTRAINT [IX_WBDataViewColumn_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewGroup')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewGroup]')
                AND   name = N'IX_WBDataViewGroup_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataViewGroup] ADD
   CONSTRAINT [IX_WBDataViewGroup_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewIDO]')
                AND   name = N'IX_WBDataViewIDO_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataViewIDO] ADD
   CONSTRAINT [IX_WBDataViewIDO_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewLayout]')
                AND   name = N'IX_WBDataViewLayout_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataViewLayout] ADD
   CONSTRAINT [IX_WBDataViewLayout_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDataViewUser]')
                AND   name = N'IX_WBDataViewUser_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDataViewUser] ADD
   CONSTRAINT [IX_WBDataViewUser_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownCategory')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownCategory]')
                AND   name = N'IX_WBDrilldownCategory_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDrilldownCategory] ADD
   CONSTRAINT [IX_WBDrilldownCategory_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownFilter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownFilter]')
                AND   name = N'IX_WBDrilldownFilter_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDrilldownFilter] ADD
   CONSTRAINT [IX_WBDrilldownFilter_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownParameter]')
                AND   name = N'IX_WBDrilldownParameter_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDrilldownParameter] ADD
   CONSTRAINT [IX_WBDrilldownParameter_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldown]')
                AND   name = N'IX_WBDrilldown_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDrilldown] ADD
   CONSTRAINT [IX_WBDrilldown_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBDrilldownColumn]')
                AND   name = N'IX_WBDrilldownColumn_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBDrilldownColumn] ADD
   CONSTRAINT [IX_WBDrilldownColumn_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBKPIUser]')
                AND   name = N'IX_WBKPIUser_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBKPIUser] ADD
   CONSTRAINT [IX_WBKPIUser_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSource]')
                AND   name = N'IX_WBSearchSource_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSearchSource] ADD
   CONSTRAINT [IX_WBSearchSource_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceColumn')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceColumn]')
                AND   name = N'IX_WBSearchSourceColumn_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
   CONSTRAINT [IX_WBSearchSourceColumn_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceGroup')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceGroup]')
                AND   name = N'IX_WBSearchSourceGroup_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
   CONSTRAINT [IX_WBSearchSourceGroup_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceItem')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceItem]')
                AND   name = N'IX_WBSearchSourceItem_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSearchSourceItem] ADD
   CONSTRAINT [IX_WBSearchSourceItem_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSourceUser')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSearchSourceUser]')
                AND   name = N'IX_WBSearchSourceUser_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSearchSourceUser] ADD
   CONSTRAINT [IX_WBSearchSourceUser_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSnapshot]')
                AND   name = N'IX_WBSnapshot_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSnapshot] ADD
   CONSTRAINT [IX_WBSnapshot_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END
 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSubDrilldown')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBSubDrilldown]')
                AND   name = N'IX_WBSubDrilldown_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBSubDrilldown] ADD
   CONSTRAINT [IX_WBSubDrilldown_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters')
AND NOT EXISTS (SELECT 1 FROM sys.indexes
                WHERE object_id = OBJECT_ID(N'[dbo].[WBParameters]')
                AND   name = N'IX_WBParameters_RowPointer')
BEGIN
   ALTER TABLE [dbo].[WBParameters] ADD
   CONSTRAINT [IX_WBParameters_RowPointer] UNIQUE NONCLUSTERED
   (
      [RowPointer]
   )
END

--Add Secondary Indexes
IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBCategory_Description'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBCategory]'))
   CREATE INDEX [IX_WBCategory_Description] ON [WBCategory]([Description])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBCategoryUser_ReceiveEmail'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBCategoryUser]'))
   CREATE INDEX [IX_WBCategoryUser_ReceiveEmail] ON [WBCategoryUser]([ReceiveEmail])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPICategory_Category'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPICategory]'))
   CREATE INDEX [IX_WBKPICategory_Category] ON [WBKPICategory]([Category], [KPINum])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPIDrilldown_DrillNum'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPIDrilldown]'))
   CREATE INDEX [IX_WBKPIDrilldown_DrillNum] ON [WBKPIDrilldown]([DrillNum], [KPINum])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPI_Active'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPI]'))
   CREATE INDEX [IX_WBKPI_Active] ON [WBKPI]([Active])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPI_CannedKPINum'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPI]'))
   CREATE INDEX [IX_WBKPI_CannedKPINum] ON [WBKPI]([CannedKPINum])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPI_Description'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPI]'))
   CREATE INDEX [IX_WBKPI_Description] ON [WBKPI]([Description])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPI_ShortDescription'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPI]'))
   CREATE INDEX [IX_WBKPI_ShortDescription] ON [WBKPI]([ShortDescription])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBDrilldownCategory_Category'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBDrilldownCategory]'))
   CREATE INDEX [IX_WBDrilldownCategory_Category] ON [WBDrilldownCategory]([Category])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBKPIUser_ReceiveEmail'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBKPIUser]'))
   CREATE INDEX [IX_WBKPIUser_ReceiveEmail] ON [WBKPIUser]([ReceiveEmail])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBSnapshot_Description'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBSnapshot]'))
   CREATE INDEX [IX_WBSnapshot_Description] ON [WBSnapshot]([Description])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBSnapshot_ShortDescription'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBSnapshot]'))
   CREATE INDEX [IX_WBSnapshot_ShortDescription] ON [WBSnapshot]([ShortDescription])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBSnapshot_KPINum'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBSnapshot]'))
   CREATE INDEX [IX_WBSnapshot_KPINum] ON [WBSnapshot]([KPINum], [Seq])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBSnapshot_Category'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBSnapshot]'))
   CREATE INDEX [IX_WBSnapshot_Category] ON [WBSnapshot]([Category])  ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBTmpKPIs_SessionID'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBTmpKPIs]'))
   CREATE CLUSTERED INDEX [IX_WBTmpKPIs_SessionID] ON [WBTmpKPIs]([SessionID], [KPINum]) ON [PRIMARY]

IF NOT EXISTS(SELECT 1 FROM sys.indexes
              WHERE name = N'IX_WBTmpDrilldowns_SessionID'
              AND   object_id  = OBJECT_ID( N'[dbo].[WBTmpDrilldowns]'))
   CREATE CLUSTERED INDEX [IX_WBTmpDrilldowns_SessionID] ON [WBTmpDrilldowns]([SessionID]) ON [PRIMARY]

--Add Default Constraints
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBCategory')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategory_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBCategory] ADD
      CONSTRAINT [DF_WBCategory_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBCategoryUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CanDrilldown')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CanDrilldown] DEFAULT ((1)) FOR [CanDrilldown]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CanRun')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CanRun] DEFAULT ((1)) FOR [CanRun]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CanUpdateParameters')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CanUpdateParameters] DEFAULT ((1)) FOR [CanUpdateParameters]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CanUser')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CanUser] DEFAULT ((1)) FOR [CanUser]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_ReceiveDrilldown')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_ReceiveDrilldown] DEFAULT ((0)) FOR [ReceiveDrilldown]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_ReceiveEmail')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_ReceiveEmail] DEFAULT ((1)) FOR [ReceiveEmail]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBCategoryUser_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [DF_WBCategoryUser_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPICategory')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPICategory_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPICategory] ADD
      CONSTRAINT [DF_WBKPICategory_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPIDrilldown')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIDrilldown_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIDrilldown] ADD
      CONSTRAINT [DF_WBKPIDrilldown_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPIFilter')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIFilter_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIFilter] ADD
      CONSTRAINT [DF_WBKPIFilter_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPI')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_Active')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_Active] DEFAULT ((1)) FOR [Active]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_AggregateName')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_AggregateName] DEFAULT ('SUM') FOR [AggregateName]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_AlertUse')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_AlertUse] DEFAULT ((1)) FOR [AlertUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_AlertValue')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_AlertValue] DEFAULT ((0)) FOR [AlertValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_CannedKPINum')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_CannedKPINum] DEFAULT ((0)) FOR [CannedKPINum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_KPINum')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_KPINum] DEFAULT ((0)) FOR [KPINum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_DisplayBlank')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_DisplayBlank] DEFAULT ((1)) FOR [DisplayBlank]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_Divisor')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_Divisor] DEFAULT ((1)) FOR [Divisor]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_GoalUse')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_GoalUse] DEFAULT ((1)) FOR [GoalUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_GoalValue')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_GoalValue] DEFAULT ((0)) FOR [GoalValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_lp')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_lp] DEFAULT ((0)) FOR [lp]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_lw')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_lw] DEFAULT ((0)) FOR [lw]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_ly')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_ly] DEFAULT ((0)) FOR [ly]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_lyptd')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_lyptd] DEFAULT ((0)) FOR [lyptd]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_lytd')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_lytd] DEFAULT ((0)) FOR [lytd]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_Places')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_Places] DEFAULT ((2)) FOR [Places]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_ptd')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_ptd] DEFAULT ((0)) FOR [ptd]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_rolling')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_rolling] DEFAULT ((0)) FOR [rolling]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_SnapshotUse')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_SnapshotUse] DEFAULT ((0)) FOR [SnapshotUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_SourceType')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_SourceType] DEFAULT ('S') FOR [SourceType]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_today')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_today] DEFAULT ((0)) FOR [today]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_wtd')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_wtd] DEFAULT ((0)) FOR [wtd]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_yesterday')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_yesterday] DEFAULT ((0)) FOR [yesterday]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPI_ytd')
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [DF_WBKPI_ytd] DEFAULT ((0)) FOR [ytd]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPIParameter')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_KPINum')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_KPINum] DEFAULT ((0)) FOR [KPINum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIParameter_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIParameter] ADD
      CONSTRAINT [DF_WBKPIParameter_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataView')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataView_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataView] ADD
      CONSTRAINT [DF_WBDataView_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewAction')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_Active')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_Active] DEFAULT ((1)) FOR [Active]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewAction_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [DF_WBDataViewAction_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewColumn')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewColumn_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewColumn] ADD
      CONSTRAINT [DF_WBDataViewColumn_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewGroup')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewGroup_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewGroup] ADD
      CONSTRAINT [DF_WBDataViewGroup_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewIDO')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_LinkType')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_LinkType] DEFAULT ('M') FOR [LinkType]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewIDO_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [DF_WBDataViewIDO_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewLayout')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_DefaultView')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_DefaultView] DEFAULT ((0)) FOR [DefaultView]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewLayout_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [DF_WBDataViewLayout_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDataViewUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDataViewUser_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDataViewUser] ADD
      CONSTRAINT [DF_WBDataViewUser_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDrilldown')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_AlertUse')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_AlertUse] DEFAULT ((1)) FOR [AlertUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_AlertValue')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_AlertValue] DEFAULT ((0)) FOR [AlertValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_DetailType')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_DetailType] DEFAULT ('F') FOR [DetailType]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_DrillNum')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_DrillNum] DEFAULT ((0)) FOR [DrillNum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_EmailDrilldown')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_EmailDrilldown] DEFAULT ((0)) FOR [EmailDrilldown]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_GoalUse')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_GoalUse] DEFAULT ((1)) FOR [GoalUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_GoalValue')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_GoalValue] DEFAULT ((0)) FOR [GoalValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_RecordCap')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_RecordCap] DEFAULT ((0)) FOR [RecordCap]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_SourceType')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_SourceType] DEFAULT ('S') FOR [SourceType]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldown_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [DF_WBDrilldown_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDrilldownColumn')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_ColumnSize')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_ColumnSize] DEFAULT (0) FOR [ColumnSize]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_Seq')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_Seq] DEFAULT ((0)) FOR [Seq]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_DrillNum')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_DrillNum] DEFAULT ((0)) FOR [DrillNum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownColumn_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownColumn] ADD
      CONSTRAINT [DF_WBDrilldownColumn_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDrilldownCategory')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownCategory_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownCategory] ADD
      CONSTRAINT [DF_WBDrilldownCategory_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDrilldownFilter')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_Seq')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_Seq] DEFAULT ((0)) FOR [Seq]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownFilter_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownFilter] ADD
      CONSTRAINT [DF_WBDrilldownFilter_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBDrilldownParameter')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_DrillNum')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_DrillNum] DEFAULT ((0)) FOR [DrillNum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBDrilldownParameter_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBDrilldownParameter] ADD
      CONSTRAINT [DF_WBDrilldownParameter_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBKPIUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CanDrilldown')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CanDrilldown] DEFAULT ((1)) FOR [CanDrilldown]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CanRun')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CanRun] DEFAULT ((1)) FOR [CanRun]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CanUpdateParameters')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CanUpdateParameters] DEFAULT ((1)) FOR [CanUpdateParameters]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CanUser')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CanUser] DEFAULT ((1)) FOR [CanUser]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_KPINum')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_KPINum] DEFAULT ((0)) FOR [KPINum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_ReceiveDrilldown')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_ReceiveDrilldown] DEFAULT ((0)) FOR [ReceiveDrilldown]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_ReceiveEmail')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_ReceiveEmail] DEFAULT ((1)) FOR [ReceiveEmail]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBKPIUser_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [DF_WBKPIUser_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSearchSource')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSource_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [DF_WBSearchSource_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSearchSourceColumn')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceColumn_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceColumn] ADD
      CONSTRAINT [DF_WBSearchSourceColumn_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSearchSourceGroup')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceGroup_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceGroup] ADD
      CONSTRAINT [DF_WBSearchSourceGroup_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSearchSourceItem')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceItem_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceItem] ADD
      CONSTRAINT [DF_WBSearchSourceItem_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSearchSourceUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSearchSourceUser_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSearchSourceUser] ADD
      CONSTRAINT [DF_WBSearchSourceUser_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSnapshot')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_ActualValue')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_ActualValue] DEFAULT ((0)) FOR [ActualValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_AlertUse')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_AlertUse] DEFAULT ((1)) FOR [AlertUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_AlertValue')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_AlertValue] DEFAULT ((0)) FOR [AlertValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_KPINum')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_KPINum] DEFAULT ((0)) FOR [KPINum]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_GoalUse')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_GoalUse] DEFAULT ((1)) FOR [GoalUse]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_GoalValue')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_GoalValue] DEFAULT ((0)) FOR [GoalValue]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_Color')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_Color] DEFAULT ((0)) FOR [Color]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSnapshot_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [DF_WBSnapshot_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBSubDrilldown')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBSubDrilldown_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBSubDrilldown] ADD
      CONSTRAINT [DF_WBSubDrilldown_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBTmpKPIs')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_Processed')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_Processed] DEFAULT ((0)) FOR [Processed]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpKPIs_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBTmpKPIs] ADD
      CONSTRAINT [DF_WBTmpKPIs_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = N'dbo'
                AND TABLE_NAME = N'WBTmpDrilldowns')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_Amount')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_Amount] DEFAULT ((0)) FOR [Amount]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = N'dbo'
                   AND NAME = N'DF_WBTmpDrilldowns_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBTmpDrilldowns] ADD
      CONSTRAINT [DF_WBTmpDrilldowns_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END

END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'WBParameters')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_AlertColor')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_AlertColor] DEFAULT ((0)) FOR [AlertColor]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_CreateDate')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_CreatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_CreatedBy] DEFAULT (suser_sname()) FOR [CreatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_GoalColor')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_GoalColor] DEFAULT ((0)) FOR [GoalColor]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_InWorkflow')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_InWorkflow] DEFAULT ((0)) FOR [InWorkflow]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_LoadBatchSize')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_LoadBatchSize] DEFAULT ((10000)) FOR [LoadBatchSize]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_NoteExistsFlag')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_NoteExistsFlag] DEFAULT ((0)) FOR [NoteExistsFlag]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_ParmKey')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_ParmKey] DEFAULT ((0)) FOR [ParmKey]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_RecordDate')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_RecordDate] DEFAULT (getdate()) FOR [RecordDate]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_RowPointer')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_RowPointer] DEFAULT (newid()) FOR [RowPointer]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_UpdatedBy')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_UpdatedBy] DEFAULT (suser_sname()) FOR [UpdatedBy]
   END
   IF NOT EXISTS(SELECT 1 FROM sys.Default_Constraints
                 WHERE SCHEMA_NAME(schema_ID) = 'dbo'
                   AND NAME = 'DF_WBParameters_WarningColor')
   BEGIN
      ALTER TABLE [dbo].[WBParameters] ADD
      CONSTRAINT [DF_WBParameters_WarningColor] DEFAULT ((0)) FOR [WarningColor]
   END

END

--Add Check Constraints
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBCategoryUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_CanDrilldown]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_CanDrilldown] CHECK ([CanDrilldown] = (1) Or [CanDrilldown] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_CanRun]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_CanRun] CHECK ([CanRun] = (1) Or [CanRun] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_CanUpdateParameters]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_CanUpdateParameters] CHECK ([CanUpdateParameters] = (1) Or [CanUpdateParameters] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_CanUser]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_CanUser] CHECK ([CanUser] = (1) Or [CanUser] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_ReceiveDrilldown]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_ReceiveDrilldown] CHECK ([ReceiveDrilldown] = (1) Or [ReceiveDrilldown] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBCategoryUser_ReceiveEmail]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBCategoryUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBCategoryUser] ADD
      CONSTRAINT [CK_WBCategoryUser_ReceiveEmail] CHECK ([ReceiveEmail] = (1) Or [ReceiveEmail] = (0))
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPI')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_Active]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_Active] CHECK ([Active] = (1) Or [Active] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_AlertUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_AlertUse] CHECK ([AlertUse] = (1) Or [AlertUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_DisplayBlank]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_DisplayBlank] CHECK ([DisplayBlank] = (1) Or [DisplayBlank] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_GoalUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_GoalUse] CHECK ([GoalUse] = (1) Or [GoalUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_lp]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_lp] CHECK ([lp] = (1) Or [lp] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_lw]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_lw] CHECK ([lw] = (1) Or [lw] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_ly]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_ly] CHECK ([ly] = (1) Or [ly] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_lyptd]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_lyptd] CHECK ([lyptd] = (1) Or [lyptd] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_lytd]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_lytd] CHECK ([lytd] = (1) Or [lytd] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_ptd]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_ptd] CHECK ([ptd] = (1) Or [ptd] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_rolling]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_rolling] CHECK ([rolling] = (1) Or [rolling] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_SnapshotUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_SnapshotUse] CHECK ([SnapshotUse] = (1) Or [SnapshotUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_SourceType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_SourceType] CHECK ([SourceType] = N'S' OR [SourceType] = N'I')
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_today]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_today] CHECK ([today] = (1) Or [today] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_wtd]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_wtd] CHECK ([wtd] = (1) Or [wtd] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_yesterday]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_yesterday] CHECK ([yesterday] = (1) Or [yesterday] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPI_ytd]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPI]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPI] ADD
      CONSTRAINT [CK_WBKPI_ytd] CHECK ([ytd] = (1) Or [ytd] = (0))
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDataViewAction')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewAction_ActionType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewAction]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [CK_WBDataViewAction_ActionType] CHECK ([ActionType] = N'V' OR [ActionType] = N'F' OR [ActionType] = N'E')
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewAction_Active]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewAction]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewAction] ADD
      CONSTRAINT [CK_WBDataViewAction_Active] CHECK ([Active] = (1) Or [Active] = (0))
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDataViewIDO')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewIDO_LinkType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewIDO]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [CK_WBDataViewIDO_LinkType] CHECK ([LinkType] = N'M' OR [LinkType] = N'S')
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDataViewLayout')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewLayout_DefaultView]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewLayout]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [CK_WBDataViewLayout_DefaultView] CHECK ([DefaultView] = (1) Or [DefaultView] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewLayout_SourceType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewLayout]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [CK_WBDataViewLayout_SourceType] CHECK ([SourceType] = N'V' OR [SourceType] = N'P' OR [SourceType] = N'D' OR [SourceType] = N'S')
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewLayout_ScopeType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewLayout]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewLayout] ADD
      CONSTRAINT [CK_WBDataViewLayout_ScopeType] CHECK ([ScopeType] = N'0' OR [ScopeType] = N'1' OR [ScopeType] = N'2' OR [ScopeType] = N'3')
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDrilldown')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDrilldown_AlertUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDrilldown]'))
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [CK_WBDrilldown_AlertUse] CHECK ([AlertUse] = (1) Or [AlertUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDrilldown_DetailType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDrilldown]'))
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [CK_WBDrilldown_DetailType] CHECK ([DetailType] = N'F' OR [DetailType] = N'E')
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDrilldown_EmailDrilldown]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDrilldown]'))
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [CK_WBDrilldown_EmailDrilldown] CHECK ([EmailDrilldown] = (1) Or [EmailDrilldown] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDrilldown_GoalUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDrilldown]'))
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [CK_WBDrilldown_GoalUse] CHECK ([GoalUse] = (1) Or [GoalUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDrilldown_SourceType]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDrilldown]'))
   BEGIN
      ALTER TABLE [dbo].[WBDrilldown] ADD
      CONSTRAINT [CK_WBDrilldown_SourceType] CHECK ([SourceType] = N'S' OR [SourceType] = N'I')
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBKPIUser')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_CanDrilldown]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_CanDrilldown] CHECK ([CanDrilldown] = (1) Or [CanDrilldown] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_CanRun]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_CanRun] CHECK ([CanRun] = (1) Or [CanRun] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_CanUpdateParameters]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_CanUpdateParameters] CHECK ([CanUpdateParameters] = (1) Or [CanUpdateParameters] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_CanUser]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_CanUser] CHECK ([CanUser] = (1) Or [CanUser] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_ReceiveDrilldown]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_ReceiveDrilldown] CHECK ([ReceiveDrilldown] = (1) Or [ReceiveDrilldown] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBKPIUser_ReceiveEmail]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBKPIUser]'))
   BEGIN
      ALTER TABLE [dbo].[WBKPIUser] ADD
      CONSTRAINT [CK_WBKPIUser_ReceiveEmail] CHECK ([ReceiveEmail] = (1) Or [ReceiveEmail] = (0))
   END
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSnapshot')
BEGIN
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBSnapshot_AlertUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBSnapshot]'))
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [CK_WBSnapshot_AlertUse] CHECK ([AlertUse] = (1) Or [AlertUse] = (0))
   END
   IF NOT EXISTS(SELECT 1 FROM sys.check_constraints
                 WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBSnapshot_GoalUse]')
                   AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBSnapshot]'))
   BEGIN
      ALTER TABLE [dbo].[WBSnapshot] ADD
      CONSTRAINT [CK_WBSnapshot_GoalUse] CHECK ([GoalUse] = (1) Or [GoalUse] = (0))
   END
END

--Drop Tables
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'wb_data_view_style')
   DROP TABLE [dbo].[wb_data_view_style]

--Drop Columns
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategory'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBCategory] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBCategoryUser'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBCategoryUser] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'display_header')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [display_header]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'display_type')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [display_type]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'footer_format')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [footer_format]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'module_spec')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [module_spec]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'scale_increment')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [scale_increment]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'scale_max')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [scale_max]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'scale_min')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [scale_min]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'show_cr_num')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [show_cr_num]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPI'
           AND   COLUMN_NAME = N'source_parms')
   ALTER TABLE [dbo].[WBKPI] DROP COLUMN [source_parms]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIParameter'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBKPIParameter] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldownParameter'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBDrilldownParameter] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'source_parms')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [source_parms]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDrilldown'
           AND   COLUMN_NAME = N'std_display')
   ALTER TABLE [dbo].[WBDrilldown] DROP COLUMN [std_display]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBKPIUser'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBKPIUser] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSnapshot'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBSnapshot] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBTmpKPIs'
           AND   COLUMN_NAME = N'source_parms')
   ALTER TABLE [dbo].[WBTmpKPIs] DROP COLUMN [source_parms]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewLayout'
           AND   COLUMN_NAME = N'style')
   ALTER TABLE [dbo].[WBDataViewLayout] DROP COLUMN [style]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'charfld1')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [charfld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'charfld2')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [charfld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'charfld3')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [charfld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'datefld')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [datefld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'decifld1')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [decifld1]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'decifld2')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [decifld2]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'decifld3')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [decifld3]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'logifld')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [logifld]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'show_snap')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [show_snap]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'style')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [style]
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBParameters'
           AND   COLUMN_NAME = N'last_gen_date')
   ALTER TABLE [dbo].[WBParameters] DROP COLUMN [last_gen_date]
