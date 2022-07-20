IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'ArgentineanStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('ArgentineanStrings')
END