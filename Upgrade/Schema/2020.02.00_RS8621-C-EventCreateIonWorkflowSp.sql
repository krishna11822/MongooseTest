SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EventCreateIonWorkflowSp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[EventCreateIonWorkflowSp]
GO

/*$Header: /Tools/SQLScripts/ApplicationDB/Stored Procedures/EventCreateWorkflowSp.sp 2     4/05/13 5:27p Djohnson $ */
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
*   (c) COPYRIGHT 2012 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/

/* $Archive: /Tools/SQLScripts/ApplicationDB/Stored Procedures/EventCreateWorkflowSp.sp $
 *
 * CoreDev 2 RS5905 Djohnson Fri Apr 05 17:27:58 2013
 * RS5905 - Default AppliesToSite to local site.
 *
 * CoreDev 1 RS5337 Nthurn Sun Jun 03 04:15:15 2012
 * Create EventHandler(s) for the WorkflowWizard form.  (RS5337)
 *
 * $NoKeywords: $
 */
CREATE PROCEDURE [dbo].[EventCreateIonWorkflowSp] (
   @Purpose DescriptionType -- e.g. STRINGS(sNotifyMeWhen...)
   , @EventSuffix EventNameType
   , @Description DescriptionType
   , @AppliesToForm EventObjectListType
   , @FormTitle FormNameOrCaptionType
   , @AppliesToIDO EventObjectListType
   , @IDOCaption FormNameOrCaptionType
   , @Filter nvarchar(MAX)
   , @TriggeringProperty CollectionPropertyNameType
   , @OldPropertyList nvarchar(MAX)
   , @AbsoluteOldPropertyList nvarchar(MAX)
   , @AbsoluteDeltaPropertyList nvarchar(MAX)
   , @Condition nvarchar(MAX)
   , @Active tinyint
   , @EventName EventNameType OUTPUT
   , @HandlerSequence SequenceType OUTPUT
)
AS

   


   DECLARE @Delimiter NCHAR(1)
   SET @Delimiter = N','

   DECLARE @DoubleQuote nchar(1)
   DECLARE @DoubleDoubleQuote nchar(2)
   SET @DoubleQuote = N'"'
   SET @DoubleDoubleQuote = N'""'

   DECLARE @ActionSequence SequenceType
   SET @ActionSequence = 0

   DECLARE @Synchronous bit
   SET @Synchronous = 0

   DECLARE @AppliesToSites SiteListType = dbo.DefaultToLocalSite(NULL)

   IF @OldPropertyList IS NOT NULL
   -- Confirm: Do we need to Notify Deletes before the Save is complete, in order to get at the key values?
   OR @EventSuffix = N'Delete'
      SET @EventName = N'IdoOnItem' + @EventSuffix
   ELSE
      -- We can do everything after the Save is complete
      SET @EventName = N'IdoPostItem' + @EventSuffix

   -- Workaround Issue 132582 --
   SET @EventName = N'IdoOnItem' + @EventSuffix

   IF @OldPropertyList IS NOT NULL
      -- We MUST do the Load IDO Row during the IdoOnItem* Event!  Otherwise we might retrieve "new" values there.
      SET @Synchronous = 1

   SET @HandlerSequence = 1
   SELECT TOP 1 @HandlerSequence = 1 + Sequence
   FROM EventHandler eh WITH(HOLDLOCK)
   WHERE eh.EventName = @EventName
   ORDER BY SEQUENCE DESC

   DECLARE @AccessAs AccessAsType
   SELECT TOP 1 @AccessAs = AccessAs FROM dbo.IdoAccessAsView

   DECLARE @EventHandlerRowPointer RowPointerType
   SET @EventHandlerRowPointer = NEWID()

   INSERT INTO EventHandler (EventName, SEQUENCE, AccessAs, Description, AppliesToObjects, AppliesToInitiators, Synchronous, RowPointer
      , EditableByWizard, Purpose, TriggeringProperty, AppliesToSites, Active )
   VALUES (@EventName, @HandlerSequence, @AccessAs, @Description, @AppliesToIDO, N'Form.' + @AppliesToForm, @Synchronous, @EventHandlerRowPointer
      , 1, @Purpose, @TriggeringProperty, @AppliesToSites, @Active )

   -- Avoid double Notify, in case another effective Handler Suspends, by ignoring Suspend-Validating mode --
   INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, ActionType, Description, Parameters)
      SELECT @EventHandlerRowPointer, 5, dbo.EventActionTypeCode(N'Finish'),
      N'Do nothing in Suspend-Validating mode',
      N'CONDITION(E(Suspend_ValidatingMode) = 1)'


   IF @OldPropertyList IS NOT NULL
   BEGIN
      -- Retrieve Old Properties --

      DECLARE @OldPropertyCount INT
      SET @OldPropertyCount = dbo.NumEntries(@OldPropertyList, @Delimiter)

      DECLARE @SetOldProperties nvarchar(MAX)
      DECLARE @OldPropertyNumber INT
      SET @OldPropertyNumber = 1
      WHILE @OldPropertyNumber <= @OldPropertyCount
      BEGIN
         IF @SetOldProperties IS NULL
            SET @SetOldProperties = N''
         ELSE
            SET @SetOldProperties = @SetOldProperties + N', '

         DECLARE @PropertyName LongListType
         SET @PropertyName = dbo.ENTRY(@OldPropertyNumber, @OldPropertyList, @Delimiter)

         SET @SetOldProperties = @SetOldProperties + N'RV(Old' + @PropertyName + N') = "' + @PropertyName + N'"'
         SET @OldPropertyNumber = @OldPropertyNumber + 1
      END

      DECLARE @LoadIDORowParameters nvarchar(MAX)
      -- E.g.  Load IDO Row
      -- IDO(IDO())
      -- PROPERTIES("AbcCode, AltItem, AsmFixed, Buyer, ChgDate, DaysSupply")
      -- FILTER(SUBSTITUTE("RowPointer = {0}", FP("RowPointer")))
      -- SET(RV(OldAbcCode) = "AbcCode", RV(OldAltItem) = "AltItem", RV(OldAsmFixed) = "AsmFixed", RV(OldBuyer) = "Buyer", RV(OldChgDate) = "ChgDate", RV(OldDaysSupply) = "DaysSupply")
   
      SET @LoadIDORowParameters = N'IDO(IDO())
