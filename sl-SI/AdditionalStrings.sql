IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'SlovenianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('SlovenianStrings')
END