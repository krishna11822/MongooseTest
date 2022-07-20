/* $Header: /Tools/SQLScripts/Upgrade/ObjectsDb/All_DeleteIDOMetadata.sql 7     3/01/17 4:26p Jmorris $ */
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
DELETE ObjProperties
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjMethodParameters
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjMethodResultSets
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjMethods
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjTables
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjSubColFilterProperties
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjCollectionRules
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjCollections
WHERE CollectionName IN 
  (SELECT CollectionName 
   FROM ObjCollections col
   INNER JOIN ObjServers svr ON svr.ServerName = col.ServerName
   WHERE svr.AccessAs IN ('Core'))
GO
DELETE ObjPropertyClasses WHERE AccessAs IN ('Core')
GO
DELETE ObjPropertyClasses WHERE ClassName = 'TimeZoneBase' and AccessAs = 'BaseSyteLine'
GO
DELETE ObjCustomAssembly WHERE AccessAs IN ('Core')
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[ClassNames]'), N'IsUserTable') = 1
DELETE FROM ClassNames
GO
IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].ClassNames2]'), N'IsUserTable') = 1
DELETE FROM ClassNames2
GO
DELETE FROM ObjFilters
GO
ALTER TABLE ObjServers DISABLE TRIGGER ObjServersDel
GO
DELETE FROM ObjServers WHERE AccessAs IN ('Core')
GO
ALTER TABLE ObjServers ENABLE TRIGGER ObjServersDel
GO
DELETE FROM ObjSysParameters
GO

