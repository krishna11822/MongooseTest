SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.LowCharacter') IS NOT NULL
   DROP FUNCTION dbo.LowCharacter
GO
--  This function provides the lowest character for comparisons.  It is used
-- when the user has not entered a low value.
--
/* $Header: ApplicationDB\PreTableObjects\LowCharacter.sp 10.8.0.0 10/29/2018 13:51:49 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/LowCharacter.sp $
 *
 * CoreDev 1 rs5108 Sxu Mon May 23 02:17:36 2011
 * Copy thisfunctions from SyteLine to Core
 *
 * SL8.02 8 rs4588 Dahn Fri Mar 05 08:10:14 2010
 * rs4588 copyright header changes.
 *
 * SL8.01 7 rs3953 Vlitmano Tue Aug 26 10:54:20 2008
 * RS3953 - Changed a Copyright header?
 *
 * SL8.01 6 rs3953 Vlitmano Mon Aug 18 14:17:50 2008
 * RS3953 - Changed a Copyright from
 * 'Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of 		Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners.'
 *    to
 * 'Copyright ? 2007 Infor. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of Infor and/or related affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners. www.infor.com.'
 *
 * SL8.00 5 RS2968 nkaleel Fri Feb 23 08:05:05 2007
 * changing copyright information(RS2968)
 *
 * SL8.00 4 RS2968 prahaladarao.hs Thu Jul 13 01:04:57 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 3 RS2968 prahaladarao.hs Tue Jul 11 02:17:15 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.LowCharacter (
) RETURNS HighLowCharType
AS
BEGIN
   RETURN NCHAR(0)
END
GO









































































