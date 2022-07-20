IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[COR_INBOX_ENTRY]') AND name = N'IX_COR_INBOX_ENTRY_CreateDate_RecordDate')
   CREATE NONCLUSTERED INDEX [IX_COR_INBOX_ENTRY_CreateDate_RecordDate]
                       ON [dbo].[COR_INBOX_ENTRY]
                          ( [C_WAS_PROCESSED] ASC
                          , [CreateDate]      ASC
                          , [RecordDate]      ASC )
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EventState]') AND name = N'IX_EventState_FinishDate_BeginDate')
   CREATE NONCLUSTERED INDEX [IX_EventState_FinishDate_BeginDate]
                       ON [dbo].[EventState]
                          ( [FinishDate] ASC
                          , [BeginDate]  ASC )
GO
