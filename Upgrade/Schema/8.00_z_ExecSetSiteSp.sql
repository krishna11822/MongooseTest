DECLARE @site SiteType

SELECT @site = site
FROM parms

EXEC dbo.SetSiteSp @site, null

GO