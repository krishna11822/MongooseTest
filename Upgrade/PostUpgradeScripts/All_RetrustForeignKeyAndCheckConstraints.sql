/* $Header: /Tools/SQLScripts/Upgrade/PostUpgradeScripts/RetrustForeignKeyAndCheckConstraints.sql 1     9/06/13 1:30p Jray $ */
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
*   (c) COPYRIGHT 2013 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

DECLARE @Severity INT = 0
DECLARE @AnalyzeOnly ListYesNoType = 0
DECLARE @Infobar InfobarType = NULL

EXECUTE @Severity = [dbo].[RetrustCheckConstraintsSp]
   @AnalyzeOnly
  ,@Infobar OUTPUT

IF @Infobar IS NOT NULL
BEGIN
   SELECT @Infobar
   SET @Infobar = NULL
END

EXECUTE @Severity = [dbo].[RetrustForeignKeyConstraintsSp] 
   @AnalyzeOnly
  ,@Infobar OUTPUT

IF @Infobar IS NOT NULL
BEGIN
   SELECT @Infobar
   SET @Infobar = NULL
END

GO
