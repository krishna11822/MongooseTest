/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S001_ido.Methods.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright � 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW ido.Methods
AS
SELECT
  CollectionName
, MethodName
, MethodDesc
, MethodType
, StoredProcName
, DevelopmentFlag
, TxnFlag
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
FROM ToolsDev_600_Objects.dbo.Methods
