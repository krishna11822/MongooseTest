IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUserControls]') AND type IN (N'U'))
BEGIN
CREATE TABLE [dbo].[WebUserControls](
[UserControlName] [nvarchar](60) NOT NULL,
[AssemblyImage] [nvarchar](max) NOT NULL,
[ScopeType] [smallint] NOT NULL,
[ScopeName] [nvarchar](50) NOT NULL,
[LockedBy] [nvarchar](50) NULL,
CONSTRAINT [PK_WebUserControls] PRIMARY KEY CLUSTERED 
(
    [UserControlName] ASC,
    [ScopeType] ASC,
    [ScopeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[WebUserControls] ADD  CONSTRAINT [DF_WebUserControls_ScopeType]  DEFAULT ((0)) FOR [ScopeType]

ALTER TABLE [dbo].[WebUserControls] ADD  CONSTRAINT [DF_WebUserControls_ScopeName]  DEFAULT ('[NULL]') FOR [ScopeName]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebUserControlElements]') AND type IN (N'U'))
BEGIN
CREATE TABLE [dbo].[WebUserControlElements](
[ElementName] [nvarchar](60) NOT NULL,
[ContentType] [nvarchar](30) NOT NULL,
[ElementContent] [nvarchar](max) NOT NULL,
[ScopeType] [smallint] NOT NULL,
[ScopeName] [nvarchar](50) NOT NULL,
[LockedBy] [nvarchar](50) NULL,
CONSTRAINT [PK_WebUserControlElements] PRIMARY KEY CLUSTERED 
(
    [ElementName] ASC,
    [ContentType] ASC,
    [ScopeType] ASC,
    [ScopeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[WebUserControlElements] ADD  CONSTRAINT [DF_WebUserControlElements_ScopeType]  DEFAULT ((0)) FOR [ScopeType]

ALTER TABLE [dbo].[WebUserControlElements] ADD  CONSTRAINT [DF_WebUserControlElements_ScopeName]  DEFAULT ('[NULL]') FOR [ScopeName]
END