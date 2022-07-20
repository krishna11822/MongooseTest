SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* RS-8305 "External Role Aliases"
*
* A single 'ExternalRoleName' must map to a single 'InternalGroupModuleName'
* All 'ExternalRoleName' values must be unique (PRIMARY key)
* Any 'GroupName' or 'ModuleName' must also be unique, but nullable.
* Microsoft does not easily enable unique + nullable, so we do it in code.
*
* This table is modified seldom, but accessed often.
* Note: this also has an Insert-Update trigger:  Triggers/ExternalRoleAliasIup.trg
* Use case: Inbound is indexing ExternalRoleName. Outbound is indexing the GroupName or ModuleName to find the external name.
*
*
* RS-8305 R.Shilts 20-Mar-2018
* Add back the index on the GroupName field. Holding off on the ModuleName because nobody really uses it yet.
*
* RS-8305 R.Shilts 16-Mar-2018
* Add constraints for InWorkflow and NoteExistsFlag
*
* RS-8305 R.Shilts 14-Mar-2018
* Initial Version
* Table - references (and foreign key constraints) to dbo.GroupNames and dbo.Modules tables.
*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2018 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

 
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'ExternalRoleNameType' AND ss.name = N'dbo')
   CREATE TYPE [dbo].[ExternalRoleNameType] FROM [nvarchar](256) NOT NULL
GO

IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = N'dbo'
                AND   TABLE_NAME = N'ExternalRoleAlias' )
BEGIN

   CREATE TABLE [dbo].[ExternalRoleAlias]
   (
      [ExternalRoleName] [dbo].[ExternalRoleNameType] NOT NULL,
      [GroupName] [dbo].[GroupnameType] NULL,
      [ModuleName] [dbo].[LicenseModuleNameType] NULL,
      [CreatedBy] [dbo].[UsernameType] NOT NULL,
      [UpdatedBy] [dbo].[UsernameType] NOT NULL,
      [CreateDate] [dbo].[CurrentDateType] NOT NULL,
      [RecordDate] [dbo].[CurrentDateType] NOT NULL,
      [RowPointer] [dbo].[RowPointerType] NOT NULL,
      [NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
      [InWorkflow] [dbo].[FlagNyType] NOT NULL,
      CONSTRAINT [PK_ExternalRoleAlias] PRIMARY KEY CLUSTERED 
      (
         [ExternalRoleName] ASC
      )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],

      -- track GroupName table, but don't get in its way
      CONSTRAINT [FK_ExternalRoleAlias_Group] FOREIGN KEY (GroupName)
          REFERENCES [dbo].[GroupNames] (GroupName)
          ON DELETE CASCADE
          ON UPDATE CASCADE,

      -- track Modules table, but don't get in its way
      CONSTRAINT [FK_ExternalRoleAlias_Module] FOREIGN KEY (ModuleName)
          REFERENCES [dbo].[Modules] (ModuleName)
          ON DELETE CASCADE
          ON UPDATE CASCADE,

      CONSTRAINT [IX_ExternalRoleAlias_RowPointer] UNIQUE NONCLUSTERED 
      (
         [RowPointer] ASC
      )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
   ) ON [PRIMARY]

   CREATE NONCLUSTERED INDEX [IX_ExternalRoleAlias_GroupName] ON [dbo].[ExternalRoleAlias] 
   (
      [GroupName] ASC
   )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)

   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
   ALTER TABLE [dbo].[ExternalRoleAlias] ADD  CONSTRAINT [DF_ExternalRoleAlias_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]

   ALTER TABLE [dbo].[ExternalRoleAlias] WITH CHECK ADD  CONSTRAINT [CK_ExternalRoleAlias_InWorkflow] CHECK  (([InWorkflow]=(1) OR [InWorkflow]=(0)))
   ALTER TABLE [dbo].[ExternalRoleAlias] CHECK CONSTRAINT [CK_ExternalRoleAlias_InWorkflow]

   ALTER TABLE [dbo].[ExternalRoleAlias] WITH CHECK ADD  CONSTRAINT [CK_ExternalRoleAlias_NoteExistsFlag] CHECK  (([NoteExistsFlag]=(1) OR [NoteExistsFlag]=(0)))
   ALTER TABLE [dbo].[ExternalRoleAlias] CHECK CONSTRAINT [CK_ExternalRoleAlias_NoteExistsFlag]
END
GO

--
-- SchemaAdditionalTasksSp
--
DECLARE
@PStartingTable TableNameType
,@PEndingTable TableNameType
,@Infobar InfobarType
,@PModuleName AppModuleType

SET @PStartingTable = 'ExternalRoleAlias'
SET @PEndingTable = 'ExternalRoleAlias'
SET @Infobar = NULL
SET @PModuleName = N'Core'

EXEC dbo.SchemaAdditionalTasksSp
@PStartingTable
,@PEndingTable
,@Infobar
,@PModuleName

GO
