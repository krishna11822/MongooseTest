/* $Header: /Tools/SQLScripts/ApplicationDB/Init Data/DocumentType.sql 1     5/30/13 3:41p Sataylor $ */
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
*   (c) COPYRIGHT 2020 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
IF NOT EXISTS(SELECT 1 FROM DocumentType WHERE DocumentType = N'AttachedReportDocument')
   INSERT INTO DocumentType ([DocumentType]
      ,[Description]
      ,[StorageMethod]
      ,[LogicalFolderName]
      ,[UseServerPathAsRootPath]
      ,[AutoPopulate]
      ,[PopulationDepth]
      ,[CreateFolderIfNotExists])
   VALUES (N'AttachedReportDocument',N'This is a predefined document type',N'D',N'default', 0, 0, 0, 0 )
 
GO

