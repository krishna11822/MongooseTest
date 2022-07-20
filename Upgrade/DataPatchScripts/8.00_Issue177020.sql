IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'SSSWBEmailGeneration')
   DELETE FROM BGTaskDefinitions WHERE TaskName = 'SSSWBEmailGeneration'

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'WBEmailGeneration')
   DELETE FROM BGTaskDefinitions WHERE TaskName = 'WBEmailGeneration'

INSERT INTO BGTaskDefinitions (
 TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'WBEmailGeneration'
, 'IDOMTH'
, 'WBKPIs.EmailGeneration'
, 0
, 20
)

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'SSSWBSnapshotGeneration')
   DELETE FROM BGTaskDefinitions WHERE TaskName = 'SSSWBSnapshotGeneration'

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'WBSnapshotGeneration')
   DELETE FROM BGTaskDefinitions WHERE TaskName = 'WBSnapshotGeneration'

INSERT INTO BGTaskDefinitions (
 TaskName, TaskTypeCode, TaskExecutable, ExclusiveFlag, MaxConcurrent
) VALUES (
  'WBSnapshotGeneration'
, 'IDOMTH'
, 'WBSnapshots.SnapshotGeneration'
, 0
, 20
)
