--227598 - add date time format to BG_EXECUTIONTIME on report type forms
UPDATE cmp2
SET Post301DataType = 'DATATYPE(DATE)'
, Post301Format = CASE WHEN Post301Format IS NULL THEN 'DATETIME()' ELSE 'DATETIME() ' + cmp2.Post301Format END
FROM FormComponents02 cmp2
INNER JOIN FormComponents01 cmp
ON cmp.FormID = cmp2.FormID
AND cmp.Name = cmp2.Name
INNER JOIN Forms frm
ON frm.id = cmp.formid
WHERE frm.Type = 6
AND cmp.Name LIKE '%ExecutionTime%'
AND cmp.DataSource LIKE 'variables.BG_EXECUTIONTIME%'
AND cmp2.DefaultFrom IS NULL
AND (cmp2.Post301DataType IS NULL OR NOT cmp2.DataType LIKE '%Date%')
AND (cmp2.Post301Format IS NULL OR NOT cmp2.Post301Format LIKE '%DateTime%')