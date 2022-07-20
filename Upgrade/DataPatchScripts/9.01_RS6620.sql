SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

DECLARE @EHRP uniqueidentifier
SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'

--first delete all the event actions
DELETE FROM EventAction WHERE EventHandlerRowPointer = @EHRP

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP)
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
      VALUES (N'ProcessNewDataMaintenance', 1, 'Core', 1, 0, 1, 1, @EHRP,
         N'P: ProcessID, IdoProject, UserID')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 10)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 10, 27, N'IDO("TmpStagingNewDataMaintenances")
PROPERTIES("ProcessID, DataType, PropertyScale, LabelStringID, PropertyLength, Name, PrimaryKey, PropertyClass, Required, TableIDOName, ColumnDataType, DefaultValue")
FILTER(SUBSTITUTE("ProcessID = N''{0}''", E(ProcessID)))
ORDERBY(E(SortOrder))
SET(R(Batch) = RESULT)', N'query the batch')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 11)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 11, 11, N'CONDITION(ROWS(Batch) <= 0)
RESULT(MESSAGE("E=NoRowsDefinedForNewDataMaintenanceToProcess"))', N'verify at least 1 row in batch')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 20)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 20, 14, N'IDO("SqlTables")
PROPERTIES("table_name")
FILTER(SUBSTITUTE("table_name = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingTableName) = "table_name")', N'see if the table exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 21)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 21, 14, N'IDO("IdoCollections")
PROPERTIES("CollectionName")
FILTER(SUBSTITUTE("CollectionName = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingIDOName) = "CollectionName")', N'see if the IDO exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 22)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 22, 11, N'CONDITION(LEN(V(ExistingTableName)) > 0)
RESULT(MESSAGE("E=TableAlreadyExists"))', N'fail if the table exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 23)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 23, 11, N'CONDITION(LEN(V(ExistingIDOName)) > 0)
RESULT(MESSAGE("E=IDOAlreadyExists"))', N'fail if the IDO exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 40)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 40, 15, N'IDO("SqlTables")
ACTION(INSERT)
SETPROPVALUES("table_name" = E(TableName), "table_schema" = "dbo", "object_id" = V(nullvalue), "DerSource" = "ndmw", "DerIsSiteSplit" = E(SiteSplit) )', N'insert the table')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 50)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 50, 12, N'SETVARVALUES(BatchRowIndex = "0", PrimaryKeyColumns = "")', N'set column loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 60)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 60, 12, N'SETVARVALUES(BatchRowIndex = 1 + V(BatchRowIndex), ColumnNullable = V(nullvalue))', N'increment batch row counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 70)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 70, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(120)', N'go on to the ido if columns done')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 80)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 80, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "Required") <> "1")
SETVARVALUES(ColumnNullable = "YES")', N'set column nullable var')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 90)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 90, 15, N'IDO("SqlColumns")
ACTION(INSERT)
SETPROPVALUES("columnName" = P(Batch, V(BatchRowIndex), "Name"), "tableName" = E(TableName), "tableSchema" = "dbo", "dataType" = P(Batch, V(BatchRowIndex), "ColumnDataType"), "decimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "UBDecPosUsed" = "0", "dataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "UBLengthUsed" = "0", "isNullable" = V(ColumnNullable), "defaultValue" = V(nullvalue), "systemDataType" = V(nullvalue), "derShadowColumnName" = V(nullvalue))', N'insert the column')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 100)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 100, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "PrimaryKey") = "1")
SETVARVALUES(PrimaryKeyColumns = SUBSTITUTE("{0}{1}{2}", V(PrimaryKeyColumns), V(Comma), P(Batch, V(BatchRowIndex), "Name")), Comma = ",")', N'maybe add to primary key list')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 110)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 110, 6, N'DEST(60)', N'back to top of column loop')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 120)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 120, 21, N'IDO("SqlTables")
METHOD("GenerateFrameworkDataForNDMW")
PARMS("dbo",E(TableName),RE(Infobar46), E(ViewName))', N'create mongoose system columns')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 130)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 130, 5, N'CONDITION(LEN(V(PrimaryKeyColumns)) <= 0)
DEST(300)', N'skip primary key if we don''t have any')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 140)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 140, 12, N'CONDITION(E(SiteSplit)= "1")
SETVARVALUES(PrimaryKeyColumns = SUBSTITUTE("{0}{1}{2}", V(PrimaryKeyColumns), V(Comma), "SiteRef"), Comma = ",")', N'Set SiteRef PK if it SiteSplit')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 150)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 150, 21, N'IDO("SqlTables")
METHOD("SqlPrimaryKeyModifySp")
PARMS(E(TableName), V(PrimaryKeyColumns), "1", RV(PrimaryKeyResult))', N'maybe create the primary key')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 200)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 200, 12, N'SETVARVALUES(IDONAME = E(TABLENAME))', N'set initial IDO name')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 210)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 210, 5, N'CONDITION(E(SiteSplit) <> "1")
DEST(300)', N'branch for site split logic')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 220)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 220, 21, N'IDO("AppTables")
METHOD("CreateViewsOverMultiSiteTablesSp")
PARMS(E(TableName), E(TableName), RV(Infobar210))', N'generate view')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 230)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 230, 12, N'SETVARVALUES(IDONAME = E(VIEWNAME))', N'Change IDO name to View name')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 300)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 300, 21, N'IDO("IdoCollections")
METHOD("IdoCollectionCreateSp")
PARMS(V(IDONAME), E(IdoProject), E(IDODescription), E(UserID), V(nullvalue), "0", "o" + V(IDOName), V(nullvalue), RV(InsertMessage))', N'create the ido')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 310)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 310, 21, N'IDO("IdoTables")
METHOD("IdoTableCreateSp")
PARMS(V(IDOName), V(IDOName), E(TableAlias), "3", "0", V(nullvalue), RV(IdoTableResult))', N'add the primary base table for the ido')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 320)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 320, 12, N'SETVARVALUES(BatchRowIndex = "0")', N'set the prop loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 330)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 330, 12, N'SETVARVALUES(BatchRowIndex = 1+V(BatchRowIndex))', N'increment the prop loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 340)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 340, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(600)', N'go to finish if we are done')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 350)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 350, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), P(Batch, V(BatchRowIndex), "Name"), P(Batch, V(BatchRowIndex), "Name"), RV(PropertyInsertResult))', N'insert the property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 360)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 360, 5, N'CONDITION(P(Batch, V(BatchRowIndex), "PropertyClass") <> V(NullValue))
DEST(400)', N'check if property class is defined')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 370)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 370, 15, N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = V(IDOName), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = P(Batch, V(BatchRowIndex), "DataType"), "DataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "DataDecimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "DefaultValue" = P(Batch, V(BatchRowIndex), "DefaultValue"), "LabelStringID" = P(Batch, V(BatchRowIndex), "LabelStringID"), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))', N'add property atts (no property class)')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 380)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 380, 6, N'DEST(330)', N'loop back')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 400)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 400, 14, N'IDO("IdoPropertyClasses")
PROPERTIES("EffectiveDataType, EffectiveDataLength, EffectiveDataDecimalPos, EffectiveDefaultValue, EffectiveColumnDataType, EffectiveIsRequired, EffectiveLabelStringID")
FILTER(SUBSTITUTE("ClassName = N''{0}''", P(Batch, V(BatchRowIndex), "PropertyClass")))
SET(RV(PCDataType) = "EffectiveDataType", RV(PCDataLength) = "EffectiveDataLength", RV(PCDataDecimalPos) = "EffectiveDataDecimalPos", RV(PCDefaultValue) = "EffectiveDefaultValue", RV(PCColumnDataType) = "EffectiveColumnDataType", RV(PCIsRequired) = "EffectiveIsRequired", RV(PCLabelStringID) = "EffectiveLabelStringID")', N'load property class data')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 410)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 410, 12, N'CONDITION(TRUE)
SETVARVALUES(DefDataType = P(Batch, V(BatchRowIndex), "DataType"),
 DefColumnDataType = P(Batch, V(BatchRowIndex), "ColumnDataType"),
 DefDataLength = P(Batch, V(BatchRowIndex), "PropertyLength"),
 DefDataDecimalPos = P(Batch, V(BatchRowIndex), "PropertyScale"),
 DefDefaultValue = P(Batch, V(BatchRowIndex), "DefaultValue"),
 DefLabelStringID = P(Batch, V(BatchRowIndex), "LabelStringID") )', N'set initial variables')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 420)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 420, 12, N'CONDITION(V(DefDataType) = V(PCDataType))
