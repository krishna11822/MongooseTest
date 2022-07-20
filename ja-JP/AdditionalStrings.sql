IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'JapaneseStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('JapaneseStrings')
END