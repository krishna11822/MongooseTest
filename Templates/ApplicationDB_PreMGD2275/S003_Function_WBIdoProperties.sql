/* $Header: /Tools/SQLScripts/ApplicationDB/Functions/WBIdoProperties.sql 1     11/04/15 1:45p Bharbron $ */
/*
***************************************************************
*                                                             *
*                           NOTICE                            *
*                                                             *
*   THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS             *
*   CONFIDENTIAL INFORMATION OF INFOR AND/OR ITS AFFILIATES   *
*   OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR  *
*   WRITTEN PERMISSION. LICENSED CUSTOMERS MAY COPY AND       *
*   ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH  *
*   THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.            *
*   ALL OTHER RIGHTS RESERVED.                                *
*                                                             *
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/* $Archive: /Tools/SQLScripts/ApplicationDB/Functions/WBIdoProperties.sql $
 *
 * CoreDev 1 203977 Bharbron Wed Nov 04 13:45:20 2015
 * slow performance
 * 203977
 *
* $NoKeywords: $
*/

CREATE FUNCTION dbo.WBIdoProperties ( @CollectionName NVARCHAR(80) )
RETURNS TABLE AS

RETURN (
WITH CollChain (
  BaseCollectionName
, ClimbCollName
, CollectionName
, CLevel
)
AS (
SELECT
  CollectionName
, Extends
, CollectionName
, 0
FROM ido.Collections
WHERE CollectionName = @CollectionName
AND DevelopmentFlag = 0
UNION ALL
SELECT 
  cc.BaseCollectionName
, icv.Extends
, icv.CollectionName
, cc.CLevel + 1
FROM CollChain cc
INNER JOIN ido.Collections icv 
ON (cc.ClimbCollName = icv.CollectionName) -- combined separate selects to make Oracle happy
OR (cc.CollectionName = icv.Extends
AND icv.ReplaceFlag = 1
AND cc.CLevel = 0)
)
SELECT
  c.BaseCollectionName AS CollectionName
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
, COALESCE(p.DataDecimalPos, pc.DataDecimalPos, bpc.DataDecimalPos, bbpc.DataDecimalPos) AS EffectiveDataDecimalPos
, COALESCE(p.DataLength, pc.DataLength, bpc.DataLength, bbpc.DataLength) AS EffectiveDataLength
, COALESCE(p.DataType, pc.DataType, bpc.DataType, bbpc.DataType) AS EffectiveDataType
, COALESCE(p.DomainIDOName, pc.DomainIDOName, bpc.DomainIDOName, bbpc.DomainIDOName) AS EffectiveDomainIDOName
, COALESCE(p.DomainListProperties,pc.DomainListProperties,bpc.DomainListProperties,bbpc.DomainListProperties) AS EffectiveDomainListProperties
, COALESCE(p.DomainProperty, pc.DomainProperty, bpc.DomainProperty, bbpc.DomainProperty) AS EffectiveDomainProperty
, COALESCE(p.LabelStringID, pc.LabelStringID, bpc.LabelStringID, bbpc.LabelStringID) AS EffectiveLabelStringID 
, p.InWorkflow
, p.NoteExistsFlag
, p.RecordDate
, p.RowPointer
, p.CreatedBy
, p.UpdatedBy
, p.CreateDate
FROM CollChain c
INNER JOIN ido.properties p
ON p.collectionname = c.collectionname 
LEFT OUTER JOIN ido.PropertyClasses pc
ON pc.ClassName = p.PropertyClass
LEFT OUTER JOIN ido.PropertyClasses bpc
ON bpc.ClassName = pc.ParentClassName
AND bpc.DevelopmentFlag = 0
LEFT OUTER JOIN ido.PropertyClasses bbpc
ON bbpc.ClassName = bpc.ParentClassName
AND bbpc.DevelopmentFlag = 0
WHERE p.DevelopmentFlag = 0

UNION
--uet
SELECT
  c.BaseCollectionName
, COALESCE(t.TableAlias,t.TableName) DBCONCATOPER uet.ColumnName AS PropertyName
, uet.LabelStringID
, uet.PropertyClass
, 0 --uets are bound to schema
, uet.ColumnName
, t.TableAlias
, NULL 
, NULL 
, NULL 
, NULL 
, NULL 
, NULL 
, pc.BinaryDataFormat
, pc.BoolFalseValue
, pc.BoolTrueValue
, pc.CaseFormat
, pc.ColumnDataType
, UET.DataDecimalPos
, UET.DataLength
, UET.DataType
, pc.DateFormat
, pc.DefaultIMECharset
, pc.DefaultValue
, pc.DisplayDecimalPos
, pc.DomainIDOName
, pc.DomainListProperties
, pc.DomainProperty
, pc.InputMask
, pc.InputMaskPrompt
, pc.IsHTML
, pc.IsReadOnly
, pc.IsRequired
, pc.IsRORecordFlag
, pc.JustifyFormat
, UET.LabelStringID
, COALESCE(uet.DataDecimalPos,pc.DataDecimalPos,bpc.DataDecimalPos,bbpc.DataDecimalPos)  AS EffectiveDataDecimalPos
, COALESCE(uet.DataLength,pc.DataLength,bpc.DataLength,bbpc.DataLength)      AS EffectiveDataLength
, COALESCE(uet.DataType,pc.DataType,bpc.DataType,bbpc.DataType)        AS EffectiveDataType
, COALESCE(pc.DomainIDOName,bpc.DomainIDOName,bbpc.DomainIDOName)   AS EffectiveDomainIDOName
, COALESCE(pc.DomainListProperties,bpc.DomainListProperties,bbpc.DomainListProperties) AS EffectiveDomainListProperties
, COALESCE(pc.DomainProperty,bpc.DomainProperty,bbpc.DomainProperty)  AS EffectiveDomainProperty
, COALESCE(uet.LabelStringID,pc.LabelStringID,bpc.LabelStringID,bbpc.LabelStringID) AS EffectiveLabelStringID
, pc.InWorkflow
, pc.NoteExistsFlag
, pc.RecordDate
, pc.RowPointer
, pc.CreatedBy
, pc.UpdatedBy
, pc.CreateDate
FROM CollChain c 
INNER JOIN ido.Tables t
ON t.collectionname = c.collectionname 
JOIN (SELECT DISTINCT
        t.TableName AS TableName
      , t.CollectionName
      , user_fld_impacted.fld_name AS ColumnName
      , CASE WHEN LEN(fld_UDT) > 4
              AND SUBSTRING(fld_UDT, LEN(fld_UDT) - 3, 4) = 'Type'
                THEN SUBSTRING(fld_UDT, 1, LEN(fld_UDT) - 4)
             ELSE fld_UDT
        END AS PropertyClass
      , user_fld_impacted.fld_data_type AS DataType
      , user_fld_impacted.fld_prec AS DataDecimalPos
      , user_fld_impacted.fld_decimals AS DataLength
      , NULL AS Implementation
      , 'Der' DBCONCATOPER  COALESCE(t.TableAlias,t.TableName) DBCONCATOPER user_fld_impacted.fld_name DBCONCATOPER 'IsActive' AS IsActive
      , table_class_impacted.class_name AS ClassName
      , CASE WHEN user_fld_impacted.fld_desc IS NULL THEN NULL ELSE SUBSTRING(user_fld_impacted.fld_desc, 1, 50) END AS LabelStringID
      , COALESCE(t.TableAlias,t.TableName) AS TableAlias
      FROM table_class_impacted
      INNER JOIN user_class_fld_impacted ON user_class_fld_impacted.class_name = table_class_impacted.class_name
      INNER JOIN user_fld_impacted ON user_fld_impacted.fld_name = user_class_fld_impacted.fld_name
      INNER JOIN ido.Tables t ON (t.TableName = table_class_impacted.table_name OR t.TableName = REPLACE(table_class_impacted.table_name, '_mst', ''))
      WHERE table_class_impacted.active = 1
     ) uet ON t.TableName = uet.TableName AND t.CollectionName = uet.CollectionName
LEFT OUTER JOIN ido.PropertyClasses pc 
ON pc.ClassName = UET.PropertyClass
AND pc.DevelopmentFlag = 0
LEFT OUTER JOIN ido.PropertyClasses bpc
ON bpc.ClassName = pc.ParentClassName
AND bpc.DevelopmentFlag = 0
LEFT OUTER JOIN ido.PropertyClasses bbpc
ON bbpc.ClassName = bpc.ParentClassName
AND bbpc.DevelopmentFlag = 0
WHERE t.TableType = 3
)
