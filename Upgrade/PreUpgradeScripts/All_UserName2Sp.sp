SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.UserName2Sp') IS NOT NULL
    DROP FUNCTION dbo.UserName2Sp
GO
/* $Header: ApplicationDB\PreTableObjects\UserName2Sp.sp 10.8.0.0 10/29/2018 13:51:50 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/UserName2Sp.sp $
 *
 * CoreDev 12 RS7900 Djohnson Thu Jun 23 13:18:39 2016
 * RS7900 - rolling back issue 210660 as UsernameType itself is being widened.
 *
 * CoreDev 11 210660 Nthurn Tue Apr 26 10:25:26 2016
 * Application Events are failing with error "String or binary data will be truncated" when
 * Correction to previous version.
 *
 * CoreDev 10 210660 Nthurn Tue Apr 26 09:05:36 2016
 * Application Events are failing with error "String or binary data will be truncated" when
 * Ensure the full length of SUSER_SNAME() can be returned.  (Issue 210660)
 *
 * CoreDev 9 195209 Nthurn Thu May 21 17:01:38 2015
 * dbo.UserNameBySessionId() should have been given the RS5555 modification
 * Rely on dbo.UserNameBySessionId() for implementation.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.UserName2Sp()
RETURNS UsernameType
AS
BEGIN
   DECLARE @UserName UsernameType
   DECLARE @SessionID RowPointerType

   SET @SessionID = dbo.SessionIDSp()

   SET @UserName = dbo.UserNameBySessionId(@SessionID)

   RETURN @UserName
END
GO
