--For DocumentType Table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'CreateFolderIfNotExists')
   ALTER TABLE [dbo].[DocumentType] ADD
      [CreateFolderIfNotExists] [dbo].[ListYesNoType] NOT NULL 
	  CONSTRAINT [DF_DocumentType_CreateFolderIfNotExists]  DEFAULT ((0))
GO

--check constraint
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentType]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[DocumentType]')
      AND [name] = N'CreateFolderIfNotExists')
	  AND OBJECT_ID('dbo.[CK_DocumentType_CreateFolderIfNotExists]', 'C') IS NULL
   ALTER TABLE [dbo].[DocumentType] ADD
      CONSTRAINT [CK_DocumentType_CreateFolderIfNotExists] CHECK ([CreateFolderIfNotExists] IN (0,1))
GO

