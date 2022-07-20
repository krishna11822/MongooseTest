-- RS-9027
-- Set "AllowUpload" for almost all file types
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
   --New types needed by Mongoose
   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'sql')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'sql', N'sql', N'application/octet-stream',1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'map')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'map', N'map', N'application/octet-stream',1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'iac')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'iac', N'iac',N'application/octet-stream',1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'iads')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'iads', N'iads', N'application/octet-stream',1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'iap')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'iap', N'iap', N'application/octet-stream',1)

   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'component')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active) VALUES (N'component', N'component', N'application/octet-stream',1)


   --Update AllowUpload
   --Allow file types EXCEPT the "dangerous" ones
   --For a list of "dangerous" types, check out FileValidation.cs
   --This IF stmt is so we don't overwrite any user settings.
   IF (SELECT [AllowUpload] FROM [MediaType] WHERE [DocumentExtension] = N'jpg') IS NULL
   BEGIN
      DECLARE @FORBIDDEN TABLE (name NVARCHAR(32));
      INSERT @FORBIDDEN(name) VALUES ('%'),('~');                 -- x-trash
      INSERT @FORBIDDEN(name) VALUES ('exe'),('dll'),('com');
      INSERT @FORBIDDEN(name) VALUES ('sys'),('drv'),('pif');
      INSERT @FORBIDDEN(name) VALUES ('ocx'),('cab'),('msi'),('msc'),('iso');
      INSERT @FORBIDDEN(name) values ('so'), ('elf'),('dmg');
      INSERT @FORBIDDEN(name) VALUES ('manifest'),('website'),('local');
      INSERT @FORBIDDEN(name) VALUES ('url'),('hta');
      INSERT @FORBIDDEN(name) VALUES ('swf'),('swfl'),('spl');
      INSERT @FORBIDDEN(name) VALUES ('php'),('php3'),('php3p'),('php4'),('php5'),('phps'),('phpt'),('phtml');

      UPDATE [MediaType] SET [AllowUpload] = 0 WHERE DocumentExtension     IN (SELECT * FROM @FORBIDDEN)
      UPDATE [MediaType] SET [AllowUpload] = 1 WHERE DocumentExtension NOT IN (SELECT * FROM @FORBIDDEN)
   END
   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
