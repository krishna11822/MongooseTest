SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'ClearServiceSessions')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'ClearServiceSessions', N'Core', 0, 0, 0, N'Clears out old service sessions.')
GO
