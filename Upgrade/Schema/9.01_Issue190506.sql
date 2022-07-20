-- Alter Column: Parameters (back to its original UDDT)
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[EventAction]'), N'IsUserTable') = 1
   AND EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[EventAction]')
      AND [name] = N'Parameters')
   ALTER TABLE [dbo].[EventAction] ALTER COLUMN
      [Parameters] [dbo].[EventActionParmListType] NULL

GO


