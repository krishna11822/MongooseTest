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
   IF NOT EXISTS(SELECT 1 FROM DocumentType WHERE DocumentType = N'AttachedImage')
      INSERT INTO DocumentType ([DocumentType]
         ,[Description]
         ,[StorageMethod]
         ,[LogicalFolderName]
         ,[UseServerPathAsRootPath]
         ,[AutoPopulate]
         ,[PopulationDepth]
         ,[CreateFolderIfNotExists])
      VALUES (N'AttachedImage',N'This is a predefined document type',N'D',N'default', 0, 0, 0, 0 )
    
   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
