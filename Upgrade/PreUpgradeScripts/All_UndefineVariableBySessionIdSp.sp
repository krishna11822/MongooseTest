SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.UndefineVariableBySessionIdSp') IS NOT NULL
    DROP PROCEDURE dbo.UndefineVariableBySessionIdSp
GO

--  This routine undefines a global variable for a Session ID.

/* $Header: ApplicationDB\Stored Procedures\UndefineVariableBySessionIdSp.sp 10.1.0.1 03/30/2018 14:27:37 */

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
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/


/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/UndefineVariableBySessionIdSp.sp $
 *
 * CoreDev 1 134530 Calagappan Tue Jan 04 10:46:04 2011
 * Invoice Distribution wrong when Debit/Credit memo is from  Price Adjustment Invoice and CO is "include tax in price"
 * Use passed in session ID to undefine variable
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.UndefineVariableBySessionIdSp (
  @SessionID    RowPointerType
, @VariableName SYSNAME
, @Infobar      InfobarType OUTPUT
)
AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_UndefineVariableBySessionIdSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_UndefineVariableBySessionIdSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      DECLARE @EXTGEN_Severity int
      EXEC @EXTGEN_Severity = @EXTGEN_SpName
         @SessionID
         , @VariableName
         , @Infobar OUTPUT
 
      -- ETP routine can RETURN 1 to signal that the remainder of this standard routine should now proceed:
      IF @EXTGEN_Severity <> 1
         RETURN @EXTGEN_Severity
   END
   -- End of Generic External Touch Point code.
 
DELETE DefineVariables
WHERE ConnectionID = @SessionID
AND   ProcessID = -1
AND   VariableName = @VariableName

RETURN @@ERROR
GO
