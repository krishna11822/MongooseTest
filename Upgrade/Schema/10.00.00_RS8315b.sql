--RS 8315 AppBuilder

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'EncodedImageType' )
   CREATE TYPE [dbo].[EncodedImageType] FROM NVARCHAR(MAX) NULL
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ABProjects')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'ABProjects'
                AND   COLUMN_NAME = 'PreviewImage')
BEGIN
   ALTER TABLE dbo.ABProjects
   ADD [PreviewImage] [EncodedImageType] NULL

   EXEC dbo.SchemaAdditionalTasksSp 'ABProjects', 'ABProjects', NULL, 'Core'
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ABRuntimeApps')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'ABRuntimeApps'
                AND   COLUMN_NAME = 'PreviewImage')
BEGIN
   ALTER TABLE dbo.ABRuntimeApps
   ADD [PreviewImage] [EncodedImageType] NULL

   EXEC dbo.SchemaAdditionalTasksSp 'ABRuntimeApps', 'ABRuntimeApps', NULL, 'Core'
END
