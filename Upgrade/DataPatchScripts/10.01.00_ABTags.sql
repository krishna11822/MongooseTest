DECLARE @guid UNIQUEIDENTIFIER

IF NOT EXISTS (SELECT 1 FROM ABTags WHERE ProjectId = '00000000-0000-0000-0000-000000000000' AND Name = 'HP Widget' AND Runtime = 0)
BEGIN
   SET @guid = NEWID()
   INSERT INTO ABTags (Id, ProjectId, Runtime, Name, IsSystemRecord)
   VALUES (@guid, '00000000-0000-0000-0000-000000000000', 0, 'HP Widget', 1)
END

IF NOT EXISTS (SELECT 1 FROM ABTags WHERE ProjectId = '00000000-0000-0000-0000-000000000000' AND Name = 'Desktop App' AND Runtime = 0)
BEGIN
   SET @guid = NEWID()
   INSERT INTO ABTags (Id, ProjectId, Runtime, Name, IsSystemRecord)
   VALUES (@guid, '00000000-0000-0000-0000-000000000000', 0, 'Desktop App', 1)
END

IF NOT EXISTS (SELECT 1 FROM ABTags WHERE ProjectId = '00000000-0000-0000-0000-000000000000' AND Name = 'Mobile App' AND Runtime = 0)
BEGIN
   SET @guid = NEWID()
   INSERT INTO ABTags (Id, ProjectId, Runtime, Name, IsSystemRecord)
   VALUES (@guid, '00000000-0000-0000-0000-000000000000', 0, 'Mobile App', 1)
END

IF NOT EXISTS (SELECT 1 FROM ABTags WHERE ProjectId = '00000000-0000-0000-0000-000000000000' AND Name = 'HP Banner Widget' AND Runtime = 0)
BEGIN
   SET @guid = NEWID()
   INSERT INTO ABTags (Id, ProjectId, Runtime, Name, IsSystemRecord)
   VALUES (@guid, '00000000-0000-0000-0000-000000000000', 0, 'HP Banner Widget', 1)
END
