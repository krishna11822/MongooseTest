IF NOT EXISTS (SELECT 1 FROM IntranetSharedUserTableDefault WHERE TableName = 'UserTask')
INSERT INTO IntranetSharedUserTableDefault 
  (TableName, UserIdColumnName, GroupIdColumnName, Shareable, UpdateRefId)
  VALUES ('UserTask', 'UserId', NULL, 1, 1)
  
IF NOT EXISTS (SELECT 1 FROM IntranetSharedUserTableDefault WHERE TableName = 'UserCalendar')
INSERT INTO IntranetSharedUserTableDefault 
  (TableName, UserIdColumnName, GroupIdColumnName, Shareable, UpdateRefId)
  VALUES ('UserCalendar', 'UserId', NULL, 1, 1)


INSERT INTO IntranetSharedUserTable (IntranetName, TableName, UserIdColumnName, Shared, Processed, Shareable, UpdateRefId)
SELECT isu.IntranetName, 'UserCalendar', 'UserId', 0, 1, 1, 1
FROM IntranetSharedUserTable isu
WHERE isu.TableName = 'UserNames'
AND NOT EXISTS (SELECT 1
FROM IntranetSharedUserTable isu2
WHERE isu2.IntranetName = isu.IntranetName
AND isu2.TableName = 'UserCalendar')
UNION
SELECT isu.IntranetName, 'UserTask', 'UserId', 0, 1, 1, 1
FROM IntranetSharedUserTable isu
WHERE isu.TableName = 'UserNames'
AND NOT EXISTS (SELECT 1
FROM IntranetSharedUserTable isu2
WHERE isu2.IntranetName = isu.IntranetName
AND isu2.TableName = 'UserTask')

GO
