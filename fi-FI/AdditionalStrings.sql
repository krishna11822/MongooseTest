IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'FinnishStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('FinnishStrings')
END