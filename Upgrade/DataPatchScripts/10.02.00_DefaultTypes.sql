IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 67)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (67, N'Enable Remote Logging')
