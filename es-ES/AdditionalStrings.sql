IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'SpainStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('SpainStrings')
END