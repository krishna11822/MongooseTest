-- Issue 123332 "Event IdoPostUpdateCollection is not listed"
-- Safely insert the possibly missing Event row:

IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'IdoPostUpdateCollection')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'IdoPostUpdateCollection', N'Core', 1, 1, 0, N'Occurs after an IDO updates a collection')

