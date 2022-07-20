IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessageVariable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventMessageVariable]')
      AND [name] = N'IsModifiedPayloadProperty')
   ALTER TABLE [dbo].[EventMessageVariable] ADD
      [IsModifiedPayloadProperty] [dbo].[ListYesNoType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessage]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventMessage]')
      AND [name] = N'EventActionRowPointer')
   ALTER TABLE [dbo].[EventMessage] ADD
      [EventActionRowPointer] [dbo].[RowPointerType] NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventAction]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventAction]')
      AND [name] = N'PayloadAccess')
   ALTER TABLE [dbo].[EventAction] ADD
	   [PayloadAccess] [dbo].[EventVariableAccessType] NULL,
	   [ModifiedPayloadAccess] [dbo].[EventVariableAccessType] NULL,
	   [UnmodifiedPayloadAccess] [dbo].[EventVariableAccessType] NULL
GO


