--  Add UserPasswordHistory to the list of shared tables and to AppTables.


IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'UserPasswordHistory')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName])
   VALUES (N'UserPasswordHistory',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0, 
      0, 0, 0, 0, 
      NULL, 
      N'Core')

IF NOT EXISTS (SELECT 1 FROM IntranetSharedUserTableDefault WHERE TableName = 'UserPasswordHistory')
INSERT INTO IntranetSharedUserTableDefault 
  (TableName, UserIdColumnName, GroupIdColumnName, Shareable, UpdateRefId)
   VALUES ('UserPasswordHistory', NULL, Null, 1, 0) 

INSERT INTO IntranetSharedUserTable (IntranetName, TableName, Shared, Processed, Shareable, UpdateRefId)
SELECT IntranetName, N'UserPasswordHistory', 0, 1, 1, 0
FROM IntranetSharedUserTable is1
WHERE TableName = 'AccountAuthorizations'
AND NOT EXISTS (SELECT 1
FROM IntranetSHaredUserTable is2
WHERE is1.IntranetName = is2.IntranetName
AND is2.TableName = N'UserPasswordHistory')
GO
