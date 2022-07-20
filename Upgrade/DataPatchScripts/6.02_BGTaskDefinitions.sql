/* BGTaskDefinitions */

/* RS 5115 */
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserAuthorizationReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'UserAuthorizationReport'
, 'RPT'
, 'UserAuthorization'
, NULL
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'DatabaseSchemaReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'DatabaseSchemaReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'DatabaseSchemaReport'
, 'RPT'
, 'DatabaseSchema'
, NULL
, 0
, 20
)
GO
 
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'QuickDictionaryReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'QuickDictionaryReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'QuickDictionaryReport'
, 'RPT'
, 'QuickDictionary'
, NULL
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserClassReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserClassReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'UserClassReport'
, 'RPT'  
, 'UserClass'
, NULL
, 0
, 20
)
GO
 
IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserFieldsReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserFieldsReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'UserFieldsReport'
, 'RPT'
, 'UserFields'
, NULL
, 0
, 20
)
GO

IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserIndexReport')
DELETE FROM BGTaskDefinitions WHERE TaskName = 'UserIndexReport'
GO
INSERT INTO BGTaskDefinitions (
TaskName, TaskTypeCode, TaskExecutable, TaskDescription, ExclusiveFlag, MaxConcurrent
) VALUES (
  'UserIndexReport'
, 'RPT'
, 'UserIndex'
, NULL
, 0
, 20
)
GO

