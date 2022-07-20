IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'TurkishStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('TurkishStrings')
END