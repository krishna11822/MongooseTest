IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'RussianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('RussianStrings')
END