FILTER(SUBSTITUTE("RowPointer = {0}", FP("RowPointer")))
PROPERTIES("' + @OldPropertyList + N'")
SET(' + @SetOldProperties + N')'

      INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, ActionType, Description, Parameters)
         SELECT @EventHandlerRowPointer, 10, dbo.EventActionTypeCode(N'LoadIDORow'),
         N'Get old property values from changed row',
         @LoadIDORowParameters
   END


   -- Check Filter --

   IF @Filter IS NOT NULL
   BEGIN
      DECLARE @FinishCondition nvarchar(MAX)
      SET @FinishCondition = N'CONDITION( NOT (' + @Filter + N' ) )'

      INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, ActionType, Description, Parameters)
         SELECT @EventHandlerRowPointer, 20, dbo.EventActionTypeCode(N'Finish'), N'Check Filter', @FinishCondition

   END


   -- Calculate Absolute Values of Old Properties --

   IF @AbsoluteOldPropertyList IS NOT NULL
   BEGIN
      SET @ActionSequence = 110

      DECLARE @AbsoluteOldPropertyCount INT
      SET @AbsoluteOldPropertyCount = dbo.NumEntries(@AbsoluteOldPropertyList, @Delimiter)

      DECLARE @AbsoluteOldPropertyNumber INT
      SET @AbsoluteOldPropertyNumber = 1
      WHILE @AbsoluteOldPropertyNumber <= @AbsoluteOldPropertyCount
      BEGIN
         SET @PropertyName = dbo.ENTRY(@AbsoluteOldPropertyNumber, @AbsoluteOldPropertyList, @Delimiter)

         DECLARE @SetAbsoluteOldProperty nvarchar(MAX)
         SET @SetAbsoluteOldProperty = N'ABS_Old' + @PropertyName + N' = IF(V(Old' + @PropertyName + N') > 0, V(Old' + @PropertyName + N'), - CAST(V(Old' + @PropertyName + N') AS NUMBER))'
         SET @AbsoluteOldPropertyNumber = @AbsoluteOldPropertyNumber + 1

         DECLARE @SetValueAbsoluteOldParameters nvarchar(MAX)
         -- E.g. Set Values
         -- CONDITION( PROPERTYAVAILABLE("P2") )
         -- SETVARVALUES(ABS_OldP2 = IF(V(OldP2) >= 0, V(OldP2), - CAST(V(OldP2) AS NUMBER)))
   
         SET @SetValueAbsoluteOldParameters = N'CONDITION( PROPERTYAVAILABLE("' + @PropertyName + N'") )
