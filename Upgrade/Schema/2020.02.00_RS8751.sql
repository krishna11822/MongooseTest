
/****** Object:  Table [dbo].[ObjExtDataSource]    Script Date: 1/14/2020 5:41:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ObjExtDataSource]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[ObjExtDataSource](
		[CollectionName] [dbo].[CollectionNameType] NOT NULL,
		[ExtObjectName] [dbo].[ObjectNameType] NOT NULL,
		[ExtPropertyMapping] [dbo].[JSONStringType] NOT NULL,
		[ExtSource] [dbo].[NameType] NOT NULL,
		[CreatedBy] [dbo].[UsernameType] NOT NULL,
		[UpdatedBy] [dbo].[UsernameType] NOT NULL,
		[CreateDate] [dbo].[CurrentDateType] NOT NULL,
		[RecordDate] [dbo].[CurrentDateType] NOT NULL,
		[RowPointer] [dbo].[RowPointerType] NOT NULL,
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
		[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	 CONSTRAINT [PK_ObjExtDataSource] PRIMARY KEY CLUSTERED 
	(
		[ExtObjectName] ASC,
		[CollectionName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_ObjExtDataSource_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_CreatedBy]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_UpdatedBy]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_CreateDate]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_RecordDate]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_RowPointer]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_NoteExistsFlag]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DF_ObjExtDataSource_InWorkflow]') AND type = 'D')
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] ADD  CONSTRAINT [DF_ObjExtDataSource_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ObjExtDataSource_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjExtDataSource]'))
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource]  WITH CHECK ADD  CONSTRAINT [CK_ObjExtDataSource_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
	END
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ObjExtDataSource_InWorkflow]') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjExtDataSource]'))
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] WITH CHECK CHECK CONSTRAINT [CK_ObjExtDataSource_InWorkflow]
	END
GO

IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ObjExtDataSource_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjExtDataSource]'))
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource]  WITH CHECK ADD  CONSTRAINT [CK_ObjExtDataSource_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
	END
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_ObjExtDataSource_NoteExistsFlag]') AND parent_object_id = OBJECT_ID(N'[dbo].[ObjExtDataSource]'))
	BEGIN
		ALTER TABLE [dbo].[ObjExtDataSource] WITH CHECK CHECK CONSTRAINT [CK_ObjExtDataSource_NoteExistsFlag]
	END
GO


DECLARE		@PStartingTable TableNameType,
			@PEndingTable TableNameType,
			@Infobar InfobarType,
			@PModuleName AppModuleType

-- New table
SET @PStartingTable = N'ObjExtDataSource'
SET @PEndingTable = N'ObjExtDataSource'
SET @Infobar = NULL
SET @PModuleName = N'Core'

EXEC dbo.SchemaAdditionalTasksSp @PStartingTable,@PEndingTable,@Infobar,@PModuleName
GO
