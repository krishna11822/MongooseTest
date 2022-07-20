-- Replication Document now obsolete: SecurityExternalEntityUserMaster
-- Replaced by SecurityExternalUserMaster (no Entity)
-- RS-9097
--
Declare
   @SiteList  NVARCHAR(max),
   @SiteRef   SiteType,
   @Infobar   InfoBarType
-- Build the list of Sites in this Database
SELECT @SiteList = COALESCE(@SiteList+',', '') + site FROM parms_mst
SET @SiteList += ','

WHILE CHARINDEX(',',@SiteList) > 0
BEGIN
   SET @SiteRef = SUBSTRING(@SiteList,0, CHARINDEX(',',@SiteList))
   EXEC [dbo].[SetSiteSp] @SiteRef, @Infobar OUTPUT

   -- INSERT YOUR CODE HERE

DELETE f FROM ReplDocOutboundFilter f JOIN ReplDocOutbound o ON f.ReplDocOutboundRowPointer = o.RowPointer WHERE o.DocumentName = 'SecurityExternalEntityUserMaster'
AND o.AccessAs = 'Core'
DELETE FROM ReplDocOutbound WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocInbound WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocAttribute WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocElement WHERE DocumentName = 'SecurityExternalEntityUserMaster'  AND AccessAs = 'Core'
DELETE FROM ReplDocument WHERE DocumentName = 'SecurityExternalEntityUserMaster' AND AccessAs = 'Core'


   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList));
END

GO
