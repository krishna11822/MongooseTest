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
*   (c) COPYRIGHT 2013 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/


IF NOT EXISTS (SELECT TOP 1 category FROM rep_category WHERE category = N'ESB')
BEGIN
   INSERT INTO rep_category ([category], [description], [IsSystemRecord])
   VALUES(N'ESB', N'Enterprise Service Bus', 1)
END


IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerSecurityUserMasterProcessSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerSecurityUserMasterProcessSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerSecurityUserMasterProcessSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerSecurityUserMasterAcknowledgeSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerSecurityUserMasterAcknowledgeSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerSecurityUserMasterAcknowledgeSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerBODConfirmSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerBODConfirmSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerBODConfirmSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerSecurityRoleMasterSyncSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerSecurityRoleMasterSyncSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerSecurityRoleMasterSyncSp', NULL, 0, 1)
END

GO
