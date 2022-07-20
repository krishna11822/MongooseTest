SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* $Header: /Tools/SQLScripts/Upgrade/DataPatchScripts/9.01_Issue188548.sql 1     3/02/15 3:33p Bharbron $ */
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
--Issue 188548 - right-click Email not sending email address

IF EXISTS (SELECT 1 FROM WBDataViewAction 
           WHERE ScopeType = 0 
             AND ClassName = 'Email' 
             AND ActionType = 'E'
             AND Caption = 'sSendEmail')
   UPDATE WBDataViewAction
   SET ActionName = 'mailto:P(CURCOLLECTION(DOTIFNECESSARY)CURPROP())'
   WHERE ScopeType = 0 
     AND ClassName = 'Email' 
     AND ActionType = 'E'
ELSE
   INSERT WBDataViewAction ( 
        ScopeType
      , ScopeName
      , ClassName
      , IDOName
      , PropertyName
      , ActionType
      , ActionName
      , ActionParameters
      , ActionFilter
      , ActionInitialMode
      , ActionProperty
      , Active
      , Caption
   )
   SELECT
        0
      , '[NULL]'
      , 'Email'
      , NULL
      , NULL
      , 'E'
      , 'mailto:P(CURCOLLECTION(DOTIFNECESSARY)CURPROP())'
      , NULL
      , NULL
      , NULL
      , NULL
      , 1
      , 'sSendEmail'
      
      
IF EXISTS (SELECT 1 FROM WBDataViewAction
           WHERE ScopeType = 0
             AND ClassName = 'URL'
             AND ActionType = 'E'
             AND Caption = 'sWebsite')
   UPDATE WBDataViewAction
   SET ActionName = 'P(CURCOLLECTION(DOTIFNECESSARY)CURPROP())'
   WHERE ScopeType = 0
     AND ClassName = 'URL'
     AND ActionType = 'E'
ELSE
   INSERT WBDataViewAction ( 
        ScopeType
      , ScopeName
      , ClassName
      , IDOName
      , PropertyName
      , ActionType
      , ActionName
      , ActionParameters
      , ActionFilter
      , ActionInitialMode
      , ActionProperty
      , Active
      , Caption
   )
   SELECT 
        0
      , '[NULL]'
      , 'URL'
      , NULL
      , NULL
      , 'E'
      , 'P(CURCOLLECTION(DOTIFNECESSARY)CURPROP())'
      , NULL
      , NULL
      , NULL
      , NULL
      , 1
      , 'sWebsite'      