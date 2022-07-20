SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- PropertyClasses table upgrade script
-- Steps:
-- 1. Drop old columns
-- 2. Add new columns including new system columns
-- 3. Run update queries to set new column values based on the values in PropertyClassAttrs
-- 4. Drop the AttributeSetId column
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_PropertyClasses.sql 1     11/18/13 1:45p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    C O L U M N S **/
ALTER TABLE [dbo].[PropertyClasses] DROP
  COLUMN [RowTimeStamp]
, COLUMN [RootClassName]
GO

/** A D D    C O L U M N S **/
ALTER TABLE [dbo].[PropertyClasses] ADD
  [LockBy]               [nvarchar](80)     NULL
, [RevisionNo]           [int]              NOT NULL CONSTRAINT [DF_PropClass_RevisionNo] DEFAULT (1)
, [RevisionDate]         [datetime]         NOT NULL CONSTRAINT [DF_PropClass_RevisionDate] DEFAULT (getdate())
, [DevelopmentFlag]      [int]              NOT NULL CONSTRAINT [DF_PropClass_DevFlag] DEFAULT (0)
, [AccessAs]             [nvarchar](50)     NULL
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
, [InWorkflow]           [FlagNyType]       NOT NULL CONSTRAINT [DF_PropClass_InWorkflow] DEFAULT (0)
, [NoteExistsFlag]       [FlagNyType]       NOT NULL CONSTRAINT [DF_PropClass_NoteExistsFlag] DEFAULT (0)
, [RecordDate]           [CurrentDateType]  NOT NULL CONSTRAINT [DF_PropClass_RecordDate] DEFAULT (getdate())
, [RowPointer]           [RowPointerType]   NOT NULL CONSTRAINT [DF_PropClass_RowPointer] DEFAULT (newid())
, [CreatedBy]            [UsernameType]     NOT NULL CONSTRAINT [DF_PropClass_CreatedBy] DEFAULT (suser_sname())
, [UpdatedBy]            [UsernameType]     NOT NULL CONSTRAINT [DF_PropClass_UpdatedBy] DEFAULT (suser_sname())
, [CreateDate]           [CurrentDateType]  NOT NULL CONSTRAINT [DF_PropClass_CreateDate] DEFAULT (getdate())
GO

/** D R O P    C O N S T R A I N T S **/
-- Drop the primary key constraint.
ALTER TABLE [dbo].[PropertyClasses] DROP CONSTRAINT [PK_PropertyClasses]
GO

/** N V A R C H A R    C O N V E R S I O N **/
-- ALTER TABLE [dbo].[PropertyClasses] ALTER COLUMN [ClassName] [nvarchar](80)  NOT NULL
EXEC UpgradeAlterColumn N'PropertyClasses', N'ClassName', N'[nvarchar](80)  NOT NULL'
-- ALTER TABLE [dbo].[PropertyClasses] ALTER COLUMN [ParentClassName] [nvarchar](80)  NULL
EXEC UpgradeAlterColumn N'PropertyClasses', N'ParentClassName', N'[nvarchar](80)  NULL'
-- ALTER TABLE [dbo].[PropertyClasses] ALTER COLUMN [Description] [nvarchar](255) NULL
EXEC UpgradeAlterColumn N'PropertyClasses', N'Description', N'[nvarchar](255)  NULL'
GO

/** R E B U I L D    C O N S T R A I N T S **/
-- Re-create the primary key constraint.
ALTER TABLE [dbo].[PropertyClasses] WITH NOCHECK ADD
  CONSTRAINT [PK_PropertyClasses] PRIMARY KEY CLUSTERED
  (
    [ClassName]
  , [DevelopmentFlag]
  ) WITH FILLFACTOR = 90 ON [PRIMARY]
GO

/** R O W P O I N T E R    C O N S T R A I N T **/
-- Create a unique constraint on RowPointer.
ALTER TABLE [dbo].[PropertyClasses] WITH NOCHECK ADD
  CONSTRAINT [IX_PropertyClasses_RowPointer] UNIQUE NONCLUSTERED
  (
    [RowPointer]
  ) ON [PRIMARY]
GO

/** U P D A T E    A T T R S **/
-- Update table based on data from PropertyClassAttrs table.
UPDATE p
SET p.[DataType] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DataType'
GO
UPDATE p
SET p.[DataLength] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DataLength'
GO
UPDATE p
SET p.[DataDecimalPos] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DataDecimalPos'
GO
UPDATE p
SET p.[DefaultValue] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DefaultValue'
GO
UPDATE p
SET p.[ColumnDataType] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'ColumnDataType'
GO
UPDATE p
SET p.[IsRequired] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'IsRequired'
GO
UPDATE p
SET p.[IsRORecordFlag] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'IsRORecordFlag'
GO
-- Strip off the prefix and return only the IDO name to the right of the period.
UPDATE p
SET p.[DomainIDOName] = RIGHT(a.AttrValue, LEN(a.AttrValue) - CHARINDEX('.', a.AttrValue))
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DomainIDOName'
GO
UPDATE p
SET p.[DomainProperty] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DomainProperty'
GO
UPDATE p
SET p.[DomainListProperties] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DomainListProperties'
GO
UPDATE p
SET p.[BoolTrueValue] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'BoolTrueValue'
GO
UPDATE p
SET p.[BoolFalseValue] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'BoolFalseValue'
GO
UPDATE p
SET p.[LabelStringID] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'LabelStringID'
GO
UPDATE p
SET p.[InputMask] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'InputMask'
GO
UPDATE p
SET p.[InputMaskPrompt] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'InputMaskPrompt'
GO
UPDATE p
SET p.[JustifyFormat] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'JustifyFormat'
GO
UPDATE p
SET p.[DateFormat] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DateFormat'
GO
UPDATE p
SET p.[BinaryDataFormat] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'BinaryDataFormat'
GO
UPDATE p
SET p.[DefaultIMECharset] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DefaultIMECharset'
GO
UPDATE p
SET p.[IsReadOnly] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'IsReadOnly'
GO
UPDATE p
SET p.[CaseFormat] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'CaseFormat'
GO
UPDATE p
SET p.[IsHTML] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'IsHTML'
GO
UPDATE p
SET p.[DisplayDecimalPos] = a.AttrValue
FROM [dbo].[PropertyClasses] p
INNER JOIN [dbo].[PropertyClassAttrs] a ON p.AttributeSetId = a.AttributeSetId AND a.DevelopmentFlag = 0
WHERE a.AttrName = 'DisplayDecimalPos'
GO

/** D R O P    A T T R I B U T E S E T I D **/
-- Drop the AttributeSetId column.
-- ALTER TABLE [dbo].[PropertyClasses] DROP COLUMN [AttributeSetId]
EXEC UpgradeDropColumn N'PropertyClasses', N'AttributeSetId'
GO
