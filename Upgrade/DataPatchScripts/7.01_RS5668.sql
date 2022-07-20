
IF NOT EXISTS (SELECT 1 FROM Event WHERE EventName = N'ProcessNewDataMaintenance')
INSERT INTO Event (EventName, AccessAs, IsFrameworkEvent, IsFrameworkIDOEvent, IsFrameworkIDOSuspendableEvent, Description)
   VALUES (N'ProcessNewDataMaintenance', N'Core', 0, 0, 0, N'Creates a new table and IDO.')

   
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'

IF NOT EXISTS (SELECT 1 FROM EventHandler WHERE RowPointer = @EHRP)
   INSERT INTO EventHandler (EventName, Sequence, AccessAs, Synchronous, Transactional, Overridable, Active, RowPointer, Description)
      VALUES (N'ProcessNewDataMaintenance', 1, 'Core', 1, 0, 1, 1, @EHRP,
         N'P: ProcessID, IdoProject, UserID')


IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 0)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 0, 27, N'IDO("TmpStagingNewDataMaintenances")
PROPERTIES("ProcessID, DataType, PropertyScale, LabelStringID, PropertyLength, Name, PrimaryKey, PropertyClass, Required, TableIDOName, ColumnDataType")
FILTER(SUBSTITUTE("ProcessID = N''{0}''", E(ProcessID)))
SET(R(Batch) = RESULT)
', N'query the batch')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 10)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 10, 11, N'CONDITION(ROWS(Batch) <= 0)
RESULT("No rows in batch")', N'verify at least 1 row in batch')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 11)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 11, 14, N'IDO("SqlTables")
PROPERTIES("table_name")
FILTER(SUBSTITUTE("table_name = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingTableName) = "table_name")', N'see if the table exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 12)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 12, 14, N'IDO("IdoCollections")
PROPERTIES("CollectionName")
FILTER(SUBSTITUTE("CollectionName = N''{0}''", P(Batch, 1, "TableIDOName")))
SET(RV(ExistingIDOName) = "CollectionName")
 ', N'see if the IDO exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 13)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 13, 11, N'CONDITION(LEN(V(ExistingTableName)) > 0)
RESULT("Table Already Exists")', N'fail if the table exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 14)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 14, 11, N'CONDITION(LEN(V(ExistingIDOName)) > 0)
RESULT("IDO Already Exists")', N'fail if the IDO exists')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 15)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 15, 15, N'IDO("SqlTables")
ACTION(INSERT)
SETPROPVALUES("table_name" = P(Batch, 1, "TableIDOName"), "table_schema" = "dbo", "object_id" = V(nullvalue))
 ', N'insert the table')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 20)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 20, 12, N'SETVARVALUES(BatchRowIndex = "0", PrimaryKeyColumns = "")', N'set column loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 30)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 30, 12, N'SETVARVALUES(BatchRowIndex = 1 + V(BatchRowIndex), ColumnNullable = V(nullvalue))', N'increment batch row counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 35)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 35, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(50)', N'go on to the ido if columns done')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 36)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 36, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "Required") <> "1")
SETVARVALUES(ColumnNullable = "YES")
 ', N'set column nullable var')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 40)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 40, 15, N'IDO("SqlColumns")
