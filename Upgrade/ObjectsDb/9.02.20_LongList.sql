IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'LongList' AND ss.name = N'dbo')
CREATE TYPE [dbo].[LongList] FROM [nvarchar](4000) NULL
GO
