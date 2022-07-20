IF EXISTS (SELECT 1 FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'FormBuilder')
DELETE FROM WSFormWizards WHERE WizardName = 'Report' AND CategoryName = 'FormBuilder'
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
, 'FormBuilder'
, 'Core'
, 'mWizard_Report'      -- 
, 'WSRuntimeWizardReport'
, 'ReportBuilderIcon.svg'
, 1
)
GO