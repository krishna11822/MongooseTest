 
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'FullForm' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'FullForm' AND CategoryName = 'FormBuilder'
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Widget' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'Widget' AND CategoryName = 'FormBuilder'
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'FormBuilder' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'FormBuilder' AND CategoryName = 'FormBuilder'
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'ResponsiveForm' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'ResponsiveForm' AND CategoryName = 'FormBuilder'

INSERT INTO [WSFormWizards] ([WizardName] ,[CategoryName] ,[Description] ,[FormName],[AccessAs],[ImageName],[IsRuntimeBuilder])
VALUES( 'ResponsiveForm' ,'FormBuilder', 'mWizardCategory_FormBuilder', 'WSRuntimeWizardFormBuilder','Core','nfw.svg' , 1)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'DataMaintenance' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'DataMaintenance' AND CategoryName = 'FormBuilder'

INSERT INTO [WSFormWizards] ([WizardName] ,[CategoryName] ,[Description] ,[FormName],[AccessAs],[ImageName],[IsRuntimeBuilder])
VALUES( 'DataMaintenance' ,'FormBuilder', 'mWizard_NewDataMaintenance', 'WSFormBuilderNewDataMaintenance','Core','ndmw_maintenance.svg' , 1)

GO

-----------------------------------------RS9122 - Form Builder Wizard Phase 2-----------------------------------------
 
 IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Grid'
,'Widget'
,'mWidgetGrid'
,'WSFormBuilderTemplateWidgetGrid'
,'WSFormBuilderTemplateWidgetGrid'
,2
,3
,0
,0
,NULL
,NULL
,'Core'
,'FB_WidGrid.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Header' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Header' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Grid with Header'
,'Widget'
,'mWidgetGridHeader'
,'WSFormBuilderTemplateWidgetGridHeader'
,'WSFormBuilderTemplateWidgetGridHeader'
,2
,5
,0
,0
,NULL
,NULL
,'Core'
,'FB_WidGridHeader.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Header and Actions' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Header and Actions' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Grid with Header and Actions'
,'Widget'
,'mWidgetGridHeaderActions'
,'WSFormBuilderTemplateWidgetGridHeaderActions'
,'WSFormBuilderTemplateWidgetGridHeaderActions'
,2
,6
,0
,0
,NULL
,NULL
,'Core'
,'FB_WidGridHeaderAct.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Search' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Grid with Search' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Grid with Search'
,'Widget'
,'mWidgetGridSearch'
,'WSFormBuilderTemplateWidgetGridSearch'
,'WSFormBuilderWidGridSearchTemplate'
,2
,4
,0
,0
,NULL
,NULL
,'Core'
,'FB_WidGridSearch.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'ION Workflow'
,'Widget'
,'mIONWorkflowTemplate'
,'WSFormBuilderTemplateION'
,'WSFormBuilderTemplateION'
,20
,8
,0
,0
,NULL
,NULL
,'Core'
,'FB_ResponsiveNavMenu.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'List v2' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'List v2' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'List v2'
,'Widget'
,'mWidgetList'
,'WSFormBuilderTemplateWidgetList'
,'WSFormBuilderTemplateWidgetList'
,2
,1
,1
,0
,'WSFormBuilderWidListTileTemplate'
,'WSFormBuilderWidListTileTemplate'
,'Core'
,'FB_WidList.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'List with Icons' AND FormType = 'Widget')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'List with Icons' AND FormType = 'Widget'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'List with Icons'
,'Widget'
,'mWidgetListIcons'
,'WSFormBuilderTemplateWidgetListIcon'
,'WSFormBuilderTemplateWidgetListIcon'
,3
,2
,1
,1
,'WSFormBuilderTemplateWidgetListIconTile'
,'WSFormBuilderTemplateWidgetListIconTile'
,'Core'
,'FB_WidListIcon.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Non-Data Menu with Actions' AND FormType = 'Non-Data')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Non-Data Menu with Actions' AND FormType = 'Non-Data'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Non-Data Menu with Actions'
,'Non-Data'
,'mNonDataMenuActions'
,'WSFormBuilderTemplateNonDataMenu'
,'WSFormBuilderTemplateNonDataMenu'
,0
,2
,0
,0
,NULL
,NULL
,'Core'
,'FB_NonDataMenuAct.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive v2' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive v2' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Responsive v2'
,'FullForm'
,'mResponsive'
,'WSFormBuilderTemplateResponsive'
,'WSFormBuilderTemplateResponsive'
,20
,4
,0
,0
,NULL
,NULL
,'Core'
,'FB_Responsive.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Responsive with Navigation'
,'FullForm'
,'mResponsiveNav'
,'WSFormBuilderTemplateResponsiveNav'
,'WSFormBuilderTemplateResponsiveNav'
,20
,5
,0
,0
,NULL
,NULL
,'Core'
,'FB_ResponsiveNav.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation and Menu' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation and Menu' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Responsive with Navigation and Menu'
,'FullForm'
,'mResponsiveNavMenuActions'
,'WSFormBuilderTemplateResponsiveNavMenu'
,'WSFormBuilderTemplateResponsiveNavMenu'
,20
,7
,0
,0
,NULL
,NULL
,'Core'
,'FB_ResponsiveNavMenu.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation, Menu and Subcollection' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Responsive with Navigation, Menu and Subcollection' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Responsive with Navigation, Menu and Subcollection'
,'FullForm'
,'mResponsiveNavMenuActionsSubCol'
,'WSFormBuilderTemplateResponsiveNavMenuSubCol'
,'WSFormBuilderTemplateResponsiveNavMenuSubCol'
,20
,8
,0
,0
,NULL
,NULL
,'Core'
,'FB_ResponsiveNavMenu.png'
,1
,NULL
)
GO

