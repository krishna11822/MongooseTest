SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF object_id('dbo.SetSiteSp') IS NOT NULL
   DROP PROCEDURE dbo.SetSiteSp
GO

/* $Header: ApplicationDB\Stored Procedures\SetSiteSp.sp 10.1.0.1 03/30/2018 14:27:37 */
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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/SetSiteSp.sp $
 *
 * CoreDev 4 204810 Mmarsolo Fri Dec 04 10:38:21 2015
 * SetSiteSp returns sql error when passing in NULL site
 * 204810 - Set CONTEXT_INFO = NULL if a NULL site value is passed into the Sp. 
 *
 * CoreDev 3 RS5905 Djohnson Thu Feb 07 15:03:49 2013
 * Tweak len of space.
 *
 * CoreDev 2 RS5905 Djohnson Mon Feb 04 10:51:42 2013
 * RS5905 - blank pad the context info value to displace the zeros with blanks.
 *
 * CoreDev 1 RS5905 Djohnson Thu Dec 13 09:50:41 2012
 * RS5905
 *
 * $NoKeywords: $
 */
--  Set the site for the current spid.
CREATE PROCEDURE dbo.SetSiteSp (
  @Site    SiteType
, @Infobar InfobarType   OUTPUT
)
AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_SetSiteSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_SetSiteSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      EXEC @EXTGEN_SpName
        @Site
      , @Infobar OUTPUT
 
      -- ETP routine must take over all desired functionality of this standard routine:
      RETURN 0
   END
   -- End of Generic External Touch Point code.

DECLARE
  @Context VARBINARY(128)
, @PadSite NCHAR(8)

IF @Site IS NULL
BEGIN
   SET CONTEXT_INFO 0x
END
ELSE
BEGIN
   SET @PadSite = @Site + SPACE(8)
   SET @Context = CAST(@PadSite AS VARBINARY(128))
   SET CONTEXT_INFO @Context
END
RETURN 0
GO
