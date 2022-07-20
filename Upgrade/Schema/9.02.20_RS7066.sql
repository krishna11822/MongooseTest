--RS7066 - Add Group Security to Critical Numbers

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBCategoryGroup')
BEGIN
   CREATE TABLE [dbo].[WBCategoryGroup]
   (
      [Category] [WBCategoryType] NOT NULL,
      [GroupName] [GroupNameType] NOT NULL,
      [CanDrilldown] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_CanDrilldown] DEFAULT((1)),
	   [CanRun] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBCategoryGroup_CanRun] DEFAULT((1)),
	   [CanUpdateParameters] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_CanUpdateParameters] DEFAULT((1)),
	   [CanUser] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBCategoryGroup_CanUser] DEFAULT((1)),
	   [ReceiveEmail] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBCategoryGroup_ReceiveEmail] DEFAULT((1)),
	   [ReceiveDrilldown] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBCategoryGroup_ReceiveDrilldown] DEFAULT((0)),      
      [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_InWorkflow] DEFAULT ((0)),
      [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_NoteExistsFlag] DEFAULT ((0)),
      [RecordDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_RecordDate] DEFAULT (getdate()),
      [CreateDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_CreateDate] DEFAULT (getdate()),
      [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_UpdatedBy] DEFAULT (suser_sname()),
      [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_WBCategoryGroup_RowPointer] DEFAULT (newid())   
      CONSTRAINT [PK_WBCategoryGroup] PRIMARY KEY CLUSTERED
      (
         [Category],
         [GroupName]
      )  , 
      CONSTRAINT [IX_WBCategoryGroup_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
      ),
      CONSTRAINT [CK_WBCategoryGroup_CanDrilldown] CHECK ([CanDrilldown] = (1) Or [CanDrilldown] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_CanRun] CHECK ([CanRun] = (1) Or [CanRun] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_CanUpdateParameters] CHECK ([CanUpdateParameters] = (1) Or [CanUpdateParameters] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_CanUser] CHECK ([CanUser] = (1) Or [CanUser] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_ReceiveEmail] CHECK ([ReceiveEmail] = (1) Or [ReceiveEmail] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_ReceiveDrilldown] CHECK ([ReceiveDrilldown] = (1) Or [ReceiveDrilldown] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_WBCategoryGroup_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0))
   ) 
END


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
               WHERE TABLE_SCHEMA = N'dbo'
               AND   TABLE_NAME = N'WBKPIGroup')
BEGIN
   CREATE TABLE [dbo].[WBKPIGroup]
   (
      [KPINum] [WBKPINumType] NOT NULL,
      [GroupName] [GroupNameType] NOT NULL,
      [CanDrilldown] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBKPIGroup_CanDrilldown] DEFAULT((1)),
	   [CanRun] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBKPIGroup_CanRun] DEFAULT((1)),
	   [CanUpdateParameters] [ListYesNoType] NOT NULL CONSTRAINT [DF_WBKPIGroup_CanUpdateParameters] DEFAULT((1)),
	   [CanUser] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBKPIGroup_CanUser] DEFAULT((1)),
	   [ReceiveEmail] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBKPIGroup_ReceiveEmail] DEFAULT((1)),
	   [ReceiveDrilldown] [ListYesNoType] NOT NULL  CONSTRAINT [DF_WBKPIGroup_ReceiveDrilldown] DEFAULT((0)),      
      [InWorkflow] [FlagNyType] NOT NULL CONSTRAINT [DF_WBKPIGroup_InWorkflow] DEFAULT ((0)),
      [NoteExistsFlag] [FlagNyType] NOT NULL CONSTRAINT [DF_WBKPIGroup_NoteExistsFlag] DEFAULT ((0)),
      [RecordDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBKPIGroup_RecordDate] DEFAULT (getdate()),
      [CreateDate] [DateTimeType] NOT NULL CONSTRAINT [DF_WBKPIGroup_CreateDate] DEFAULT (getdate()),
      [CreatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBKPIGroup_CreatedBy] DEFAULT (suser_sname()),
      [UpdatedBy] [UsernameType] NOT NULL CONSTRAINT [DF_WBKPIGroup_UpdatedBy] DEFAULT (suser_sname()),
      [RowPointer] [RowPointerType] NOT NULL CONSTRAINT [DF_WBKPIGroup_RowPointer] DEFAULT (newid())   
      CONSTRAINT [PK_WBKPIGroup] PRIMARY KEY CLUSTERED
      (
         [KPINum],
         [GroupName]
      )  , 
      CONSTRAINT [IX_WBKPIGroup_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
      ),
      CONSTRAINT [CK_WBKPIGroup_CanDrilldown] CHECK ([CanDrilldown] = (1) Or [CanDrilldown] = (0)),
      CONSTRAINT [CK_WBKPIGroup_CanRun] CHECK ([CanRun] = (1) Or [CanRun] = (0)),
      CONSTRAINT [CK_WBKPIGroup_CanUpdateParameters] CHECK ([CanUpdateParameters] = (1) Or [CanUpdateParameters] = (0)),
      CONSTRAINT [CK_WBKPIGroup_CanUser] CHECK ([CanUser] = (1) Or [CanUser] = (0)),
      CONSTRAINT [CK_WBKPIGroup_ReceiveEmail] CHECK ([ReceiveEmail] = (1) Or [ReceiveEmail] = (0)),
      CONSTRAINT [CK_WBKPIGroup_ReceiveDrilldown] CHECK ([ReceiveDrilldown] = (1) Or [ReceiveDrilldown] = (0)),
      CONSTRAINT [CK_WBKPIGroup_InWorkflow] CHECK ([InWorkflow] = (1) Or [InWorkflow] = (0)),
      CONSTRAINT [CK_WBKPIGroup_NoteExistsFlag] CHECK ([NoteExistsFlag] = (1) Or [NoteExistsFlag] = (0))
   ) 
END         