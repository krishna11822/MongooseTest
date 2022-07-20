SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Declare
@SiteList  NVARCHAR(max),
@SiteRef   SiteType,
@Infobar InfoBarType

-- Build the list of Sites in this Database
SELECT @SiteList = COALESCE(@SiteList+',', '') + site
FROM parms_mst

SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
    SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
    
	EXEC [dbo].[SetSiteSp] @SiteRef, @Infobar OUTPUT

	-- PurgeHistoryData Event State
	DECLARE @EHRP uniqueidentifier
	SET @EHRP = 'FF58ED59-61D3-481F-A50E-71362931D280'
	IF NOT EXISTS (SELECT 1
	  FROM EventTrigger
	  WHERE EventTriggerId = @EHRP)
	INSERT INTO EventTrigger (EventName, EventTriggerId, RowPointer, AccessAs, RequestedBy, ConfigurationName, Active, Condition, FailureRetestInterval, SuccessRetestInterval, Transactional)
	VALUES (N'PurgeHistoryData', @EHRP, @EHRP, N'Core', N'sa', NULL, 0, 'CONDITION(TRUE)', 86400, 86400, 1)

	--Event parameters PurgeDBMethodToCall
	IF NOT EXISTS (SELECT 1
	  FROM EventTriggerParameter
	  WHERE EventTriggerRowPointer = @EHRP AND [Name] = N'PurgeDBMethodToCall')
	INSERT INTO EventTriggerParameter (EventTriggerRowPointer, [Name], [Value], NoteExistsFlag )
	VALUES (@EHRP, N'PurgeDBMethodToCall', N'PurgeEventDataSp', 0)

	--Event parameters DaysOld
	IF NOT EXISTS (SELECT 1
	  FROM EventTriggerParameter
	  WHERE EventTriggerRowPointer = @EHRP AND [Name] = N'DaysOld')
	INSERT INTO EventTriggerParameter (EventTriggerRowPointer, [Name], [Value], NoteExistsFlag )
	VALUES (@EHRP, N'DaysOld', N'30', 0)

	SET @SiteList = 
      SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList)); 

END
GO
