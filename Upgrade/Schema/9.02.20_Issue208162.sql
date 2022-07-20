--For FileServer Table alter datatype
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] syscol, [sys].[types] systype
   WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[FileServer]')
   AND [syscol].[name] = N'UserPassword'
   And [syscol].[user_type_id] = [systype].[user_type_id]   
   AND [systype].[Name] = 'EncryptedPasswordType' and [systype].[is_user_defined] = 1)
   ALTER TABLE [dbo].[FileServer] ALTER COLUMN 
      [UserPassword] [dbo].[EncryptedClientPasswordType] NOT NULL
GO