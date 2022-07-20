-- RS-9027
-- add yet more Infor types
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
   --New types needed by Infor

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'ionapi')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active, AllowUpload) VALUES (N'ionapi', N'ionapi', N'application/octet-stream', 1, 1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'der')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active, AllowUpload) VALUES (N'der', N'der', N'application/x-x509-ca-cert', 1, 1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'pfx')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active, AllowUpload) VALUES (N'pfx', N'pfx', N'application/x-pkcs12', 1, 1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'p12')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active, AllowUpload) VALUES (N'p12', N'p12', N'application/x-pkcs12', 1, 1)

   --below is needed because of goofy custom "MediaTypeInsert" trigger seems to leave [AllowUpload] as null
   DECLARE @ALLOWLIST TABLE (name NVARCHAR(32));
   INSERT @ALLOWLIST(name) VALUES ('ionapi'),('der'),('pfx'),('p12');
   UPDATE [MediaType] SET [AllowUpload] = 1 WHERE DocumentExtension IN (SELECT * FROM @ALLOWLIST)
   
   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
