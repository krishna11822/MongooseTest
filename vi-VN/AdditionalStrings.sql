IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'VietnameseStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('VietnameseStrings')
END