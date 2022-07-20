SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
      
DECLARE @EHRP uniqueidentifier

-- SendGenericEmail
IF EXISTS(SELECT 1 FROM Event WHERE EventName = 'GenericSendEmail'
   AND AccessAs = 'BaseSyteLine')
   UPDATE Event
   SET AccessAs = 'Core', Description = N'Sends an e-mail based on parameters'
   WHERE EventName = 'GenericSendEmail'


SET @EHRP = '6F9605FA-AD8E-4FDE-8881-1898C610AC5D'

DECLARE @EHS EventSequenceType
DECLARE @BadRP RowPointerType
SELECT @EHS = Sequence, @BadRP = RowPointer
FROM EventHandler
WHERE EventName = 'GenericSendEmail'
AND AccessAs IN ('BaseSyteLine', 'Core')
AND RowPointer <> @EHRP

IF @EHS IS NOT NULL
BEGIN
   -- Row exists with wrong RowPointer and possibly wrong AccessAs
   -- We need to correct those, but preserve its Sequence.
   UPDATE EventHandler
   SET RowPointer = @EHRP, AccessAs = 'Core', Description = N'Sends an e-mail based on parameters'
   WHERE EventName = 'GenericSendEmail'
   AND Sequence = @EHS
   
   -- Correct all referencing rows in other tables:
   
   UPDATE EventAction
   SET EventHandlerRowPointer = @EHRP, Description = N'Sends an e-mail based on parameters'
   WHERE EventHandlerRowPointer = @BadRP
   
   UPDATE EventState
   SET RefRowPointer = @EHRP
   WHERE RefRowPointer = @BadRP

   UPDATE ObjectNotes
   SET RefRowPointer = @EHRP
   WHERE RefRowPointer = @BadRP

   UPDATE DocumentObjectReference
   SET TableRowPointer = @EHRP
   WHERE TableRowPointer = @BadRP


END

GO
