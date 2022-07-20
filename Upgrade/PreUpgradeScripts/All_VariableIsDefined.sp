SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF OBJECT_ID('dbo.VariableIsDefined') IS NOT NULL
    DROP FUNCTION dbo.VariableIsDefined
GO

-- Returns a flag indicating whether or not a variable of the given name has
-- been defined in the DefineVariables table for current session ID.

/* $Header: ApplicationDB\PreTableObjects\VariableIsDefined.sp 10.8.0.0 10/29/2018 13:51:50 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/VariableIsDefined.sp $
 *
 * CoreDev 7 134530 Calagappan Tue Jan 04 10:46:12 2011
 * Invoice Distribution wrong when Debit/Credit memo is from  Price Adjustment Invoice and CO is "include tax in price"
 * Obtain and pass in session ID to VariableIsDefinedBySessionId
 *
 * CoreDev 6 rs4588 Dahn Mon Mar 08 08:06:43 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 5 rs3953 Dahn Tue Aug 26 16:50:41 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 4 rs3953 Vlitmano Mon Aug 18 15:57:46 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.VariableIsDefined (
  @VariableName SYSNAME
) RETURNS ListYesNoType
AS
BEGIN
   DECLARE
     @SessionID RowPointerType
   , @Flag      ListYesNoType

   SET @SessionID = dbo.SessionIDSp()

   SET @Flag = dbo.VariableIsDefinedBySessionId(@SessionID, @VariableName)

   RETURN @Flag
END
GO
