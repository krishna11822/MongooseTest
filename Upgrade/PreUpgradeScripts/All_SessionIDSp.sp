SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF OBJECT_ID('dbo.SessionIDSp') IS NOT NULL
    DROP FUNCTION dbo.SessionIDSp
GO
--  This routine returns a session attribute UNIQUEIDENTIFIER value.  It must
-- have previously been set via the InitSessionSp routine.

/* $Header: ApplicationDB\PreTableObjects\SessionIDSp.sp 10.8.0.0 10/29/2018 13:51:49 */

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

/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/SessionIDSp.sp $
 *
 * CoreDev 6 rs4588 Dahn Mon Mar 08 08:06:25 2010
 * rs4588 copyright header changes.
 *
 * CoreDev 5 rs3953 Dahn Tue Aug 26 16:49:57 2008
 * changing copyright header(rs3953)
 *
 * CoreDev 4 rs3953 Vlitmano Mon Aug 18 15:57:16 2008
 * Changed a Copyright header information(RS3959)
 *
 * $NoKeywords: $
 */
CREATE FUNCTION dbo.SessionIDSp()
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
DECLARE
  @ID UNIQUEIDENTIFIER

SELECT @ID = SessionID
FROM SessionContextNames
WHERE ProcessID = @@spid
--  No session ID has been set, query analyzer work is often like this.
IF @@ROWCOUNT = 0
SELECT @ID = '00000000-0000-0000-0000-000000000000'

RETURN @ID
END
GO

