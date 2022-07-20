
IF NOT EXISTS (SELECT * from sys.objects where object_id = OBJECT_ID(N'FormAppsInfo') and type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormAppsInfo](
	[ID] [uniqueidentifier] NOT NULL,
	[EntryType] [int] NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[MessageButtons] [int] NOT NULL,
	[MessageIcon] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[RowNumber] [int] NOT NULL,
	[ObjectType] [int] NULL,
	[ObjectName] [nvarchar](255) NULL,
	[TargetScope] [int] NULL,
	[TargetScopeName] [nvarchar](255) NULL,
	[SecondaryObjectName] [nvarchar](255) NULL,
	[TertiaryObjectName] [nvarchar](255) NULL,
	[FieldID] [int] NULL,
	[Instruction] [nvarchar](max) NULL,
	[Explanation] [nvarchar](max) NULL,
	[CommandLinks] [nvarchar](max) NULL
)
END
GO
IF NOT EXISTS (SELECT * FROM SYS.indexes where name = 'IX_FormAppsInfo_ID')
BEGIN
CREATE NONCLUSTERED INDEX [IX_FormAppsInfo_ID] ON [dbo].[FormAppsInfo]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
END
GO
IF NOT EXISTS (select *
      from sys.all_columns c
      join sys.tables t on t.object_id = c.object_id
      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id
    where t.name = 'FormAppsInfo'
      and c.name = 'MessageText'
      and s.name = 'dbo')
BEGIN
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormAppsInfo_MessageText]  DEFAULT ('') FOR [MessageText]
END
GO
IF NOT EXISTS (select *
      from sys.all_columns c
      join sys.tables t on t.object_id = c.object_id
      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id
    where t.name = 'FormAppsInfo'
      and c.name = 'MessageButtons'
      and s.name = 'dbo')
BEGIN
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormAppsInfo_MessageButtons]  DEFAULT ((0)) FOR [MessageButtons]
END
GO
IF NOT EXISTS (select *
      from sys.all_columns c
      join sys.tables t on t.object_id = c.object_id
      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id
    where t.name = 'FormAppsInfo'
      and c.name = 'MessageIcon'
      and s.name = 'dbo')
BEGIN
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormsAppsInfo_MessageIcon]  DEFAULT ((0)) FOR [MessageIcon]
END
GO
IF NOT EXISTS (select *
      from sys.all_columns c
      join sys.tables t on t.object_id = c.object_id
      join sys.schemas s on s.schema_id = t.schema_id
      join sys.default_constraints d on c.default_object_id = d.object_id
    where t.name = 'FormAppsInfo'
      and c.name = 'CreateDate'
      and s.name = 'dbo')
BEGIN
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormsAppsInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
