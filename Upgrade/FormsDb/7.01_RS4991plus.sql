--upgrade script for the changes in mongoose release 7.02 to formsdb

--rs4991

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[FormComponentDragDropEvents]') IS NULL
CREATE TABLE [dbo].[FormComponentDragDropEvents](
	[FormID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsDragFrom] [smallint] NOT NULL,
	[EventName] [nvarchar](50) NOT NULL,
	[DeviceID] [int] NOT NULL,
 CONSTRAINT [PK_FormComponentDragDropEvents] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC,
	[Name] ASC,
	[IsDragFrom] ASC,
	[EventName] ASC,
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[FormComponentDragDropEvents] ADD  CONSTRAINT [DF_FormComponentDragDropEvents_DeviceID]  DEFAULT ((-1)) FOR [DeviceID]

GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[PropertyDefaultDragDropEvents]') IS NULL
CREATE TABLE [dbo].[PropertyDefaultDragDropEvents](
	[PropertyName] [nvarchar](50) NOT NULL,
	[ScopeType] [smallint] NOT NULL,
	[ScopeName] [nvarchar](50) NOT NULL,
	[IsPropertyClassExtension] [smallint] NOT NULL,
	[IsDragFrom] [smallint] NOT NULL,
	[EventName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PropertyDefaultDragDropEvents] PRIMARY KEY CLUSTERED 
(
	[PropertyName] ASC,
	[ScopeType] ASC,
	[ScopeName] ASC,
	[IsPropertyClassExtension] ASC,
	[IsDragFrom] ASC,
	[EventName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--rs5436

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF OBJECT_ID('[dbo].[Images]') IS NULL
CREATE TABLE [dbo].[Images](
	[Filename] [nvarchar](250) NOT NULL,
	[ScopeType] [smallint] NOT NULL,
	[ScopeName] [nvarchar](50) NOT NULL,
	[Blob] [nvarchar](max) NULL,
	[LockedBy] [nvarchar](50) NULL,        
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED
(
	[Filename] ASC,
	[ScopeType] ASC,
	[ScopeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--rs5341

GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--DerivedFormOverrides
IF OBJECT_ID('[dbo].[DerivedFormOverrides]') IS NULL
CREATE TABLE [dbo].[DerivedFormOverrides](
	[FormID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL,
	[StandardOperations] [int] NULL,
	[HelpFileName] [nvarchar](max) NULL,
	[HelpContextID] [int] NULL,
	[Flags] [int] NULL,
	[PaneZeroSize] [nvarchar](20) NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
 CONSTRAINT [PK_DerivedFormOverrides01] PRIMARY KEY NONCLUSTERED 
(
	[FormID] ASC,
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
--DeviceTypes

IF OBJECT_ID('[dbo].[DeviceTypes]') IS NULL
BEGIN
CREATE TABLE [dbo].[DeviceTypes](
	[ID] [int] NOT NULL,
	[DeviceName] [nvarchar](50) NOT NULL,
	[MaxWidth] [int] NOT NULL,
	[MaxHeight] [int] NOT NULL,
	[UserAgentMatch] [nvarchar](100) NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DeviceTypes]  WITH CHECK ADD  CONSTRAINT [CK_DeviceTypesID] CHECK  (([ID]>(0)))

ALTER TABLE [dbo].[DeviceTypes] CHECK CONSTRAINT [CK_DeviceTypesID]
END


--FormComponents01

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FormComponents01]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DeviceID' 
   AND OBJECT_NAME(id) = N'FormComponents01')
ALTER TABLE [dbo].[FormComponents01]
  ADD [DeviceID] [int] NOT NULL CONSTRAINT DF_FormComponents01_DeviceType DEFAULT -1
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FormComponents01]') AND name = N'PK_FormComponents01')
ALTER TABLE [dbo].[FormComponents01] DROP CONSTRAINT [PK_FormComponents01]
GO

ALTER TABLE [dbo].[FormComponents01] ADD  CONSTRAINT [PK_FormComponents01] PRIMARY KEY NONCLUSTERED 
(
	[FormID] ASC,
	[Name] ASC,
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

--FormComponents02

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FormComponents02]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DeviceID' 
   AND OBJECT_NAME(id) = N'FormComponents02')
ALTER TABLE [dbo].[FormComponents02]
  ADD [DeviceID] [int] NOT NULL CONSTRAINT DF_FormComponents02_DeviceType DEFAULT -1
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FormComponents02]') AND name = N'PK_FormComponents02')
ALTER TABLE [dbo].[FormComponents02] DROP CONSTRAINT [PK_FormComponents02]
GO

ALTER TABLE [dbo].[FormComponents02] ADD  CONSTRAINT [PK_FormComponents02] PRIMARY KEY NONCLUSTERED 
(
	[FormID] ASC,
	[Name] ASC,
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


--Forms

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Forms]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'MasterDeviceID' 
   AND OBJECT_NAME(id) = N'Forms')
ALTER TABLE [dbo].Forms
  ADD [MasterDeviceID] [int] NOT NULL CONSTRAINT DF_Forms_MasterDeviceID DEFAULT 0
GO

IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Forms]') AND name = N'PK_Forms')
ALTER TABLE [dbo].[Forms] DROP CONSTRAINT [PK_Forms]
GO

ALTER TABLE [dbo].[Forms] ADD  CONSTRAINT [PK_Forms] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC,
	[MasterDeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FormComponents]'))
DROP VIEW [dbo].[FormComponents]
GO

CREATE VIEW [dbo].[FormComponents]
AS
SELECT   [dbo].[FormComponents01].*, [dbo].[FormComponents02].Format AS Format, 
               [dbo].[FormComponents02].FindFromSpec AS FindFromSpec, 
               [dbo].[FormComponents02].MaintainFromSpec AS MaintainFromSpec, 
               [dbo].[FormComponents02].MaxCharacters AS MaxCharacters, 
               [dbo].[FormComponents02].DefaultFrom AS DefaultFrom, 
               [dbo].[FormComponents02].MenuName AS MenuName, 
               [dbo].[FormComponents02].DataType AS DataType, 
               [dbo].[FormComponents02].ActiveXControlName AS ActiveXControlName, 
               [dbo].[FormComponents02].PropertyClassName AS PropertyClassName, 
               [dbo].[FormComponents02].Post301DataType AS Post301DataType, 
               [dbo].[FormComponents02].Post301Format AS Post301Format, 
               [dbo].[FormComponents02].Description AS Description, 
               [dbo].[FormComponents02].EffectiveCaption AS EffectiveCaption
FROM      [dbo].FormComponents01 INNER JOIN
               [dbo].[FormComponents02] ON 
               [dbo].[FormComponents01].FormID = [dbo].[FormComponents02].FormID AND
               [dbo].[FormComponents01].Name = [dbo].[FormComponents02].Name AND
               [dbo].[FormComponents01].DeviceID = [dbo].[FormComponents02].DeviceID


GO

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[FormComponentsUpd]'))
DROP TRIGGER [dbo].[FormComponentsUpd]
GO

CREATE TRIGGER [dbo].[FormComponentsUpd] ON [dbo].[FormComponents]
INSTEAD OF UPDATE
AS
UPDATE FormComponents01
SET TabOrder = ii.TabOrder
, Type = ii.Type
, TopPos = ii.TopPos
, LeftPos = ii.LeftPos
, Height = ii.Height
, ListHeight = ii.ListHeight
, Width = ii.Width
, Caption = ii.Caption
, Validators = ii.Validators
, ContainerName = ii.ContainerName
, ContainerSequence = ii.ContainerSequence
, DataSource = ii.DataSource
, Binding = ii.Binding
, EventToGenerate = ii.EventToGenerate
, SelectionEventToGenerate = ii.SelectionEventToGenerate
, LoseFocusEventToGenerate = ii.LoseFocusEventToGenerate
, GainFocusEventToGenerate = ii.GainFocusEventToGenerate
, RadioButtonSelectedValue = ii.RadioButtonSelectedValue
, ComboListSource = ii.ComboListSource
, Flags = ii.Flags
, DefaultData = ii.DefaultData
, ReadOnly = ii.ReadOnly
, Hidden = ii.Hidden
, BitmapFileName = ii.BitmapFileName
, HelpString = ii.HelpString
, HelpFileName = ii.HelpFileName
, HelpContextID = ii.HelpContextID
, DeviceID= ii.DeviceID
FROM FormComponents01 AS fc1
INNER JOIN inserted AS ii ON
  ii.FormID = fc1.FormID
AND ii.Name = fc1.Name
AND ii.DeviceID = fc1.DeviceID

UPDATE FormComponents02
SET TabOrder = ii.TabOrder
, Format = ii.Format
, FindFromSpec = ii.FindFromSpec
, MaintainFromSpec = ii.MaintainFromSpec
, MaxCharacters = ii.MaxCharacters
, DefaultFrom = ii.DefaultFrom
, MenuName = ii.MenuName
, DataType = ii.DataType
, ActiveXControlName = ii.ActiveXControlName
, PropertyClassName = ii.PropertyClassName
, Post301DataType = ii.Post301DataType
, Post301Format = ii.Post301Format
, Description = ii.Description
, EffectiveCaption = ii.EffectiveCaption
, DeviceID= ii.DeviceID
FROM FormComponents02 AS fc2
INNER JOIN inserted AS ii ON
  ii.FormID = fc2.FormID
AND ii.Name = fc2.Name
AND ii.DeviceID = fc2.DeviceID
RETURN
GO


IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[FormComponentsDel]'))
DROP TRIGGER [dbo].[FormComponentsDel]
GO

CREATE TRIGGER [dbo].[FormComponentsDel] ON [dbo].[FormComponents]
INSTEAD OF DELETE
AS
DELETE fc01
FROM FormComponents01 AS fc01
INNER JOIN deleted AS dd ON
  dd.FormID = fc01.FormID
AND dd.Name = fc01.Name
AND dd.DeviceID = fc01.DeviceID

DELETE fc02
FROM FormComponents02 AS fc02
INNER JOIN deleted AS dd ON
  dd.FormID = fc02.FormID
AND dd.Name = fc02.Name
AND dd.DeviceID = fc02.DeviceID

RETURN
GO

IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[FormComponentsIns]'))
DROP TRIGGER [dbo].[FormComponentsIns]
GO

CREATE TRIGGER [dbo].[FormComponentsIns] ON [dbo].[FormComponents]
INSTEAD OF INSERT
AS
INSERT INTO FormComponents01 (
  FormID
, Name
, TabOrder
, Type
, TopPos
, LeftPos
, Height
, ListHeight
, Width
, Caption
, Validators
, ContainerName
, ContainerSequence
, DataSource
, Binding
, EventToGenerate
, SelectionEventToGenerate
, LoseFocusEventToGenerate
, GainFocusEventToGenerate
, RadioButtonSelectedValue
, ComboListSource
, Flags
, DefaultData
, ReadOnly
, Hidden
, BitmapFileName
, HelpString
, HelpFileName
, HelpContextID
, DeviceID
) SELECT
  FormID
, Name
, TabOrder
, Type
, TopPos
, LeftPos
, Height
, ListHeight
, Width
, Caption
, Validators
, ContainerName
, ContainerSequence
, DataSource
, Binding
, EventToGenerate
, SelectionEventToGenerate
, LoseFocusEventToGenerate
, GainFocusEventToGenerate
, RadioButtonSelectedValue
, ComboListSource
, Flags
, DefaultData
, ReadOnly
, Hidden
, BitmapFileName
, HelpString
, HelpFileName
, HelpContextID
, ISNULL(DeviceID,-1)
FROM inserted

INSERT INTO FormComponents02 (
  FormID
, Name
, TabOrder
, Format
, FindFromSpec
, MaintainFromSpec
, MaxCharacters
, DefaultFrom
, MenuName
, DataType
, ActiveXControlName
, PropertyClassName
, Post301DataType
, Post301Format
, Description
, EffectiveCaption
, DeviceID
) SELECT
  FormID
, Name
, TabOrder
, Format
, FindFromSpec
, MaintainFromSpec
, MaxCharacters
, DefaultFrom
, MenuName
, DataType
, ActiveXControlName
, PropertyClassName
, Post301DataType
, Post301Format
, Description
, EffectiveCaption
, ISNULL(DeviceID,-1)
FROM inserted

RETURN
GO

-- =============================================================
--  Forms DB Upgrade Script (RS 5438):
-- =============================================================
DECLARE @statExists AS BIT

--  Forms:
SET @statExists = 0
IF EXISTS ( SELECT [name] FROM [sys].[stats]
            WHERE [name] = N'IconFileName' AND
                  [OBJECT_ID] = OBJECT_ID( N'Forms' ) )
BEGIN
   SET @statExists = 1
   DROP STATISTICS [dbo].[Forms].[IconFileName]
END


IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Forms]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns]
   WHERE [syscolumns].[id] = OBJECT_ID('dbo.Forms')
   AND [syscolumns].[name] = N'IconFileName')
