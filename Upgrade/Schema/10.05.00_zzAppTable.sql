SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ArgentineanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ArgentineanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'BrazilianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'BrazilianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'BulgarianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'BulgarianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'CanadianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'CanadianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ChileanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ChileanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ColombianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ColombianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'CzechStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'CzechStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DanishStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DanishStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'DutchStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'DutchStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'EcuadorianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'EcuadorianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FinnishStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FinnishStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'FrenchStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'FrenchStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'GermanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'GermanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'HebrewStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'HebrewStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'HungarianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'HungarianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ItalianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ItalianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'JapaneseStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'JapaneseStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'KoreanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'KoreanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'MexicanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'MexicanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NorwegianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NorwegianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'PolishStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PolishStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'PortugalStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'PortugalStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'RussianStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'RussianStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'SimplifiedChineseStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SimplifiedChineseStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'SpainStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SpainStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'SwedishStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'SwedishStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'ThaiStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'ThaiStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'TurkishStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'TurkishStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'VenezuelanStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'VenezuelanStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'VietnameseStrings')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'VietnameseStrings',
      NULL, NULL, 1, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', NULL, NULL)

GO

--  Issue 238069: AppTable 'AuditLog' should have IgnoreInsert flag set to 0

DECLARE 
  @Infobar  InfobarType

SET @Infobar = NULL

IF EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'AuditLog'
   AND IgnoreInsert = 1)
BEGIN

   UPDATE dbo.AppTable
   SET 
     IgnoreInsert = 0
   WHERE TableName = N'AuditLog'

   EXEC dbo.TriggerIupCodeWrapperSp
         @StartingTableName = N'AuditLog'
       , @EndingTableName   = N'AuditLog'
       , @Infobar           = @Infobar OUTPUT

END                  

GO
