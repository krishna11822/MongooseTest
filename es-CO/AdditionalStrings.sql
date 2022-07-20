IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'ColombianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('ColombianStrings')
END