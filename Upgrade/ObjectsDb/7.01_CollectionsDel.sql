SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CollectionsDel]'))
DROP TRIGGER [dbo].[CollectionsDel]
GO

/*$Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_CollectionsDel.sql 1     6/11/12 4:01p Bcummings $ */
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

CREATE TRIGGER [dbo].[CollectionsDel]
ON [dbo].[Collections]
FOR DELETE
AS
IF @@ROWCOUNT = 0
   RETURN

UPDATE c
SET Extends = dd.Extends
FROM Collections c
INNER JOIN deleted dd ON
  dd.CollectionName = c.Extends
WHERE dd.ReplaceFlag = 1
AND c.ReplaceFlag = 1
AND NOT EXISTS (SELECT 1
  FROM Collections c2
  WHERE c2.CollectionName = dd.CollectionName
  AND c2.DevelopmentFlag != dd.DevelopmentFlag)

--  Fire the timestamp increment on this singleton table.
EXEC dbo.BumpDbUsedSp

GO