SETVARVALUES( ' + @SetAbsoluteOldProperty + N' )'

         INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, ActionType, Description, Parameters)
            SELECT @EventHandlerRowPointer, @ActionSequence, dbo.EventActionTypeCode(N'SetValues'),
            N'Calculate numeric property absolute',
            @SetValueAbsoluteOldParameters

         SET @ActionSequence = @ActionSequence + 5
      END
   END

   -- Calculate Absolute Values of Changes of Properties --
      
   IF @AbsoluteDeltaPropertyList IS NOT NULL
   BEGIN
      IF @ActionSequence < 210
         SET @ActionSequence = 210

      DECLARE @AbsoluteDeltaPropertyCount INT
      SET @AbsoluteDeltaPropertyCount = dbo.NumEntries(@AbsoluteDeltaPropertyList, @Delimiter)

      DECLARE @AbsoluteDeltaPropertyNumber INT
      SET @AbsoluteDeltaPropertyNumber = 1
      WHILE @AbsoluteDeltaPropertyNumber <= @AbsoluteDeltaPropertyCount
      BEGIN
         SET @PropertyName = dbo.ENTRY(@AbsoluteDeltaPropertyNumber, @AbsoluteDeltaPropertyList, @Delimiter)

         DECLARE @SetAbsoluteDeltaProperty nvarchar(MAX)
         SET @SetAbsoluteDeltaProperty = N'ABS_Delta_' + @PropertyName + N' = IF(P("' + @PropertyName + N'") > V(Old' + @PropertyName + N'), CAST(P("' + @PropertyName + N'") AS NUMBER) - V(Old' + @PropertyName + N'), CAST(V(Old' + @PropertyName + N') AS NUMBER) - P("' + @PropertyName + N'"))'
         SET @AbsoluteDeltaPropertyNumber = @AbsoluteDeltaPropertyNumber + 1

         DECLARE @SetValueAbsoluteDeltaParameters nvarchar(MAX)
         -- E.g. Set Values
         -- CONDITION( PROPERTYAVAILABLE("P1") )
         -- SETVARVALUES(ABS_Delta_P1 = IF(P("P1") > V(OldP1), CAST(P("P1") AS NUMBER) - V(OldP1), CAST(V(OldP1) AS NUMBER) - P("P1")))
   
         SET @SetValueAbsoluteDeltaParameters = N'CONDITION( PROPERTYAVAILABLE("' + @PropertyName + N'") )
SETVARVALUES(' + @SetAbsoluteDeltaProperty + N')'

         INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, ActionType, Description, Parameters)
            SELECT @EventHandlerRowPointer, @ActionSequence, dbo.EventActionTypeCode(N'SetValues'),
            N'Calculate numeric property deltas',
            @SetValueAbsoluteDeltaParameters

         SET @ActionSequence = @ActionSequence + 5
      END
   END


   -- Notify --

   IF @ActionSequence < 300
      SET @ActionSequence = 300
   
   DECLARE @NotifyCondition nvarchar(MAX)
   SET @NotifyCondition = N''

   IF @EventSuffix = N'Update'
      IF @Condition IS NOT NULL
         SET @NotifyCondition = N'CONDITION( ' + @Condition + ' )
