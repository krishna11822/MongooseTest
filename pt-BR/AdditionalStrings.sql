IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'BrazilianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('BrazilianStrings')
END