SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.UserNameBySessionId') IS NOT NULL
    DROP FUNCTION dbo.UserNameBySessionId
GO
/* $Header: ApplicationDB\PreTableObjects\UserNameBySessionId.sp 10.8.0.0 10/29/2018 13:51:50 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/UserNameBySessionId.sp $
 *
 * CoreDev 6 143111 Nthurn Fri May 12 14:46:21 2017
 * Improved performance of current UserName retrieval.  (Issue 143111)
 *
 * CoreDev 5 RS7900 Djohnson Thu Jun 23 13:18:43 2016
 * RS7900 - rolling back issue 210660 as UsernameType itself is being widened.
 *
 * CoreDev 4 210660 Nthurn Tue Apr 26 09:05:44 2016
 * Application Events are failing with error "String or binary data will be truncated" when
 * Ensure the full length of SUSER_SNAME() can be returned.  (Issue 210660)
 *
 * CoreDev 3 195209 Nthurn Thu May 21 17:01:07 2015
 * dbo.UserNameBySessionId() should have been given the RS5555 modification
 * Look to SessionContextNames for a username if there is no ConnectionInformation record.  (RS5555)
 *
 * History inherited from UserName2Sp.sp:
 *
 * CoreDev 8 RS5077 Djohnson Tue Jul 29 14:15:01 2014
 * Use TOP 1 when selecting from SessionContextNames, which can have multiple records per SessionID.
 *
 * CoreDev 7 RS5555 Djohnson Mon Apr 23 09:55:36 2012
 * RS5555 - make the SessionContextNames read a nolock for the event system, which blocked.
 *
 * CoreDev 6 RS5555 Djohnson Fri Apr 20 15:49:57 2012
 * RS5555 - Look to SessionContextNames for a username if there is no ConnectionInformation record.
 *
 * End inheritance.
 *
 * CoreDev 1 126324 Nthurn Fri Dec 11 16:40:02 2009
 * Email Address that has [User: $service] does not exist.
 * Returns the owner of the given Session.
 *
 * $NoKeywords: $
 */
 
CREATE FUNCTION dbo.UserNameBySessionId( @SessionID RowPointerType )
RETURNS UsernameType
AS
BEGIN
   -- WARNING! This algorithm is also encoded in UserNameView
   -- Please maintain in concert!
   DECLARE @UserName UsernameType
   DECLARE @ImpersonatingUserName UsernameType

   SELECT @UserName = UserName,
          @ImpersonatingUserName = ImpersonatingUserName
   FROM ConnectionInformation
   WHERE ConnectionID = @SessionID

   IF @ImpersonatingUserName IS NOT NULL
      SET @UserName = @ImpersonatingUserName

   --  No ConnectionInformation record found, so use the override username.
   IF @UserName IS NULL
      SELECT TOP 1 @UserName = CreatedBy
      FROM SessionContextNames WITH (NOLOCK)
      WHERE SessionID = @SessionID

   IF @UserName IS NULL
      SET @UserName = SUSER_SNAME()

   RETURN @UserName
END
GO
