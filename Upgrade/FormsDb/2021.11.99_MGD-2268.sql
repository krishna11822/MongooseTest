--ArabicStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArabicStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ArabicStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ArabicStrings]
	ADD Description nvarchar(250) NULL
END

--ArgentineanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArgentineanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ArgentineanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ArgentineanStrings]
	ADD Description nvarchar(250) NULL
END

--BrazilianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BrazilianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[BrazilianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[BrazilianStrings]
	ADD Description nvarchar(250) NULL
END

--BulgarianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BulgarianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[BulgarianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[BulgarianStrings]
	ADD Description nvarchar(250) NULL
END

--CanadianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CanadianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[CanadianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[CanadianStrings]
	ADD Description nvarchar(250) NULL
END

--ChileanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChileanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ChileanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ChileanStrings]
	ADD Description nvarchar(250) NULL
END

--ColombianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColombianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ColombianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ColombianStrings]
	ADD Description nvarchar(250) NULL
END

--CzechStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CzechStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[CzechStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[CzechStrings]
	ADD Description nvarchar(250) NULL
END

--DanishStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DanishStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[DanishStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[DanishStrings]
	ADD Description nvarchar(250) NULL
END

--DutchStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DutchStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[DutchStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[DutchStrings]
	ADD Description nvarchar(250) NULL
END

--EcuadorianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EcuadorianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[EcuadorianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[EcuadorianStrings]
	ADD Description nvarchar(250) NULL
END

--FinnishStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinnishStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[FinnishStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[FinnishStrings]
	ADD Description nvarchar(250) NULL
END

--FrenchStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FrenchStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[FrenchStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[FrenchStrings]
	ADD Description nvarchar(250) NULL
END

--GermanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GermanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[GermanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[GermanStrings]
	ADD Description nvarchar(250) NULL
END

--HebrewStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HebrewStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[HebrewStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[HebrewStrings]
	ADD Description nvarchar(250) NULL
END

--HungarianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HungarianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[HungarianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[HungarianStrings]
	ADD Description nvarchar(250) NULL
END

--ItalianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItalianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ItalianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ItalianStrings]
	ADD Description nvarchar(250) NULL
END

--JapaneseStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JapaneseStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[JapaneseStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[JapaneseStrings]
	ADD Description nvarchar(250) NULL
END

--KoreanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KoreanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[KoreanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[KoreanStrings]
	ADD Description nvarchar(250) NULL
END

--MexicanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MexicanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[MexicanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[MexicanStrings]
	ADD Description nvarchar(250) NULL
END

--NorwegianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NorwegianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[NorwegianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[NorwegianStrings]
	ADD Description nvarchar(250) NULL
END

--PolishStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolishStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[PolishStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[PolishStrings]
	ADD Description nvarchar(250) NULL
END

--PortugalStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PortugalStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[PortugalStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[PortugalStrings]
	ADD Description nvarchar(250) NULL
END

--RomanianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RomanianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[RomanianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[RomanianStrings]
	ADD Description nvarchar(250) NULL
END

--RussianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RussianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[RussianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[RussianStrings]
	ADD Description nvarchar(250) NULL
END

--SimplifiedChineseStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SimplifiedChineseStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[SimplifiedChineseStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[SimplifiedChineseStrings]
	ADD Description nvarchar(250) NULL
END

--SlovakStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlovakStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[SlovakStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[SlovakStrings]
	ADD Description nvarchar(250) NULL
END

--SlovenianStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlovenianStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[SlovenianStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[SlovenianStrings]
	ADD Description nvarchar(250) NULL
END

--SpainStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpainStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[SpainStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[SpainStrings]
	ADD Description nvarchar(250) NULL
END

--Strings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Strings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[Strings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[Strings]
	ADD Description nvarchar(250) NULL
END

--SwedishStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SwedishStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[SwedishStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[SwedishStrings]
	ADD Description nvarchar(250) NULL
END

--ThaiStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ThaiStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[ThaiStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[ThaiStrings]
	ADD Description nvarchar(250) NULL
END

--TraditionalChineseStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TraditionalChineseStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[TraditionalChineseStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[TraditionalChineseStrings]
	ADD Description nvarchar(250) NULL
END

--TurkishStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TurkishStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[TurkishStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[TurkishStrings]
	ADD Description nvarchar(250) NULL
END

--VenezuelanStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VenezuelanStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[VenezuelanStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[VenezuelanStrings]
	ADD Description nvarchar(250) NULL
END

--VietnameseStrings
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VietnameseStrings]') AND type in (N'U'))
	AND 
(COL_LENGTH(N'[dbo].[VietnameseStrings]', 'Description') IS NULL)
BEGIN
	ALTER TABLE [dbo].[VietnameseStrings]
	ADD Description nvarchar(250) NULL
END