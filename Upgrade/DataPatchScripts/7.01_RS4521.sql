-- AppTable init data for RS4521
IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DocumentObject')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName])
   VALUES (N'DocumentObject',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0, 
      0, 0, 0, 0, 
      NULL, 
      N'Core')

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DocumentObjectReference')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName])
   VALUES (N'DocumentObjectReference',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0, 
      0, 0, 0, 0, 
      NULL, 
      N'Core')

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DocumentType')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName])
   VALUES (N'DocumentType',
      NULL, NULL, 0, 0, 0,
      0, 0, 0, 0, 
      0, 0, 0, 0, 
      NULL, 
      N'Core')
GO

