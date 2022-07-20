IF NOT EXISTS(SELECT * FROM AdditionalStringTables WHERE Name = 'SimplifiedChineseStrings')
BEGIN
INSERT INTO AdditionalStringTables (NAME) VALUES ('SimplifiedChineseStrings')
END