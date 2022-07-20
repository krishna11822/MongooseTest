IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name ='MexicanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('MexicanStrings')
END