
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'PurgeInboxOutBoxEntries')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'PurgeInboxOutBoxEntries'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'PurgeInboxOutBoxEntries'
, 'IDOMTH'
, 'CorInboxEntries.COR_InBox_OutBoxPurgeSp'
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'RestoreInboxOutBoxEntries')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'RestoreInboxOutBoxEntries'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'RestoreInboxOutBoxEntries'
, 'IDOMTH'
, 'CorInboxEntries.COR_InBox_OutBoxRestoreSp'
, 0
, 20
)
GO