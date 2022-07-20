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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
IF EXISTS (SELECT 1 FROM WSFormWizardCategories WHERE CategoryName = 'Classic')
DELETE FROM WSFormWizardCategories WHERE CategoryName = 'Classic'
GO

INSERT INTO WSFormWizardCategories (
  CategoryName
, AccessAs
, Description
, ImageName
) VALUES (
  'Classic'
, 'Core'
, 'mWizardCategory_Classic'      -- WinStudio classic form wizards
, 'nfw.svg'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizardCategories WHERE CategoryName = 'NewData')
DELETE FROM WSFormWizardCategories WHERE CategoryName = 'NewData'
GO

INSERT INTO WSFormWizardCategories (
  CategoryName
, AccessAs
, Description
, ImageName
) VALUES (
  'NewData'
, 'Core'
, 'mWizardCategory_NewData'      -- Wizards to create forms with their required SQL tables, IDOs, and components
, 'ndmw.svg'
)
GO

IF EXISTS (SELECT 1 FROM WSFormWizardCategories WHERE CategoryName = 'Flex')
DELETE FROM WSFormWizardCategories WHERE CategoryName = 'Flex'
GO

INSERT INTO WSFormWizardCategories (
  CategoryName
, AccessAs
, Description
, ImageName
) VALUES (
  'Flex'
, 'Core'
, 'mWizardCategory_Flex'      -- Wizards to create forms with their required SQL tables, IDOs, and components
, 'NULL'
)
GO
