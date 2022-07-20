IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'ItalianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('ItalianStrings')
END