﻿-- Translation tools: CountryPack Info Script
-- File generated by ndies on Friday, April 10, 2020; Version 2020.5.0.3.

SET NOCOUNT ON 
 
IF EXISTS (SELECT 1 FROM CountryPack WHERE [Option] = N'T' And [Name] = N'th-TH') 
BEGIN 
    UPDATE [CountryPack] SET [Version] = N'2020.5.0.3.'  
    WHERE [Option] = N'T' And [Name] = N'th-TH' 
END 
ELSE 
BEGIN 
    INSERT INTO [CountryPack] ([Option], [Name], [Description], [Version]) 
    VALUES (N'T', N'th-TH', N'Thai (Thailand)', N'2020.5.0.3.')  
END 
GO
