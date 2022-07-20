IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'EcuadorianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('EcuadorianStrings')
END