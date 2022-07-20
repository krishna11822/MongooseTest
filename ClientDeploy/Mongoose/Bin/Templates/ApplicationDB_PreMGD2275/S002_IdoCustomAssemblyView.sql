/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoCustomAssemblyView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoCustomAssemblyView
AS
SELECT
  AssemblyName
, DevelopmentFlag
, FullName
, AssemblyImage
, AssemblySymbols
, [FileName]
, SymbolFileName
, LockBy
, RevisionNo
, RevisionDate
, AccessAs
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
, AssemblyType
, [Language]
, [References]
, ExtendedAssemblyName
FROM ido.CustomAssembly
INNER JOIN UserNameView u ON 1=1
WHERE 1 = (CASE WHEN LockBy = u.UserName THEN DevelopmentFlag ELSE DevelopmentFlag + 1 END)
