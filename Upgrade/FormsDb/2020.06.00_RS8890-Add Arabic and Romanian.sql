GO
--ar-SA
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ArabicStrings')
    CREATE TABLE [dbo].[ArabicStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ArabicStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ArabicStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
        CONSTRAINT [PK_ArabicStrings] PRIMARY KEY CLUSTERED
        (
            [Name] ASC,
            [ScopeType] ASC,
            [ScopeName] ASC
        ) ON [PRIMARY]
    ) ON [PRIMARY]

GO
--ro-RO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'RomanianStrings')
    CREATE TABLE [dbo].[RomanianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_RomanianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_RomanianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
        CONSTRAINT [PK_RomanianStrings] PRIMARY KEY CLUSTERED
        (
            [Name] ASC,
            [ScopeType] ASC,
            [ScopeName] ASC
        ) ON [PRIMARY]
    ) ON [PRIMARY]