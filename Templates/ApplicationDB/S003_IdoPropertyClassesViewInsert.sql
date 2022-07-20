/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoPropertyClassesView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE TRIGGER dbo.IdoPropertyClassesViewInsert ON
IdoPropertyClassesView
INSTEAD OF INSERT
AS
INSERT INTO ido.PropertyClasses (
ClassName, 
ParentClassName, 
Description, 
LockBy, 
RevisionNo, 
RevisionDate, 
DevelopmentFlag, 
AccessAs, 
BinaryDataFormat, 
BoolFalseValue, 
BoolTrueValue, 
CaseFormat, 
ColumnDataType, 
DataDecimalPos, 
DataLength, 
DataType, 
DateFormat, 
DefaultIMECharset, 
DefaultValue, 
DisplayDecimalPos, 
DomainIDOName, 
DomainListProperties, 
DomainProperty, 
InputMask, 
InputMaskPrompt, 
IsHTML, 
IsReadOnly, 
IsRequired, 
IsRORecordFlag, 
JustifyFormat, 
LabelStringID,  
InlineList,
Validators,
PropertyValue,
RowPointer
)
select
ClassName, 
ParentClassName, 
Description, 
LockBy, 
RevisionNo, 
RevisionDate, 
DevelopmentFlag, 
AccessAs, 
BinaryDataFormat, 
BoolFalseValue, 
BoolTrueValue, 
CaseFormat, 
ColumnDataType, 
DataDecimalPos, 
DataLength, 
DataType, 
DateFormat, 
DefaultIMECharset, 
DefaultValue, 
DisplayDecimalPos, 
DomainIDOName, 
DomainListProperties, 
DomainProperty, 
InputMask, 
InputMaskPrompt, 
IsHTML, 
IsReadOnly, 
IsRequired, 
IsRORecordFlag, 
JustifyFormat, 
LabelStringID, 
InlineList,
Validators,
PropertyValue,
RowPointer
FROM inserted
