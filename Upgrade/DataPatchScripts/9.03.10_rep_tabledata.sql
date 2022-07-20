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
   AND object_name = N'TriggerSecurityPermissionMasterSyncSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerSecurityPermissionMasterSyncSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerSecurityPermissionMasterSyncSp', NULL, 0, 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerSecurityUserMasterSyncSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerSecurityUserMasterSyncSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerSecurityUserMasterSyncSp', NULL, 0, 1)
END

-- If there are any ION category objects that do not exist in ESB put them into ESB.

INSERT INTO rep_object_category (category, object_name, object_type, filter, InWorkflow, IsSystemRecord, skip_delete, skip_update, 
skip_insert, to_object_name, insert_from_view, skip_method, retain_site)
SELECT 'ESB', object_name, object_type, filter, InWorkflow, IsSystemRecord, skip_delete, skip_update, 
skip_insert, to_object_name, insert_from_view, skip_method, retain_site
FROM rep_object_category r1
WHERE NOT EXISTS (SELECT 1
FROM rep_object_category r2
WHERE r2.category = 'ESB'
AND r2.object_name = r1.object_name)
AND r1.category = 'ION'

-- If there are any rules using ION, make an equivalent rule using ESB, if it does not already exist.
INSERT INTO rep_rule (source_site, target_site, category, description, conflict_res_workflow, interval_type, interval_count, update_all_columns, disable_repl )
SELECT source_site, target_site, 'ESB', description, conflict_res_workflow, interval_type, interval_count, update_all_columns, disable_repl
FROM rep_rule r1
WHERE r1.category = 'ION'
AND NOT EXISTS (SELECT 1
FROM rep_rule r2
WHERE r2.source_site = r1.source_site
and r2.target_site = r2.target_site
and r2.category = 'ESB')


-- Now that ESB contains everything from ION and there is an ESB rule for every ION rule, delete the ION rules.
DELETE rep_rule
WHERE category = 'ION';

DISABLE TRIGGER ALL ON rep_object_category

DELETE rep_object_category
WHERE category = 'ION';

ENABLE TRIGGER ALL ON rep_object_category;

DISABLE TRIGGER ALL ON rep_category
DELETE rep_category
WHERE category = 'ION';
ENABLE TRIGGER ALL ON rep_category



GO
