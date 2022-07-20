IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'DutchStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('DutchStrings')
END