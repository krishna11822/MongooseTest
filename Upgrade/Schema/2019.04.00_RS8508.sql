SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'UserPreferences' )
BEGIN
CREATE TABLE [dbo].[UserPreferences](
	[UserName] [dbo].[UsernameType] NOT NULL,
	[DisplayCaptionInMru] [dbo].[FlagNyType] NULL,
	[FormLoadReplaceWithExtension] [dbo].[FlagNyType] NULL,
	[PromptSaveFlexLayoutChanges] [dbo].[FlagNyType] NULL,
	[PromptSaveGridChanges] [dbo].[FlagNyType] NULL,
	[PromptSaveSizeSplitterChanges] [dbo].[FlagNyType] NULL,
	[ShowConfigOnCaption] [dbo].[FlagNyType] NULL,
	[ShowHiddenInEditMode] [dbo].[FlagNyType] NULL,
	[SimpleLayout] [dbo].[FlagNyType] NULL,
	[StrictLockByForSave] [dbo].[FlagNyType] NULL,
	[UnloadIDOMetadata] [dbo].[FlagNyType] NULL,
	[Theme] [dbo].[FlagNyType] NULL,
	[EscapeCharacters] [dbo].[EscapeCharactersType] NULL,
	[FormsDBThemeName] [dbo].[FormsDBThemeNameType] NULL,
	[WildcardChar] [dbo].[WildcardType] NULL,
	[UsingUserDefaultLanguage] [dbo].[FlagNyType] NULL,
	[LanguageSubdir] [dbo].[LanguageSubdirType] NULL,
	[MRUFormList] [dbo].[MRUFormListType] NULL,
	[MRUFormCaptionList] [dbo].[MRUFormCaptionListType] NULL,
	[HandlerEditingMode] [dbo].[HandlerEditingModeType] NULL,
	[DevelopmentMode] [dbo].[DevelopmentModeType] NULL,
	[DataCacheCap] [dbo].[DataCacheCapType] NULL,
	[LanguageIDInteger] [dbo].[LanguageIDIntegerType] NULL,
	[ListCacheCap] [dbo].[ListCacheCapType] NULL,
	[MaxRecordCap] [dbo].[MaxRecordCapType] NULL,
	[SubLanguageIDInteger] [dbo].[SubLanguageIDIntegerType] NULL,
	[HelpSubdir] [dbo].[HelpSubdirType] NULL,
	[OverrideLanguageID] [dbo].[OverrideLanguageIDType] NULL,
	[FMGridBottomPaneHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMGridLeftPaneWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMGridTopPaneHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMHorizSpaceBetweenButtons] [dbo].[FormMetricsSpaceType] NULL,
	[FMMaxGridWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMMimimumColumnWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMSpaceAboveGroupBoxBottom] [dbo].[FormMetricsBottomType] NULL,
	[FMSpaceBelowGroupBoxTop] [dbo].[FormMetricsTopType] NULL,
	[FMVertSpaceBetweenButtons] [dbo].[FormMetricsSpaceType] NULL,
	[FMButtonSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMButtonSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMCheckBoxSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMCheckBoxSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMComboSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMComboSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMEditSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMEditSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMLabelSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMLabelSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMMaxFormSizeWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMMaxFormSizeHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMNotebookSizeGridLeftWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMNotebookSizeGridLeftHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMNotebookSizeGridTopBottomWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMNotebookSizeGridTopBottomHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMSubCollectionGridSizeGridLeftWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMSubCollectionGridSizeGridLeftHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMSubCollectionGridSizeGridTopBottomWidth] [dbo].[FormMetricsWidthType] NULL,
	[FMSubCollectionGridSizeGridTopBottomHeight] [dbo].[FormMetricsHeightType] NULL,
	[FMDefaultFormLayout] [dbo].[DefaultFormLayoutType] NULL,
	[DiagCacheCommandsEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheDependentNotificationEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheInitializingEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheLoadOverviewEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheLoadValuesEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheUpdateOverviewEnabled] [dbo].[FlagNyType] NULL,
	[DiagCacheUpdateValuesEnabled] [dbo].[FlagNyType] NULL,
	[DiagComponentDataToFromControlEnabled] [dbo].[FlagNyType] NULL,
	[DiagComponentDataToFromSourceEnabled] [dbo].[FlagNyType] NULL,
	[DiagCompDependentNotifEnabled] [dbo].[FlagNyType] NULL,
	[DiagCompInitializingEnabled] [dbo].[FlagNyType] NULL,
	[DiagCompListBuildingEnabled] [dbo].[FlagNyType] NULL,
	[DiagCompUserInteractionEnabled] [dbo].[FlagNyType] NULL,
	[DiagEnabled] [dbo].[FlagNyType] NULL,
	[DiagEventHandlerExecutionEnabled] [dbo].[FlagNyType] NULL,
	[DiagFormEventsEnabled] [dbo].[FlagNyType] NULL,
	[DiagFormInitializingEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterCompEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterDateEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterOverviewEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterPropEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterScriptEnabled] [dbo].[FlagNyType] NULL,
	[DiagInterpreterVarEnabled] [dbo].[FlagNyType] NULL,
	[DiagMetaDataServerEnabled] [dbo].[FlagNyType] NULL,
	[DiagMethodsEnabled] [dbo].[FlagNyType] NULL,
	[DiagScriptsEnabled] [dbo].[FlagNyType] NULL,
	[DiagSecurityEnabled] [dbo].[FlagNyType] NULL,
	[DiagSysInfoEnabled] [dbo].[FlagNyType] NULL,
	[DiagValidatorExecutionEnabled] [dbo].[FlagNyType] NULL,
	[DiagVarDependentNotificationEnabled] [dbo].[FlagNyType] NULL,
	[DiagVarInitializingEnabled] [dbo].[FlagNyType] NULL,
	[DiagVarValueChangeEnabled] [dbo].[FlagNyType] NULL,
	[StringTableName] [dbo].[StringTableNameType] NULL,
	[ActualDataCacheCap] [dbo].[DataCacheCapType] NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_UserPreferences_CreatedBy]  DEFAULT (suser_sname()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_UserPreferences_UpdatedBy]  DEFAULT (suser_sname()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_UserPreferences_CreateDate]  DEFAULT (getdate()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_UserPreferences_RecordDate]  DEFAULT (getdate()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_UserPreferences_RowPointer]  DEFAULT (newid()),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_UserPreferences_NoteExistsFlag]  DEFAULT ((0)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_UserPreferences_InWorkflow]  DEFAULT ((0)),
	[ActualListCacheCap] [dbo].[ListCacheCapType] NULL,
	[DisplayStatusBar] [dbo].[FlagNyType] NULL,
	[UpdateExistingView] [dbo].[FlagNyType] NULL,
	[EnterIsTab] [dbo].[FlagNyType] NULL,
 CONSTRAINT [PK_UserPreferences] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserPreferences_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'UserPreferences'
AND COLUMN_NAME = 'EnterIsTab' )
BEGIN
	ALTER TABLE UserPreferences
	ADD EnterIsTab [dbo].[FlagNyType] NULL
END