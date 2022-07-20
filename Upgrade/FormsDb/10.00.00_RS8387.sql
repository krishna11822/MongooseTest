--bg-BG
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'BulgarianStrings')
    CREATE TABLE [dbo].[BulgarianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_BulgarianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_BulgarianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_BulgarianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--cs-CZ
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'CzechStrings')
    CREATE TABLE [dbo].[CzechStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_CzechStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_CzechStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_CzechStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]


--da-DK
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'DanishStrings')
    CREATE TABLE [dbo].[DanishStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_DanishStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_DanishStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_DanishStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--de-DE
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'GermanStrings')
    CREATE TABLE [dbo].[GermanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_GermanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_GermanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_GermanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-AR
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ArgentineanStrings')
    CREATE TABLE [dbo].[ArgentineanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ArgentineanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ArgentineanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_ArgentineanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-CL
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ChileanStrings')
    CREATE TABLE [dbo].[ChileanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ChileanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ChileanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_ChileanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-CO
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ColombianStrings')
    CREATE TABLE [dbo].[ColombianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ColombianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ColombianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_ColombianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-EC
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'EcuadorianStrings')
    CREATE TABLE [dbo].[EcuadorianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_EcuadorianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_EcuadorianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_EcuadorianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-ES
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'SpainStrings')
    CREATE TABLE [dbo].[SpainStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_SpainStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_SpainStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_SpainStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-MX
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'MexicanStrings')
    CREATE TABLE [dbo].[MexicanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_MexicanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_MexicanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_MexicanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--es-VE
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'VenezuelanStrings')
    CREATE TABLE [dbo].[VenezuelanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_VenezuelanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_VenezuelanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_VenezuelanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--fi-FI
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'FinnishStrings')
    CREATE TABLE [dbo].[FinnishStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_FinnishStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_FinnishStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_FinnishStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--fr-CA
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'CanadianStrings')
    CREATE TABLE [dbo].[CanadianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_CanadianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_CanadianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_CanadianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--fr-FR
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'FrenchStrings')
    CREATE TABLE [dbo].[FrenchStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_FrenchStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_FrenchStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_FrenchStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--he-IL
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'HebrewStrings')
    CREATE TABLE [dbo].[HebrewStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_HebrewStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_HebrewStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_HebrewStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--hu-HU
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'HungarianStrings')
    CREATE TABLE [dbo].[HungarianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_HungarianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_HungarianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_HungarianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--it-IT
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ItalianStrings')
    CREATE TABLE [dbo].[ItalianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ItalianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ItalianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_ItalianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--ja-JP
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'JapaneseStrings')
    CREATE TABLE [dbo].[JapaneseStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_JapaneseStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_JapaneseStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_JapaneseStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--ko-KR
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'KoreanStrings')
    CREATE TABLE [dbo].[KoreanStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_KoreanStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_KoreanStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_KoreanStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--nb-NO
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'NorwegianStrings')
    CREATE TABLE [dbo].[NorwegianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_NorwegianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_NorwegianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_NorwegianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--nl-NL
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'DutchStrings')
    CREATE TABLE [dbo].[DutchStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_DutchStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_DutchStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_DutchStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--pl-PL
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'PolishStrings')
    CREATE TABLE [dbo].[PolishStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_PolishStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_PolishStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_PolishStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--pt-BR
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'BrazilianStrings')
    CREATE TABLE [dbo].[BrazilianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_BrazilianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_BrazilianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_BrazilianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--pt-PT
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'PortugalStrings')
    CREATE TABLE [dbo].[PortugalStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_PortugalStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_PortugalStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_PortugalStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--ru-RU
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'RussianStrings')
    CREATE TABLE [dbo].[RussianStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_RussianStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_RussianStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_RussianStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--sv-SE
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'SwedishStrings')
    CREATE TABLE [dbo].[SwedishStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_SwedishStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_SwedishStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_SwedishStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--th-TH
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'ThaiStrings')
    CREATE TABLE [dbo].[ThaiStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_ThaiStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_ThaiStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_ThaiStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]
    
--tr-TR
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'TurkishStrings')
    CREATE TABLE [dbo].[TurkishStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_TurkishStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_TurkishStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_TurkishStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--vi-VN
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'VietnameseStrings')
    CREATE TABLE [dbo].[VietnameseStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_VietnameseStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_VietnameseStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_VietnameseStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]

--zh-CN
GO
IF NOT EXISTS (SELECT 1 FROM SYS.TABLES WHERE NAME = 'SimplifiedChineseStrings')
    CREATE TABLE [dbo].[SimplifiedChineseStrings](
    [Name] [nvarchar](50) NOT NULL,
    [ScopeType] [smallint] NOT NULL CONSTRAINT [DF_SimplifiedChineseStrings_ScopeType]  DEFAULT (0),
    [ScopeName] [nvarchar](50) NOT NULL CONSTRAINT [DF_SimplifiedChineseStrings_ScopeName]  DEFAULT ('[NULL]'),
    [String] [nvarchar](501) NULL,
    [String2] [nvarchar](501) NULL,
    [String3] [nvarchar](501) NULL,
    [LockedBy] [nvarchar](50) NULL,
    CONSTRAINT [PK_SimplifiedChineseStrings] PRIMARY KEY CLUSTERED
    (
        [Name] ASC,
        [ScopeType] ASC,
        [ScopeName] ASC
    ) ON [PRIMARY]
    ) ON [PRIMARY]
