SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
*   (c) COPYRIGHT 2017 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/
-- DefaultTypes:

-- =============================================================
--? RS #: 7480
--? Notes: Remote WinStudio Sessions
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 52)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (52, N'Remote WinStudio Sessions')
GO
-- =============================================================
--? RS #: 7311
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 54)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (54, N'Send Context Message on Form Focus')
GO
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 55)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (55, N'Optional Context Message Form Prefix')
GO
-- =============================================================
--? RS #:?? 7554
--? Notes:? Filter spec validation
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 56)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (56, N'Filter validation')
GO
-- =============================================================
--? RS #: 7790
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 57)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (57, N'Admin License Module Name')
GO

-- =============================================================
--? RS #: 7910
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 58)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (58, N'Prune Explorer Folder Callout')
GO

-- =============================================================
--? Issue: 219617
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 59)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (59, N'Browser Component BG Render Interval')
GO

-- =============================================================
-- Issue: 188102
-- =============================================================
--IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 60)
--INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (60, N'Framework Event Max. Recursion Depth')

IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 61)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (61, N'Disallow Underdefined AES Handlers')
GO

-- =============================================================
-- SystemProcessDefaults:
-- =============================================================

-- =============================================================
--? RS #: 7311
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 55)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (55,'MGCore_', 0, 0)


-- =============================================================
--? RS #: 7790
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM SystemProcessDefaults WHERE DefaultType = 57)
INSERT SystemProcessDefaults(DefaultType,DefaultValue, NoteExistsFlag, InWorkflow )
VALUES (57,'MGCoreTrans', 0, 0)
