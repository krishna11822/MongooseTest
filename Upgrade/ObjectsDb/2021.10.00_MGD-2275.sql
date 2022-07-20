SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
-- dbo.ObjPropertyClasses.PropertyValue
--
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ObjPropertyClasses'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ObjPropertyClasses'
                AND   COLUMN_NAME = N'PropertyValue')
BEGIN
   ALTER TABLE dbo.ObjPropertyClasses 
      ADD PropertyValue nvarchar(MAX) NULL
END
GO

--
-- dbo.ObjProperties.PropertyValueArguments
--
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ObjProperties'
           AND TABLE_TYPE = 'BASE TABLE')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ObjProperties'
                AND   COLUMN_NAME = N'PropertyValueArguments')
BEGIN
   ALTER TABLE dbo.ObjProperties 
      ADD PropertyValueArguments nvarchar(MAX) NULL 
END
GO

--
-- dbo.ObjProperties.PropertyValue
--
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'ObjProperties'
           AND TABLE_TYPE = 'BASE TABLE')
AND EXISTS (SELECT 1 FROM [sys].[columns] syscol
            WHERE [syscol].[object_id] = OBJECT_ID(N'[dbo].[ObjProperties]')
            AND   [syscol].[system_type_id] = 231 -- nvarchar
            AND   [syscol].[max_length] = 4000    -- nvarchar(2000)
            AND   [syscol].[name] = N'PropertyValue')
BEGIN
   ALTER TABLE [dbo].[ObjProperties]
      ALTER COLUMN [PropertyValue] nvarchar(MAX) NULL
END
GO