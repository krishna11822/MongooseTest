IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'ThaiStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('ThaiStrings')
END