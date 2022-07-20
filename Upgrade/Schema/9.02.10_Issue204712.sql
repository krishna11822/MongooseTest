IF EXISTS (SELECT 1 FROM sys.fulltext_indexes fti 
   WHERE fti.object_id = OBJECT_ID(N'[dbo].[DocumentObject]'))
   DROP FULLTEXT INDEX ON [dbo].[DocumentObject]
GO

IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'PK_DocumentObject'
   AND [type] = 'PK' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[DocumentObject]'))
   ALTER TABLE [dbo].[DocumentObject] DROP CONSTRAINT [PK_DocumentObject]
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'PK_DocumentObject'
   AND [type] = 'PK' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[DocumentObject]'))
   ALTER TABLE [dbo].[DocumentObject] ADD 
      CONSTRAINT PK_DocumentObject PRIMARY KEY NONCLUSTERED 
	  (
	     RowPointer
	  ) WITH FILLFACTOR = 90
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[DocumentObject]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'IX_DocumentObject_DocumentName_Sequence'
   AND [type] = 'UQ' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[DocumentObject]'))
   ALTER TABLE [dbo].[DocumentObject] ADD 
      CONSTRAINT IX_DocumentObject_DocumentName_Sequence UNIQUE CLUSTERED 
	  (
	     DocumentName	
		 ,Sequence
	  ) WITH FILLFACTOR = 90
GO

IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name]= N'IX_DocumentObject_RowPointer'
   AND [type] = 'UQ' 
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[DocumentObject]'))
   ALTER TABLE [dbo].[DocumentObject] DROP CONSTRAINT [IX_DocumentObject_RowPointer]
GO

IF FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') = 1
   IF NOT EXISTS (SELECT 1 FROM sys.fulltext_catalogs WHERE name = 'DocumentsCatalog')
      CREATE FULLTEXT CATALOG DocumentsCatalog
   GO
IF FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') = 1
BEGIN
   IF EXISTS (SELECT 1 FROM sys.fulltext_catalogs WHERE name = 'DocumentsCatalog')
      AND NOT EXISTS (SELECT 1 FROM sys.fulltext_indexes fti 
	  WHERE fti.object_id = OBJECT_ID(N'[dbo].[DocumentObject]'))
      CREATE FULLTEXT INDEX ON DocumentObject
	  (DocumentObject TYPE COLUMN IndexExtension )
	  KEY INDEX PK_DocumentObject
	  ON DocumentsCatalog
END
GO