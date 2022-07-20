-- Drop Objects Database views
IF OBJECT_ID('EventMyWorkflowsView') IS NOT NULL
    DROP VIEW EventMyWorkflowsView
GO
IF OBJECT_ID('WBIdoPropertiesView') IS NOT NULL
    DROP VIEW WBIdoPropertiesView
GO
if Object_id('FinalPropertiesView') is not null
    drop view FinalPropertiesView
go
if Object_id('IdoPropertiesChainView') is not null
    drop view IdoPropertiesChainView
go
if Object_id('IdoPropertyClassesViewDelete') is not null
    drop trigger IdoPropertyClassesViewDelete
go
if Object_id('IdoPropertyClassesViewInsert') is not null
    drop trigger IdoPropertyClassesViewInsert
go
if Object_id('IdoPropertyClassesViewUpdate') is not null
    drop trigger IdoPropertyClassesViewUpdate
go
if Object_id('IdoAccessAsView') is not null
    drop view IdoAccessAsView
go
if Object_id('IdoCollectionsView') is not null
    drop view IdoCollectionsView
go
if Object_id('IdoColumnWithAliasView') is not null
    drop view IdoColumnWithAliasView
go
if Object_id('IdoCustomAssemblyView') is not null
    drop view IdoCustomAssemblyView
go
if Object_id('IdoMethodParametersView') is not null
    drop view IdoMethodParametersView
go
if Object_id('IdoMethodResultSetsView') is not null
    drop view IdoMethodResultSetsView
go
if Object_id('IdoMethodsView') is not null
    drop view IdoMethodsView
go
if Object_id('IdoProjectsView') is not null
    drop view IdoProjectsView
go
if Object_id('IdoPropertiesView') is not null
    drop view IdoPropertiesView
go
if Object_id('IdoPropertyClassesView') is not null
    drop view IdoPropertyClassesView
go
if Object_id('IdoSchemaTablesView') is not null
    drop view IdoSchemaTablesView
go
if Object_id('IdoSubColFilterPropertiesView') is not null
    drop view IdoSubColFilterPropertiesView
go
if Object_id('IdoAllTablesView') is not null
    drop view IdoAllTablesView
go
if Object_id('IdoCollectionRulesView') is not null
    drop view IdoCollectionRulesView
go
if Object_id('IdoTablesView') is not null
    drop view IdoTablesView
go
if Object_id('RootCollectionsView') is not null
    drop view RootCollectionsView
go
if object_id('ido.AccessAs') is not null
    drop view ido.AccessAs
go
if object_id('ido.CollectionRules') is not null
    drop view ido.CollectionRules
go
if object_id('ido.Collections') is not null
    drop view ido.Collections
go
if object_id('ido.CustomAssembly') is not null
    drop view ido.CustomAssembly
go
if object_id('ido.MethodParameters') is not null
    drop view ido.MethodParameters
go
if object_id('ido.MethodResultSets') is not null
    drop view ido.MethodResultSets
go
if object_id('ido.Methods') is not null
    drop view ido.Methods
go
if object_id('ido.Properties') is not null
    drop view ido.Properties
go
if object_id('ido.PropertyClasses') is not null
    drop view ido.PropertyClasses
go
if object_id('ido.Servers') is not null
    drop view ido.Servers
go
if object_id('ido.SubColFilterProperties') is not null
    drop view ido.SubColFilterProperties
go
if object_id('ido.SysParameters') is not null
    drop view ido.SysParameters
go
if object_id('ido.Tables') is not null
    drop view ido.Tables
go

if object_id('ido.CustomAssemblySource') is not null
    drop view ido.CustomAssemblySource
go

-- Drop any views that are not owned by dbo
DECLARE Views_Crs CURSOR
READ_ONLY
FOR select s.name, o.name from 
sysobjects o
inner join sys.schemas s on s.schema_id = o.uid
where o.xtype = 'v' and o.uid <> 1 and s.name <> 'ido'

DECLARE @schema_name sysname, @object_name sysname
DECLARE @sql nvarchar(max)
OPEN Views_Crs

FETCH NEXT FROM Views_Crs INTO @schema_name, @object_name
WHILE (@@fetch_status <> -1)
BEGIN
   IF (@@fetch_status <> -2)
   BEGIN
      SET @sql = 'DROP VIEW ' + @schema_name + '.' + @object_name
      EXEC (@sql)
   END
   FETCH NEXT FROM Views_Crs INTO @schema_name, @object_name
END

CLOSE Views_Crs
DEALLOCATE Views_Crs

