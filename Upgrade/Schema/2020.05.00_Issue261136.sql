IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ReplicatedRows3_mst')
   DELETE AppTable WHERE TableName = N'ReplicatedRows3_mst'
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ReplicatedRows3_mst',
      NULL, NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'ReplicatedRows3', N'SiteRef')

      declare @Infobar InfobarType
exec dbo.[SchemaAdditionalTasksSp]
     @PStartingTable = 'ReplicatedRows3_mst'
   , @PEndingTable = 'ReplicatedRows3_mst'
   , @Infobar = @Infobar OUTPUT
