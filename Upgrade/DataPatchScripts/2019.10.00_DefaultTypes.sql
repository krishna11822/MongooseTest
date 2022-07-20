IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 74)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (74, N'Outbound SUM Role LID Override')
