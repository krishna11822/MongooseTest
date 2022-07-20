IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'ManualReplicationHeader')
INSERT INTO AppTable(TableName, IgnoreInsert, IgnoreUpdate, ModuleName) values ('ManualReplicationHeader', 1, 1, 'Core')
ELSE
BEGIN
UPDATE AppTable 
SET IgnoreInsert = 1, IgnoreUpdate = 1
WHERE TableName like 'ManualReplicationHeader'
END

IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'ArabicStrings')
INSERT INTO AppTable(TableName, IgnoreInsert, IgnoreUpdate, ModuleName) values ('ArabicStrings', 1, 1, 'Core')
ELSE
BEGIN
UPDATE AppTable 
SET IgnoreInsert = 1, IgnoreUpdate = 1
WHERE TableName like 'ArabicStrings'
END

IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'RomanianStrings')
INSERT INTO AppTable(TableName, IgnoreInsert, IgnoreUpdate, ModuleName) values ('RomanianStrings', 1, 1, 'Core')
ELSE
BEGIN
UPDATE AppTable 
SET IgnoreInsert = 1, IgnoreUpdate = 1
WHERE TableName like 'RomanianStrings'
END

IF NOT EXISTS (SELECT 1 FROM AppTable WHERE TableName = 'SlovenianStrings')
INSERT INTO AppTable(TableName, IgnoreInsert, IgnoreUpdate, ModuleName) values ('SlovenianStrings', 1, 1, 'Core')
ELSE
BEGIN
UPDATE AppTable 
SET IgnoreInsert = 1, IgnoreUpdate = 1
WHERE TableName like 'SlovenianStrings'
END

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ManualReplicationHeaderInsert]'))
DROP TRIGGER [dbo].[ManualReplicationHeaderInsert]

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[ManualReplicationHeaderUpdatePenultimate]'))
DROP TRIGGER [dbo].[ManualReplicationHeaderUpdatePenultimate]


IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[LogMessagesInsert]'))
DROP TRIGGER [dbo].[LogMessagesInsert]

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[LogMessagesUpdatePenultimate]'))
DROP TRIGGER [dbo].[LogMessagesUpdatePenultimate]







