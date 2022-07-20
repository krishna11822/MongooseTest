IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'HashStateType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[HashStateType] FROM [varbinary](64) NULL
GO
