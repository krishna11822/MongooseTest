IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'DanishStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('DanishStrings')
END