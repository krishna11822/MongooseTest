IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 72)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (72, N'Unprocessed Task Timeout (ms)')
