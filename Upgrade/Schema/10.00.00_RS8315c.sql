--RS 8315 AppBuilder

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ABTags'
           AND   CONSTRAINT_NAME = 'PK_ABTags')
BEGIN
   ALTER TABLE dbo.ABTags
   DROP CONSTRAINT PK_ABTags
END

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_SCHEMA = 'dbo'
           AND   TABLE_NAME = 'ABTags')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'dbo'
                AND   TABLE_NAME = 'ABTags'
                AND   COLUMN_NAME = 'Runtime')
BEGIN
   ALTER TABLE dbo.ABTags
   ADD [Runtime] [ListYesNoType] NOT NULL CONSTRAINT [DF_ABTags_Runtime] DEFAULT(0)

   ALTER TABLE dbo.ABTags
   ADD CONSTRAINT PK_ABTags PRIMARY KEY CLUSTERED 
   (
     [ProjectId] ASC
   , [Id] ASC
   , [Runtime] ASC
   ) ON [PRIMARY]

   EXEC dbo.SchemaAdditionalTasksSp 'ABTags', 'ABTags', NULL, 'Core'
END
