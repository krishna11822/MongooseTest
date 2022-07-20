IF NOT EXISTS (SELECT TOP 1 category FROM rep_category WHERE category = N'ESB')
BEGIN
   INSERT INTO rep_category ([category], [description], [IsSystemRecord])
   VALUES(N'ESB', N'Enterprise Service Bus', 1)
END

IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'SendEntireBodSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'SendEntireBodSp', 2,
      NULL , 1, 0, 0, 0,
      N'SendEntireBodSp', NULL, 0, 1)
END
IF NOT EXISTS(SELECT TOP 1 category FROM rep_object_category  
   WHERE category = N'ESB'
   AND object_name = N'TriggerPulseNotificationSyncSp'
   AND object_type = 2)
BEGIN
   INSERT INTO rep_object_category ([category], [object_name], [object_type],
      [filter], [IsSystemRecord], [skip_delete], [skip_update], [skip_insert],
      [to_object_name], [insert_from_view], [skip_method], [retain_site])
   VALUES (N'ESB', N'TriggerPulseNotificationSyncSp', 2,
      NULL , 1, 0, 0, 0,
      N'TriggerPulseNotificationSyncSp', NULL, 0, 1)
END

