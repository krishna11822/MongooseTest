-- DefaultTypes:
-- =============================================================
-- RS #: MGD-2283 - Inbox Notification in Web Client
-- Add Check for New Message Interval (minutes) in DefaultTypes 
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 81)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc, DefaultRegEx) VALUES (81, N'Check for New Message Interval', '^[1-9]+[0-9]*$')