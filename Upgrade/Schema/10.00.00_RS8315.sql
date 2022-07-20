--RS 8315 - AppBuilder
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'ABIdType' )
   CREATE TYPE [dbo].[ABIdType] FROM NVARCHAR(64) NULL
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'ABVersionType' )
   CREATE TYPE [dbo].[ABVersionType] FROM NVARCHAR(32) NULL
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'ABThemeType' )
   CREATE TYPE [dbo].[ABThemeType] FROM SMALLINT NULL
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'LongerDescType' )
   CREATE TYPE [dbo].[LongerDescType] FROM NVARCHAR(2000) NULL
GO

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABProjects')
BEGIN
   CREATE TABLE [dbo].[ABProjects] (
      [Id] [dbo].[ABIdType] NOT NULL,
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      [Description] [dbo].[LongerDescType] NULL,
      [DisplayName] [dbo].[ObjectNameType] NULL,
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [Title] [dbo].[ObjectNameType] NULL,
      [Version] [dbo].[ABVersionType] NULL,
      [ShowTitleBar] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABProjects_ShowTitleBar] DEFAULT((1)),
      [ThemeSwitchEnabled] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABProjects_ThemeSwitchEnabled] DEFAULT((0)),
      [DefaultTheme] [dbo].[ABThemeType] NOT NULL CONSTRAINT [DF_ABProjects_DefaultTheme] DEFAULT((1)),
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABProjects_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABProjects_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABProjects_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABProjects_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABProjects_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABProjects_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABProjects_InWorkflow]  DEFAULT ((0)),
      [Composites] [dbo].[JSONStringType] NULL,
      [Translations] [dbo].[JSONStringType] NULL,
      CONSTRAINT [PK_ABProjects] PRIMARY KEY CLUSTERED 
      (
	      [Id] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABProjects_RowPointer] UNIQUE NONCLUSTERED 
      (
	      [RowPointer] ASC
      ) ON [PRIMARY]
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABProjects', 'ABProjects', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABDataServices')
BEGIN
   CREATE TABLE [dbo].[ABDataServices] (
      [Id] [dbo].[ABIdType] NOT NULL,
      [ProjectId] [dbo].[ABIdType] NOT NULL,
      [Runtime] [dbo].[ListYesNoType] NOT NULL,
      [Name] [dbo].[LongDescType] NULL,
      [Version] [dbo].[SchemaLevelType] NULL,
      [Data] [dbo].[JSONStringType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABDataServices_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABDataServices_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABDataServices_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABDataServices_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABDataServices_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABDataServices_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABDataServices_InWorkflow]  DEFAULT ((0)),
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      CONSTRAINT [PK_ABDataServices] PRIMARY KEY CLUSTERED 
      (
         [ProjectId] ASC,
         [Id] ASC,
         [Runtime] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABDataServices_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY],
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABDataServices', 'ABDataServices', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABRepositoryDataServices')
BEGIN
   CREATE TABLE [dbo].[ABRepositoryDataServices] (
      [Id] [dbo].[ABIdType] NOT NULL,
      [Name] [dbo].[LongDescType] NULL,
      [Version] [dbo].[SchemaLevelType] NULL,
      [Data] [dbo].[JSONStringType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryDataServices_InWorkflow]  DEFAULT ((0)),
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      CONSTRAINT [PK_ABRepositoryDataServices] PRIMARY KEY CLUSTERED 
      (
         [Id] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABRepositoryDataServices_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY]
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABRepositoryDataServices', 'ABRepositoryDataServices', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABRepositoryProjects')
BEGIN
   CREATE TABLE [dbo].[ABRepositoryProjects](
      [Id] [dbo].[ABIdType] NOT NULL,
      [DisplayName] [dbo].[ObjectNameType] NULL,
      [Description] [dbo].[LongerDescType] NULL,
      [Version] [dbo].[ABVersionType] NOT NULL,
      [IsSystemRecord] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_IsSystemRecord]  DEFAULT ((0)),
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRepositoryProjects_InWorkflow]  DEFAULT ((0)),
      [Data] [dbo].[JSONStringType] NULL,
      CONSTRAINT [PK_ABRepositoryProjects] PRIMARY KEY CLUSTERED 
      (
         [Id] ASC,
         [Version] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABRepositoryProjects_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY]
   ) ON [PRIMARY] 

   EXEC dbo.SchemaAdditionalTasksSp 'ABRepositoryProjects', 'ABRepositoryProjects', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABRuntimeApps')
