
IF NOT EXISTS(SELECT 1 FROM AuditLogTypes WHERE MessageType = 6)
INSERT INTO AuditLogTypes
  (MessageType,MessageDesc,Category,FieldName)
  VALUES
  (6,'User Logout','S',NULL)

