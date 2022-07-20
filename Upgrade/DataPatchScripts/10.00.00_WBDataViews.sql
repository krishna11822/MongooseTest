SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--RS8214 - convert parameters on method calls to MP (Method Parameter) operator

UPDATE dvp
SET Operator = 'MP'
FROM WBDataViewParameter dvp
WHERE dvp.Operator is null
AND EXISTS ( SELECT 1 FROM WBDataViewIDO dvi WHERE dvi.ViewName = dvp.ViewName AND dvi.SourceType = 'M' )
