IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'ManualReplication')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'ManualReplication'
GO

INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'ManualReplication'
, 'IDOMTH'
, 'SLReplicationTriggers.ManualReplication2Sp'
, 0
, 1
)
GO