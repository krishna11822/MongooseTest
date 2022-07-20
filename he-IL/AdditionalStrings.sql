IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'HebrewStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('HebrewStrings')
END