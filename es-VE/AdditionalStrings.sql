IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'VenezuelanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('VenezuelanStrings')
END