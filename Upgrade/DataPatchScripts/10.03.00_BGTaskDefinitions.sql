 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'DatabaseSchemaReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'Database Schema Report' WHERE TaskName = 'DatabaseSchemaReport'

 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'QuickDictionaryReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'Quick Dictionary Report' WHERE TaskName = 'QuickDictionaryReport'

 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserAuthorizationReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'User Authorization Report' WHERE TaskName = 'UserAuthorizationReport'

 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserClassReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'User Class Report' WHERE TaskName = 'UserClassReport'

 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserFieldsReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'User Fields Report' WHERE TaskName = 'UserFieldsReport'

 IF EXISTS (SELECT 1 FROM BGTaskDefinitions WHERE TaskName = 'UserIndexReport')
	UPDATE BGTaskDefinitions SET TaskExecutable = 'User Index Report' WHERE TaskName = 'UserIndexReport'
