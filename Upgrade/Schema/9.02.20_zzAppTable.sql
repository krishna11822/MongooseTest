SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/

-- RS5957
IF NOT EXISTS(SELECT 1 FROM AppTable WHERE TableName = N'NextKeyDefinition_mst')
   INSERT INTO AppTable ([TableName],
      [Update_AllWhen], [UpdateRecordDateWhen], [IgnoreInsert], [IgnoreUpdate], [DisallowUpdate],
      [KeepClusteringKeys], [UseRPOnInsert], [UseRPOnUpdate], [IupTriggerModifiesNewRows],
      [RememberIdentity], [RegisterNewKey], [TestOutsideLockForNewKey], [NextKeyReverseKeyOrder],
      [InheritorTableList],
      [ModuleName], [AppViewName], [SiteColumnName])
   VALUES (N'NextKeyDefinition_mst',
      NULL, NULL, 0, 1, 0,
      0, 0, 0, 0,
      0, 0, 0, 0,
      NULL,
      N'Core', N'NextKeyDefinition', N'SiteRef')
GO
UPDATE AppTable
SET IgnoreUpdate = 1
WHERE TableName = 'UserNames'
GO
