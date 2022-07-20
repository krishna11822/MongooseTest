SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'PurgeHistoryData')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'PurgeHistoryData', N'Core', 0, 0, 0, N'Execute Purge History Data module.')
GO
