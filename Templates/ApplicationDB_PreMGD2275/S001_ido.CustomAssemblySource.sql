/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S001_ido.CustomAssemblySource.sql  $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW ido.CustomAssemblySource
AS
SELECT
  AssemblyName
, [FileName]
, DevelopmentFlag
, SourceCode
, LockBy
, RevisionNo
, RevisionDate
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
FROM ToolsDev_600_Objects.dbo.CustomAssemblySource
