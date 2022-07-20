--Script to clean up duplicate records from LanguageIDs table
DELETE FROM LanguageIDs WHERE LanguageID = 'hi-IN' AND LanguageCode = 'HIN'
INSERT LanguageIDs (LanguageID, LanguageCode, LanguageDesc, StringTableName, LanguageSubdir, HelpSubdir, LocaleID) 
   VALUES('hi-IN','HIN','Hindi (India)','Strings','hi-IN','hi-IN',1081)

DELETE FROM LanguageIDs WHERE LanguageID = 'ms-MY' AND LanguageCode = 'MSL'
INSERT LanguageIDs (LanguageID, LanguageCode, LanguageDesc, StringTableName, LanguageSubdir, HelpSubdir, LocaleID)
   VALUES('ms-MY','MSL','Malay (Malaysia)','Strings','ms-MY','ms-MY',1086)


-- Unique constraint for LanguageIDs table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[LanguageIDs]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'IX_LanguageIDs_LocaleID'
   AND [type] = 'UQ' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[LanguageIDs]'))
   ALTER TABLE [dbo].[LanguageIDs] ADD
      CONSTRAINT [IX_LanguageIDs_LocaleID] UNIQUE NONCLUSTERED    
      (
         [LocaleID]
      )  WITH  FILLFACTOR = 90
GO

