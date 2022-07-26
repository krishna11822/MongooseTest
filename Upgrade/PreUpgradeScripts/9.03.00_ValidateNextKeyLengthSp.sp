SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ValidateNextKeyLengthSp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ValidateNextKeyLengthSp]
GO

/* $Header: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/9.03.00_ValidateNextKeyLengthSp.sp 1     11/21/16 8:55a Djohnson $ */

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

/* $Archive: /Tools/SQLScripts/Upgrade/PreUpgradeScripts/9.03.00_ValidateNextKeyLengthSp.sp $
 *
 * CoreDev 1 218600 Djohnson Fri Nov 18 15:23:40 2016
 * Redesign form to maintain current function without risk of SQL injection.
 * Issue #218600
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.ValidateNextKeyLengthSp (
  @NextKeyLength VeryLongListType
, @Infobar       InfobarType   OUTPUT
) AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_ValidateNextKeyLengthSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_ValidateNextKeyLengthSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      DECLARE @EXTGEN_Severity int
      EXEC @EXTGEN_Severity = @EXTGEN_SpName
         @NextKeyLength
         , @Infobar OUTPUT

      -- ETP routine can RETURN 1 to signal that the remainder of this standard routine should now proceed:
      IF @EXTGEN_Severity <> 1
         RETURN @EXTGEN_Severity
   END
   -- End of Generic External Touch Point code.

DECLARE
  @Severity   INT
, @TableName  SYSNAME
, @ColumnName SYSNAME

SET @Severity = 0

IF @NextKeyLength IS NULL
   RETURN 0

IF dbo.IsNonNegativeInteger(@NextKeyLength) = 1
BEGIN
   IF CAST(@NextKeyLength AS INT) > 0
      RETURN 0
   SET @Severity = 16
END

SET @TableName = dbo.Entry(1, @NextKeyLength, '.')
SET @ColumnName = dbo.Entry(2, @NextKeyLength, '.')

IF NOT EXISTS (SELECT 1
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName
AND COLUMN_NAME = @ColumnName)
BEGIN
   EXEC @Severity = MsgAppSp @Infobar OUTPUT
   , N'E=NextKeyLength'
   , @NextKeyLength
END

RETURN @Severity

GO
