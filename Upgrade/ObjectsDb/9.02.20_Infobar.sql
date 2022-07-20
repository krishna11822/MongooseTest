IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Infobar' AND ss.name = N'dbo')
CREATE TYPE [dbo].[Infobar] FROM [nvarchar](2800) NULL
GO
