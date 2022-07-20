IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'ChileanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('ChileanStrings')
END