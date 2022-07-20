/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoCustomAssemblySourceView.sql  $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoCustomAssemblySourceView
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
FROM ido.CustomAssemblySource
INNER JOIN UserNameView u ON 1=1
WHERE 1 = (CASE WHEN LockBy = u.UserName THEN DevelopmentFlag ELSE DevelopmentFlag + 1 END)

