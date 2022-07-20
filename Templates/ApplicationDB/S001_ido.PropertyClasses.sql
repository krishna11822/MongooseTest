CREATE VIEW ido.PropertyClasses
AS
SELECT
  ClassName
, ParentClassName
, Description
, LockBy
, RevisionNo
, RevisionDate
, DevelopmentFlag
, AccessAs
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
, PropertyValue
, InWorkflow
, NoteExistsFlag
, RecordDate
, RowPointer
, CreatedBy
, UpdatedBy
, CreateDate
FROM ToolsDev_600_Objects.dbo.PropertyClasses