SETVARVALUES(DefDataType = V(nullvalue))', N'define data type')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 421)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 421, 12, N'CONDITION(V(DefColumnDataType) = V(PCColumnDataType))
SETVARVALUES(DefColumnDataType = V(nullvalue))', N'define column (SQL) data type')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 422)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 422, 12, N'CONDITION(V(DefDataLength) = V(PCDataLength))
SETVARVALUES(DefDataLength = V(nullvalue))', N'define data length')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 423)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 423, 12, N'CONDITION(V(DefDataDecimalPos) = V(PCDataDecimalPos))
SETVARVALUES(DefDataDecimalPos = V(nullvalue))', N'define decimal position (scale)')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 424)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 424, 12, N'CONDITION(V(DefDefaultValue) = V(PCDefaultValue))
SETVARVALUES(DefDefaultValue = V(nullvalue))', N'define default value')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 425)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 425, 12, N'CONDITION(V(DefLabelStringID) = V(PCLabelStringID))
SETVARVALUES(DefLabelStringID = V(nullvalue))', N'define label string ID')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 490)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 490, 15, N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = V(IDOName), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = V(DefDataType), "ColumnDataType" = V(DefColumnDataType), "DataLength" = V(DefDataLength), "DataDecimalPos" = V(DefDataDecimalPos), "DefaultValue" = V(DefDefaultValue), "LabelStringID" = V(DefLabelStringID), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))', N'update with Property class defined')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 500)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 500, 5, N'CONDITION(E(KeepStg) = "1")
DEST(360)', N'skip batch delete if we are keeping')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 510)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 510, 15, N'IDO("TmpStagingNewDataMaintenances")
ACTION(DELETE)
SETPROPVALUES("ProcessID" = E(ProcessID), "Name" = P(Batch, V(BatchRowIndex), "Name"))', N'delete the staging data row')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 520)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 520, 6, N'DEST(330)', N'top of property loop')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 600)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 600, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "NoteExistsFlag", "NoteExistsFlag", RV(PropertyInsertResult))', N'add the NoteExists framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 601)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 601, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "CreatedBy", "CreatedBy", RV(PropertyInsertResult))', N'add the CreatedBy framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 602)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 602, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "UpdatedBy", "UpdatedBy", RV(PropertyInsertResult))', N'add the UpdatedBy framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 603)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 603, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "CreateDate", "CreateDate", RV(PropertyInsertResult))', N'add the CreateDate framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 604)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 604, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "RecordDate", "RecordDate", RV(PropertyInsertResult))', N'add the RecordDate framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 605)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 605, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "RowPointer", "RowPointer", RV(PropertyInsertResult))', N'add the RowPointer framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 606)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 606, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(V(IDOName), E(TableAlias), "InWorkflow", "InWorkflow", RV(PropertyInsertResult))', N'add the InWorkFlow framework property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 620)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 620, 5, N'CONDITION(E(IDOTablesXml) = "")
DEST(625)', N'Branch if no IdoTables to be created')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 621)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 621, 21, N'IDO("IdoTables")
METHOD("CreateTableFromDataTable")
PARMS(E(IDOTablesXml), RV(IDOTablesXmlResult))', N'add any Ido Tables')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 625)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 625, 5, N'CONDITION(E(IDOSubCollectionPropertiesXml) = "")
DEST(700)', N'branch if no subCollection properties')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 626)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 626, 21, N'IDO("IdoProperties")
METHOD("CreatePropertyFromDataTable")
PARMS(E(IDOSubCollectionPropertiesXml), RV(IDOSubCollectionPropertiesXmlResult))', N'add any Ido SubCollection properties')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 700)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 700, 5, N'CONDITION(E(GenerateScripts) = "0")
DEST(1000)', N'branch if generating SQL scripts')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 710)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 710, 5, N'CONDITION(E(UDTNames) = "")
DEST(730)', N'if no UDTs, go on to script table')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 720)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 720, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("UDTScriptSp")
PARMS(E(UDTNames), "dbo", RV(UDTScript))', N'write UDT script')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 730)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 730, 21, N'IDO("TmpStagingNewDataMaintenances")
METHOD("TableScriptStringSp")
PARMS(P(Batch, 1, "TableIDOName"), "dbo", RV(TableScript))', N'write Create Table script')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 800)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 800, 12, N'CONDITION(1 = 1)
SETPARMVALUES(ScriptString = SUBSTITUTE( "{0}  {1}", V(UDTScript),V(TableScript)))', N'Concatenate the script strings')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 1000)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
      VALUES (@EHRP, 1000, 10, N'RESULT(MESSAGE("E=TableAndIDOCreated"))', N'finish')

