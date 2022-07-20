--RS6267 - DataViews Phase 2

--DataView Input Parameters
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBDataViewParameter')
BEGIN
   CREATE TABLE [dbo].[WBDataViewParameter]
   (
      [ViewName] [NameType] NOT NULL,
      [Seq] [SequenceType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_Seq] DEFAULT (0),
      [PropertyName] [WBPropertyNameType] NULL,
      [Operator] [WBOperatorType] NULL,
      [EndOfDay] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_EndOfDay] DEFAULT (0),
      [Description] [DescriptionType] NULL,
      [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_InWorkflow] DEFAULT ((0)),
      [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_NoteExistsFlag] DEFAULT ((0)),
      [RecordDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_RecordDate] DEFAULT (getdate()),
      [CreateDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_CreateDate] DEFAULT (getdate()),
      [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_UpdatedBy] DEFAULT (suser_sname()),
      [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_WBDataViewParameter_RowPointer] DEFAULT (newid())   
      CONSTRAINT [PK_WBDataViewParameter] PRIMARY KEY CLUSTERED
      (
         [ViewName],
         [Seq]
      )  , 
      CONSTRAINT [IX_WBDataViewParameter_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
      ),
      CONSTRAINT [CK_WBDataViewParameter_EndOfDay] CHECK ([EndOfDay] = (1) Or [EndOfDay] = (0)),
      CONSTRAINT [CK_WBDataViewParameter_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_WBDataViewParameter_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0))
   ) 
END

--WBDataViewIDO - ido method data source
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBDataViewIDO')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                 WHERE TABLE_SCHEMA = N'dbo'
                 AND   TABLE_NAME = N'WBDataViewIDO'
                 AND   COLUMN_NAME = N'SourceType')
BEGIN
   ALTER TABLE [dbo].[WBDataViewIDO]
   ADD
      [SourceType] [WBSourceTypeType] NOT NULL CONSTRAINT [DF_WBDataViewIDO_SourceType] DEFAULT('I'),
      [SourceName] [WBSourceNameType] NULL
END

--DataSearch - search notes and show notes
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = N'dbo'
           AND   TABLE_NAME = N'WBSearchSource')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'WBSearchSource'
                AND   COLUMN_NAME = N'SearchNotes')
BEGIN
   ALTER TABLE [dbo].[WBSearchSource]
   ADD 
      [SearchNotes] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBSearchSource_SearchNotes] DEFAULT(0),
      [ShowNotes] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBSearchSource_ShowNotes] DEFAULT(0)   
END

--DataSearch Sets - grouping of search sources into "sets" for searching
--Code table
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSet')
BEGIN
   CREATE TABLE [dbo].[WBSearchSet]
   (
      [SetName] [NameType] NOT NULL,
      [Caption] [NameType] NULL,
      [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_WBSearchSet_InWorkflow] DEFAULT ((0)),
      [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_WBSearchSet_NoteExistsFlag] DEFAULT ((0)),
      [RecordDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBSearchSet_RecordDate] DEFAULT (getdate()),
      [CreateDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBSearchSet_CreateDate] DEFAULT (getdate()),
      [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBSearchSet_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBSearchSet_UpdatedBy] DEFAULT (suser_sname()),
      [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_WBSearchSet_RowPointer] DEFAULT (newid())  
      CONSTRAINT [PK_WBSearchSet] PRIMARY KEY CLUSTERED
      (
         [SetName]
      )  ,
      CONSTRAINT [IX_WBSearchSet_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
      ),
      CONSTRAINT [CK_WBSearchSet_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_WBSearchSet_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0))
   )       
END

--Bridge table between Search Sources and Search Sets
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBSearchSourceSet')
BEGIN
   CREATE TABLE [dbo].[WBSearchSourceSet]
   (
      [SourceName] [NameType] NOT NULL,
      [SetName] [NameType] NOT NULL,
      [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_InWorkflow] DEFAULT ((0)),
      [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_NoteExistsFlag] DEFAULT ((0)),
      [RecordDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_RecordDate] DEFAULT (getdate()),
      [CreateDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_CreateDate] DEFAULT (getdate()),
      [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_UpdatedBy] DEFAULT (suser_sname()),
      [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_WBSearchSourceSet_RowPointer] DEFAULT (newid()) 
      CONSTRAINT [PK_WBSearchSourceSet] PRIMARY KEY CLUSTERED
      (
         [SourceName],
         [SetName]
      )  ,
      CONSTRAINT [IX_WBSearchSourceSet_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
      ),
      CONSTRAINT [CK_WBSearchSourceSet_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_WBSearchSourceSet_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0))
   )        
END

GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBDataViewIDO')
BEGIN            
   IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBDataViewIDO'
              AND   COLUMN_NAME = N'SourceType')
   AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                  WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBDataViewIDO_SourceType]')
                    AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBDataViewIDO]'))
   BEGIN
      ALTER TABLE [dbo].[WBDataViewIDO] ADD
      CONSTRAINT [CK_WBDataViewIDO_SourceType] CHECK ([SourceType] = ('I') Or [SourceType] = ('M'))
   END  
END

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
            AND TABLE_NAME = N'WBSearchSource')
BEGIN      
   IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBSearchSource'
              AND   COLUMN_NAME = N'SearchNotes')
   AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                  WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBSearchSource_SearchNotes]')
                    AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBSearchSource]'))
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [CK_WBSearchSource_SearchNotes] CHECK ([SearchNotes] = (1) Or [SearchNotes] = (0))
   END
   
   IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
              WHERE TABLE_SCHEMA = N'dbo'
              AND   TABLE_NAME = N'WBSearchSource'
              AND   COLUMN_NAME = N'ShowNotes')   
   AND NOT EXISTS(SELECT 1 FROM sys.check_constraints
                  WHERE object_ID = OBJECT_ID(N'[dbo].[CK_WBSearchSource_ShowNotes]')
                    AND parent_object_ID  = OBJECT_ID(N'[dbo].[WBSearchSource]'))
   BEGIN
      ALTER TABLE [dbo].[WBSearchSource] ADD
      CONSTRAINT [CK_WBSearchSource_ShowNotes] CHECK ([ShowNotes] = (1) Or [ShowNotes] = (0))
   END   
END   