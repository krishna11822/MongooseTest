SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'LicenseSessionUsageTracking' )
BEGIN
	CREATE TABLE [dbo].[LicenseSessionUsageTracking](
		[SessionConnectionId] [dbo].[RowPointer] NOT NULL,
		[UserName] [dbo].[UsernameType] NOT NULL,
		[SessionOpenDateTime] [dbo].[CurrentDateType] NOT NULL,
		[SessionCloseDateTime] [dbo].[CurrentDateType] NULL,
		[SessionType] [dbo].[SessionTypeType] NOT NULL,
		[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_CreateDate]  DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL  CONSTRAINT [DF_LicenseSessionUsageTracking_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_RowPointer]  DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_NoteExistsFlag]  DEFAULT ((0)),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LicenseSessionUsageTracking_InWorkflow]  DEFAULT ((0)),
	 CONSTRAINT [PK_LicenseSessionUsageTracking] PRIMARY KEY CLUSTERED 
	(
		[SessionConnectionId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_LicenseSessionUsageTracking_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]
END

GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'LicenseObjectUsageTracking' )
BEGIN
	CREATE TABLE [dbo].[LicenseObjectUsageTracking](
		[SessionConnectionId] [dbo].[RowPointer] NOT NULL,
		[ObjectType] [dbo].[LicenseObjectTypeType] NOT NULL,
		[ObjectName] [dbo].[LicenseObjectNameType] NOT NULL,
		[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_CreateDate]  DEFAULT (getdate()),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_RowPointer]  DEFAULT (newid()),
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_NoteExistsFlag]  DEFAULT ((0)),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LicenseObjectUsageTracking_InWorkflow]  DEFAULT ((0)),
	 CONSTRAINT [PK_LicenseObjectUsageTracking] PRIMARY KEY CLUSTERED 
	(
		[SessionConnectionId] ASC,
		[ObjectType] ASC,
		[ObjectName] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	 CONSTRAINT [IX_LicenseObjectUsageTracking_RowPointer] UNIQUE NONCLUSTERED 
	(
		[RowPointer] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]
END


GO

IF OBJECT_ID('dbo.ConnectionInformationDel_UsageTracking') IS NOT NULL
   DROP TRIGGER dbo.[ConnectionInformationDel_UsageTracking]
GO

CREATE TRIGGER dbo.[ConnectionInformationDel_UsageTracking]
   ON  [ConnectionInformation]
   FOR DELETE
AS 
BEGIN

	IF @@ROWCOUNT = 0 RETURN

	SET NOCOUNT ON;

    -- Delete License Session records
	DELETE FROM dbo.[LicenseSessionUsageTracking]
	WHERE [SessionConnectionId] IN (SELECT deleted.ConnectionID from deleted)

	-- Delete License Object records
	DELETE FROM dbo.[LicenseObjectUsageTracking]
	WHERE [SessionConnectionId] IN (SELECT deleted.ConnectionID from deleted)

END