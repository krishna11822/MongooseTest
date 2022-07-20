IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'GermanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('GermanStrings')
END