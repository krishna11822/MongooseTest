IF NOT EXISTS (SELECT 1 FROM LanguageIds WHERE LanguageID = 'ar-SA') AND NOT EXISTS (SELECT 1 FROM LanguageIds WHERE LanguageCode = 'ARA')
	INSERT LanguageIds (LanguageID, LanguageCode, LanguageDesc, StringTableName, LanguageSubdir, HelpSubdir, LocaleID) VALUES('ar-SA','ARA','Arabic (Saudi Arabia)','ArabicStrings','ar-SA','ar-SA',1025)

IF NOT EXISTS (SELECT 1 FROM LanguageIds WHERE LanguageID = 'ro-RO') AND NOT EXISTS (SELECT 1 FROM LanguageIds WHERE LanguageCode = 'ROM')
	INSERT LanguageIds (LanguageID, LanguageCode, LanguageDesc, StringTableName, LanguageSubdir, HelpSubdir, LocaleID) VALUES('ro-RO','ROM','Romanian (Romania)','RomanianStrings','ro-RO','ro-RO',1048)
