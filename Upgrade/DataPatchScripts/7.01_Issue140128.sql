/* $Header: /InforMongoose/InstallSource/Infor/Mongoose/Upgrade/DataPatchScripts/7.01_Issue140128.sql 1     6/11/12 4:01p Bcummings $ */
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
DECLARE @EHRP uniqueidentifier
SET @EHRP = 'E436BF15-9A8E-45F4-9705-08A238B511334'

   UPDATE EventAction
   SET Parameters = N'TO(E(ToVar)) SUBJECT(E(SubjectVar)) CATEGORY(E(CategoryParm)) BODY(E(BodyVar)) SAVEMESSAGE(FALSE)
HTMLBODY(E(HTMLBodyVar))'
   WHERE EventHandlerRowPointer = @EHRP
   AND Sequence = 10
GO
