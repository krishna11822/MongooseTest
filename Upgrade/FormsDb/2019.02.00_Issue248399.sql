GO
--sl-SI
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'SlovenianStrings')
    CREATE TABLE [dbo].[SlovenianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_SlovenianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_SlovenianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
        CONSTRAINT [PK_SlovenianStrings] PRIMARY KEY CLUSTERED
        (
            [Name] ASC,
            [ScopeType] ASC,
            [ScopeName] ASC
        ) ON [PRIMARY]
    ) ON [PRIMARY]
