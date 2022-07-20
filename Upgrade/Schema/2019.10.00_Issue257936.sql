-----==EventUserData(New TBL)==-----
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'EventUserData' )
BEGIN
	CREATE TABLE [dbo].[EventUserData](
		[Username] [dbo].[UsernameType] NOT NULL,
		[EventMessagesLastCheckedTime] [dbo].[DateTimeType] NULL,
		[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL
		   CONSTRAINT [DF_EventUserData_NoteExistsFlag] DEFAULT ((0))
		   CONSTRAINT [CK_EventUserData_NoteExistsFlag] CHECK ([NoteExistsFlag] IN (0,1)),
		[RecordDate] [dbo].[CurrentDateType] NOT NULL
		   CONSTRAINT [DF_EventUserData_RecordDate]  DEFAULT (getdate()),
		[RowPointer] [dbo].[RowPointerType] NOT NULL
		   CONSTRAINT [DF_EventUserData_RowPointer]  DEFAULT (newid()),
		[CreatedBy] [dbo].[UsernameType] NOT NULL
		   CONSTRAINT [DF_EventUserData_CreatedBy]  DEFAULT (suser_sname()),
		[UpdatedBy] [dbo].[UsernameType] NOT NULL
		   CONSTRAINT [DF_EventUserData_UpdatedBy]  DEFAULT (suser_sname()),
		[CreateDate] [dbo].[CurrentDateType] NOT NULL
		   CONSTRAINT [DF_EventUserData_CreateDate]  DEFAULT (getdate()),
		[InWorkflow] [dbo].[FlagNyType] NOT NULL
		   CONSTRAINT [DF_EventUserData_InWorkflow] DEFAULT ((0))
		   CONSTRAINT [CK_EventUserData_InWorkflow] CHECK ([InWorkflow] IN (0,1)),
	CONSTRAINT [PK_EventUserData] PRIMARY KEY CLUSTERED
	(
		[Username]
	),
	CONSTRAINT [IX_EventUserData_RowPointer] UNIQUE NONCLUSTERED
	(
		[RowPointer]
	)
	)
END
GO

EXEC dbo.SchemaAdditionalTasksSp N'EventUserData', N'EventUserData', NULL, N'Core'
GO

INSERT INTO EventUserData (Username, EventMessagesLastCheckedTime)
SELECT Username, EventMessagesLastCheckedTime
FROM Usernames
WHERE NOT EXISTS (SELECT 1
FROM EventUserData x
WHERE x.Username = Usernames.Username)

GO
