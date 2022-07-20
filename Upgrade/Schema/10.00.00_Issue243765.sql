/* FileServer */

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] 
   WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServer]') 
   AND [name] = N'DomainName')
   ALTER TABLE [dbo].[FileServer] ALTER COLUMN [DomainName] [dbo].[NetworkDomainNameType] NULL

GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns] 
   WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServer]') 
   AND [name] = N'UserPassword')
   ALTER TABLE [dbo].[FileServer] ALTER COLUMN [UserPassword] [dbo].[EncryptedClientPasswordType] NULL

GO
