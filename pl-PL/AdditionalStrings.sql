IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'PolishStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('PolishStrings')
END