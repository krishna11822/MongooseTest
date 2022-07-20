SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ESBSecurityUserMasterView]'))
DROP VIEW [dbo].[ESBSecurityUserMasterView]
GO

/* $Header: /Tools/SQLScripts/ApplicationDB/Views/ESBSecurityUserMasterView.sql 8     10/04/17 12:12p Djohnson $ */
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


/* $Archive: /Tools/SQLScripts/ApplicationDB/Views/ESBSecurityUserMasterView.sql $
 *
 * Core90310 8 RS8266 Djohnson Wed Oct 04 12:12:50 2017
 * RS8266 - add UserAlias to view.
 *
 * CoreDev 7 226620 Djackson1 Wed Apr 05 15:58:07 2017
 * Approva ID elements exceed the 100 char limit
 * 226620 
 *
 * CoreDev 6 226620 Djackson1 Wed Apr 05 15:55:42 2017
 * 226620 - IDs over 100 char
 *
 * CoreDev 5 RS6090 Djackson1 Tue Jan 10 10:28:31 2017
 * 6090 Approva Integration
 *
 * CoreDev 4 200269 Tcecere Wed Aug 12 08:41:41 2015
 * Add Given and Family Name to SecurityUser Master BOD
 * Issue 200269 - Added GivenName and FamilyName to collection method.
 *
 * CoreDev 3 198822 Tcecere Tue Jul 21 07:41:50 2015
 * Add Email logic to SecurityUserMaster BOD
 * Issue 198822 - Added EmailAddress to view.
 *
 * CoreDev 2 196297 Nthurn Fri Jun 12 13:17:52 2015
 * Views/ESBSecurityUserMasterView.sql fails to DROP an existing object of the same name and type
 * Added missing DROP statement.  (Issue 196297)
 *
 * CoreDev 1 194897 Tcecere Wed May 13 10:00:04 2015
 * RS7309 - issue coding
 * Issue 194897 - New SecurityUserMasterView view
 *
 * $NoKeywords: $
 */
CREATE VIEW [dbo].[ESBSecurityUserMasterView]
AS

SELECT 
     UserId           = un.UserId,
     UserName         = un.Username,
     UserDesc         = un.UserDesc,
     WorkstationLogin = ISNULL(un.WorkstationLogin, un.UserId),
     RefCreateDate    = un.CreateDate,
     Status           = CASE WHEN un.Status = 0 THEN 'Enabled' ELSE 'Disabled' END,
     EmailAddress     = ue.emailaddress,
     GivenName        = 
          CASE 
               WHEN CHARINDEX ( ' ' , userdesc, 1) > 0 AND NOT UserDesc IS NULL 
                  THEN SUBSTRING(userdesc,1,CHARINDEX (' ' , userdesc, 1) - 1)
               ELSE userdesc
          END,
     FamilyName       = 
          CASE  
               WHEN CHARINDEX ( ' ' , userdesc, 1) > 0 
                    AND NOT UserDesc IS NULL 
                    AND NOT CHARINDEX (' ' , userdesc, 1) + 1 > LEN(userdesc)
                  THEN SUBSTRING(userdesc,CHARINDEX (' ' , userdesc, 1) + 1, LEN(userdesc) - CHARINDEX (' ' , userdesc, 1) )
               ELSE ''
          END,
     UserAlias = un.UserAlias
  FROM UserNames as un
  LEFT OUTER JOIN UserEmail ue on ue.Username = un.Username AND ue.EmailType = un.PrimaryEmailType
 
GO




