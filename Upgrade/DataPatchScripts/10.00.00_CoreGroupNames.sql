IF NOT EXISTS(SELECT 1 FROM GroupNames
   WHERE GroupName = 'APPBUILDER-Administrator')
INSERT GroupNames
   (GroupName, GroupDesc)
VALUES ('APPBUILDER-Administrator', 'AppBuilder Administrator Group')

IF NOT EXISTS(SELECT 1 FROM GroupNames
   WHERE GroupName = 'APPBUILDER-Designer')
INSERT GroupNames
   (GroupName, GroupDesc)
VALUES ('APPBUILDER-Designer', 'AppBuilder Designer Group')

IF NOT EXISTS(SELECT 1 FROM GroupNames
   WHERE GroupName = 'APPBUILDER-User')
INSERT GroupNames
   (GroupName, GroupDesc)
VALUES ('APPBUILDER-User', 'AppBuilder User Group')
