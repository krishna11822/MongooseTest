SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

IF object_id('dbo.EventSetParameterSp') IS NOT NULL
   DROP PROCEDURE dbo.EventSetParameterSp
GO
IF object_id('dbo.EventSetSessionVariableSp') IS NOT NULL
   DROP PROCEDURE dbo.EventSetSessionVariableSp
GO
IF object_id('dbo.EventSetValuesInternalSp') IS NOT NULL
   DROP PROCEDURE dbo.EventSetValuesInternalSp
GO
IF object_id('dbo.EventSetValuesSp') IS NOT NULL
   DROP PROCEDURE dbo.EventSetValuesSp
GO
IF object_id('dbo.EventSetVariableSp') IS NOT NULL
   DROP PROCEDURE dbo.EventSetVariableSp
GO