ALTER TABLE [dbo].[Forms]
   ALTER COLUMN [IconFileName] nvarchar(max) NULL

IF @statExists = 1
BEGIN
   CREATE STATISTICS [IconFileName]
   ON [dbo].[Forms]([IconFileName])
END

--  FormComponents02:
SET @statExists = 0
IF EXISTS ( SELECT [name] FROM [sys].[stats]
            WHERE [name] = N'Post301Format' AND
                  [OBJECT_ID] = OBJECT_ID( N'FormComponents02' ) )
BEGIN
   SET @statExists = 1
   DROP STATISTICS [dbo].[FormComponents02].[Post301Format]
END

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[FormComponents02]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns]
   WHERE [syscolumns].[id] = OBJECT_ID('dbo.FormComponents02')
   AND [syscolumns].[name] = N'Post301Format')
ALTER TABLE [dbo].[FormComponents02]
   ALTER COLUMN [Post301Format] nvarchar(max) NULL

IF @statExists = 1
BEGIN
   CREATE STATISTICS [Post301Format]
   ON [dbo].[FormComponents02]([Post301Format])
END

--  PropertyDefaults02:
SET @statExists = 0
IF EXISTS ( SELECT [name] FROM [sys].[stats]
            WHERE [name] = N'Post301Format' AND
                  [OBJECT_ID] = OBJECT_ID( N'PropertyDefaults02' ) )
BEGIN
   SET @statExists = 1
   DROP STATISTICS [dbo].[PropertyDefaults02].[Post301Format]
END

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyDefaults02]'), N'IsUserTable') = 1
   AND EXISTS (
   SELECT 1 FROM [dbo].[syscolumns]
   WHERE [syscolumns].[id] = OBJECT_ID('dbo.PropertyDefaults02')
   AND [syscolumns].[name] = N'Post301Format')
ALTER TABLE [dbo].[PropertyDefaults02]
   ALTER COLUMN [Post301Format] nvarchar(max) NULL

IF @statExists = 1
BEGIN
   CREATE STATISTICS [Post301Format]
   ON [dbo].[PropertyDefaults02]([Post301Format])
END

