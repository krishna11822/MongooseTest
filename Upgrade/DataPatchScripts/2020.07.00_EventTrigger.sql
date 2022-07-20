-- Unique-ize RowPointers in PurgeHistoryData Event State metadata
DECLARE @EventTriggerId uniqueidentifier
SET @EventTriggerId = 'FF58ED59-61D3-481F-A50E-71362931D280'
 
-- Disable EventTriggerParameter_mstIup Trigger:
DECLARE
   @SavedState LongListType
  , @Infobar InfobarType
 
EXEC dbo.SetTriggerStateSp 0, 1, 0, @SavedState OUTPUT, @Infobar OUTPUT
 
-- Loop through each Site:
DECLARE c CURSOR LOCAL STATIC
FOR
SELECT SiteRef
FROM EventTrigger_mst et
WHERE et.RowPointer = @EventTriggerId

OPEN c
WHILE 1=1
BEGIN
   DECLARE @SiteRef SiteType
   FETCH c INTO @SiteRef
   IF @@FETCH_STATUS < 0
      BREAK
 
   -- Create a new RowPointer for each Site:
   DECLARE @ETRP RowPointerType
   SET @ETRP = NEWID()
 
   UPDATE etp SET EventTriggerRowPointer = @ETRP
   --select *
   FROM EventTriggerParameter_mst etp
   WHERE EventTriggerRowPointer = @EventTriggerId
   AND SiteRef = @SiteRef
 
   UPDATE et SET RowPointer = @ETRP
   --select *
   FROM EventTrigger_mst et
   WHERE RowPointer = @EventTriggerId
   AND SiteRef = @SiteRef
END
CLOSE c
DEALLOCATE c
 
EXEC dbo.RestoreTriggerStateSp 0, @SavedState, @Infobar OUTPUT
 
GO