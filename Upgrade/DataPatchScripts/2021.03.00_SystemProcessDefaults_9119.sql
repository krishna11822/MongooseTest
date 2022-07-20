IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 80)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (80, N'Report Batch Size')
