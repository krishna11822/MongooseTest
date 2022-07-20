
-- RS-8322
-- Add flag column signifying there is a 'delete' scheduled for this UserId
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[UserModules]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[UserModules]')
      AND [name] = N'DeleteRequested')
BEGIN
   ALTER TABLE [dbo].[UserModules] ADD
      [DeleteRequested] [dbo].[FlagNyType] NULL
END
