-- RS-9069
-- Add system process default number 77
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
   IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 77)
   INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (77, N'REST Token Lifetime (sec)')
   
   -- INSERT YOUR CODE HERE

   SET @SiteList = SUBSTRING(@SiteList, CHARINDEX(',', @SiteList) + 1, LEN(@SiteList)); 
END

GO
