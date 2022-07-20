IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'RomanianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('RomanianStrings')
END