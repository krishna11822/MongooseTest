IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventMessageVariable]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventMessageVariable]')
      AND [name] = N'IsBinaryProperty')
   ALTER TABLE [dbo].[EventMessageVariable] ADD
      [IsBinaryProperty] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_EventMessageVariable_IsBinaryProperty] DEFAULT ((0))
GO
