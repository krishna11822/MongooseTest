-- Drop primary key
IF EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'PK_EventTrigger_mst'
   AND [type] = 'PK'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[EventTrigger_mst]'))
   ALTER TABLE [dbo].[EventTrigger_mst] DROP CONSTRAINT [PK_EventTrigger_mst]
GO

-- Add Column: EventTriggerId
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger_mst]'), N'IsUserTable') = 1 
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns] 
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventTrigger_mst]') 
      AND [name] = N'EventTriggerId') 
   ALTER TABLE [dbo].[EventTrigger_mst] ADD 
      [EventTriggerId] [dbo].[RowPointerType] NOT NULL	
      CONSTRAINT [DF_EventTrigger_mst_EventTriggerId] DEFAULT (newid())  
GO
	   
-- Update any existing rows, set EventTriggerId = Rowpointer then regenerate RowPointer
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'IX_EventTrigger_mst_RowPointer'
   AND [type] = 'UQ'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[EventTrigger_mst]'))
   BEGIN
   UPDATE EventTrigger_mst SET EventTriggerId = RowPointer
   UPDATE EventTrigger_mst SET RowPointer = NEWID()
   END
GO

-- Add new primary key
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger_mst]'), N'IsUserTable') = 1
ALTER TABLE [dbo].[EventTrigger_mst] ADD
   CONSTRAINT [PK_EventTrigger_mst] PRIMARY KEY NONCLUSTERED
   (
        [EventTriggerId]
      , [SiteRef]
   ) WITH FILLFACTOR = 90 
GO

-- Add new RowPointer key
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventTrigger_mst]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[objects]
   WHERE [name] = N'IX_EventTrigger_mst_RowPointer'
   AND [type] = 'UQ'
   AND [parent_object_id] = OBJECT_ID(N'[dbo].[EventTrigger_mst]'))
   ALTER TABLE [dbo].[EventTrigger_mst] ADD
      CONSTRAINT [IX_EventTrigger_mst_RowPointer] UNIQUE NONCLUSTERED
      (
         [RowPointer]
       , [SiteRef]
      ) WITH FILLFACTOR = 90
GO