IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'HungarianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('HungarianStrings')
END