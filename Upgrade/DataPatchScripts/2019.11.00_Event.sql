
IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'LazyDeleteLicenseModuleExecute')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'LazyDeleteLicenseModuleExecute', N'Core', 0, 0, 0, N'Execute the user-modules lazy delete.')
