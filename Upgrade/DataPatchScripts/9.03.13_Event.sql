SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: ApplicationDB\DataPatchScripts\Event.sql 10.0.2.0 02/23/2018 15:32:22 */
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
*
*/
/* Events */

-- RS8196
IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'TaskOnPerform')
   DELETE Event WHERE EventName = N'TaskOnPerform'

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'TaskOnPerform', N'Core', 1, 0, 0, N'Occurs when a Task is performed')

IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'TaskPostPerform')
   DELETE Event WHERE EventName = N'TaskPostPerform'

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'TaskPostPerform', N'Core', 1, 0, 0, N'Occurs after a Task is performed')
   
IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'TaskOnPerformFailed')
   DELETE Event WHERE EventName = N'TaskOnPerformFailed'

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'TaskOnPerformFailed', N'Core', 1, 0, 0, N'Occurs when a Task fails to be performed')
   
