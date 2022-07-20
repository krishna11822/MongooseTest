SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.11_WSFormWizards.sql 3     9/15/17 1:34p Jmorris $ */
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
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'BuildFromScratch'
, 'Classic'
, 'Blank form with no components initially'
, 'WSFormWizardClassicBuildFromScratch'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'GridOnly' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'GridOnly' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'GridOnly'
, 'Classic'
, 'Form that displays data in a row-column grid using a tabular format'
, 'WSFormWizardClassicGridOnly'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'DetailOnly' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'DetailOnly' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'DetailOnly'
, 'Classic'
, 'Form to display the details for a single record of an IDO collection'
, 'WSFormWizardClassicDetailOnly'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'MultiView' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'MultiView' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'MultiView'
, 'Classic'
, 'Form that consists of two views: a Grid View and a Detail View'
, 'WSFormWizardClassicMultiView'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Query' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Query' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'Query'
, 'Classic'
, 'Form that uses filters to search for and retrieve data for a parent form'
, 'WSFormWizardClassicQuery'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'Report'
, 'Classic'
, 'Form that acts as a template to generate user-defined reports'
, 'WSFormWizardClassicReport'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Tile' AND CategoryName = 'Classic')
DELETE FROM WSFormWizards WHERE WizardName = 'Tile' AND CategoryName = 'Classic'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'Tile'
, 'Classic'
, 'Specialized form designed to display data as a tile within a grid or infocon component'
, 'WSFormWizardClassicTile'
)
GO

-- ======================================
--  NewData:
-- ======================================
IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Maintenance' AND CategoryName = 'NewData')
DELETE FROM WSFormWizards WHERE WizardName = 'Maintenance' AND CategoryName = 'NewData'
GO

INSERT INTO WSFormWizards (
  WizardName,
  CategoryName,
  Description,
  FormName
) VALUES (
  'Maintenance'
, 'NewData'
, 'Creating a table, IDO, and (optionally) form'
, 'WSFormWizardNewDataMaintenance'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'XmlToIdo' AND CategoryName = 'NewData')
DELETE FROM WSFormWizards WHERE WizardName = 'XmlToIdo' AND CategoryName = 'NewData'
GO

-- ======================================
--  Future TODO:
-- ======================================
--INSERT INTO WSFormWizards (
--  WizardName,
--  CategoryName,
--  Description,
--  FormName
--) VALUES (
--  'XmlToIdo'
--, 'NewData'
--, 'Importing BOD or other XML to create table(s), IDO(s), Form(s), and Replication Rule(s)'
--, 'WSFormWizardNewDataXmlToIdo'
--)
--GO