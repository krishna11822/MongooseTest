/*8.03 RS 5007 DataPatch Script
 *Create UserEmail View In all Non Master Sites Pointing to the Master Site
 *if Shared site
 */

DECLARE 
@Severity                        int
,@MasterSite                     SiteType 
,@DatabaseName                   SYSNAME    
,@Shared                         INT
,@IntranetName                   IntranetNameType
,@CurSite                        SiteType 
,@TableName                      TableNameType
,@LinkedServerNameFromMaster     OSLocationType
,@LinkedServerNameFromUsingSite  OSLocationType
,@CurSiteAppDB                   OSLocationType
,@Sqlstr                         Nvarchar(4000)
,@Sqlstr2                        Nvarchar(4000)
,@IsTableExist                   SYSNAME
,@IsViewExist                    SYSNAME
,@MasterSiteAppDB                OSLocationType


DECLARE @TableList AS TABLE
(
TableName TableNameType
)
INSERT INTO @TableList (TableName) Values ('UserEmail')

IF NOT EXISTS (SELECT 1 FROM IntranetSharedUserTableDefault WHERE TableName = 'UserEmail')
INSERT INTO IntranetSharedUserTableDefault 
  (TableName, UserIdColumnName, GroupIdColumnName, Shareable, UpdateRefId)
   VALUES ('UserEmail', NULL, Null, 1, 0) 

--If UserNames Table is shared UserEmail Should also be shared
SELECT @Shared = Shared FROM IntranetSharedUserTable WHERE Tablename = 'UserNames'
SET @DatabaseName = DB_NAME()

SELECT top 1 @MasterSite = mastersite
           , @IntranetName = intranet.intranet_name 
           , @MasterSiteAppDB = site.app_db_name
  from intranet join site on mastersite = site 
  where app_db_name = @DatabaseName 
  
  
IF @Shared = 0 Or @MasterSite IS NULL
  RETURN

DECLARE SiteCursor CURSOR FOR 
 SELECT LTRIM(RTRIM(Site)), LTRIM(RTRIM(App_db_name)), LTRIM(RTRIM(TableName))
   FROM site 
   JOIN @TableList On 1 = 1 
  WHERE Intranet_name = @IntranetName
    AND Site <> @MasterSite
  ORDER BY Site

OPEN SiteCursor

WHILE 1 = 1 
BEGIN
  FETCH NEXT FROM SiteCursor 
   INTO @CurSite, @CurSiteAppDB, @TableName
  IF @@FETCH_STATUS <> 0 
    BREAK
    
  SELECT @LinkedServerNameFromMaster = LTRIM(linked_server_name)
    FROM site_link_info WHERE from_site = @MasterSite  AND to_site = @CurSite 

  SELECT @LinkedServerNameFromUsingSite = LTRIM(linked_server_name)
    FROM site_link_info WHERE from_site = @CurSite  AND to_site = @MasterSite    

  --Create view for table in using site
  SET @IsViewExist = Null
  SET @Sqlstr = 'Select @IsViewExist = name from ['+ @LinkedServerNameFromMaster+'].['+ @CurSiteAppDB +'].dbo.sysobjects ' 
              + 'where xtype=''V'' and name ='''+ @TableName +''''
  SET @Severity = 0
  EXEC @severity = sp_executesql @Sqlstr,N'@IsViewExist SysName OUTPUT',@IsViewExist = @IsViewExist OUTPUT
  IF @severity <> 0
  BEGIN
    ROLLBACK TRANSACTION
    RETURN 
  END

  IF @IsViewExist IS NULL
  BEGIN
    SET @Sqlstr= 'Create View ' + @TableName + '1 as Select * from [' 
               + @LinkedServerNameFromUsingSite +'].['+ @MasterSiteAppDB +']'+'.dbo.'+ @TableName
    SET @Sqlstr2 = 'Execute ['+ @LinkedServerNameFromMaster + '].[' + @CurSiteAppDB + ']'
                   + '.dbo.IntranetRemoteScriptSp @Parm1Value = @Sqlstr'
    SET @Severity = 0

    EXEC @severity = Sp_executesql @Sqlstr2,N'@Sqlstr nvarchar(4000)', @Sqlstr = @Sqlstr
    IF @severity <> 0
    BEGIN
      ROLLBACK TRANSACTION
      RETURN 
    END
  END

  --Updating the Porcessed Status  
  SET @Sqlstr= 'IF NOT EXISTS (SELECT 1 FROM intranetsharedtable WHERE TableName = ' + @TableName + ') '
                 + 'INSERT INTO intranetsharedtable (intranet_name, TableName, Shared, Processed) '
                       + 'VALUES (''' + @intranetname + ''' , ''' + @tablename + ''',  1, 1) '
             + 'ELSE ' 
                + 'UPDATE intranetsharedtable SET Shared = 1 ,Processed = 1 '
                + 'WHERE intranet_name = ''' + @IntranetName + ''' and TableName = ''' + @TableName + ''''
  SET @Sqlstr2 = 'Execute ['+ @LinkedServerNameFromMaster + '].[' + @CurSiteAppDB + ']'
               + '.dbo.IntranetRemoteScriptSp @Parm1Value = @Sqlstr'
  SET @Severity = 0

  EXEC @severity = Sp_executesql @Sqlstr2,N'@Sqlstr nvarchar(4000)', @Sqlstr = @Sqlstr
  
  
  --Updating the Porcessed Status current master Site 'This will fire for each site 
  SET @Sqlstr= 'IF NOT EXISTS (SELECT 1 FROM IntranetSharedUserTable WHERE TableName = ''' + @TableName + ''') '
                 + 'INSERT INTO IntranetSharedUserTable (intranet_name, TableName, Shared, Processed) '
                       + 'VALUES (''' + @intranetname + ''' , ''' + @tablename + ''',  1, 1) '
             + 'ELSE ' 
                + 'UPDATE IntranetSharedUserTable SET Shared = 1 ,Processed = 1 '
                + 'WHERE intranet_name = ''' + @IntranetName + ''' and TableName = ''' + @TableName + ''''
  EXEC @severity = Sp_executesql @Sqlstr
  
END  


CLOSE SiteCursor
DEALLOCATE SiteCursor
RETURN
  