'

   DECLARE @To MessageRecipientListType
   SET @To = N'ORIGINATOR()'

   -- Strings:
   -- sWorkflowNotifyRowAddition%1 = "A new row was added to %1."
   -- sWorkflowNotifyRowAddition%1%2%3 = "FORMAT(sWorkflowNotifyRowAddition%1, %1)\nThis addition was performed by %2 via the %3 form."
   -- sWorkflowNotifyPropertyChange%1%2 = "A change was made to %1 on a row of %2."
   -- sWorkflowNotifyPropertyChange%1%2%3%4 = "FORMAT(sWorkflowNotifyPropertyChange%1%2, %1, %2)\nThis change was performed by %3 via the %4 form."
   -- sWorkflowNotifyRowDeletion%1 = "A row was deleted from %1."
   -- sWorkflowNotifyRowDeletion%1%2%3 = "FORMAT(sWorkflowNotifyRowDeletion%1, %1)\nThis deletion was performed by %2 via the %3 form."
   -- sWorkflowNotifyInternal%1SeeDetails = "%1\nSee STRINGS(sVariables) tab for details."
   -- sWorkflowNotifyExternal%1SeeDetails = "%1<br>See below for details."
   -- sAProperty = "a property"
   -- sAnIDO = "an IDO"

   DECLARE @StringActionInfix nvarchar(MAX)
   DECLARE @StringSuffix1or2 nvarchar(MAX)
   DECLARE @StringSuffix1or2Plus2 nvarchar(MAX)
   DECLARE @IncludeProperty bit
   IF @EventSuffix = N'Insert'
   BEGIN
      SET @StringActionInfix = N'RowAddition'
      SET @StringSuffix1or2 = N'%1'
      SET @StringSuffix1or2Plus2 = N'%1%2%3'
      SET @IncludeProperty = 0
   END
   ELSE IF @EventSuffix = N'Update'
   BEGIN
      SET @StringActionInfix = N'PropertyChange'
      SET @StringSuffix1or2 = N'%1%2'
      SET @StringSuffix1or2Plus2 = N'%1%2%3%4'
      SET @IncludeProperty = 1
   END
   ELSE --IF @EventSuffix = N'Update'
   BEGIN
      SET @StringActionInfix = N'RowDeletion'
      SET @StringSuffix1or2 = N'%1'
      SET @StringSuffix1or2Plus2 = N'%1%2%3'
      SET @IncludeProperty = 0
   END

   -- Convert @TriggeringProperty to a Caption
   DECLARE @TriggeringPropertyCaption FormNameOrCaptionType
   IF @TriggeringProperty IS NOT NULL
      SET @TriggeringPropertyCaption = N'STRINGS(' + dbo.EffectiveLabelStringID(NULL, @AppliesToIDO, @TriggeringProperty, NULL) + N')'


   DECLARE @NotifySubject nvarchar(max)  -- MessageSubjectType
   SET @NotifySubject = REPLACE(
      N'FORMAT(sWorkflowNotify' + @StringActionInfix + @StringSuffix1or2 + N', '
      + CASE @IncludeProperty WHEN 1 THEN ISNULL(@TriggeringPropertyCaption, N'STRINGS(sAProperty)') + N', ' ELSE N'' END
      + ISNULL(@IDOCaption, N'STRINGS(sAnIDO)') + N')'
      , @DoubleQuote, @DoubleDoubleQuote)

   -- Make sure we don't blow out EventMessage.Subject on the Action execute!
   IF LEN(@NotifySubject) > 80
   BEGIN
      SET @NotifySubject = REPLACE(
         N'FORMAT(sWorkflowNotify' + @StringActionInfix + @StringSuffix1or2 + N', '
         + CASE @IncludeProperty WHEN 1 THEN ISNULL(@TriggeringPropertyCaption, N'STRINGS(sAProperty)') + N', ' ELSE N'' END
         -- Try without the IDO Caption:
         + N'STRINGS(sAnIDO)' + N')'
         , @DoubleQuote, @DoubleDoubleQuote)
         
      IF LEN(@NotifySubject) > 80
      BEGIN
         IF @IncludeProperty = 1
         SET @NotifySubject = REPLACE(
            N'FORMAT(sWorkflowNotify' + @StringActionInfix + @StringSuffix1or2 + N', '
            -- Try without the Property Caption:
            + N'STRINGS(sAProperty)' + N', '
            + N'STRINGS(sAnIDO)' + N')'
            , @DoubleQuote, @DoubleDoubleQuote)

         IF LEN(@NotifySubject) > 80
            -- Punt!
            SET @NotifySubject = SUBSTRING(
               REPLACE( @Description
               , @DoubleQuote, @DoubleDoubleQuote)
               , 1, 80)
            
      END
   END
   
   DECLARE @BodyPreludeTemplate nvarchar(max)
   SET @BodyPreludeTemplate = REPLACE(
      N'FORMAT(sWorkflowNotify' + @StringActionInfix + @StringSuffix1or2Plus2 + N', '
      + CASE @IncludeProperty WHEN 1 THEN ISNULL(@TriggeringPropertyCaption, N'STRINGS(sAProperty)') + N', ' ELSE N'' END
      + ISNULL(@IDOCaption, N'STRINGS(sAnIDO)') + N', {0}, '
      + ISNULL(@FormTitle, N'{1}') + N')'
      , @DoubleQuote, @DoubleDoubleQuote)

   DECLARE @NotifyParameters nvarchar(MAX)
   SET @NotifyParameters = @NotifyCondition
      + N'TO(' + @To + N')
