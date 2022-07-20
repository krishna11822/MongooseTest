IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'Widget')
DELETE WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'Widget'
GO

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'FullForm')
DELETE WSFormBuilderLayouts WHERE LayoutName = 'ION Workflow' AND FormType = 'FullForm'		
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
,'FullForm'
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

--FormType--

IF EXISTS (SELECT 1 FROM WSFormBuilderLayouts WHERE LayoutName = 'FullForm' AND FormType = 'FormType')
	UPDATE WSFormBuilderLayouts 
	SET FormName = 'N/A' , MasterFormName = 'N/A' 
	WHERE LayoutName = 'FullForm' AND FormType = 'FormType'
ELSE 
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
	,'N/A'
	,'N/A'
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
	UPDATE WSFormBuilderLayouts 
	SET FormName = 'N/A' , MasterFormName = 'N/A' 
	WHERE LayoutName = 'Non-Data' AND FormType = 'FormType'
ELSE
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
	,'N/A'
	,'N/A'
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
	UPDATE WSFormBuilderLayouts 
	SET FormName = 'N/A' , MasterFormName = 'N/A' 
	WHERE LayoutName = 'Widget' AND FormType = 'FormType'
ELSE 	
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
	,'N/A'
	,'N/A'
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