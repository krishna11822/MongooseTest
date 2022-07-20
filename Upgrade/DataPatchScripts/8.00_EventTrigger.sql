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
*   (c) COPYRIGHT 2012 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
Declare @Site SiteType

IF OBJECT_ID('dbo.parms_mst') IS NOT NULL 
BEGIN
	SELECT
	@Site = site
	FROM parms_mst
	WHERE parm_key = 0
END
ELSE
BEGIN
	SELECT
	@Site = site
	FROM parms
	WHERE parm_key = 0
END

DECLARE @Infobar InfobarType
SET @Infobar = NULL
EXEC SetSiteSp @Site, @Infobar=@Infobar OUTPUT
GO

IF NOT EXISTS (SELECT 1
  FROM EventTrigger
  WHERE EventTriggerId = 'BE21ABA2-AC91-45CE-B3C2-4DFA85E644B9')
INSERT INTO EventTrigger (EventName, EventTriggerId, AccessAs, RequestedBy, ConfigurationName, Active, Condition, FailureRetestInterval, SuccessRetestInterval, Transactional)
VALUES (N'TaskListCheck', 'BE21ABA2-AC91-45CE-B3C2-4DFA85E644B9', N'Core', N'sa', NULL, 1, 'CONDITION(TRUE)', 60, 60, 1)
ELSE
BEGIN
    UPDATE EventTrigger SET EventTriggerID = RowPointer
    UPDATE EventTrigger SET RowPointer = NEWID()
END
GO
