/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/FormsDb/8.01_ExplorerFoldersDelete_Core.sql 1     8/21/13 2:01p Jmorris $ */

WITH FolderForms ( 
ObjectId, ObjectName, ObjectType, ObjectTextData, ParentFolderId, ObjectData, ObjectDesc, LockedBy, Level )
AS
( 
SELECT ObjectId, ObjectName, ObjectType, ObjectTextData, ParentFolderId, ObjectData, ObjectDesc, LockedBy, 0
FROM ExplorerObjects
WHERE ObjectType = 'F'
AND ParentFolderId = -1
AND ObjectName IN ('xSystem')
UNION ALL
SELECT eo.ObjectId, eo.ObjectName, eo.ObjectType, eo.ObjectTextData, eo.ParentFolderId, eo.ObjectData, eo.ObjectDesc, eo.LockedBy, ff.Level + 1
FROM ExplorerObjects eo
INNER JOIN FolderForms ff ON
  eo.ParentFolderId = ff.ObjectId
) delete eo
from ExplorerObjects eo
inner join FolderForms ff on
  ff.ObjectId = eo.ObjectId