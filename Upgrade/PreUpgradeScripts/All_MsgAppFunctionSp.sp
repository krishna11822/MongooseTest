SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('dbo.MsgAppFunctionSp') IS NOT NULL
   DROP FUNCTION dbo.MsgAppFunctionSp
GO

/* $Header: ApplicationDB\PreTableObjects\MsgAppFunctionSp.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/MsgAppFunctionSp.sp $
 *
 * CoreDev 6 rs4588 Dahn Mon Mar 08 08:05:56 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 5 rs3953 Dahn Tue Aug 26 16:49:30 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 4 rs3953 Vlitmano Mon Aug 18 15:56:50 2008
 * Changed a Copyright header information(RS3959)
 *
 * SL8.00 5 RS2968 nkaleel Thu Feb 08 04:22:39 2007
 * changing copyright information
 *
 * SL8.00 4 RS2968 prahaladarao.hs Thu Jul 13 01:05:26 2006
 * RS 2968, Name change CopyRight Update.
 *
 * SL8.00 3 RS2968 prahaladarao.hs Tue Jul 11 02:17:51 2006
 * RS 2968
 * Name change CopyRight Update.
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.MsgAppFunctionSp (
  @Infobar InfobarType
, @BaseMsg InfobarType
, @Parm1   InfobarType = ''
, @Parm2   InfobarType = ''
, @Parm3   InfobarType = ''
, @Parm4   InfobarType = ''
, @Parm5   InfobarType = ''
, @Parm6   InfobarType = ''
, @Parm7   InfobarType = ''
, @Parm8   InfobarType = ''
, @Parm9   InfobarType = ''
, @Parm10  InfobarType = ''
, @Parm11  InfobarType = ''
, @Parm12  InfobarType = ''
, @Parm13  InfobarType = ''
, @Parm14  InfobarType = ''
, @Parm15  InfobarType = ''
) RETURNS InfobarType
AS
BEGIN
DECLARE
  @LocalInfo         Infobar
, @Severity          INT
, @MessageLanguage   MessageLanguageType

SET @Severity = 0

-- Get language from session variable, if session variable doesn't exist, use English
set @MessageLanguage = IsNull(dbo.DefinedValue(N'MessageLanguage'), N'1033') 


SELECT
  @LocalInfo = ams.MessageText
, @Severity = omm.MessageSeverity
FROM ObjectMainMessages AS omm
INNER JOIN ApplicationMessages AS ams ON
  ams.MessageNo = omm.MessageNo
AND ams.MessageLanguage = @MessageLanguage
WHERE omm.MessageType = 5
AND omm.ObjectName = @BaseMsg

if @MessageLanguage <> N'1033' and @LocalInfo IS NULL
BEGIN
   -- Try for English version of message
   Set @MessageLanguage = N'1033'
   SELECT
     @LocalInfo = ams.MessageText
   , @Severity = omm.MessageSeverity
   FROM ObjectMainMessages AS omm
   INNER JOIN ApplicationMessages AS ams ON
     ams.MessageNo = omm.MessageNo
   AND ams.MessageLanguage = @MessageLanguage
   WHERE omm.MessageType = 5
   AND omm.ObjectName = @BaseMsg
END 
-- Neither English version nor translated version exists.
IF @LocalInfo IS NULL
BEGIN
   SET @Infobar = 'Base message [' + @BaseMsg + '] is not defined.'
   SET @Severity = 16
   GOTO ERROR_OUT
END

IF ISNULL(@Parm1, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm1, '&1')

IF ISNULL(@Parm2, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm2, '&2')

IF ISNULL(@Parm3, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm3, '&3')

IF ISNULL(@Parm4, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm4, '&4')

IF ISNULL(@Parm5, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm5, '&5')

IF ISNULL(@Parm6, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm6, '&6')

IF ISNULL(@Parm7, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm7, '&7')

IF ISNULL(@Parm8, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm8, '&8')

IF ISNULL(@Parm9, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm9, '&9')

IF ISNULL(@Parm10, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm10, '&A')

IF ISNULL(@Parm11, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm11, '&B')

IF ISNULL(@Parm12, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm12, '&C')

IF ISNULL(@Parm13, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm13, '&D')

IF ISNULL(@Parm14, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm14, '&E')

IF ISNULL(@Parm15, 'A') <> NCHAR(1)
    SET @LocalInfo = dbo.MsgAppSubSp (@LocalInfo, @Parm15, '&F')

IF @Infobar IS NOT NULL AND @Infobar <> ''
    SET @Infobar = @Infobar + NCHAR(13) + NCHAR(10) + NCHAR(13) + NCHAR(10)
SET @LocalInfo = ISNULL (@Infobar, '') +  ISNULL (@LocalInfo, ' ')

ERROR_OUT:

RETURN @LocalInfo
END
GO

