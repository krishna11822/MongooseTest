IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'KoreanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('KoreanStrings')
END