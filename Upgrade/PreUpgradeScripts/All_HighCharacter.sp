SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.HighCharacter') IS NOT NULL
   DROP FUNCTION dbo.HighCharacter
GO
--  This function provides the highest character for comparisons.  It is used
-- when the user has not entered a high value.
--
/* $Header: ApplicationDB\PreTableObjects\HighCharacter.sp 10.8.0.0 10/29/2018 13:51:49 */
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
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/HighCharacter.sp $
 *
 * CoreDev 3 177144 Harroyo Thu Oct 23 07:05:30 2014
 * dbo.HighString not work well in SSRS report
 * Rechecking-in to Issue 177144
 *
 * CoreDev 2 RS73 Harroyo Fri Oct 17 08:59:45 2014
 * NCHAR(65499) largest unicode character
 *
 * CoreDev 1 rs5108 Sxu Mon May 23 02:16:24 2011
 * Copy thisfunctions from SyteLine to Core
 *
 * SL8.02 9 rs4588 Dahn Fri Mar 05 08:01:38 2010
 * rs4588 copyright header changes
 *
 * SL8.01 8 rs3953 Vlitmano Tue Aug 26 10:53:54 2008
 * RS3953 - Changed a Copyright header?
 *
 * SL8.01 7 rs3953 Vlitmano Mon Aug 18 14:17:34 2008
 * RS3953 - Changed a Copyright from
 * 'Copyright ? 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of 		Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners.'
 *    to
 * 'Copyright ? 2007 Infor. All rights reserved. The word and design marks set forth herein are trademarks and/or registered trademarks of Infor and/or related affiliates and subsidiaries. All rights reserved. All other trademarks listed herein are the property of their respective owners. www.infor.com.'
 *
 * SL8.00 6 RS2968 nkaleel Fri Feb 23 07:44:52 2007
 * changing copyright information(RS2968)
 *
 * SL8.00 5 RS2968 prahaladarao.hs Thu Jul 13 01:03:53 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 4 RS2968 prahaladarao.hs Tue Jul 11 01:59:41 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * SL7.05 3 86354 walabran Wed Nov 23 12:46:00 2005
 * vendor with chinese character description error in voucher transaction printing
 * changed NCHAR(377) to NCHAR(1617)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.HighCharacter (
) RETURNS HighLowCharType
AS
BEGIN
--   RETURN NCHAR(1617) --unicode
--  Since HighLowCharType is unicode, it was necessary
-- to replicate for some reason, returning a single
-- character failed comparisons > 'z'.

   RETURN REPLICATE(NCHAR(65499), 4000)
END
GO









































































