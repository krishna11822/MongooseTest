IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'BulgarianStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('BulgarianStrings')
END