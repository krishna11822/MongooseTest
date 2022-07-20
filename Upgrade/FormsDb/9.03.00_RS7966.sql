--New UDDTs
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ProductNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ProductNameType] FROM [nvarchar](80) NOT NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchemaNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchemaNameType] FROM [nvarchar](80) NOT NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'BuildNumberType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[BuildNumberType] FROM [int] NOT NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'SchemaLevelType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[SchemaLevelType] FROM [int] NOT NULL
GO
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'HashType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[HashType] FROM [char](64) NOT NULL
GO

--This UDDT doesn't exist in ObjectsDb
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'ProductVersionType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ProductVersionType] FROM [nvarchar](160) NOT NULL
GO

--This UDDT doesn't exist in FormsDb, ObjectsDb, TemplatesDb
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'OSLocationType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[OSLocationType] FROM [nvarchar](255) NOT NULL
GO

--This UDDT doesn't exist in FormsDb, TemplatesDb
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'RowPointerType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[RowPointerType] FROM [uniqueidentifier] NULL
GO

--ProductInfo table
IF OBJECT_ID(N'[dbo].[ProductInfo]', N'U') IS NULL
CREATE TABLE [dbo].[ProductInfo](
   [ProductName] [dbo].[ProductNameType] NOT NULL,
   [ProductVersion][dbo].[ProductVersionType] NOT NULL,
   [BuildNumber] [dbo].[BuildNumberType] NOT NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag][dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ProductInfo_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_CreatedBy] DEFAULT(suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductInfo_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ProductInfo_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED 
   (
      [ProductName]
   ),
   CONSTRAINT [IX_ProductInfo_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )
)
GO

--ProductSchemaInfo table
IF OBJECT_ID(N'[dbo].[ProductSchemaInfo]', N'U') IS NULL
CREATE TABLE [dbo].[ProductSchemaInfo](
   [ProductName] [dbo].[ProductNameType] NOT NULL,
   [SchemaName] [dbo].[SchemaNameType] NOT NULL,
   [SchemaLevel] [dbo].[SchemaLevelType] NOT NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag][dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ProductSchemaInfo_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_CreatedBy] DEFAULT(suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaInfo_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ProductSchemaInfo_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ProductSchemaInfo] PRIMARY KEY CLUSTERED 
   (
      [ProductName],
      [SchemaName]
   ),
   CONSTRAINT [IX_ProductSchemaInfo_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )
)
GO

--ProductSchemaObjectInfo table
IF OBJECT_ID(N'[dbo].[ProductSchemaObjectInfo]', N'U') IS NULL
CREATE TABLE [dbo].[ProductSchemaObjectInfo](
   [ProductName] [dbo].[ProductNameType] NOT NULL,
   [SchemaName] [dbo].[SchemaNameType] NOT NULL,
   [ObjectFileName] [dbo].[OSLocationType] NOT NULL,
   [ObjectHash] [dbo].[HashType] NOT NULL,
   [RowPointer] [dbo].[RowPointerType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_RowPointer] DEFAULT (newid()),
   [NoteExistsFlag][dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_NoteExistsFlag] DEFAULT ((0))
      CONSTRAINT [CK_ProductSchemaObjectInfo_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
   [CreatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_CreatedBy] DEFAULT(suser_sname()),
   [UpdatedBy] [dbo].[UsernameType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_UpdatedBy] DEFAULT (suser_sname()),
   [CreateDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_CreateDate] DEFAULT (getdate()),
   [RecordDate] [dbo].[CurrentDateType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_RecordDate] DEFAULT (getdate()),
   [InWorkflow] [dbo].[FlagNyType] NOT NULL 
      CONSTRAINT [DF_ProductSchemaObjectInfo_InWorkflow] DEFAULT ((0))
      CONSTRAINT [CK_ProductSchemaObjectInfo_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
   CONSTRAINT [PK_ProductSchemaObjectInfo] PRIMARY KEY CLUSTERED 
   (
      [ProductName],
      [SchemaName],
      [ObjectFileName]
   ),
   CONSTRAINT [IX_ProductSchemaObjectInfo_RowPointer] UNIQUE NONCLUSTERED 
   (
      [RowPointer]
   )
)
GO
