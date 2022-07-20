/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S001_ido.Properties.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW ido.Properties
AS
SELECT
  CollectionName
, PropertyName
, PropertyDesc
, PropertyClass
, PropertyType
, ColumnName
, ColumnTableAlias
, KeySequence
, SubCollectionName
, PropertyValue
, PseudoKeyFlag
, DevelopmentFlag
, Sequence
, BinaryDataFormat
, BoolFalseValue
, BoolTrueValue
, CaseFormat
, ColumnDataType
, DataDecimalPos
, DataLength
, DataType
, DateFormat
, DefaultIMECharset
, DefaultValue
, DisplayDecimalPos
, DomainIDOName
, DomainListProperties
, DomainProperty
, InputMask
, InputMaskPrompt
, IsHTML
, IsReadOnly
, IsRequired
, IsRORecordFlag
, JustifyFormat
, LabelStringID
, InlineList
, Validators
, PropertyValueArguments
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
FROM ToolsDev_600_Objects.dbo.Properties
