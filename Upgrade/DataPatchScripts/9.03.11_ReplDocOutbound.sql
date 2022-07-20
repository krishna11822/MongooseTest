SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
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
*   (c) COPYRIGHT 2013 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
IF NOT EXISTS(SELECT 1 FROM ReplDocOutbound 
	WHERE AppliesToIDOMethodName = N'TriggerPulseNotificationSyncSp' 
	AND DocumentName = N'IONPulseNotification'
	AND AppliesToIDOName = N'SP!'
	AND DocumentName = N'IONPulseNotification'
	AND AccessAs = N'Core'
	AND AppliesToIDOAction = N'Invoke'
	AND BODNoun = N'PulseNotification'
	AND BODVerb = N'Process'
	)
	BEGIN
		INSERT INTO ReplDocOutbound ([DocumentName],[AppliesToIDOName], [AppliesToIDOAction], [AppliesToIDOMethodName], [BODNoun], [BODVerb], [AccessAs], [ActiveForManualRequest] )
		VALUES (N'IONPulseNotification',N'SP!', N'Invoke', N'TriggerPulseNotificationSyncSp', N'PulseNotification', N'Process', N'Core', 0)
	END
 
GO

