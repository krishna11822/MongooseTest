IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'CzechStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('CzechStrings')
END