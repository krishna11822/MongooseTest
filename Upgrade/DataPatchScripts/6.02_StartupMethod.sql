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
DECLARE
  @Seq INT
SELECT @Seq = ISNULL(MAX(Sequence), 0)
FROM StartupMethod

IF NOT EXISTS (SELECT 1 FROM dbo.StartupMethod WHERE MethodName = 'GetCurrentAccessAs')
BEGIN
   SET @Seq = @Seq + 1
   INSERT INTO dbo.StartupMethod (IDO, MethodName, ParameterList, Sequence)
   VALUES('AccessAs', 'GetCurrentAccessAs', 'RVAR V(AccessAs)', @Seq)
END

IF NOT EXISTS (SELECT 1 FROM dbo.StartupMethod WHERE MethodName = 'StartupMethodSp')
BEGIN
   SET @Seq = @Seq + 1
   INSERT INTO dbo.StartupMethod (IDO, MethodName, ParameterList, Sequence)
   VALUES('AccessAs', 'StartupMethodSp', 'RVAR V(Parm_Site),RVAR V(Parm_DisplayReportHeaders)', @Seq)
END
ELSE
   UPDATE StartupMethod set ParameterList='RVAR V(Parm_Site),RVAR V(Parm_DisplayReportHeaders)' where MethodName='StartupMethodSp'
GO
