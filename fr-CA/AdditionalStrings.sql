IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'CanadianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('CanadianStrings')
END