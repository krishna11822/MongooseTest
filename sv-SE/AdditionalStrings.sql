IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'SwedishStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('SwedishStrings')
END