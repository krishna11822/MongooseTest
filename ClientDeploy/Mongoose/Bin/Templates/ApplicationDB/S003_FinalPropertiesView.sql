/* $Header: /Tools/SQLScripts/ApplicationDB/Views/EventActionStateView.sql 2     3/06/07 2:51p Djohnson $ */
/*
Copyright © 2018 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/

CREATE VIEW FinalPropertiesView
AS
SELECT 
  x.StartName AS CollectionName
, p.PropertyName
, p.PropertyDesc
, p.PropertyClass
, p.PropertyType
, p.ColumnName
, p.ColumnTableAlias
, p.KeySequence
, p.SubCollectionName
, p.PropertyValue
, p.PseudoKeyFlag
, p.DevelopmentFlag
, p.Sequence
, p.BinaryDataFormat
, p.BoolFalseValue
, p.BoolTrueValue
, p.CaseFormat
, p.ColumnDataType
, p.DataDecimalPos
, p.DataLength
, p.DataType
, p.DateFormat
, p.DefaultIMECharset
, p.DefaultValue
, p.DisplayDecimalPos
, p.DomainIDOName
, p.DomainListProperties
, p.DomainProperty
, p.InputMask
, p.InputMaskPrompt
, p.IsHTML
, p.IsReadOnly
, p.IsRequired
, p.IsRORecordFlag
, p.JustifyFormat
, p.LabelStringID
, p.InlineList
, p.Validators
, p.PropertyValueArguments
, dbo.EffectiveBinaryDataFormat(    p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveBinaryDataFormat
, dbo.EffectiveBoolFalseValue(      p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveBoolFalseValue
, dbo.EffectiveBoolTrueValue(       p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveBoolTrueValue
, dbo.EffectiveCaseFormat(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveCaseFormat
, dbo.EffectiveColumnDataType(      p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveColumnDataType
, dbo.EffectiveDataDecimalPos(      p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDataDecimalPos
, dbo.EffectiveDataLength(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDataLength
, dbo.EffectiveDataType(            p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDataType
, dbo.EffectiveDateFormat(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDateFormat
, dbo.EffectiveDefaultIMECharset(   p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDefaultIMECharset
, dbo.EffectiveDefaultValue(        p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDefaultValue
, dbo.EffectiveDisplayDecimalPos(   p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDisplayDecimalPos
, dbo.EffectiveDomainIDOName(       p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDomainIDOName
, dbo.EffectiveDomainListProperties(p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDomainListProperties
, dbo.EffectiveDomainProperty(      p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveDomainProperty
, dbo.EffectiveInputMask(           p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveInputMask
, dbo.EffectiveInputMaskPrompt(     p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveInputMaskPrompt
, dbo.EffectiveIsHTML(              p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveIsHTML
, dbo.EffectiveIsReadOnly(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveIsReadOnly
, dbo.EffectiveIsRequired(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveIsRequired
, dbo.EffectiveIsRORecordFlag(      p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveIsRORecordFlag
, dbo.EffectiveJustifyFormat(       p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveJustifyFormat
, dbo.EffectiveLabelStringID(       p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveLabelStringID
, dbo.EffectiveInlineList(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveInlineList
, dbo.EffectiveValidators(          p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectiveValidators
, dbo.EffectivePropertyValue(       p.PropertyClass, p.CollectionName, p.PropertyName, p.DevelopmentFlag) AS EffectivePropertyValue
, p.InWorkflow
, p.NoteExistsFlag
, p.RecordDate
, p.RowPointer
, p.CreatedBy
, p.UpdatedBy
, p.CreateDate
FROM ido.Properties p
INNER JOIN RootCollectionsView x ON
  x.CollectionName = p.CollectionName
INNER JOIN UserNameView u ON 1=1
INNER JOIN ido.Collections c ON
  c.CollectionName = p.CollectionName
  and 1 = CASE WHEN c.LockBy = u.UserName THEN c.DevelopmentFlag ELSE c.DevelopmentFlag + 1 END
and not exists (select 1
  from RootCollectionsView x2
  inner join ido.Properties p2 on
    p2.CollectionName = x2.CollectionName
  where x2.CollectionName = x.StartName
  and x2.ColLevel < x.ColLevel
  AND p2.PropertyName = p.PropertyName
)
where p.DevelopmentFlag= c.DevelopmentFlag
