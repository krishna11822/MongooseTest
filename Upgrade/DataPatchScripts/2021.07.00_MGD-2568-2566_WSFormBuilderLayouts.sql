
--MGD-2568
UPDATE  WSFormBuilderLayouts
SET LayoutType = 0
WHERE 
LayoutType IS NULL AND 
FormType = 'Widget' AND 
LayoutName in ('Graph','List','ListWithIcons','WidgetInput')
GO

UPDATE  WSFormBuilderLayouts
SET LayoutType = 0
WHERE 
LayoutType IS NULL AND 
FormType = 'FullForm' AND 
LayoutName in ('Responsive','FormWithGrid')

GO

---MGD-2566
UPDATE WSFormBuilderLayouts
SET MasterFormName = 'WSFormBuilderTemplateWidgetGridSearch'
WHERE  LayoutName = 'Grid with Search' AND
MasterFormName = 'WSFormBuilderWidGridSearchTemplate' 

