/*8.02_UserNames - Issue138052*/

UPDATE UserNames
SET [EmailPromptsEmailType] = N'P'
WHERE SendEmailPrompts = 1
AND EXISTS (SELECT 1 FROM UserEmail WHERE UserEmail.Username = UserNames.Username
   AND UserEmail.EmailType = N'P')                                      
   
