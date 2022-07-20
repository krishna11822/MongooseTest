IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'FrenchStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('FrenchStrings')
END