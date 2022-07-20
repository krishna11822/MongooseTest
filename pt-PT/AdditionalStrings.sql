IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'PortugalStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('PortugalStrings')
END