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
*   (c) COPYRIGHT 2015 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
*************************************************************** 
*/

-- =============================================================
--? RS #:?? 7480
--? Notes:? Remote WinStudio Sessions
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 52)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (52, N'Remote WinStudio Sessions')

GO
-- =============================================================
--? RS #:?? 7554
--? Notes:? Filter spec validation
-- =============================================================
IF NOT EXISTS(SELECT 1 FROM DefaultTypes WHERE DefaultType = 56)
INSERT INTO DefaultTypes (DefaultType, DefaultTypeDesc) VALUES (56, N'Filter validation')
GO
