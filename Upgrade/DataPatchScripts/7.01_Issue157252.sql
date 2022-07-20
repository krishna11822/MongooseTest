
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'


--update ProcessNewDataMaintenance event
UPDATE EventAction 
SET Parameters = N'IDO("TmpStagingNewDataMaintenances")
PROPERTIES("ProcessID, DataType, PropertyScale, LabelStringID, PropertyLength, Name, PrimaryKey, PropertyClass, Required, TableIDOName, ColumnDataType, DefaultValue")
FILTER(SUBSTITUTE("ProcessID = N''{0}''", E(ProcessID)))
SET(R(Batch) = RESULT)'
WHERE EventHandlerRowPointer = @EHRP AND Sequence = 0

UPDATE EventAction 
SET Parameters = N'IDO("IdoProperties")
ACTION(UPDATE)
SETPROPVALUES("CollectionName" = P(Batch, 1, "TableIDOName"), "PropertyName" = P(Batch, V(BatchRowIndex), "Name"), "DataType" = P(Batch, V(BatchRowIndex), "DataType"), "DataLength" = P(Batch, V(BatchRowIndex), "PropertyLength"), "DataDecimalPos" = P(Batch, V(BatchRowIndex), "PropertyScale"), "DefaultValue" = P(Batch, V(BatchRowIndex), "DefaultValue"), "LabelStringID" = P(Batch, V(BatchRowIndex), "LabelStringID"), "DevelopmentFlag" = "1", "PropertyClass" = P(Batch, V(BatchRowIndex), "PropertyClass"))'
WHERE EventHandlerRowPointer = @EHRP AND Sequence = 76
