SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Properties table upgrade script
-- Steps:
-- 1. Drop EnvironmentId column
-- 2. Drop old columns
-- 3. Convert varchar columns to nvarchar and increase size of PropertyValue column
-- 4. Rebuild constraints
-- 5. Add new columns including new system columns
-- 6. Run update queries to set new column values based on the values in PropertyClassAttrs
-- 7. Drop the AttributeSetId column
--
-- Notes:
-- 1. CaseFormat (U,L,M) - Upper, Lower, Mixed
-- 2. JustifyFormat (L,C,R) - Left, Center, Right
-- 3. DateFormat (D,T,B) - Date, Time, Both
-- 4. BinaryDataFormat (BMP,ICO)
--
-- TODO: Add a Sequence column to allow for non-alphabetical ordering of IDO properties.
--       The WinStudio new form wizard will use this for its default ordering.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_Properties.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    E N V I R O N M E N T I D **/
-- Drop the primary key constraint.
ALTER TABLE [dbo].[Properties] DROP CONSTRAINT [PK_Properties]
GO
-- Drop the EnvironmentId column.
-- ALTER TABLE [dbo].[Properties] DROP COLUMN [EnvironmentId]
EXEC UpgradeDropColumn N'Properties', N'EnvironmentId'
GO

/** D R O P    C O L U M N S **/
ALTER TABLE [dbo].[Properties] DROP
  COLUMN [PropertyValueExt]
, COLUMN [DataType]
, COLUMN [PropertyLength]
, COLUMN [UserDataType]
, COLUMN [RequiredFlag]
, COLUMN [ReadOnlyRecordFlag]
, COLUMN [ReadOnlyFlag]
, COLUMN [UpperCaseFlag]
, COLUMN [NullableFlag]
, COLUMN [NumericFlag]
, COLUMN [GuidFlag]
GO

/** N V A R C H A R    C O N V E R S I O N **/
ALTER TABLE [dbo].[Properties] ALTER COLUMN [CollectionName]    [nvarchar](80)   NOT NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [PropertyName]      [nvarchar](80)   NOT NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [PropertyDesc]      [nvarchar](255)  NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [PropertyClass]     [nvarchar](80)   NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [ColumnName]        [nvarchar](80)   NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [SubCollectionName] [nvarchar](80)   NULL
ALTER TABLE [dbo].[Properties] ALTER COLUMN [PropertyValue]     [nvarchar](2000) NULL
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[Properties] WITH NOCHECK ADD
  CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED
  (
      [CollectionName]
    , [PropertyName]
    , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[Properties] ADD
  [Sequence]             [smallint]         NOT NULL CONSTRAINT [DF_Properties_Sequence] DEFAULT (0)
, [BinaryDataFormat]     [nvarchar](30)     NULL
, [BoolFalseValue]       [nvarchar](30)     NULL
, [BoolTrueValue]        [nvarchar](30)     NULL
, [CaseFormat]           [nvarchar](10)     NULL
, [ColumnDataType]       [nvarchar](80)     NULL
, [DataDecimalPos]       [int]              NULL
, [DataLength]           [int]              NULL
, [DataType]             [nvarchar](80)     NULL
, [DateFormat]           [nvarchar](30)     NULL
, [DefaultIMECharset]    [nvarchar](30)     NULL
, [DefaultValue]         [nvarchar](80)     NULL
, [DisplayDecimalPos]    [int]              NULL
, [DomainIDOName]        [nvarchar](80)     NULL
, [DomainListProperties] [nvarchar](500)    NULL
, [DomainProperty]       [nvarchar](80)     NULL
, [InputMask]            [nvarchar](50)     NULL
, [InputMaskPrompt]      [nvarchar](50)     NULL
, [IsHTML]               [smallint]         NULL
, [IsReadOnly]           [smallint]         NULL
, [IsRequired]           [smallint]         NULL
, [IsRORecordFlag]       [smallint]         NULL
, [JustifyFormat]        [nvarchar](10)     NULL
, [LabelStringID]        [nvarchar](50)     NULL
, [InWorkflow]           [FlagNyType]       NOT NULL CONSTRAINT [DF_Properties_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]       [FlagNyType]       NOT NULL CONSTRAINT [DF_Properties_NoteExistsFlag] DEFAULT (0)
, [RecordDate]           [CurrentDateType]  NOT NULL CONSTRAINT [DF_Properties_RecordDate] DEFAULT (getdate())
, [RowPointer]           [RowPointerType]   NOT NULL CONSTRAINT [DF_Properties_RowPointer] DEFAULT (newid())
, [CreatedBy]            [UsernameType]     NOT NULL CONSTRAINT [DF_Properties_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]            [UsernameType]     NOT NULL CONSTRAINT [DF_Properties_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]           [CurrentDateType]  NOT NULL CONSTRAINT [DF_Properties_CreateDate] DEFAULT (getdate())
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[Properties] WITH NOCHECK ADD
  CONSTRAINT [IX_Properties_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO

/** U P D A T E    A T T R S **/
-- Update table based on data from PropertyClassAttrs table.
UPDATE p
SET p.[DataType] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DataType'
GO
UPDATE p
SET p.[DataLength] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DataLength'
GO
UPDATE p
SET p.[DataDecimalPos] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DataDecimalPos'
GO
UPDATE p
SET p.[DefaultValue] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DefaultValue'
GO
UPDATE p
SET p.[ColumnDataType] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'ColumnDataType'
GO
UPDATE p
SET p.[IsRequired] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'IsRequired'
GO
UPDATE p
SET p.[IsRORecordFlag] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'IsRORecordFlag'
GO
-- Strip off the prefix and return only the IDO name to the right of the period.
UPDATE p
SET p.[DomainIDOName] = RIGHT(a.AttrValue, LEN(a.AttrValue) - CHARINDEX('.', a.AttrValue))
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DomainIDOName'
GO
UPDATE p
SET p.[DomainProperty] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DomainProperty'
GO
UPDATE p
SET p.[DomainListProperties] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DomainListProperties'
GO
UPDATE p
SET p.[BoolTrueValue] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'BoolTrueValue'
GO
UPDATE p
SET p.[BoolFalseValue] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'BoolFalseValue'
GO
UPDATE p
SET p.[LabelStringID] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'LabelStringID'
GO
UPDATE p
SET p.[InputMask] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'InputMask'
GO
UPDATE p
SET p.[InputMaskPrompt] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'InputMaskPrompt'
GO
UPDATE p
SET p.[JustifyFormat] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'JustifyFormat'
GO
UPDATE p
SET p.[DateFormat] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DateFormat'
GO
UPDATE p
SET p.[BinaryDataFormat] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'BinaryDataFormat'
GO
UPDATE p
SET p.[DefaultIMECharset] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DefaultIMECharset'
GO
UPDATE p
SET p.[IsReadOnly] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'IsReadOnly'
GO
UPDATE p
SET p.[CaseFormat] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'CaseFormat'
GO
UPDATE p
SET p.[IsHTML] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'IsHTML'
GO
UPDATE p
SET p.[DisplayDecimalPos] = a.AttrValue
FROM [dbo].[Properties] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = p.DevelopmentFlag
WHERE a.AttrName = 'DisplayDecimalPos'
GO

/** D R O P    A T T R I B U T E S E T I D **/
-- Drop the AttributeSetId column.
-- ALTER TABLE [dbo].[Properties] DROP COLUMN [AttributeSetId]
EXEC UpgradeDropColumn N'Properties', N'AttributeSetId'
GO
