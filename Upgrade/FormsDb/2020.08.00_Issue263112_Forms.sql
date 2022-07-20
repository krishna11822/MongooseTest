IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ArabicStringsInsert]'))
DROP TRIGGER [dbo].[ArabicStringsInsert]

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[RomanianStringsInsert]'))
DROP TRIGGER [dbo].[RomanianStringsInsert]

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[SlovenianStringsInsert]'))
DROP TRIGGER [dbo].[SlovenianStringsInsert]


IF EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[ArrabicStrings]'))
DROP TABLE [dbo].[ArrabicStrings]






