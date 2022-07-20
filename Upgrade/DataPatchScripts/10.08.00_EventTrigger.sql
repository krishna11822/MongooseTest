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
	
IF NOT EXISTS (SELECT 1
  FROM EventTrigger
  WHERE EventTriggerId = 'B8429D4E-E3D1-4F97-83F7-5470CB829C5E')
INSERT INTO EventTrigger (EventName, EventTriggerId, AccessAs, RequestedBy, ConfigurationName, Active, Condition, FailureRetestInterval, SuccessRetestInterval, Transactional)
VALUES (N'ClearServiceSessions', 'B8429D4E-E3D1-4F97-83F7-5470CB829C5E', N'Core', N'sa', NULL, 1, 'CONDITION(TRUE)', 86400, 86400, 1)
    
	SET @SiteList = 
      SUBSTRING(@SiteList, CHARINDEX(',',@SiteList) + 1, LEN(@SiteList)); 

END
GO
