IF OBJECT_ID(N'[dbo].[BodInformation]', N'U') IS NULL
CREATE TABLE [dbo].[BodInformation] (
  [BodID] ESBSystemIdType NOT NULL 
, [LogicalID] ESBLogicalIdType NOT NULL 
, [BodNoun] ESBNounNameType NOT NULL
, [BodKey] AS HASHBYTES('SHA2_256', BodID + LogicalID + BodNoun)
, [VariationID] ESBMessageIdType NOT NULL
, [NoteExistsFlag] FlagNyType NOT NULL CONSTRAINT [DF_BodInformation_NEF] DEFAULT ((0))
, [CreatedBy] UsernameType NOT NULL CONSTRAINT [DF_BodInformation_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy] UsernameType NOT NULL CONSTRAINT [DF_BodInformation_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate] CurrentDateType NOT NULL CONSTRAINT [DF_BodInformation_CreateDate] DEFAULT (getdate())
, [RecordDate] CurrentDateType NOT NULL CONSTRAINT [DF_BodInformation_RecordDate] DEFAULT (getdate())
, [RowPointer] RowPointerType NOT NULL CONSTRAINT [DF_BodInformation_RowPointer] DEFAULT (newid())
, [InWorkflow] FlagNyType NOT NULL CONSTRAINT [DF_BodInformation_InWorkflow] DEFAULT ((0))
, CONSTRAINT [CK_BodInNoteExistsFlag] CHECK ([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0))
, CONSTRAINT [CK_BodInInWorkflow] CHECK ([InWorkflow]=(1) OR [InWorkflow]=(0))
, CONSTRAINT [PK_BodInformation] PRIMARY KEY NONCLUSTERED ([RowPointer])
)
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
          AND TABLE_NAME = N'BodInformation')
AND NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[BodInformation]') 
               AND name = N'IX_BodInformation_BodKey')
CREATE NONCLUSTERED INDEX IX_BodInformation_BodKey ON BodInformation(BodKey)
GO
