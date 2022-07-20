SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =================================================================================
-- Drop obsolete database objects
-- Steps:
-- 1. Drop obsolete tables.
-- 2. Drop obsolete functions.
-- 3. Drop obsolete stored procedures.
-- =================================================================================
/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/ObjectsDb/8.00_03_ObsoleteObjects.sql 1     8/21/13 2:03p Jmorris $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

/** D R O P    T R I G G E R S **/
-- The PropertyIup trigger exists in the Syteline database, but must be removed.
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[PropertyIup]'))
DROP TRIGGER [dbo].[PropertyIup]
GO

/** D R O P    T A B L E S **/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActivityLog]') AND type IN (N'U'))
DROP TABLE [dbo].[ActivityLog]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollectionsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[CollectionsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollectionsHistoryComment]') AND type IN (N'U'))
DROP TABLE [dbo].[CollectionsHistoryComment]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DataSources]') AND type IN (N'U'))
DROP TABLE [dbo].[DataSources]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnvironmentHierarchies]') AND type IN (N'U'))
DROP TABLE [dbo].[EnvironmentHierarchies]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Environments]') AND type IN (N'U'))
DROP TABLE [dbo].[Environments]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MethodParametersHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[MethodParametersHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MethodResultSetsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[MethodResultSetsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MethodsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[MethodsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OldPropertyClassAttrsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[OldPropertyClassAttrsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PropertiesHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[PropertiesHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PropertyClassesHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[PropertyClassesHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubColFilterPropsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[SubColFilterPropsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TableJoinsHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[TableJoinsHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TablesHistory]') AND type IN (N'U'))
DROP TABLE [dbo].[TablesHistory]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TmpTableNames]') AND type IN (N'U'))
DROP TABLE [dbo].[TmpTableNames]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserEnvProfiles]') AND type IN (N'U'))
DROP TABLE [dbo].[UserEnvProfiles]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfiles]') AND type IN (N'U'))
DROP TABLE [dbo].[UserProfiles]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserServerBuilds]') AND type IN (N'U'))
DROP TABLE [dbo].[UserServerBuilds]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSysParameters]') AND type IN (N'U'))
DROP TABLE [dbo].[UserSysParameters]
GO

/** D R O P    F U N C T I O N S **/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompareStringCaseSensitive]') AND type IN (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CompareStringCaseSensitive]
GO

/** D R O P    P R O C E D U R E S **/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddEnvironmentToHierarchySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddEnvironmentToHierarchySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ArchiveCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[ArchiveCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckInCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckInCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckOutCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckOutCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollectionExistsInBaseEnvSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[CollectionExistsInBaseEnvSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CollectionSearchSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[CollectionSearchSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CopyCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[CopyCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteMethodSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteMethodSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteProjectSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteProjectSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetHistoryLastRevisionNoSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetHistoryLastRevisionNoSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetIDOsCkdInSinceLastBuildSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetIDOsCkdInSinceLastBuildSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLastServerAutoBuildDateSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetLastServerAutoBuildDateSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetLastUserServerBuildDateSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetLastUserServerBuildDateSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSysParameter]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetSysParameter]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserEnvProfileSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserEnvProfileSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserSysParameter]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserSysParameter]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertTableSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[InsertTableSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LockCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[LockCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogActivitySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[LogActivitySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PreDeleteCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[PreDeleteCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PropertySearchSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[PropertySearchSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryAutoBuildServersSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryAutoBuildServersSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryCollectionHistorySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryCollectionHistorySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryCollectionsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryCollectionsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryDataSourcesSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryDataSourcesSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryEnvironmentHierarchySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryEnvironmentHierarchySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryEnvironmentsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryEnvironmentsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryLockedCollectionsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryLockedCollectionsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryMethodParametersSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryMethodParametersSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryMethodResultSetSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryMethodResultSetSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryMethodsByCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryMethodsByCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryModifiedServersSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryModifiedServersSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryNewCollectionsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryNewCollectionsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryPropertiesByCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryPropertiesByCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryPropertiesHistorySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryPropertiesHistorySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryRegenCollectionsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryRegenCollectionsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryServersSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryServersSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryTableJoinsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryTableJoinsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryTablesByCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryTablesByCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryTablesHistorySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryTablesHistorySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryUpdatedCollectionsSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryUpdatedCollectionsSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryUserEnvProfilesSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryUserEnvProfilesSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryUserProfileSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[QueryUserProfileSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RemoveEnvFromHierarchySp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[RemoveEnvFromHierarchySp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetCollectionCommentSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetCollectionCommentSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetCollectionsRegenCompleteSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetCollectionsRegenCompleteSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetLastServerAutoBuildDateSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetLastServerAutoBuildDateSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetLastUserServerBuildDateSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetLastUserServerBuildDateSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSysParameter]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetSysParameter]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetUserSysParameter]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetUserSysParameter]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UndoCheckOutCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[UndoCheckOutCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnlockCollectionSp]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[UnlockCollectionSp]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePropertyClassAttr]') AND type IN (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdatePropertyClassAttr]
GO
