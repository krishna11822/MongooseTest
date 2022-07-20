/* $Header: /Tools/SQLScripts/ApplicationDB/Init Data/EventHandler.sql 45    20-11-2019 20:24 R.Shilts $ */
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
*   (c) COPYRIGHT 2010 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/

-- ClearServiceSessions
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'CF41C0EE-D2B0-4E78-B9B1-01D1769E6708'

   DELETE [dbo].[EventAction] WHERE [EventHandlerRowPointer] = @EHRP         
   IF NOT EXISTS (SELECT 1 FROM EventAction WHERE EventHandlerRowPointer = @EHRP)
   BEGIN
      INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
         VALUES (@EHRP, 10, 22, 'METHOD("ClearOldSessionsSp") PARMS("",RV(InfobarVar))',
            N'Clears out old service sessions.')

      INSERT INTO EventAction (EventHandlerRowPointer, Sequence, ActionType, Parameters, Description)
         VALUES (@EHRP, 20, 12, 'CONDITION(V(InfobarVar) > "")
SETPARMVALUES(InfobarParm=V(InfobarVar))',
            N'Preserves any error message')
   END
GO
