-- Issue 247579 - Add new password requirement options

-- Create new type
IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.DOMAINS 
                WHERE DOMAIN_SCHEMA = N'dbo' 
                  AND DOMAIN_NAME = N'PswdConsecIdenticalCharMaxType' )
   CREATE TYPE [dbo].[PswdConsecIdenticalCharMaxType] FROM SMALLINT NULL
GO

-- Add columns and constaints
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_SCHEMA = N'dbo' 
           AND TABLE_NAME = N'PasswordParameters')
AND NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'PasswordParameters'
                AND   COLUMN_NAME = N'ConsecutiveIdenticalCharMax')
BEGIN
   ALTER TABLE [dbo].[PasswordParameters] Add
     [ConsecutiveIdenticalCharMax] [dbo].[PswdConsecIdenticalCharMaxType] NOT NULL CONSTRAINT [DF_PswdParms_ConsecIdCharMax] DEFAULT((3)),
     [ForbidEmbeddedUserName] [dbo].[ListYesNoType] NOT NULL CONSTRAINT [DF_PswdParms_ForbidEmbedUsrNm] DEFAULT((1)),

     CONSTRAINT [CK_PswdParms_ConsecIdCharMax] CHECK (ConsecutiveIdenticalCharMax > (0)),
     CONSTRAINT [CK_PswdParms_ForbidEmbedUsrNm] CHECK ([ForbidEmbeddedUserName] = (1) Or [ForbidEmbeddedUserName] = (0))

   EXEC dbo.SchemaAdditionalTasksSp 'PasswordParameters', 'PasswordParameters', NULL, 'Core'
END

