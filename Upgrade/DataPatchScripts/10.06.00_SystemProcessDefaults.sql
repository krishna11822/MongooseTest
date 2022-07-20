IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 70)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (70, N'MG Version')
