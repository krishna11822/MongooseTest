/* $Header: /Tools/SQLScripts/Templates/ApplicationDB/S002_IdoPropertyClassesView.sql 1     3/30/07 3:38p Tblosser $ */
/*
Copyright © 2007 Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. The word and design marks set forth herein are trademarks and/or registered
trademarks of Infor Global Solutions Technology GmbH and/or its affiliates and subsidiaries.
All rights reserved. All other trademarks listed herein are the property of their respective owners.
*/
CREATE TRIGGER dbo.IdoPropertyClassesViewUpdate ON
IdoPropertyClassesView
INSTEAD OF UPDATE
As
UPDATE pc
SET 
  ParentClassName = ii.ParentClassName
, Description = ii.Description
, LockBy = ii.LockBy
, RevisionNo = ii.RevisionNo
, RevisionDate = ii.RevisionDate
, DevelopmentFlag = ii.DevelopmentFlag
, AccessAs = ii.AccessAs
, BinaryDataFormat = ii.BinaryDataFormat
, BoolFalseValue = ii.BoolFalseValue
, BoolTrueValue = ii.BoolTrueValue
, CaseFormat = ii.CaseFormat
, ColumnDataType = ii.ColumnDataType
, DataDecimalPos = ii.DataDecimalPos
, DataLength = ii.DataLength
, DataType = ii.DataType
, DateFormat = ii.DateFormat
, DefaultIMECharset = ii.DefaultIMECharset
, DefaultValue = ii.DefaultValue
, DisplayDecimalPos = ii.DisplayDecimalPos
, DomainIDOName = ii.DomainIDOName
, DomainListProperties = ii.DomainListProperties
, DomainProperty = ii.DomainProperty
, InputMask = ii.InputMask
, InputMaskPrompt = ii.InputMaskPrompt
, IsHTML = ii.IsHTML
, IsReadOnly = ii.IsReadOnly
, IsRequired = ii.IsRequired
, IsRORecordFlag = ii.IsRORecordFlag
, JustifyFormat = ii.JustifyFormat
, LabelStringID = ii.LabelStringID
, InlineList = ii.InlineList
, Validators = ii.Validators
, InWorkflow = ii.InWorkflow
, NoteExistsFlag = ii.NoteExistsFlag
, RecordDate = ii.RecordDate
, RowPointer = ii.RowPointer
, CreatedBy = ii.CreatedBy
, UpdatedBy = ii.UpdatedBy
, CreateDate = ii.CreateDate
FROM inserted ii
inner join ido.PropertyClasses pc ON
pc.ClassName = ii.ClassName
and pc.DevelopmentFlag = ii.DevelopmentFlag
