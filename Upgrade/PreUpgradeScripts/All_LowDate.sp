SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.LowDate') IS NOT NULL
   DROP FUNCTION dbo.LowDate
GO
--  This function provides the lowest Date for comparisons.  It is used
-- when the user has not entered a low value.
--
/* $Header: ApplicationDB\PreTableObjects\LowDate.sp 10.1.0.1 03/30/2018 14:27:32 */
/*
Copyright � 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/* $Archive: /Tools/SQLScripts/ApplicationDB/PreTableObjects/LowDate.sp $
 *
 * SL8.00 7 RS2968 nkaleel Fri Feb 23 08:05:07 2007
 * changing copyright information(RS2968)
 *
 * SL8.00 6 RS2968 prahaladarao.hs Thu Jul 13 01:04:59 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 4 RS2968 prahaladarao.hs Tue Jul 11 02:17:16 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.LowDate (
) RETURNS CurrentDateType
AS
BEGIN
   RETURN CONVERT(DATETIME, '1753-01-01', 121)
END
GO




















































































