

IF NOT EXISTS(SELECT 1 FROM AuditLogTypes WHERE MessageType = 5)
INSERT INTO AuditLogTypes
  (MessageType,MessageDesc,Category,FieldName)
  VALUES
  (5,'User Login Failure','S',NULL)

