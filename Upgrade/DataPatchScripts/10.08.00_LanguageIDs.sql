UPDATE dbo.LanguageIDs
SET OverrideMidHelpURL = 'en-us';

UPDATE dbo.LanguageIDs
SET HelpSubdir = 'en-US'
WHERE LanguageID IN  
('bg-BG'
,'cs-CZ'
,'da-DK'
,'en-AU'
,'en-GB'
,'en-NZ'
,'en-US'
,'fi-FI'
,'he-IL'
,'hi-IN'
,'hu-HU'
,'it-IT'
,'ko-KR'
,'ms-MY'
,'nb-NO'
,'nl-NL'
,'pl-PL'
,'pt-BR'
,'pt-PT'
,'ru-RU'
,'sk-SK'
,'sl-SI'
,'sv-SE'
,'th-TH'
,'tr-TR'
,'vi-VN');
