SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
      
DECLARE @EHRP uniqueidentifier

SET @EHRP = 'E70B3E38-D312-4D47-9D33-630F7D3D63E0'

DECLARE @EHS EventSequenceType

SELECT @EHS = Sequence
FROM EventHandler
WHERE EventName = 'ProcessNewDataMaintenance'
AND RowPointer = @EHRP

IF @EHS IS NOT NULL
BEGIN
   -- Correct all referencing rows in other tables:
   
   UPDATE EventAction
   SET Parameters = N'IDO("IdoCollections")
METHOD("IdoCollectionCreateSp")
PARMS(P(Batch, 1, "TableIDOName"), E(IdoProject), V(NullValue), E(UserID), V(nullvalue), "0", "o" + P(Batch, 1, "TableIDOName"), V(nullvalue), RV(InsertMessage))'
   WHERE EventHandlerRowPointer = @EHRP
   AND Sequence = 50
END

GO
