--RS 8315 AppBuilder Metadata
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ABRuntimeApps')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'ABRuntimeApps'
                AND   COLUMN_NAME = 'Title')
BEGIN
   ALTER TABLE dbo.ABRuntimeApps
   ADD [Title] [dbo].[ObjectNameType] NULL,
       [ShowTitleBar] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_ShowTitleBar] DEFAULT((1))
                                                     CONSTRAINT [CK_ABRuntimeApps_ShowTitleBar] CHECK ([ShowTitleBar]=(0) OR [ShowTitleBar]=(1)),
       [ThemeSwitchEnabled] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_ThemeSwitchEnabled] DEFAULT((0))
                                                           CONSTRAINT [CK_ABRuntimeApps_ThemeSwitchEnabled] CHECK ([ThemeSwitchEnabled]=(0) OR [ThemeSwitchEnabled]=(1)),
       [DefaultTheme] [dbo].[ABThemeType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_DefaultTheme] DEFAULT((1))

   EXEC dbo.SchemaAdditionalTasksSp 'ABRuntimeApps', 'ABRuntimeApps', NULL, 'Core'
END


