/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
-- ======================================
--  Classic:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'BuildFromScratch' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'BuildFromScratch' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'BuildFromScratch'
, 'Classic'
, 'Core'
, 'mWizard_BuildFromScratch'        -- Plain form without defined components
, 'WSFormWizardClassicBuildFromScratch'
, 'nfw_classic_buildfromscratch.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'GridOnly' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'GridOnly' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'GridOnly'
, 'Classic'
, 'Core'
, 'mWizard_GridOnly'                -- Form with a single grid, bound to an IDO collection and displayed in a row-column table format
, 'WSFormWizardClassicGridOnly'
, 'nfw_classic_gridonly.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'DetailOnly' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'DetailOnly' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'DetailOnly'
, 'Classic'
, 'Core'
, 'mWizard_DetailOnly'              -- Form to display the details for a single record of an IDO collection
, 'WSFormWizardClassicDetailOnly'
, 'nfw_classic_detailonly.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'MultiView' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'MultiView' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'MultiView'
, 'Classic'
, 'Core'
, 'mWizard_MultiView'               -- Multi-view (grid/detail) form bound to an IDO collection
, 'WSFormWizardClassicMultiView'
, 'nfw_classic_multiview.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Query' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Query' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Query'
, 'Classic'
, 'Core'
, 'mWizard_Query'                   -- Query form to create a filter to specify the collection user can retrieve
, 'WSFormWizardClassicQuery'
, 'nfw_classic_query.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Report'
, 'Classic'
, 'Core'
, 'mWizard_Report'                  -- Template form to generate report outputs
, 'WSFormWizardClassicReport'
, 'nfw_classic_report.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Tile' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Tile' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Tile'
, 'Classic'
, 'Core'
, 'mWizard_Tile'                    -- Tile form to be hosted by another form
, 'WSFormWizardClassicTile'
, 'nfw_classic_tile.svg'
, 0
)
GO

-- ======================================
--  NewData:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Maintenance' AND CategoryName = 'NewData')
DELETE FROM WSFormWizards WHERE WizardName = 'Maintenance' AND CategoryName = 'NewData'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Maintenance'
, 'NewData'
, 'Core'
, 'mWizard_NewDataMaintenance'      -- Creating a table, IDO, and (optionally) form
, 'WSFormWizardNewDataMaintenance'
, 'ndmw_maintenance.svg'
, 0
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'XmlToIdo' AND CategoryName = 'NewData')
DELETE FROM WSFormWizards WHERE WizardName = 'XmlToIdo' AND CategoryName = 'NewData'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'XmlToIdo'
, 'NewData'
, 'Core'
, 'mWizard_XmlToIdo'              -- Importing BOD or other XML to create table(s), IDO(s), Form(s), and Replication Rule(s)
, 'WSFormWizardNewDataXmlToIdo'
, 'ndmw_xmltoido.svg'
, 0
)
GO

-- ======================================
--  Flex:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Basic' AND CategoryName = 'Flex')
DELETE FROM WSFormWizards WHERE WizardName = 'Basic' AND CategoryName = 'Flex'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Basic'
, 'Flex'
, 'Core'
, 'mWizard_BasicFlex'      -- Create form with a flex layout and three vertical flex regions.
, 'WSFormWizardFlexBasic'
, 'NULL'
, 0
)
GO
-- ======================================
--  Form Builder:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'FullForm' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'FullForm' AND CategoryName = 'FormBuilder'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'FullForm'
, 'FormBuilder'
, 'Core'
, 'mFormBuilder_FullForm'      -- Create full forms from template.
, 'WSRuntimeWizardFormBuilder'
, 'fb_fullform.svg'
, 1
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Widget' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'Widget' AND CategoryName = 'FormBuilder'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'Widget'
, 'FormBuilder'
, 'Core'
, 'mFormBuilder_Widget'      -- Create widget forms from template.
, 'WSRuntimeWizardFormBuilder'
, 'fb_widget.svg'
, 1
)
GO

-- ======================================
--  REST:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'APIGenerator' AND CategoryName = 'REST')
DELETE FROM WSFormWizards WHERE WizardName = 'APIGenerator' AND CategoryName = 'REST'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'APIGenerator'
, 'REST'
, 'Core'
, 'mWizard_RestApiGenerator'      -- Create strongly-typed APIs for an IOD based on REST API v2.
, 'WSFormWizardRestApi'
, 'NULL'
, 1
)
GO

-- ======================================
--  External Datasource wizard:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'DatalakeWizard' AND CategoryName = 'ExtDatasource')
DELETE FROM WSFormWizards WHERE WizardName = 'DatalakeWizard' AND CategoryName = 'ExtDatasource'
GO

INSERT INTO WSFormWizards (
  WizardName
, CategoryName
, AccessAs
, Description
, FormName
, ImageName
, IsRuntimeBuilder
) VALUES (
  'DatalakeWizard'
, 'ExtDatasource'
, 'Core'
, 'mWizard_ExtDatasource'     
, 'WSFDataLakeIDOWizard'
, 'NULL'
, 1
)
GO
