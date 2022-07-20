﻿-- Translation tools: CountryPack Info Script
-- File generated by ndies on Friday, April 10, 2020; Version 2020.5.0.3.0003

SET NOCOUNT ON 
 
IF EXISTS (SELECT 1 FROM CountryPack WHERE [Option] = N'T' And [Name] = N'es-CL') 
BEGIN 
    UPDATE [CountryPack] SET [Version] = N'2020.5.0.3.0003'  
    WHERE [Option] = N'T' And [Name] = N'es-CL' 
END 
ELSE 
BEGIN 
    INSERT INTO [CountryPack] ([Option], [Name], [Description], [Version]) 
    VALUES (N'T', N'es-CL', N'Spanish (Chile)', N'2020.5.0.3.0003')  
END 
GO
