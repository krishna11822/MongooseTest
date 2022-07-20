IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES
          WHERE TABLE_SCHEMA = N'dbo'
          AND TABLE_NAME = N'EventActionState')
AND NOT EXISTS (SELECT 1 FROM sys.indexes 
               WHERE object_id = OBJECT_ID(N'[dbo].[EventActionState]') 
               AND name = N'IX_EventActionStatePath')
   CREATE INDEX [IX_EventActionStatePath] ON [EventActionState]([PathToWatch])
     INCLUDE(LastWatchedDate)
  ON [PRIMARY]
GO

