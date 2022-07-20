IF EXISTS (SELECT 1 FROM AppTable WHERE TableName = N'LoginCfg')
DELETE AppTable WHERE TableName = N'LoginCfg'
