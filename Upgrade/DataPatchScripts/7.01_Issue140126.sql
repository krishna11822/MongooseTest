-- =============================================================
--  Issue:   140126
--  Notes:   including a clause for the new HTMLFORMAT() keyword
-- =============================================================
DECLARE @EHRP uniqueidentifier

SELECT @EHRP = RowPointer FROM EventHandler WHERE EventName = 'GenericSendEmail' and Sequence = 1

IF @EHRP IS NOT NULL
BEGIN
         
	IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP AND Sequence=10 AND ActionType=26)
	   INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
		 VALUES (@EHRP, 10, 26, 'CONDITION(TRUE)  TO(E(EmailTo))  CC(E(EmailCc))  SUBJECT(E(EmailSubject))  BODY(E(EmailMessage)) HTMLFORMAT(E(EmailHTMLFormat) = "TRUE")',
		   N'Send e-mail message')
	ELSE
	   UPDATE EventAction 
		 SET Parameters ='CONDITION(TRUE)  TO(E(EmailTo))  CC(E(EmailCc))  SUBJECT(E(EmailSubject))  BODY(E(EmailMessage)) HTMLFORMAT(E(EmailHTMLFormat) = "TRUE")', 
			 Description= N'Send e-mail message'
		 WHERE EventHandlerRowPointer = @EHRP
		 AND Sequence=10
		 AND ActionType=26
END
GO