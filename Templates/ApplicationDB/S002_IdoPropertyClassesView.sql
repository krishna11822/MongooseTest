/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoPropertyClassesView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE VIEW dbo.IdoPropertyClassesView
AS
WITH   PropClassChain (ClassName, ClimbParentClassName, ParentClassName, LockBy, DevelopmentFlag, PcLevel
, RevisionNo, RevisionDate, AccessAs
, BinaryDataFormat, EffectiveBinaryDataFormat
, BoolFalseValue, EffectiveBoolFalseValue
, BoolTrueValue, EffectiveBoolTrueValue
, CaseFormat, EffectiveCaseFormat
, ColumnDataType, EffectiveColumnDataType
, DataDecimalPos, EffectiveDataDecimalPos
, DataLength, EffectiveDataLength
, DataType, EffectiveDataType
, DateFormat, EffectiveDateFormat
, DefaultIMECharset, EffectiveDefaultIMECharset
, DefaultValue, EffectiveDefaultValue
, DisplayDecimalPos, EffectiveDisplayDecimalPos
, DomainIDOName, EffectiveDomainIDOName
, DomainListProperties, EffectiveDomainListProperties
, DomainProperty, EffectiveDomainProperty
, InputMask, EffectiveInputMask
, InputMaskPrompt, EffectiveInputMaskPrompt
, IsHTML, EffectiveIsHTML
, IsReadOnly, EffectiveIsReadOnly
, IsRequired, EffectiveIsRequired
, IsRORecordFlag, EffectiveIsRORecordFlag
, JustifyFormat, EffectiveJustifyFormat
, LabelStringID, EffectiveLabelStringID
, InlineList, EffectiveInlineList
, Validators, EffectiveValidators
, PropertyValue, EffectivePropertyValue
, Description, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
)
AS (
SELECT ClassName, ParentClassName, ParentClassName, LockBy, DevelopmentFlag, 0
, RevisionNo, RevisionDate, AccessAs
, BinaryDataFormat, BinaryDataFormat
, BoolFalseValue, BoolFalseValue
, BoolTrueValue, BoolTrueValue
, CaseFormat, CaseFormat
, ColumnDataType, ColumnDataType
, DataDecimalPos, DataDecimalPos
, DataLength, DataLength
, DataType, DataType
, DateFormat, DateFormat
, DefaultIMECharset, DefaultIMECharset
, DefaultValue, DefaultValue
, DisplayDecimalPos, DisplayDecimalPos
, DomainIDOName, DomainIDOName
, DomainListProperties, DomainListProperties
, DomainProperty, DomainProperty
, InputMask, InputMask
, InputMaskPrompt, InputMaskPrompt
, IsHTML, IsHTML
, IsReadOnly, IsReadOnly
, IsRequired, IsRequired
, IsRORecordFlag, IsRORecordFlag
, JustifyFormat, JustifyFormat
, LabelStringID, LabelStringID
, InlineList, InlineList
, Validators, Validators
, PropertyValue, PropertyValue
, Description, InWorkflow, NoteExistsFlag, RecordDate, RowPointer, CreatedBy, UpdatedBy, CreateDate
FROM ido.PropertyClasses
INNER JOIN UserNameView ON 1=1
WHERE 1 = (CASE WHEN LockBy = UserName THEN DevelopmentFlag ELSE DevelopmentFlag + 1 END)
UNION ALL SELECT pcc.ClassName, pc.ParentClassName, pcc.ParentClassName, pcc.LockBy, pcc.DevelopmentFlag, pcc.PcLevel + 1
, pcc.RevisionNo, pcc.RevisionDate, pcc.AccessAs
, pcc.BinaryDataFormat, COALESCE(pcc.EffectiveBinaryDataFormat, pc.BinaryDataFormat)
, pcc.BoolFalseValue, COALESCE(pcc.EffectiveBoolFalseValue, pc.BoolFalseValue)
, pcc.BoolTrueValue, COALESCE(pcc.EffectiveBoolTrueValue, pc.BoolTrueValue)
, pcc.CaseFormat, COALESCE(pcc.EffectiveCaseFormat, pc.CaseFormat)
, pcc.ColumnDataType, COALESCE(pcc.EffectiveColumnDataType, pc.ColumnDataType)
, pcc.DataDecimalPos, COALESCE(pcc.EffectiveDataDecimalPos, pc.DataDecimalPos)
, pcc.DataLength, COALESCE(pcc.EffectiveDataLength, pc.DataLength)
, pcc.DataType, COALESCE(pcc.EffectiveDataType, pc.DataType)
, pcc.DateFormat, COALESCE(pcc.EffectiveDateFormat, pc.DateFormat)
, pcc.DefaultIMECharset, COALESCE(pcc.EffectiveDefaultIMECharset, pc.DefaultIMECharset)
, pcc.DefaultValue, COALESCE(pcc.EffectiveDefaultValue, pc.DefaultValue)
, pcc.DisplayDecimalPos, COALESCE(pcc.EffectiveDisplayDecimalPos, pc.DisplayDecimalPos)
, pcc.DomainIDOName, COALESCE(pcc.EffectiveDomainIDOName, pc.DomainIDOName)
, pcc.DomainListProperties, COALESCE(pcc.EffectiveDomainListProperties, pc.DomainListProperties)
, pcc.DomainProperty, COALESCE(pcc.EffectiveDomainProperty, pc.DomainProperty)
, pcc.InputMask, COALESCE(pcc.EffectiveInputMask, pc.InputMask)
, pcc.InputMaskPrompt, COALESCE(pcc.EffectiveInputMaskPrompt, pc.InputMaskPrompt)
, pcc.IsHTML, COALESCE(pcc.EffectiveIsHTML, pc.IsHTML)
, pcc.IsReadOnly, COALESCE(pcc.EffectiveIsReadOnly, pc.IsReadOnly)
, pcc.IsRequired, COALESCE(pcc.EffectiveIsRequired, pc.IsRequired)
, pcc.IsRORecordFlag, COALESCE(pcc.EffectiveIsRORecordFlag, pc.IsRORecordFlag)
, pcc.JustifyFormat, COALESCE(pcc.EffectiveJustifyFormat, pc.JustifyFormat)
, pcc.LabelStringID, COALESCE(pcc.EffectiveLabelStringID, pc.LabelStringID)
, pcc.InlineList, COALESCE(pcc.EffectiveInlineList, pc.InlineList)
, pcc.Validators, COALESCE(pcc.EffectiveValidators, pc.Validators)
, pcc.PropertyValue, COALESCE(pcc.EffectivePropertyValue, pc.PropertyValue)
, pcc.Description, pcc.InWorkflow, pcc.NoteExistsFlag, pcc.RecordDate, pcc.RowPointer, pcc.CreatedBy, pcc.UpdatedBy, pcc.CreateDate

FROM PropClassChain pcc
INNER JOIN ido.PropertyClasses pc ON
pc.ClassName = pcc.ClimbParentClassName
INNER JOIN UserNameView ON 1=1
WHERE 1 = (CASE WHEN pc.LockBy = UserName THEN pc.DevelopmentFlag ELSE pc.DevelopmentFlag + 1 END)
)
select * from PropClassChain pcc1
WHERE NULLIF(pcc1.ClimbParentClassName, N'') IS NULL
