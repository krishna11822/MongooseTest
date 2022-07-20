IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'IdoOnPersistFailed')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'IdoOnPersistFailed', N'Core', 1, 1, 0, N'Occurs when an IDO update request fails')

IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'SessionOnLoginFailed')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'SessionOnLoginFailed', N'Core', 1, 0, 0, N'Occurs when a login attempt fails')

