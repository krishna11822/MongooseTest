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



IF NOT EXISTS (SELECT TOP 1 category FROM rep_category WHERE category = N'ION')
BEGIN
   INSERT INTO rep_category ([category], [description], [IsSystemRecord])
   VALUES(N'ION', N'Intelligent Open Network', 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ION'
   AND object_name = N'FlushBusCacheForSiteSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ION', N'FlushBusCacheForSiteSp', 2,
      NULL , 1, 0, 0, 0,
      N'FlushBusCacheForSiteSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ION'
   AND object_name = N'FlushBusParmsForSiteSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ION', N'FlushBusParmsForSiteSp', 2,
      NULL , 1, 0, 0, 0,
      N'FlushBusParmsForSiteSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ION'
   AND object_name = N'SendEntireBodSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ION', N'SendEntireBodSp', 2,
      NULL , 1, 0, 0, 0,
      N'SendEntireBodSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ION'
   AND object_name = N'TriggerPulseNotificationSyncSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ION', N'TriggerPulseNotificationSyncSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerPulseNotificationSyncSp', NULL, 0, 1)
END

IF NOT EXISTS (SELECT TOP 1 category FROM rep_category WHERE category = N'Site Admin')
BEGIN
   INSERT INTO rep_category ([category], [description], [IsSystemRecord])
   VALUES(N'Site Admin', N'Site Admin', 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'EmailType'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'EmailType', 1,
      NULL , 1, 0, 0, 0,
      N'EmailType', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'intranet'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'intranet', 1,
      NULL , 1, 0, 0, 0,
      N'intranet', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'IntranetSharedTable'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'IntranetSharedTable', 1,
      NULL , 1, 0, 0, 0,
      N'IntranetSharedTable', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'PasswordParameters'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'PasswordParameters', 1,
      NULL , 1, 0, 0, 0,
      N'PasswordParameters', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'DefineVariableSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'DefineVariableSp', 2,
      NULL , 1, 0, 0, 0,
      N'DefineVariableSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'site'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'site', 1,
      NULL , 1, 0, 0, 0,
      N'site', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'site_group'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'site_group', 1,
      NULL , 1, 0, 0, 0,
      N'site_group', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'site_hierarchy'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'site_hierarchy', 1,
      NULL , 1, 0, 0, 0,
      N'site_hierarchy', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'site_link_info'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'site_link_info', 1,
      NULL , 1, 0, 0, 0,
      N'site_link_info', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'system_type'
   AND object_type = 1)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'system_type', 1,
      NULL , 1, 0, 0, 0,
      N'system_type', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'UpdateAllTablesSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'UpdateAllTablesSp', 2,
      NULL , 1, 0, 0, 0,
      N'UpdateAllTablesSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'Site Admin'
   AND object_name = N'UserNamesRemoteUpdateSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'Site Admin', N'UserNamesRemoteUpdateSp', 2,
      NULL , 1, 0, 0, 0,
      N'UserNamesRemoteUpdateSp', NULL, 0, 1)
END


GO