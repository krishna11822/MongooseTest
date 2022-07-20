--create UDDTs 
IF NOT EXISTS (SELECT 1 FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id 
   WHERE st.name = N'JSONStringType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[JSONStringType] FROM [nvarchar](max) NULL
GO

--For FileServer Table
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FileServer]'), N'IsUserTable') = 1
   AND NOT EXISTS (SELECT 1 FROM [sys].[columns]
      WHERE [object_id] = OBJECT_ID(N'[dbo].[FileServer]')
      AND [name] = N'FileServerAdditionalProperties')
   ALTER TABLE [dbo].[FileServer] ADD
      [FileServerAdditionalProperties] [dbo].[JSONStringType] NULL
GO