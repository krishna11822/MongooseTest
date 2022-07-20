-- Add yet more file types...
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
   IF NOT EXISTS (SELECT 1 FROM MediaType WHERE DocumentExtension = N'jks')
   INSERT INTO MediaType (DocumentExtension, BlobFormat, MediaType, Active, AllowUpload) VALUES (N'jks', N'jks', N'application/octet-stream', 1, 1)

   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
