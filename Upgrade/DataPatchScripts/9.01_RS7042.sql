SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 50)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc)
VALUES (50, N'Enforce prefix from Access As')

