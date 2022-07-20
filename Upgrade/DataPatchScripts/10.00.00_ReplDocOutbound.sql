SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

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

UPDATE ReplDocOutbound
SET DocumentationGenerationEvents = N'Adding or updating Account Authorizations'
where AppliesToIDOMethodName = N'TriggerSecurityPermissionMasterSyncSp'

UPDATE ReplDocOutbound
SET DocumentationGenerationEvents = N'Adding or updating Groups'
where AppliesToIDOMethodName = N'TriggerSecurityRoleMasterSyncSp'

UPDATE ReplDocOutbound
SET DocumentationGenerationEvents = N'Adding or updating Groups'
where AppliesToIDOMethodName = N'TriggerSecurityRoleMasterSyncSp'

GO