--FullForm--

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Detail' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Detail' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Standard Detail'
,'FullForm'
,'mStandardDetailForm'
,'WSFormBuilderTemplateStandardDetail'
,'WSFormBuilderTemplateStandardDetail'
,20
,3
,0
,0
,NULL
,NULL
,'Core'
,'FB_StandardDetail.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Form' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Form' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Standard Form'
,'FullForm'
,'mStandardForm'
,'WSFormBuilderTemplateStandardForm'
,'WSFormBuilderTemplateStandardForm'
,20
,1
,0
,0
,NULL
,NULL
,'Core'
,'FB_StandardForm.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Grid' AND FormType = 'FullForm')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Standard Grid' AND FormType = 'FullForm'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Standard Grid'
,'FullForm'
,'mStandardGrid'
,'WSFormBuilderTemplateStandardGrid'
,'WSFormBuilderTemplateStandardGrid'
,20
,2
,0
,0
,NULL
,NULL
,'Core'
,'FB_StandardGrid.png'
,0
,NULL
)
GO

--FormType--

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'FullForm' AND FormType = 'FormType')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'FullForm' AND FormType = 'FormType'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'FullForm'
,'FormType'
,'mFullForm'
,'WSFormBuilderFlexFormTemplate'
,'WSFormBuilderFlexFormTemplate'
,1
,6
,0
,0
,NULL
,NULL
,'Core'
,'FB_RespNav.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Non-Data' AND FormType = 'FormType')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Non-Data' AND FormType = 'FormType'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Non-Data'
,'FormType'
,'mNonData'
,'WSFormBuilderFlexForm'
,'WSFormBuilderFlexFormTemplate'
,0
,3
,0
,0
,NULL
,NULL
,'Core'
,'FB_NonDataMenu.png'
,0
,NULL
)
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'Widget' AND FormType = 'FormType')
DELETE FROM WSFormBuilderLayouts WHERE LayoutName = 'Widget' AND FormType = 'FormType'

INSERT INTO WSFormBuilderLayouts (
LayoutName
,FormType
,Description
,FormName
,MasterFormName
,NumberOfProperties
,Sequence
,HasTileFlag
,TileHasImageFlag
,TileFormName
,TileMasterFormName
,AccessAs
,ImageName
,LayoutType
,MaxNumberOfCards
) VALUES (
'Widget'
,'FormType'
,'mWidget'
,'WSFormBuilderFlexForm'
,'WSFormBuilderFlexFormTemplate'
,1
,2
,0
,0
,NULL
,NULL
,'Core'
,'FB_Widget.png'
,0
,NULL
)
GO