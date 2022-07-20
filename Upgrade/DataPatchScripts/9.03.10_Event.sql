SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.03.10_Event.sql 1     8/02/17 1:08p Jmorris $ */
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
*   (c) COPYRIGHT 2016 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*
* R.Shilts 10-Feb-2017
* Issue 224315- add event AssignUserToLicenseModule
*
*
*/
/* Events */

-- A feature to send alert into ION
IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'GenericSendPulseAlertBOD')
   DELETE Event WHERE EventName = N'GenericSendPulseAlertBOD' 

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'GenericSendPulseAlertBOD', N'Core', 0, 0, 0, N'Send an alert to ION')   

-- Event to assign admin licence module to user
IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'AssignUserToAdminLicenseModule')
   DELETE Event WHERE EventName = N'AssignUserToAdminLicenseModule'

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'AssignUserToAdminLicenseModule', N'Core', 0, 0, 0, N'Event to assign admin licence module')

-- Event to assign named licence module to user
IF EXISTS (SELECT 1 FROM Event WHERE EventName = N'AssignUserToLicenseModule')
   DELETE Event WHERE EventName = N'AssignUserToLicenseModule'

INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'AssignUserToLicenseModule', N'Core', 0, 0, 0, N'Assign named user to named module')
