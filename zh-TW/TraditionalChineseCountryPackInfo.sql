-- Translation tools: CountryPack Info Script

SET NOCOUNT ON 
 
IF EXISTS (SELECT 1 FROM CountryPack WHERE [Option] = N'T' And [Name] = N'zh-TW') 
BEGIN 
    UPDATE [CountryPack] SET [Version] = N'Mongoose2021.09'  
    WHERE [Option] = N'T' And [Name] = N'zh-TW' 
END 
ELSE 
BEGIN 
    INSERT INTO [CountryPack] ([Option], [Name], [Description], [Version]) 
    VALUES (N'T', N'zh-TW', N'Chinese (Traditional, Taiwan)', N'Mongoose2021.09')  
END 
GO
