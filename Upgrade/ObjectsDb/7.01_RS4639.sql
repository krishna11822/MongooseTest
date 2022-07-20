IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[AccessAs]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'AccessAs')
ALTER TABLE [dbo].[AccessAs]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Collections]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'Collections')
ALTER TABLE [dbo].[Collections]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[CustomAssembly]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'CustomAssembly')
ALTER TABLE [dbo].[CustomAssembly]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MethodParameters]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'MethodParameters')
ALTER TABLE [dbo].[MethodParameters]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[MethodResultSets]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'MethodResultSets')
ALTER TABLE [dbo].[MethodResultSets]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Methods]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'Methods')
ALTER TABLE [dbo].[Methods]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Properties]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'Properties')
ALTER TABLE [dbo].[Properties]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[PropertyClasses]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'PropertyClasses')
ALTER TABLE [dbo].[PropertyClasses]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Servers]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'Servers')
ALTER TABLE [dbo].[Servers]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SubColFilterProperties]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'SubColFilterProperties')
ALTER TABLE [dbo].[SubColFilterProperties]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[SysParameters]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'SysParameters')
ALTER TABLE [dbo].[SysParameters]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO

IF OBJECTPROPERTY(OBJECT_ID(N'[dbo].[Tables]'), N'IsUserTable') = 1
   AND NOT EXISTS (
   SELECT 1 FROM [dbo].[syscolumns] 
   WHERE [name] = N'DataRowversion' 
   AND OBJECT_NAME(id) = N'Tables')
ALTER TABLE [dbo].[Tables]
  ADD [DataRowversion] ROWVERSION NOT NULL
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BumpDbUsedSp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[BumpDbUsedSp]
GO


/*$Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_RS4639.sql 1     6/11/12 4:01p Bcummings $ */
/*
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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

--  A timestamp (ROWVERSION) column in the AccessAs singleton table is used to bump
-- the database wide @@DBTS value to show that something has changed in the database.

/* $Archive: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/7.01_RS4639.sql $
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE dbo.BumpDbUsedSp
AS

   -- Check for existence of Generic External Touch Point routine (this section was generated by SpETPCodeSp and inserted by CallETPs.exe):
   IF OBJECT_ID(N'dbo.EXTGEN_BumpDbUsedSp') IS NOT NULL
   BEGIN
      DECLARE @EXTGEN_SpName sysname
      SET @EXTGEN_SpName = N'dbo.EXTGEN_BumpDbUsedSp'
      -- Invoke the ETP routine, passing in (and out) this routine's parameters:
      EXEC @EXTGEN_SpName
 
      -- ETP routine must take over all desired functionality of this standard routine:
      RETURN 0
   END
   -- End of Generic External Touch Point code.
 
UPDAtE AccessAs
SET AccessAs = AccessAs

GO