CATEGORY("' + REPLACE(@Purpose, @DoubleQuote, @DoubleDoubleQuote) + N'")
SUBJECT("' + @NotifySubject + N'")
HTMLBODY(SUBSTITUTE("FORMAT(sWorkflowNotifyExternal%1SeeDetails, ' + @BodyPreludeTemplate + N')", ORIGINATOR(), REPLACE(INITIATOR(), "Form.", "")))
BODY(SUBSTITUTE("FORMAT(sWorkflowNotifyInternal%1SeeDetails, ' + @BodyPreludeTemplate + N')", ORIGINATOR(), REPLACE(INITIATOR(), "Form.", "")))'

   -- DECLARE @EventActionRowPointer RowPointerType
   -- SET @EventActionRowPointer = NEWID()
   -- INSERT INTO EventAction (EventHandlerRowPointer, SEQUENCE, RowPointer, ActionType, Description, Parameters)
   --    SELECT @EventHandlerRowPointer, @ActionSequence, @EventActionRowPointer, dbo.EventActionTypeCode(N'Notify'),
   --    N'Notify',
   --    @NotifyParameters


   -- -- String:
   -- -- sOld%1 = "Old %1"

   -- -- Create EventActionVariableAccess rows with Captions for our Old* variables --
   -- INSERT INTO EventActionVariableAccess (EventActionRowPointer, Name, Caption)
   -- SELECT
   --    @EventActionRowPointer
   --    , N'Old'  -- Must equal Old_prefix in EventConditionBuilder.cs!
   --       + p.PropertyName
   --    , N'FORMAT(sOld%1, STRINGS('+ ISNULL(p.EffectiveLabelStringID, N's' + p.PropertyName) + N'))'
   -- FROM dbo.TableOfEntries(@OldPropertyList, @Delimiter, 1,1,1) n
   -- INNER JOIN IdoPropertiesView p
   --    ON p.PropertyName = n.[Entry]
   -- WHERE p.CollectionName = @AppliesToIDO


   -- -- Create EventActionVariableAccess rows to hide our ABS_* variables --
   -- INSERT INTO EventActionVariableAccess (EventActionRowPointer, Name, [Access])
   -- SELECT
   --    @EventActionRowPointer
   --    , N'ABS_Old'  -- Must equal AbsoluteOld_prefix in EventConditionBuilder.cs!
   --       + n.[Entry]
   --    , N'H'  -- Hidden
   -- FROM dbo.TableOfEntries(@AbsoluteOldPropertyList, @Delimiter, 1,1,1) n
   
   -- INSERT INTO EventActionVariableAccess (EventActionRowPointer, Name, [Access])
   -- SELECT
   --    @EventActionRowPointer
   --    , N'ABS_Delta_'  -- Must equal AbsoluteDelta_prefix in EventConditionBuilder.cs!
   --       + n.[Entry]
   --    , N'H'  -- Hidden
   -- FROM dbo.TableOfEntries(@AbsoluteDeltaPropertyList, @Delimiter, 1,1,1) n


   -- -- Workaround Issue 149863 --
   -- INSERT INTO EventActionVariableAccess (EventActionRowPointer, Name, [Access])
   -- SELECT
   --    @EventActionRowPointer
   --    , N'Row.' + p.PropertyName
   --    , N'H'  -- Hidden
   -- FROM IdoPropertiesView p
   -- WHERE p.CollectionName = @AppliesToIDO
   -- AND p.EffectiveDataType = N'Binary'


   RETURN 0

GO