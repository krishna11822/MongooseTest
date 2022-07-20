IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExternalEntityCodeType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExternalEntityCodeType] FROM [nvarchar](64)  NULL


IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExternalEntityNameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExternalEntityNameType] FROM [nvarchar](128)  NULL


IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExternalEntityRoleNameType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[ExternalEntityRoleNameType] FROM [nvarchar](128)  NULL
GO

