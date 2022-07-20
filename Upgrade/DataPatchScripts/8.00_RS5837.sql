-- =============================================================
--  RS 5837- AESInboundBOD
--  Notes:   BodOnReceive event occures in response to reception of any inbound BOD
-- =============================================================
IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'BodOnReceive')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'BodOnReceive', N'Core', 1, 0, 0, N'Occurs when any inbound BOD is received')
GO