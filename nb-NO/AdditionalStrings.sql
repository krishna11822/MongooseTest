IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'NorwegianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('NorwegianStrings')
END