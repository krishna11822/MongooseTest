SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlovakStrings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SlovakStrings](
	[Name] [nvarchar](50) NOT NULL,
	[ScopeType] [smallint] NOT NULL,
	[ScopeName] [nvarchar](50) NOT NULL,
	[String] [nvarchar](501) NULL,
	[String2] [nvarchar](501) NULL,
	[String3] [nvarchar](501) NULL,
	[LockedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_SlovakStrings] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[ScopeType] ASC,
	[ScopeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SlovakStrings_ScopeType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SlovakStrings] ADD  CONSTRAINT [DF_SlovakStrings_ScopeType]  DEFAULT ((0)) FOR [ScopeType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SlovakStrings_ScopeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SlovakStrings] ADD  CONSTRAINT [DF_SlovakStrings_ScopeName]  DEFAULT ('[NULL]') FOR [ScopeName]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraditionalChineseStrings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TraditionalChineseStrings](
	[Name] [nvarchar](50) NOT NULL,
	[ScopeType] [smallint] NOT NULL,
	[ScopeName] [nvarchar](50) NOT NULL,
	[String] [nvarchar](501) NULL,
	[String2] [nvarchar](501) NULL,
	[String3] [nvarchar](501) NULL,
	[LockedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_TraditionalChineseStrings] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[ScopeType] ASC,
	[ScopeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SlovakStrings_ScopeType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TraditionalChineseStrings] ADD  CONSTRAINT [DF_TraditionalChineseStrings_ScopeType]  DEFAULT ((0)) FOR [ScopeType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SlovakStrings_ScopeName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TraditionalChineseStrings] ADD  CONSTRAINT [DF_TraditionalChineseStrings_ScopeName]  DEFAULT ('[NULL]') FOR [ScopeName]
END
GO
