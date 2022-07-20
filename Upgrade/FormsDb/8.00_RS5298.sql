SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID(N'[dbo].[FormAppsInfo]', N'U') IS NULL
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
) ON [PRIMARY]

ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormAppsInfo_MessageText]  DEFAULT ('') FOR [MessageText]
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormAppsInfo_MessageButtons]  DEFAULT ((0)) FOR [MessageButtons]
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormsAppsInfo_MessageIcon]  DEFAULT ((0)) FOR [MessageIcon]
ALTER TABLE [dbo].[FormAppsInfo] ADD  CONSTRAINT [DF_FormsAppsInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END
GO
