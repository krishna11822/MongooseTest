-----==UserPreferences(Modify TBL)==-----

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'MSDevEnvVersionIdType' AND ss.name = N'dbo')
CREATE TYPE [dbo].[MSDevEnvVersionIdType] FROM [nvarchar](12) NULL

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'UserPreferences'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'UserPreferences'
                AND   COLUMN_NAME IN (N'VSDownloadVersion'))
BEGIN
   ALTER TABLE [dbo].[UserPreferences]
   ADD
     [VSDownloadVersion] MSDevEnvVersionIdType NULL
END
GO
