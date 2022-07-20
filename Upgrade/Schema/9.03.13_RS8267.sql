/* FileServerLogicalFolder_mst */

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServerLogicalFolder_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServerLogicalFolder_mst]')
      AND [name] = N'AdditionalProperties')
   ALTER TABLE [dbo].[FileServerLogicalFolder_mst] ADD
      [AdditionalProperties] [dbo].[JSONStringType] NULL

GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServerLogicalFolder_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServerLogicalFolder_mst]')
      AND [name] = N'AttachedDocumentType')
   ALTER TABLE [dbo].[FileServerLogicalFolder_mst] ADD
      [AttachedDocumentType] [dbo].[DocumentTypeType] NULL

GO

DECLARE
	  @PStartingTable TableNameType
	, @PEndingTable TableNameType
	, @Infobar InfobarType
	, @PModuleName AppModuleType

	SET @PStartingTable = N'FileServerLogicalFolder_mst'
	SET @PEndingTable = N'FileServerLogicalFolder_mst'
	SET @Infobar = NULL

	EXEC dbo.SchemaAdditionalTasksSp
	  @PStartingTable
	, @PEndingTable
	, @Infobar

GO
