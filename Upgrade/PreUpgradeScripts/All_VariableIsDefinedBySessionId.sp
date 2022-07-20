SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF OBJECT_ID('dbo.VariableIsDefinedBySessionId') IS NOT NULL
    DROP FUNCTION dbo.VariableIsDefinedBySessionId
GO

-- Returns a flag indicating whether or not a variable of the given name has
-- been defined in the DefineVariables table for a session ID.

/* $Header: ApplicationDB\PreTableObjects\VariableIsDefinedBySessionId.sp 10.8.0.0 10/29/2018 13:51:50 */

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


/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/VariableIsDefinedBySessionId.sp $
 *
 * CoreDev 1 134530 Calagappan Tue Jan 04 10:46:08 2011
 * Invoice Distribution wrong when Debit/Credit memo is from  Price Adjustment Invoice and CO is "include tax in price"
 * Use passed in session ID to determine whether variable exists
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.VariableIsDefinedBySessionId (
  @SessionID    RowPointerType
, @VariableName SYSNAME
) RETURNS ListYesNoType
AS
BEGIN
   DECLARE
     @Flag ListYesNoType

   SET @Flag = 0

   IF EXISTS (SELECT 1
              FROM  DefineVariables
              WHERE ConnectionID = @SessionID
              AND   ProcessID    = -1
              AND   VariableName = @VariableName)
      SET @Flag = 1

   RETURN @Flag
END
GO