BEGIN
   CREATE TABLE [dbo].[ABRuntimeApps](
      [Id] [dbo].[ABIdType] NOT NULL,
      [DisplayName] [dbo].[ObjectNameType] NULL,
      [Description] [dbo].[LongerDescType] NULL,
      [UrlName] [dbo].[UrlType] NULL,
      [Version] [dbo].[ABVersionType] NULL,
      [IsSystemRecord] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_IsSystemRecord] DEFAULT ((0)),
      [Active] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_Status] DEFAULT ((0)),
      [CreatedByDisplayName] [dbo].[LongDescType] NULL,
      [LastChangedByDisplayName] [dbo].[LongDescType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABRuntimeApps_InWorkflow]  DEFAULT ((0)),
      [Composites] [dbo].[JSONStringType] NULL,
      [Translations] [dbo].[JSONStringType] NULL,
      CONSTRAINT [PK_ABRuntimeApps] PRIMARY KEY CLUSTERED 
      (
         [Id] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABRuntimeApps_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY]
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABRuntimeApps', 'ABRuntimeApps', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABTags')
BEGIN
   CREATE TABLE [dbo].[ABTags](
      [Id] [dbo].[ABIdType] NOT NULL,
      [ProjectId] [dbo].[ABIdType] NOT NULL,
      [Name] [dbo].[LongDescType] NULL,
      [IsSystemRecord] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_ABTags_IsSystemRecord] DEFAULT ((0)),
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABTags_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABTags_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABTags_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABTags_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABTags_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABTags_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABTags_InWorkflow]  DEFAULT ((0)),
      CONSTRAINT [PK_ABTags] PRIMARY KEY CLUSTERED 
      (
         [ProjectId] ASC,
         [Id] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABTags_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABTags_Id] UNIQUE NONCLUSTERED 
      (
         [Id] ASC
      ) ON [PRIMARY]
   ) ON [PRIMARY]

   CREATE INDEX [IX_ABTags_ProjectId] ON ABTags(ProjectId)

   EXEC dbo.SchemaAdditionalTasksSp 'ABTags', 'ABTags', NULL, 'Core'
END

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
               WHERE TABLE_SCHEMA = 'dbo'
               AND   TABLE_NAME = 'ABProjectRoles')
BEGIN
   CREATE TABLE [dbo].[ABProjectRoles](
      [Id] [dbo].[ABIdType] NOT NULL,
      [ProjectId] [dbo].[ABIdType] NOT NULL,
      [Name] [dbo].[LongDescType] NOT NULL,
      [Type] [dbo].[LongDescType] NOT NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABProjectRoles_CreatedBy]  DEFAULT (suser_sname()),
      [UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_ABProjectRoles_UpdatedBy]  DEFAULT (suser_sname()),
      [CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABProjectRoles_CreateDate]  DEFAULT (getdate()),
      [RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_ABProjectRoles_RecordDate]  DEFAULT (getdate()),
      [RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_ABProjectRoles_RowPointer]  DEFAULT (newid()),
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABProjectRoles_NoteExistsFlag]  DEFAULT ((0)),
      [InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_ABProjectRoles_InWorkflow]  DEFAULT ((0)),
      CONSTRAINT [PK_ABProjectRoles] PRIMARY KEY CLUSTERED 
      (
         [ProjectId] ASC,
         [Id] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABProjectRoles_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      ) ON [PRIMARY],
      CONSTRAINT [IX_ABProjectRoles_Id] UNIQUE NONCLUSTERED 
      (
         [Id] ASC
      ) ON [PRIMARY],
	  CONSTRAINT [ABProjectRolesFK1] FOREIGN KEY([ProjectId]) REFERENCES [dbo].[ABRuntimeApps] ([Id]),
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABProjectRoles', 'ABProjectRoles', NULL, 'Core'
END
