-- Issue #246175 - remove deadlock retries default
DELETE SystemProcessDefaults
WHERE DefaultType = 25
DELETE DefaultTypes
WHERE DefaultType = 25
GO
