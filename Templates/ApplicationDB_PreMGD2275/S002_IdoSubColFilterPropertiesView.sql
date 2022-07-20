/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoSubColFilterPropertiesView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright � 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW IdoSubColFilterPropertiesView
AS
SELECT
  CollectionName
, PropertyName
, Sequence
, FilterPropertyName
, DevelopmentFlag
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
FROM ido.SubColFilterProperties
