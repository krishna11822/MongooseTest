-----==UserDefinedInfo(New TBL)==-----
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'UserDefinedInfo' )
BEGIN
	CREATE TABLE [dbo].[UserDefinedInfo](
		[Name] [dbo].[NameType] NOT NULL,
		[Description] [dbo].[DescriptionType] NULL,
		[ContextDefinedInfo] [dbo].[ExtDataStoreValueType] NOT NULL,
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_NoteExistsFlag] DEFAULT ((0))
		   CONSTRAINT [CK_UserDefinedInfo_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_RowPointer]  DEFAULT (newid()),
		[CreatedBy] [dbo].[UsernameType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_CreateDate]  DEFAULT (getdate()),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL
		   CONSTRAINT [DF_UserDefinedInfo_InWorkflow] DEFAULT ((0))
		   CONSTRAINT [CK_UserDefinedInfo_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_UserDefinedInfo] PRIMARY KEY CLUSTERED
	(
		[Name]
	),
	CONSTRAINT [IX_UserDefinedInfo_RowPointer] UNIQUE NONCLUSTERED
	(
		[RowPointer]
	)
	)
END
GO

EXEC dbo.SchemaAdditionalTasksSp N'UserDefinedInfo', N'UserDefinedInfo', NULL, N'Core'
GO

-----==/UserDefinedInfo(New TBL)==-----

-----==Printer(Modify TBL)==-----

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'Printer'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'Printer'
                AND   COLUMN_NAME IN (N'InternetPrinterID', N'InternetInfoName'))
BEGIN
   ALTER TABLE [dbo].[Printer]
   ADD
     [InternetPrinterID] [dbo].[LongRowPointerType] NULL
	,[InternetInfoName] [dbo].[NameType] NULL
END
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Printer]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [OBJECT_ID] = OBJECT_ID(N'FK_Printer_UserDefinedInfo'))
BEGIN
   ALTER TABLE [dbo].[Printer] WITH NOCHECK
   ADD CONSTRAINT [FK_Printer_UserDefinedInfo]
   FOREIGN KEY (
     [InternetInfoName]
   ) REFERENCES [dbo].[UserDefinedInfo](
     [Name]
   )
END
GO

IF NOT EXISTS (SELECT 1 
			   FROM sys.indexes 
			   WHERE [NAME]=N'IX_Printer_InternetPrinterID'
				AND [OBJECT_ID] = OBJECT_ID(N'[dbo].[Printer]'))
BEGIN
	CREATE UNIQUE NONCLUSTERED INDEX
	[IX_Printer_InternetPrinterID] ON [dbo].[Printer]
	(
		[InternetPrinterID]
	)
	WHERE [InternetPrinterID] IS NOT NULL
END
GO

EXEC dbo.SchemaAdditionalTasksSp N'Printer', N'Printer', NULL, N'Core'
GO

-----==/Printer(Modify TBL)==-----