-- =============================================================
--  Forms DB Upgrade Script (RS 6539):
--      - FlexLayout
-- =============================================================

-- ======================================
-- FormComponents02.LayoutAttributes:
-- ======================================
IF NOT EXISTS( SELECT 1 FROM [dbo].[syscolumns] WHERE [name] = N'LayoutAttributes' AND [id] = OBJECT_ID( N'[dbo].[FormComponents02]' ) )
    ALTER TABLE [dbo].[FormComponents02] ADD LayoutAttributes nvarchar(MAX) NULL
GO

-- ======================================
-- FormComponents (View):
-- ======================================
IF OBJECT_ID('dbo.FormComponents') IS NOT NULL
   DROP VIEW dbo.FormComponents
GO

CREATE VIEW [dbo].[FormComponents]
AS
SELECT  [dbo].[FormComponents01].*,
        [dbo].[FormComponents02].Format AS Format, 
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
        [dbo].[FormComponents02].EffectiveCaption AS EffectiveCaption,
        [dbo].[FormComponents02].LayoutAttributes AS LayoutAttributes
FROM    [dbo].FormComponents01 INNER JOIN
        [dbo].[FormComponents02] ON 
        [dbo].[FormComponents01].FormID = [dbo].[FormComponents02].FormID AND
        [dbo].[FormComponents01].Name = [dbo].[FormComponents02].Name AND
        [dbo].[FormComponents01].DeviceID = [dbo].[FormComponents02].DeviceID
GO

-- ======================================
-- FormComponents (FormComponentsDel):
-- ======================================
IF OBJECT_ID('dbo.FormComponentsDel') IS NOT NULL
    DROP TRIGGER dbo.FormComponentsDel
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

-- ======================================
-- FormComponents (FormComponentsIns):
-- ======================================
IF OBJECT_ID('dbo.FormComponentsIns') IS NOT NULL
    DROP TRIGGER dbo.FormComponentsIns
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
, LayoutAttributes
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
, LayoutAttributes
FROM inserted

RETURN
GO

-- ======================================
-- FormComponents (FormComponentsUpd):
-- ======================================
IF OBJECT_ID('dbo.FormComponentsUpd') IS NOT NULL
    DROP TRIGGER dbo.FormComponentsUpd
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
, LayoutAttributes = ii.LayoutAttributes
FROM FormComponents02 AS fc2
INNER JOIN inserted AS ii ON
  ii.FormID = fc2.FormID
AND ii.Name = fc2.Name
AND ii.DeviceID = fc2.DeviceID

RETURN
GO