ACTION(INSERT)
SETPROPVALUES("columnName" = P(Batch, V(BatchRowIndex), "Name"), "tableName" = P(Batch, V(BatchRowIndex), "TableIDOName"), "tableSchema" = "dbo", "dataType" = P(Batch, V(BatchRowIndex), "ColumnDataType"), "decimalPos" = V(nullvalue), "UBDecPosUsed" = "0", "dataLength" = V(nullvalue), "UBLengthUsed" = "0", "isNullable" = V(ColumnNullable), "defaultValue" = V(nullvalue), "systemDataType" = V(nullvalue), "derShadowColumnName" = V(nullvalue))', N'insert the column')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 43)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 43, 12, N'CONDITION(P(Batch, V(BatchRowIndex), "PrimaryKey") = "1")
SETVARVALUES(PrimaryKeyColumns = SUBSTITUTE("{0}{1}{2}", V(PrimaryKeyColumns), V(Comma), P(Batch, V(BatchRowIndex), "Name")), Comma = ",")', N'maybe add to primary key list')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 45)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 45, 6, N'DEST(30)', N'back to top of column loop')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 46)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 46, 5, N'CONDITION(LEN(V(PrimaryKeyColumns)) <= 0)
DEST(50)', N'skip primary key if we don''t have any')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 47)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 47, 21, N'IDO("SqlTables")
METHOD("SqlPrimaryKeyModifySp")
PARMS(P(Batch, 1, "TableIDOName"), V(PrimaryKeyColumns), "1", RV(PrimaryKeyResult))', N'maybe create the primary key')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 50)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 50, 21, N'IDO("IdoCollections")
METHOD("IdoCollectionCreateSp")
PARMS(P(Batch, 1, "TableIDOName"), E(IdoProject), V(NullValue), E(UserID), V(nullvalue), "0", RV(InsertMessage))', N'create the ido')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 51)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 51, 21, N'IDO("IdoTables")
METHOD("IdoTableCreateSp")
PARMS(P(Batch, 1, "TableIDOName"), P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "3", "0", V(nullvalue), RV(IdoTableResult))', N'add the primary base table for the ido')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 55)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 55, 12, N'SETVARVALUES(BatchRowIndex = "0")', N'set the prop loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 65)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 65, 12, N'SETVARVALUES(BatchRowIndex = 1+V(BatchRowIndex))', N'increment the prop loop counter')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 70)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 70, 5, N'CONDITION(V(BatchRowIndex) > ROWS(Batch))
DEST(85)', N'go to finish if we are done')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 75)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 75, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, V(BatchRowIndex), "TableIDOName"), LOWER(SUBSTRING(P(Batch, V(BatchRowIndex), "TableIDOName"), 1, 3)), P(Batch, V(BatchRowIndex), "Name"), P(Batch, V(BatchRowIndex), "Name"), RV(PropertyInsertResult))
 ', N'insert the property')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 76)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 76, 15, N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = P(Batch, 1, "TableIDOName"), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = P(Batch, V(BatchRowIndex), "DataType"), "DataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "DataDecimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "LabelStringID" = P(Batch, V(BatchRowIndex), "LabelStringID"), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))', N'add property attributes')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 77)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 77, 5, N'CONDITION(E(KeepStg) = "1")
DEST(80)', N'skip batch delete if we are keeping')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 78)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 78, 15, N'IDO("TmpStagingNewDataMaintenances")
ACTION(DELETE)
SETPROPVALUES("ProcessID" = E(ProcessID), "Name" = P(Batch, V(BatchRowIndex), "Name"))
', N'delete the staging data row')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 80)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 80, 6, N'DEST(65)', N'top of property loop')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 85)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 85, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "NoteExistsFlag", "NoteExistsFlag", RV(PropertyInsertResult))', N'add the framework properties')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 90)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 90, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "CreatedBy", "CreatedBy", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 95)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 95, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "UpdatedBy", "UpdatedBy", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 100)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 100, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "CreateDate", "CreateDate", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 105)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 105, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "RecordDate", "RecordDate", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 110)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 110, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "RowPointer", "RowPointer", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 115)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 115, 21, N'IDO("IdoProperties")
METHOD("IdoPropertyCreateAutoSp")
PARMS(P(Batch, 1, "TableIDOName"), LOWER(SUBSTRING(P(Batch, 1, "TableIDOName"), 1, 3)), "InWorkflow", "InWorkflow", RV(PropertyInsertResult))', N' ')

IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence = 120)
   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
     VALUES (@EHRP, 120, 10, N'RESULT("Table and IDO Created")', N' ')


GO
