--File Generated on 11/18/2016 2:44:23 PM by johndou
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
*   (c) COPYRIGHT 2011 INFOR.  ALL RIGHTS RESERVED.           *
*   THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE            *
*   TRADEMARKS AND/OR REGISTERED TRADEMARKS OF INFOR          *
*   AND/OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS        *
*   RESERVED.  ALL OTHER TRADEMARKS LISTED HEREIN ARE         *
*   THE PROPERTY OF THEIR RESPECTIVE OWNERS.                  *
*                                                             *
***************************************************************
*/
/*
** Message File Generated for: 
** All messages where AccessAs = N'Core'
*/

/************************
 * Delete Messages
 ************************/
if exists (select 1 from dbo.sysobjects where id = object_id(N'[dbo].[ObjectBuildMessagesFk2]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
  ALTER TABLE [dbo].[ObjectBuildMessages] DROP CONSTRAINT ObjectBuildMessagesFk2
GO
DELETE ObjectBuildMessages
  WHERE ObjectName IN 
  (SELECT obb.ObjectName FROM dbo.ObjectBuildMessages AS obb 
  INNER JOIN dbo.ObjectMainMessages AS obm ON obb.ObjectName = obm.ObjectName 
  AND obb.MessageType = obm.MessageType 
  WHERE obm.AccessAs = N'Core'
)
GO
IF OBJECT_ID('dbo.ObjectMainMessagesDel') IS NOT NULL 
   DISABLE TRIGGER ObjectMainMessagesDel ON ObjectMainMessages
GO
DELETE ObjectMainMessages WHERE AccessAs = N'Core'
  AND  ObjectName NOT LIKE '%.RowPointer'
GO
IF OBJECT_ID('dbo.ObjectMainMessagesDel') IS NOT NULL 
   ENABLE TRIGGER ObjectMainMessagesDel ON ObjectMainMessages
GO
IF OBJECT_ID('dbo.ApplicationMessagesDel') IS NOT NULL 
   DISABLE TRIGGER ApplicationMessagesDel ON ApplicationMessages
GO
DELETE ApplicationMessages
  WHERE MessageNo NOT IN ( 
  SELECT MessageNo FROM ObjectBuildMessages) 
AND MessageNo NOT IN ( 
  SELECT MessageNo FROM ObjectMainMessages) 
AND AccessAs = N'Core'
GO
IF OBJECT_ID('dbo.ApplicationMessagesDel') IS NOT NULL 
   ENABLE TRIGGER ApplicationMessagesDel ON ApplicationMessages
GO
alter table [dbo].[ObjectBuildMessages]
add constraint [ObjectBuildMessagesFk2]
  foreign key (
  ObjectName , MessageType
  ) references [dbo].[ObjectMainMessages] (
  ObjectName , MessageType
  ) not for replication
GO

/************************
 * Application Messages
 ************************/
/* The following message must be there. Message 1 cannot be used as a real message */

EXEC AddApplicationMessage2Sp N'MG_1', N'Reserved Message Placeholder', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_10', N'At least &1 more &2(s) must exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_100', N'&1 may not be greater than [&2 - &3]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1000', N'Critical Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1001', N'Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1002', N'Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1003', N'Goal Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1004', N'Use Goal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1005', N'Goal Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1006', N'Parameter Update Program', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1007', N'Calculate Program', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1008', N'Short Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1009', N'Display', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_101', N'&1 may not be greater than &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1010', N'Alert Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1011', N'Use Alert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1012', N'Alert Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1013', N'Column Header', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1014', N'Column Size', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1015', N'Critical Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1016', N'Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1017', N'Goal Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1018', N'Use Goal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1019', N'Goal Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_102', N'&1 may not be &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1020', N'Maintenance Program', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1021', N'Calculate Program', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1022', N'Seq', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1023', N'Use Standard Display', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1024', N'Alert Color', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1025', N'Alert Symbol', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1026', N'Email Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1027', N'Goal Color', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1028', N'Goal Symbol', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1029', N'Parm Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_103', N'&1 may not be &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1030', N'SMTP Port', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1031', N'Server', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1032', N'Show Snapshot', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1033', N'Warning Color', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1034', N'Warning Symbol', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1035', N'Can Drill Down', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1036', N'Can Run', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1037', N'Update Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1038', N'Update Users', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1039', N'Critical Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_104', N'&1 may not be &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1040', N'User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1041', N'Receive Email', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1042', N'Actual Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1043', N'Goal Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1044', N'Alert Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1045', N'Use Alert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1046', N'Alert Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1047', N'Critical Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1048', N'Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1049', N'Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_105', N'&1 may not be &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1050', N'Goal Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1051', N'Goal Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1052', N'Use Goal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1053', N'Goal Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1054', N'Color', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1055', N'Symbol', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1056', N'Short Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1057', N'Date', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1058', N'Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1059', N'User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_106', N'&1 may not be &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1061', N'Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1062', N'Profile', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1063', N'Component Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1064', N'View Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1065', N'Layout Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1066', N'Source Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1067', N'Scope Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1068', N'Source Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1069', N'Scope Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_107', N'Length of &1 may not be greater than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1070', N'Default View', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1071', N'Property Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1072', N'Group', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1074', N'IDO Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1075', N'Caption', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1076', N'Style', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1077', N'Active', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1078', N'Critical Numbers As Of:', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1079', N'Working Days:', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_108', N'&1 may not be created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1080', N'Of', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1081', N'Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1082', N'Count', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1083', N'Goal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1084', N'Alert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1085', N'Total:', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1086', N'Warning', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1087', N'Year', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1088', N'Quarter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1089', N'Month', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_109', N'&1 may not be created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1090', N'Week', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1091', N'Today', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1092', N'Form Component', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1093', N'Form Variable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1094', N'Form Event Handler', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1095', N'Form', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1096', N'Scope Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1097', N'Scope Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1098', N'License Validation', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1099', N'Module', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_11', N'[&1] was not successful.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_110', N'&1 that has [&2: &3] may not be created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1100', N'Load', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1101', N'Decimal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1102', N'Columns', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1103', N'Integer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1104', N'Date', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1105', N'Character', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1106', N'Mismatched quotes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1107', N'Mismatched parenthesis', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1108', N'Unsubstituted function', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1109', N'No', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_111', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] may not be created', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1110', N'Yes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1111', N'Data Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1112', N'User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1113', N'Function', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1114', N'The following tasks are already running which prevent task &1 from being run at this time:&2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1115', N'The &1, &2 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1116', N'Combination', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1117', N'Key Field', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1118', N'Default Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1119', N'Note Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_112', N'Not one &1 may be created for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1120', N'Retain Site may not be false.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1121', N'Database Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1122', N'Profile Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1123', N'The &1 entered must be 0(Oracle) or 1(SQL Server).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1124', N'Query Timeout must be greater than or equal to -1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1125', N'Site that has [Site: &1] has no parms record.  Check the site in Configuration Manager.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1126', N'Site &1 exists on database &2 that is not part of intranet &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1127', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1128', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10, &11 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1129', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10, &11, &12 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_113', N'&1 where &2 is &3 may not be created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1130', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10, &11, &12, &13 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1131', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10, &11, &12, &13, &14 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1132', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9, &10, &11, &12, &13, &14, &15 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1133', N'External', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1134', N'&1 is invalid using [&2: &3] with [&4: &5] where [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1135', N'Site &1 is not live-linked to Site &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1136', N'ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1137', N'Account Authorizations', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1138', N'Account Authorizations', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1139', N'Active Background Tasks', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_114', N'&1 does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1140', N'Application Schema Columns Metadata', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1141', N'Application Messages', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1142', N'Application Schema Modules Metadata', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1143', N'Application Schema Tables Metadata', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1144', N'Audit Log Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1145', N'Background Task Definitions', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1146', N'Background Task History', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1147', N'BOD Template', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1148', N'Business Partner Product', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1149', N'Class Notes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_115', N'&1 that has [&2: &3] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1150', N'Configuration Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1151', N'Connection Information', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1152', N'Core Inbox Entry', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1153', N'Core Inbox Headers', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1154', N'Core Outbox Entry', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1155', N'Core Outbox Headers', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1156', N'Core property', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1157', N'Country Pack', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1158', N'Database Status', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1159', N'ESB Inbound Duplicate', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_116', N'&1 that has [&2: &3] and [&4: &5] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1160', N'ESB Previous Version Mediation', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1161', N'ESB Variation ID Mediation', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1162', N'Event', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1163', N'Event Action Variable Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1164', N'Event Global Constant', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1165', N'Event Handler Revision', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1166', N'Event Initial Variable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1167', N'Event Input Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1168', N'Event Message Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1169', N'Event Message Variable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_117', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1170', N'Event Output Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1171', N'Event Queue', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1172', N'Event Revision', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1173', N'Event Trigger Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1174', N'Event Variable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1175', N'External Data Store', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1176', N'Group Names', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1177', N'IDO Linked Column', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1178', N'IDO Linked Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1179', N'Intranet Shared Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_118', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1180', N'Intranet Shared User Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1181', N'Intranet Shared User Table Default', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1182', N'Language IDs', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1183', N'Long Row Pointer Map', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1184', N'Message Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1185', N'MG Data Source Maps', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1186', N'MG Data Sources', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1187', N'Module Members', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1188', N'Modules', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1189', N'Note Headers', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_119', N'Not one &1 exists for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1190', N'Notes Site Map', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1191', N'Object Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1192', N'ODT Objects', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1193', N'Printer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1194', N'Process Error Log', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1195', N'Process Line Numbers', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1196', N'Product SP Items', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1197', N'Product Version', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1198', N'Publication Category Publication', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1199', N'Replication Document Attributes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_12', N'[&1] was not successful for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_120', N'Not one &1 exists for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1200', N'Replication Document Inbound', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1201', N'Replication Document Outbound Filter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1202', N'Replicated Rows 3', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1203', N'Replicated Rows Errors', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1204', N'Reusable Notes To Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1205', N'Report Option Values', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1206', N'Search Preference List', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1207', N'Session Context Names', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1208', N'Shadow Value Errors', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1209', N'Site Connection Information', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_121', N'Not one &1 exists for &2 that has [&3: &4] and [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1210', N'Specific Notes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1211', N'System Notes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1212', N'System Process Defaults', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1213', N'Table Class Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1214', N'Table Class Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1215', N'Task Exclusion', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1216', N'Task Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1217', N'Temporary Event Handler', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1218', N'New Data Maintenance Staging Data', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1219', N'Track Rows', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_122', N'Not one &1 exists for &2 that has [&3: &4] and [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1220', N'User Class Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1221', N'User Class Field Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1222', N'User Class Field Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1223', N'User Class Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1224', N'User Class Record Associate', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1225', N'User Field Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1226', N'User Field Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1227', N'User Index Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1228', N'User Index Field Committed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1229', N'User Index Field Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_123', N'Not one &1 exists for &2 that has [&3: &4] and [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1230', N'User Index Impacted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1231', N'User Calendar', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1232', N'User Defined Fields', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1233', N'User Defined Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1234', N'User Defined Type Values', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1235', N'User Group Map', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1236', N'User Modules', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1237', N'User Notes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1238', N'User Password History', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1239', N'User Process Defaults', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_124', N'Not one &1 exists that has [&2: &3] and [&4: &5] where &6 is after &7.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1240', N'User Task', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1241', N'DataView Column', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1242', N'DataView Group', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1243', N'DataView IDO', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1244', N'DataView Layout', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1245', N'DataView User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1246', N'Drilldown Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1247', N'Drilldown Column', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1248', N'Drilldown Filter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1249', N'Drilldown Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_125', N'Not one &1 where &2 is &3 exists for &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1250', N'KPI Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1251', N'KPI Drilldown', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1252', N'Sub Drilldown', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1253', N'Business Partner Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1254', N'Product', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1255', N'Inbox ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1256', N'Outbox ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1257', N'Option', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1258', N'Process ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_126', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1260', N'TableRowPointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1261', N'Event Handler Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1262', N'Event Action Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1263', N'Event Handler State Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1264', N'Event State Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1265', N'Event Revision Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1266', N'Event State Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1267', N'Initial State Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1268', N'Event Initial State Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1269', N'Event Parameter Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_127', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1270', N'Event Message Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1271', N'Event Parameter Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1272', N'EventRevision', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1273', N'Event Trigger Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1274', N'Event Trigger Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1275', N'Access Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1276', N'Group ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1277', N'Alias Prog ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1278', N'View Column Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1279', N'Intranet Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_128', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1280', N'Language Code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1281', N'Long Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1282', N'Note Flag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1283', N'Reference Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1284', N'Child Object ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1285', N'Child Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1286', N'Parent Object ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1287', N'Parent Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1288', N'Column ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1289', N'Table ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_129', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8] and [&9: &A] and [&B: &C].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1290', N'Publication Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1291', N'Attribute Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1292', N'Element Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1293', N'Applies to IDO Method Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1294', N'Applies to IDO Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1295', N'Filter Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1296', N'Outbound BOD Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1297', N'Counter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1298', N'Form Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1299', N'Search Item Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_13', N'[&1] was not successful for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_130', N'Not one &1 where &2 is &3 and &4 is &5 exists for &6 that has [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1300', N'Search Group', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1301', N'Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1302', N'Tracked Operation Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1303', N'Appointment Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1304', N'End Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1305', N'Start Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1306', N'Password Age Count', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1307', N'Drill Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1308', N'Sub-Drill Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1309', N'Password Minimum Days must be less than or equal to Password Expiration Days, unless either is zero.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_131', N'Not one &1 where &2 is &3 and &4 is &5 and &6 is &7 exists for &8 that has [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1310', N'The password cannot be changed at this time due to minimum password age requirements.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1311', N'The user account [&1] has been inactive too long and is disabled now. Please note what you were trying to do and contact your administrator.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1312', N'Token Authentication has failed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1313', N'&1 is not checked out.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1314', N'Key Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1315', N'Key Value 2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1316', N'Line number &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1317', N'Procedure &1 not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1318', N'No more than two part identifiers allowed: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1319', N'&1 &2 &3 is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_132', N'Not one &1 where &2 is &3 and &4 is &5 and &6 matches &7 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1320', N'CREATE PROCEDURE must be set in dbo schema.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1321', N'Must start with CREATE PROCEDURE.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1322', N'CREATE PROCEDURE statement not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1323', N'EXECUTE of dynamic stored procedure name &1 is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1324', N'EXECUTE () of dynamic SQL is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1325', N'Execute of dynamic SQL via sp_executesql is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1326', N'Procedure name must begin with extgen_.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1327', N'After', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1328', N'Agriculture', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1329', N'Default', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_133', N'Not one &1 exists where &2 is on or before &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1330', N'Dynamic Subcollection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1331', N'Exclusive Instead', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1332', N'First', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1333', N'Given Name First', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1334', N'Hidden', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1335', N'Household', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1336', N'Instead', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1337', N'Last', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1338', N'Literal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1339', N'Medicare Qualified Government Employment', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_134', N'Not one &1 exists that has [&2: &3] and [&4: &5] where &6 is on or before &7.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1340', N'Native Mode', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1341', N'Network', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1342', N'Pickup Directory From IIS', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1343', N'PropertyTag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1344', N'Railroad', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1345', N'Read Only', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1346', N'SharePoint Integrated Mode', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1347', N'Specified Pickup Directory', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1348', N'Surname First', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1349', N'Writable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_135', N'&1 does not exist where &2 is &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1350', N'Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1351', N'Active For Manual Request', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1352', N'allow record assoc', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1353', N'analytical ledger', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1354', N'Any Handlers Failed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1355', N'Auto View', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1356', N'capitalize', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1357', N'Chronology', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1358', N'default ending from starting', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1359', N'Default Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_136', N'Not one &1 where &2 is &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1360', N'Delete After Reminder', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1361', N'Disallow Update', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1362', N'ec reporting', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1363', N'Editable By Wizard', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1364', N'Eligible For Background Manual Request', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1365', N'emp type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1366', N'enable multiple fsb', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1367', N'Enforce Digit', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1368', N'Event Has Changed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1369', N'extend all recs', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_137', N'Not one &1 where &2 is &3 exists that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1370', N'gl print post', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1371', N'Has Been Read', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1372', N'hide parent grid columns', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1373', N'Ignore Failure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1374', N'Ignore Insert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1375', N'Ignore Update', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1376', N'Include For Null Valued Element', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1377', N'index asc', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1378', N'index unique', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1379', N'index word', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_138', N'Not one &1 where &2 is &3 exists that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1380', N'Internal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1381', N'In Workflow', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1382', N'Is Framework Event', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1383', N'Is Framework IDOEvent', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1384', N'Is Framework IDO Suspendable Event', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1385', N'Is Output', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1386', N'Is Saved Message', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1387', N'Is System Record', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1388', N'Is To Logical Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1389', N'Iup Trigger Modifies New Rows', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_139', N'Not one &1 where &2 is &3 exists that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1390', N'Keep Clustering Keys', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1391', N'Minimum Password Expiration', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1392', N'Modified Payload Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1393', N'name code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1394', N'Next Key Reverse Key Order', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1395', N'Note Exists Flag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1396', N'Obsolete', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1397', N'Overridable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1398', N'Password Expiration', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1399', N'Payload Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_14', N'[&1] was not successful for &2 that has [&3: &4] and [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_140', N'You do not have &1 authorization for [&2].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1401', N'Persistent', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1402', N'print name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1403', N'Processed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1404', N'Register New Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1405', N'Remember Identity', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1406', N'Report Server Deployment Mode', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1407', N'Restart Current Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1408', N'retain site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1409', N'Retryable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_141', N'&1 may not be infinitely recursive.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1410', N'Retry From Current Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1411', N'Rolled Back', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1412', N'rsvd1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1413', N'rsvd2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1414', N'secure control accounts', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1415', N'Shareable', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1416', N'Shared', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1417', N'SMTP Delivery Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1418', N'SMTP Enable SSL', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1419', N'Suspended', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_142', N'&1 that has [&2: &3] may not be removed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1420', N'Suspend Validating Mode', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1421', N'Synchronous', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1422', N'Has Fields', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1423', N'Has Tables', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1424', N'Test Outside Lock For New Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1425', N'Transactional', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1426', N'Unmodified Payload Access', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1427', N'Update All Regardless Of Base Table Changes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1428', N'update all columns', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1429', N'Update Ref Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_143', N'&1 that has [&2: &3] and [&4: &5] may not be removed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1430', N'Use External General Ledger', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1431', N'use widget preferences', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1432', N'Use Email Reply To', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1433', N'Use RP On Insert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1434', N'Use RP On Update', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1435', N'ValueIs Global Constant Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1436', N'Value Source Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1437', N'Voting Open', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1438', N'Regular', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1439', N'Complete', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_144', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] may not be removed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1440', N'Mandatory', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1441', N'Military', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1442', N'Before', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1443', N'Post to Journal', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1444', N'Disable Replication', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1445', N'0', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1446', N'&1 must be &2, &3 or &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1447', N'&1 must be &2, &3, &4, &5 or &6.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1448', N'&1 must be &2, &3, &4, &5, &6 or &7.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1449', N'Workstation Login', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_145', N'"&1" may not be used in &2 fields.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1450', N'Success', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1451', N'Failure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1452', N'&1 must be &2, &3, &4 or &5.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1453', N'3', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1454', N'SP', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1455', N'XML Document', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1456', N'Localizations', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1457', N'Translations', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1458', N'The PayloadAccess should be D or UnmodifiedPayloadAccess and ModifiedPayloadAccess both equal to D.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1459', N'The Transport must be H(HTTP/Internet Protocol) or J(ESB/Enterprise Service Bus).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_146', N'[&1: &2] is invalid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1460', N'Invoke', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1461', N'Entity', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1462', N'Dispatch IDO Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1463', N'Dispatch Load Collection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1464', N'Dispatch Load IDO Row', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1465', N'Dispatch Update Collection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1466', N'DataView Input Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1467', N'Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1468', N'Update when can only contain a comma separated list of DefineVariable names. Invalid value [&1].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1469', N'Table [&1].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_147', N'&1 could not proceed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1470', N'Next Key Prefix', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1471', N'[&1] has invalid [&2:&3] and [&4:&5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1472', N'Next Key Length [&1] must be either a positive integer or a valid table.column definition.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1473', N'Next Key Generator [&1], SetNextKeySp must be followed by a comma and a single literal such as SetNextKeySp,N''XXX''.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1474', N'Expected Next Key Generator [&1] can be 2 valid stored procedures or 1 valid procedure with name/value pair parameters.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1475', N'Next Key Pairs [&1] must be either variable=value or variable=literal comma separated pairs.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1476', N'Next Key Additional Keys', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1477', N'Next Key Generator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_1478', N'Before generator code is no longer allowed.  Any such necessary logic should be written inside of the generator sp itself.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_148', N'The Print Preview was cancelled by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_149', N'&1 that has [&2: &3] is infinitely recursive.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_15', N'[&1] was not successful for &2 that has [&3: &4] and [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_150', N'Only the first and last &1(s) may be removed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_151', N'&1 has been removed by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_152', N'&1 that has [&2: &3] has been removed by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_153', N'A Site may not report to itself.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_154', N'Your session has been deleted.  You must close your session and log on again to continue.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_155', N'&1 should be &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_156', N'[&1] was not successful in site &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_157', N'&1 that has [&2: &3] exists in site &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_158', N'&1 that has [&2: &3] does not exist in site &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_159', N'&1 is not between &2 and &3 in site &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_16', N'[&1] was not successful for &2 that has [&3: &4] and [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_160', N'&1 &2(s) were changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_161', N'&1 &2(s) were created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_162', N'&1 &2(s) were deleted.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_163', N'&1 &2(s) were detected.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_164', N'&1 &2(s) were displayed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_165', N'&1 &2(s) were invalid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_166', N'&1 &2(s) contained error(s).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_167', N'&1 &2 contained error(s).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_168', N'&1 &2(s) were posted.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_169', N'&1 &2(s) were processed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_17', N'[&1] is not applicable.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_170', N'&1 &2(s) have been removed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_171', N'&1 &2(s) were selected.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_172', N'&1 must be manually adjusted.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_173', N'&1 must be manually adjusted for &2 that has [&3: &4]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_174', N'&1 is stored as a percentage of the &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_175', N'&1 has been changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_176', N'[&1] is not applicable.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_177', N'[&1] must be performed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_178', N'[&1] will be performed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_179', N'[&1] has been performed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_18', N'[&1] is not applicable for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_180', N'[&1] should be performed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_181', N'[&1] was successful.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_182', N'[&1] was successful for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_183', N'[&1] was successful for &2 that has [&3: &4] and [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_184', N'[&1] was successful for &2 that has [&3: &4] and [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_185', N'Contact system administrator.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_186', N'&1 has been distributed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_187', N'Enter &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_188', N'&1 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_189', N'&1 that has [&2: &3] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_19', N'[&1] is not applicable for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_190', N'&1 that has [&2: &3] and [&4: &5] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_191', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_192', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_193', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_194', N'At least one &1 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_195', N'At least one &1 where &2 is not equal to &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_196', N'At least one &1 where &2 is not equal to &3 exists for &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_197', N'At least one &1 where &2 is less than &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_198', N'At least one &1 exists where &2 is equal to &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_199', N'At least one &1 exists where &2 is equal to &3 for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_20', N'[&1] is not applicable for &2 that has [&3: &4] and [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_200', N'At least one &1 exists for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_201', N'At least one &1 exists for &2 that has [&3: &4]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_202', N'More than one &1 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_203', N'More than one &1 where &2 is &3 exists for &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_204', N'At least one &1 where &2 is &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_205', N'At least one &1 where &2 is &3 exists for &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_206', N'At least one &1 where &2 is &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_207', N'At least one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_208', N'At least one &1 where &2 is &3 and &4 is &5 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_209', N'At least one &1 where &2 is &3 and &4 is &5 and &6 is &7 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_21', N'[&1] is not applicable for &2 that has [&3: &4] and [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_210', N'At least one &1 where &2 is not &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_211', N'At least one &1 exists where &2 is one of: &3 for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_212', N'At least one &1 exists where &2 is not &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_213', N'First &1 for &2 that has [&3: &4] is currently displayed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_214', N'First &1 for &2 that has [&3: &4] and [&5: &6] is currently displayed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_215', N'Information has been changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_216', N'&1 is &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_217', N'&1 is less than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_218', N'&1 is not equal to &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_219', N'&1 is not equal to &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_22', N'Unable to connect to database &1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_220', N'&1 is not equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_221', N'&1 is not equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_222', N'&1 is not equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_223', N'&1 is less than &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_224', N'&1 is less than &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_225', N'&1 is less than &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_226', N'&1 is equal to &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_227', N'&1 is equal to &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_228', N'&1 is equal to &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_229', N'&1 is equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_23', N'Error in field &1 (character &2):', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_230', N'&1 is equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_231', N'&1 is equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_232', N'&1 is equal to &2 for every &3 that has [&4: &5] where &6 is between &7 and &8.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_233', N'&1 is greater than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_234', N'&1 is greater than &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_235', N'&1 is &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_236', N'&1 is &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_237', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_238', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_239', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_24', N'&1 that has [&2: &3] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_240', N'&1 is after &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_241', N'&1 is &2 for the first &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_242', N'&1 is &2 and &3 is &4 for &5 that has [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_243', N'&1 is &2 for the last &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_244', N'&1 is not one of: &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_245', N'&1 is not one of: &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_246', N'&1 is not &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_247', N'&1 is not a multiple of &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_248', N'&1 is not &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_249', N'&1 is not &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_25', N'&1 that has [&2: &3] and [&4: &5] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_250', N'&1 is not &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_251', N'&1 is not &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_252', N'&1 is &2 and will be &3 for &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_253', N'&1 is &2 and will be &3 for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_254', N'&1 is &2 and will be &3 for &4 that has [&5:&6] and [&7:&8] and [&9:&A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_255', N'&1 is locked by another user', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_256', N'More than one &1 exists where &2 is &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_257', N'&1 may be &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_258', N'&1 may be one of: &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_259', N'{&1} must be installed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_26', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_260', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] was not changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_261', N'&1 does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_262', N'&1 that has [&2: &3] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_263', N'&1 that has [&2: &3] and [&4: &5] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_264', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_265', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_266', N'Not one &1 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_267', N'Not one &1 where &2 is greater than &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_268', N'Not one &1 where &2 is greater than &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_269', N'Not one &1 exists for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_27', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_270', N'Not one &1 exists for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_271', N'Not one &1 exists for &2 that has [&3: &4] and [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_272', N'Not one &1 exists for &2 that has [&3: &4] and [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_273', N'Not one &1 exists where &2 is between &3 and &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_274', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_275', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_276', N'Not one &1 where &2 is &3 and &4 is &5 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_277', N'Not one &1 where &2 is &3 or &4 is &5 exists for &6 that has [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_278', N'Not one &1 exists where &2 is on or before &3 for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_279', N'&1 does not exist where &2 is &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_28', N'&1 that has [&2:&3] and [&4:&5] and [&6:&7] and [&8:&9] and [&A:&B] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_280', N'[&1: &2] is not equal to [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_281', N'Report Submitted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_282', N'&1 is &2 for &3 in site &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_283', N'&1 is &2 for &3 that has [&4: &5] in site &6.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_284', N'&1 that has [&2: &3] does not exist in site &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_285', N'&1 that has [&2: &3] and [&4: &5] does not exist in site &6.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_286', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] does not exist in site &8.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_287', N'&1 values were overridden for [&2: &3]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_288', N'&1 was &2 and now is &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_289', N'&1 was equal to &2 and now is equal to &3 for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_29', N'&1 that has [&2:&3] and [&4:&5] and [&6:&7] and [&8:&9] and [&A:&B] and [&C:&D] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_290', N'&1 will not be updated.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_291', N'&1 will not be updated for &2 that has [&3: &4].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_292', N'&1 will be &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_293', N'&1 will be &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_294', N'[&1] is being performed by &2 other user(s).^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_295', N'Changes made on this screen will be accepted.^Yes|No|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_296', N'[&1] will continue.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_297', N'[&1] will be performed for &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_298', N'[&1] will be performed for &2 that has [&3: &4].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_299', N'[&1] will be performed for &2 that has [&3: &4].^No|Yes|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_30', N'A &1 exists for every &2 that has [&3: &4] and [&5: &6]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_300', N'[&1] will be performed for &2 that has [&3: &4] and [&5: &6].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_301', N'[&1] will be performed for &2 that has [&3: &4] and [&5: &6] and [&7: &8].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_302', N'[&1] will be performed from &2 to &3.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_303', N'[&1] will be performed.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_304', N'&1 will be created.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_305', N'&1 that has [&2: &3] will be created.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_306', N'&1 that has [&2: &3] and [&4: &5] will be created.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_307', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] will be created.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_308', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] will be created.^OK|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_309', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] exists.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_31', N'At least one &1 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_310', N'At least one &1 where &2 is &3 exists. ^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_311', N'More than 1 type of &1 exists for this &2. Continue ? ^OK|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_312', N'Should &1 be extended by &2?^Yes|No', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_313', N'Should [&1] be performed for &2?^Yes|No', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_314', N'Should [&1] be performed for &2 that has [&3: &4]?^Yes|No|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_315', N'Should [&1] be performed?^No|Yes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_316', N'Should [&1] be performed?^Yes|No', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_317', N'Should [&1] be performed?^Yes|No|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_318', N'&1 is not equal to &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_319', N'&1 is less than &2 for &3 that has [&4: &5] and [&6: &7].^OK|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_32', N'At least one &1 exists where &2 is greater than &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_320', N'&1 is less than &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_321', N'&1 is greater than &2 for &3 that has [&4: &5].^OK|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_322', N'&1 is greater than &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_323', N'&1 is &2 for &3 that has [&4: &5].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_324', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_325', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_326', N'&1 is &2 and will be &3 for &4.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_327', N'&1 is &2 and will be &3 for &4 that has [&5: &6].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_328', N'&1 is &2 and will be &3 for &4 that has [&5: &6] and [&7: &8].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_329', N'&1 is &2 and will be &3 for &4 that has [&5: &6] and [&7: &8] and [&9: &A].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_33', N'At least one &1 where &2 is &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_330', N'&1 is &2 and will be &3 for &4 that has [&5: &6] and [&7: &8] and [&9: &A] and [&B: &C].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_331', N'&1 that has [&2: &3] does not exist.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_332', N'&1 that has [&2: &3] and [&4: &5] does not exist.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_333', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] does not exist.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_334', N'&1 that has [&2: &3] and [&4: &5] and [&6: &7] and [&8: &9] does not exist.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_335', N'&1 that has [&2: &3] will be removed.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_336', N'Every &1 for &2 will be removed.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_337', N'Every &1 will be removed for &2 that has [&3: &4] and [&5: &6] and [&7: &8] and [&9: &A].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_338', N'&1 should be &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_339', N'&1 is not between &2 and &3 in site &4.^OK|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_34', N'At least one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_340', N'&1?^Yes|No|Cancel', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_341', N'&1 will be greater than &2 for &3.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_342', N'&1 will be greater than &2 for &3 that has [&4: &5] and [&6: &7].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_343', N'&1 will be greater than &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_344', N'&1 will be &2 for &3.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_345', N'&1 will be &2.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_346', N'&1 will be created where &2 is equal to &3.^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_347', N'Not one &1 will be created for &2 that has [&3: &4].^Cancel|OK', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_348', N'&1 that has [&2: &3] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_349', N'&1 that has [&2: &3] and [&4: &5] exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_35', N'At least one &1 where &2 is &3 and &4 is &5 exists for &6 that has [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_350', N'At least one &1 where &2 is less than &3 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_351', N'[&1] is being performed by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_352', N'&1 is &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_353', N'&1 is equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_354', N'&1 is equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_355', N'&1 is greater than &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_356', N'&1 is &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_357', N'&1 is &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_358', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_359', N'&1 is not &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_36', N'At least one &1 where &2 is &3 and &4 is &5 exists for &6 that has [&7: &8] and [&9: &A] and [&B: &C].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_360', N'Warning: No license initialization data is available for Module [&1].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_361', N'&1 that has [&2: &3] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_362', N'&1 that has [&2: &3] and [&4: &5] does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_363', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_364', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_365', N'Not one &1 where &2 is &3 exists for &4 that has [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_366', N'Not one &1 has been selected.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_367', N'&1 will be &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_368', N'Errors occurred during delete of &1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_369', N'The &1 entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_37', N'At least one &1 where &2 is &3 and &4 is &5 and &6 is &7 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_370', N'The &1 field is a ''KeyField'' and cannot be updated.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_371', N'Related records exist in &1.  Cannot delete record.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_372', N'The &1, &2 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_373', N'May not delete system defined &1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_374', N'&1 does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_375', N'The &1, &2, &3, &4 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_376', N'The &1 must be entered when &2 is not null.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_377', N'&1 does not exist for this &2 and &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_378', N'The &1 entered must be less than or equal to the &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_379', N'Errors occurred during insert of &1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_38', N'At least one &1 exists where &2 is not &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_380', N'&1 exist for this &2.  Cannot delete record.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_381', N'The &1 entered must be greater than 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_382', N'The &1 already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_383', N'The &1 entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_384', N'The &1, &2 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_385', N'The &1, &2, &3 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_386', N'The &1, &2, &3, &4 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_387', N'The &1, &2, &3, &4, &5 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_388', N'The &1, &2, &3, &4, &5, &6 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_389', N'The &1, &2, &3, &4, &5, &6, &7 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_39', N'At least one &1 where the data type is not &2 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_390', N'The &1, &2, &3, &4, &5, &6, &7, &8 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_391', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9 combination entered already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_392', N'Cannot delete &1 requested because it is still in use.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_393', N'The &1 value entered is not in uppercase.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_394', N'The &1 entered must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_395', N'The &1 entered must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_396', N'Either the &1 or &2 information must be entered.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_397', N'The &1 entered cannot be greater than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_398', N'The &1 cannot have a value entered when &2 already has a value.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_399', N'The &1 entered must be 0(Internal) or 1(External).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_40', N'The Maximum Number Of Formats (2) Has Been Exceeded!', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_400', N'The &t1 entered cannot be null in &t2.  &t3 rolled back.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_401', N'&1 does not exist for &2 (&t1), &3 (&t2), and &4 (&t3).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_402', N'The &1 (&t1) entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_403', N'The following tasks are already running which prevent task &t1 from being run at this time:&t2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_404', N'Cannot delete record. At least one &1 exists for this &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_405', N'Cannot delete record. At least one &1 exists for this &2, &3 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_406', N'At least one related &1 exists.  Cannot delete record.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_407', N'Cannot delete record. At least one &1 exists for this &2, &3, &4 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_408', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_41', N'&1 is invalid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_410', N'Note Exists Flag entered must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_411', N'Attempt to insert a New Type into an SYSTEM reserved range.  All user defined Types must be greater than 10000.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_412', N'User Note Token or Specific Note Token may not be entered when System Note Token is not null.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_413', N'System Note Token or User Note Token may not be entered when Specific Note Token is not null.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_414', N'Specific Note Token or System Note Token may not be entered when User Note Token is not null.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_415', N'One of Specific Note Token, System Note Token, or User Note Token must be entered.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_416', N'Task is already running. Can only run one instance of this task.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_417', N'Exclusive Flag entered must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_418', N'Attempt to insert a New Audit Message Type into a SYSTEM reserved range.  All Audit Message Types must be between 1 and 65535.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_419', N'Message Language', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_42', N'&1 that has [&2:&3] and [&4:&5] and [&6:&7] and [&8:&9] and [&A:&B] is invalid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_420', N'Message Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_421', N'Object Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_422', N'Object Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_423', N'Application Message', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_424', N'Table Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_425', N'Task Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_426', N'Sequence Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_427', N'User ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_428', N'Referenced Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_429', N'Note Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_43', N'The character <&1> is not valid in &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_430', N'Note Header Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_431', N'Specific Note Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_432', N'System Note Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_433', N'User Note Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_434', N'Class Note Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_435', N'Object Note Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_436', N'Task Code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_437', N'Default Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_438', N'Message Code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_439', N'Object ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_44', N'&1 is &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_440', N'Internal/External Note Flag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_441', N'Message Severity', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_442', N'Object Code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_443', N'Allow User Default Flag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_444', N'Task Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_445', N'Default Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_446', N'Group Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_447', N'Task Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_448', N'Output Format', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_449', N'Row ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_45', N'&1 is not equal to &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_450', N'Excluded Task', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_451', N'Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_452', N'Type Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_453', N'Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_454', N'Group ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_455', N'Object Name 1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_456', N'Object Name 2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_457', N'User Flag', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_458', N'ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_459', N'Object Build Messages', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_46', N'&1 is not equal to &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_460', N'Object Main Messages', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_461', N'Default Types', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_462', N'Audit Log Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_463', N'Audit Message Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_464', N'Add', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_465', N'Save', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_466', N'Update', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_467', N'Copy', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_468', N'Journal Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_469', N'Property Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_47', N'&1 is not equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_470', N'Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_471', N'Audit Log', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_472', N'Audit Log Token', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_473', N'Message Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_474', N'Connection ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_475', N'Variable Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_476', N'Intranet', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_477', N'Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_478', N'Intranet', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_479', N'Output Format', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_48', N'&1 is greater than &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_480', N'Language ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_481', N'Default Data Source', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_482', N'Prog ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_483', N'Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_484', N'Module Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_485', N'Object Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_486', N'Object Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_487', N'Original Module Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_488', N'General Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_489', N'Parm Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_49', N'&1 is greater than &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_490', N'Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_491', N'Default Multi-Site Group ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_492', N'Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_493', N'Preview Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_494', N'Replication Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_495', N'Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_496', N'Replication Category Object', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_497', N'Replication Rule', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_498', N'Disabled', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_499', N'Source Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_50', N'&1 is greater than &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_500', N'Target Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_501', N'Operation Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_502', N'Task Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_503', N'User ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_504', N'Line Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_505', N'Old/New', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_506', N'Language', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_507', N'Reports To', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_508', N'Site Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_509', N'System Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_51', N'&1 is greater than &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_510', N'Time Zone', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_511', N'Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_512', N'Multi-Site Group ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_513', N'Site-Hierarchy', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_514', N'Effective Date', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_515', N'Obsolete Date', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_516', N'Site/Entity', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_517', N'From Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_518', N'To Site', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_519', N'Inter-Site Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_52', N'&1 is not greater than &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_520', N'Site-User Map', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_521', N'Default Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_522', N'Table/Class', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_523', N'Active', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_524', N'Class Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_525', N'Order', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_526', N'Delete', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_527', N'Table Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_528', N'Class Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_529', N'Session ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_53', N'&1 is &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_530', N'User-Extended Tables'' Class', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_531', N'Class/Field', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_532', N'Field name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_533', N'User Field Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_534', N'Record Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_535', N'User Field', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_536', N'Blank', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_537', N'Frequency', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_538', N'User Index', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_539', N'Index Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_54', N'&1 is &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_540', N'Unique', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_541', N'Index Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_542', N'User Index-Field', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_543', N'Seq', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_544', N'User ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_545', N'User Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_546', N'Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_547', N'Window ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_548', N'Queue Server', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_549', N'(Blank)', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_55', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_550', N'Extended Stored Procedure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_551', N'Check Constraint', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_552', N'Default Constraint', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_553', N'Scalar Function', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_554', N'Inlined table-function', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_555', N'Log', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_556', N'Stored Procedure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_557', N'Primary Key Constraint', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_558', N'Replication filter stored procedure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_559', N'System Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_56', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_560', N'Table Function', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_561', N'Trigger', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_562', N'User Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_563', N'Unique Constraint', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_564', N'View', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_565', N'Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_566', N'Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_567', N'UET Impact Schema', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_568', N'Column', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_569', N'Column Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_57', N'&1 is &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_570', N'Site Index', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_571', N'IDO Alias', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_572', N'Unable to perform update, record has been deleted or modified by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_573', N'Unable to perform delete, record has been deleted or modified by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_574', N'Error creating IDODB.IDOConnection: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_575', N'Error refreshing row:  not all of the keys for this object were included in the update.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_576', N'Multiple records returned on refresh, object definition may be incorrect.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_577', N'Invalid property [&1] in ORDER BY clause.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_578', N'Message Queue support is not installed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_579', N'Error posting document to workflow: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_58', N'&1 is before &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_580', N'Access denied:  Action requires &1 privilege for &2 IDO.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_581', N'Unable to post record to workflow.  Your system is not configured to run IDOs as a COM+ application.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_582', N'Read', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_583', N'Edit', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_584', N'Execute', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_585', N'Error committing named transaction', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_586', N'Named transaction not found', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_587', N'Error rolling back named transaction', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_588', N'Missing or unknown user name.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_589', N'Incorrect password.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_59', N'&1 is &2 and cannot be &3 for &4 that has [&5: &6] and [&7: &8] and [&9: &A].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_590', N'''&1'' is not Licensed for User ''&2.''', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_591', N'An exception occurred while trying to validate licensing for ''&1''.\n&2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_592', N'An unknown exception occurred while trying to validate licensing for ''&1''.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_593', N'An exception occurred while trying to load the user privileges for ''&1''.\n&2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_594', N'An unknown exception occurred while trying to get the user privileges for ''&1''.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_595', N'Concurrent Login Limit has been reached for the following License Modules: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_596', N'Error initiating impersonation: Already impersonating a user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_597', N'Unable to begin a transaction.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_598', N'Unable to commit a transaction.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_599', N'Unable to rollback a transaction.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_60', N'&1 is &2 and cannot be &3 for &4 that has [&5: &6] and [&7: &8] and [&9: &A] and [&B: &C].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_600', N'User session count limit may not be exceeded', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_601', N'Error opening database connection: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_602', N'Error creating named transaction', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_603', N'Error calling replication resubmit.  Invalid operation attempted.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_604', N'Error calling replication resubmit.  Free form SQL not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_605', N'Access denied:  Action requires &1 privilege for &2 form.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_606', N'Linked Server Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_607', N'USAGE: EXEC ReplicationOnObjectSp <Table/Method/XML object name>, <Object type:1 - table, 2 - method, 3 - XML>, <To Site>', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_608', N'The from site [&1] defined in parms does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_609', N'The following rules exist, but are disabled currently in all rules for categories using the object &1.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_61', N'&1 is not one of: &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_610', N'Replication [From Site: &1]  [To Site : &2]  is currently disabled between the sites themselves.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_611', N'No &1 replication trigger exists for [Table: &2].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_612', N'Replication trigger &1 is disabled.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_613', N'(Blank)', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_614', N'Database Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_615', N'The linked servername [&1] is not setup as a linked SQL Server from the local SQL Server.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_616', N'The delayed replication username [&1] from site [&2] to this site [&3] has not been given access to any license module.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_617', N'The delayed replication username [&1] from site [&2] to this site [&3] is not a super user and has not been given access to the Internal group.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_618', N'The to site [&1] is on a different intranet than the from site [&2] and the to site''s intranet has no url defined.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_619', N'No problems found.  The replication triggers may need to be regenerated.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_62', N'&1 is not &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_620', N'Enforce Mix Case must be 1(Yes) or 2(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_621', N'Enforce Number Use must be 1(Yes) or 2(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_622', N'Enforce Special Character must be 1(Yes) or 2(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_623', N'Lockout Duration must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_624', N'Password Length Min must be less than or equal to Password Length Max.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_625', N'Number Of Retries must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_626', N'Password Parameters Parm Key must be 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_627', N'Password Warning must be less than or equal to Password Expiration days.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_628', N'Password Length Minimum must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_629', N'Password Length Maximum must be less than or equal to 30.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_63', N'The sum of &1 is &2 for all &3(s) of &4 that has [&5: &6].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_630', N'Password Expiration Days must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_631', N'Password Warning Days must be greater than or equal to 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_632', N'User Status must be 0(Active), 1(Locked Out), or 2(Disabled).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_633', N'Password Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_634', N'In Workflow entered must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_635', N'Password Never Expires must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_636', N'Custom save method [&1] returned an error.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_637', N'Call', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_638', N'Execute', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_639', N'Stored Procedure', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_64', N'At least one &1 is invalid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_640', N'Prepare', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_641', N'Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_642', N'Connect', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_643', N'Configuration', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_644', N'Configuration Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_645', N'Procedure Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_646', N'Error', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_647', N'Error Code', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_648', N'Source', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_649', N'Load', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_65', N'Max users [&1] exceeded for [Module: &2]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_650', N'Event Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_651', N'Event Handler', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_652', N'Event Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_653', N'Event State', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_654', N'Event Handler State', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_655', N'Event Action State', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_656', N'Event State Group', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_657', N'Event Group Id', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_658', N'WARNING! Unable to create license record(s) for new form because no valid license is currently installed. This new form will not be licensed even after a valid license has been installed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_659', N'Infinite Wait State detected: Unretestable condition evaluated to False with no timeout for [Event Name: &1], [Event Sequence: &2], and [Event Handler Sequence: &3].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_66', N'[&1] users must be removed from [Module: &2] before installing this license.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_660', N'Goto Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_661', N'Event Action Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_662', N'Event Handler Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_663', N'Email Address', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_664', N'SMTP Server', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_665', N'The user account [&1] has been disabled for config [&2].  Please note what you were trying to do and contact your administrator.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_666', N'The user account [&1] has been locked out for config [&2].  Please contact the system administrator for further assistance.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_667', N'No sessions are available for user account [&1] for config [&2].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_668', N'Invalid Configuration [&1].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_669', N'Invalid user name [&1] or password for config [&2].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_67', N'&1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_670', N'Password has expired.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_671', N'Unknown login failure [&1].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_672', N'Message', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_673', N'Intranet Licensing', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_674', N'Form [&1] can only be accessed on the Master [Site:&2] when Intranet Licensing is enabled.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_675', N'Live Linked Site Information', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_676', N'IDO Collection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_677', N'Collection Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_678', N'Suspend', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_679', N'Suspend may not be checked unless Applies to Objects is entered, and all objects listed there have an InWorkflow property.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_68', N'&1 must be between &2 and &3', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_680', N'Table Alias', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_681', N'[&1] is not a valid IDO name.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_682', N'&1 IDO does not include a &2 property.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_683', N'Record not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_684', N'UserName', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_685', N'Custom Assembly', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_686', N'&1 is already checked out.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_687', N'Property Class', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_688', N'&1 has been cancelled', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_689', N'Event Handler RowPointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_69', N'&1 must be &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_690', N'Event Action RowPointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_691', N'Event Initial State', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_692', N'Event Trigger', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_693', N'Event Handler or Event Handler Revision Record', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_694', N'Unable to perform update, record has been deleted or modified by another user.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_695', N'SourceSafe integration is currently disabled in the current configuration. The item will not be checked in to SourceSafe.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_696', N'Parameter Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_697', N'Parameter Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_698', N'Method Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_699', N'Property Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_70', N'&1 must be less than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_700', N'Update of base table failed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_701', N'Insert failed', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_702', N'Project Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_703', N'Property', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_704', N'Action Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_705', N'Insert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_706', N'Parsing of Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_707', N'Maximum Duration was exceeded by &1 that has [&2: &3].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_708', N'Requested By', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_709', N'Asynchronous Event', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_71', N'&1 must be equal to &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_710', N'Asynchronous Event Handler', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_711', N'Event Action awaiting retest', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_712', N'Event Action that timed out', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_713', N'Time Out Destination Action Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_714', N'Set Event Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_715', N'Output', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_716', N'Event Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_717', N'Event Title', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_718', N'Begin Date', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_719', N'Notify', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_72', N'&1 must be equal to &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_720', N'Prompt', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_721', N'Wait', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_722', N'Sleep', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_723', N'Branch', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_724', N'Goto', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_725', N'Set Attributes', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_726', N'Achieve Milestone', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_727', N'Generate Event', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_728', N'Finish', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_729', N'Fail', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_73', N'&1 must be equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_730', N'Set Values', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_731', N'Audit', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_732', N'Load IDO Row', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_733', N'Load IDO Collection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_734', N'Update Collection', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_735', N'Dispatch IDO Request', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_736', N'Execute IDO Request', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_737', N'Call IDO Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_738', N'Call Database Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_739', N'Call Web Service', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_74', N'&1 must be equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_740', N'Run Background Task', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_741', N'Transform XML', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_742', N'Send Email', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_743', N'Default Types must be greater than 0 and less than 100 or greater than or equal to 10000.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_744', N'Report Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_745', N'Replication Document', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_746', N'Replication Document Object', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_747', N'Document Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_748', N'Object Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_749', N'Not one &1 exists for &2 where &3 has [&4: &5] and for &6 where [&7: &8].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_75', N'&1 must be equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_750', N'Transport', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_751', N'ESB', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_752', N'HTTP', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_753', N'Process', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_754', N'Applies To IDO', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_755', N'Applies To IDO Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_756', N'Applies To IDO Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_757', N'Replication Document Outbound Cross-Reference', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_758', N'BOD Noun', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_759', N'BOD Verb', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_76', N'&1 must be greater than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_760', N'The lock request timed out.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_761', N'The lock request was cancelled.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_762', N'The lock request was chosen as a deadlock victim.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_763', N'Indicates a parameter validation or other call error.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_764', N'Message', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_765', N'Subject', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_766', N'Question', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_767', N'Selected Choice', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_768', N'Skip Delete', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_769', N'Skip Insert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_77', N'&1 must be greater than &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_770', N'Skip Update', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_771', N'Skip Method', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_772', N'&1 must be 0(No) or 1(Yes).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_773', N'Appointment entered already exists', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_774', N'&1 must be less than or equal to &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_775', N'Reminder Date/Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_776', N'Starting Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_777', N'&1 must be greater than or equal to &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_778', N'Ending Time', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_779', N'[&1] is the current bottom of the replacement chain for [&2]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_78', N'&1 must be &2 for &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_780', N'Publication Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_781', N'Publication', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_782', N'Send E-mail Notifications Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_783', N'E-mail Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_784', N'Send E-mail Prompts', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_785', N'Send E-mail Notifications', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_786', N'E-mail Prompts E-mail Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_787', N'E-mail Notifications E-mail Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_788', N'Primary E-mail Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_789', N'User E-mail', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_79', N'&1 must be &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_790', N'Publication Subscriber', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_791', N'Document Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_792', N'Document Seq', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_793', N'Ref Seq', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_794', N'Table Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_795', N'Document Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_796', N'Internal Flag entered must be 1(Yes) or 0(No).', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_797', N'Password has been used in the previous &t1 passwords.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_798', N'Password History Count must be between 0 and 30.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_799', N'Incorrect old password.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_80', N'&1 must be &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_800', N'Search Item', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_801', N'&1 may not be deleted for &2 where &3 is &4.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_802', N'Running', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_803', N'Status', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_804', N'Document', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_805', N'Event Document', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_806', N'Document Object Row Pointer', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_807', N'Not one &1 or &2 where &3 is &4 exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_808', N'At least one &1 where &2 is &3 and &4 is &5 exists for &6.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_809', N'Attached Document', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_81', N'&1 must be before &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_810', N'Document Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_811', N'Document Seq', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_812', N'Document Type', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_813', N'Attachment Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_814', N'Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_815', N'Form Strings Table', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_817', N'Invalid post query specification at or near position &1 : &2', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_818', N'Invalid post query specification: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_819', N'Invalid intrinsic method: &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_82', N'&1 must be &2 or &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_821', N'Custom load method &1.&2 returned an invalid result [&3].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_822', N'Error processing IDO query results:  The &2 property is not valid for the &1 IDO.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_823', N'Error processing IDO query results: &1.&2 was not found in the result set.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_824', N'Invalid property name [&1] in custom update method [&2].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_825', N'Property [&1] in custom update method [&2] was not included in update request.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_826', N'Method [&1] in custom update does not exist.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_827', N'Method &1.&2 not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_828', N'Method &1.&2 is a custom load method and may not be invoked directly.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_829', N'Method &1.&2 may not be specified as a custom load method.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_83', N'&1 must be one of: &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_830', N'Error invoking &1.&2 method.  Extension class for &3 IDO not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_831', N'Error refreshing update item by keys.  Key property &1.&2 was not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_832', N'Error refreshing update item. A single row is expected back from an update refresh and &1 rows were returned.  The &2 IDO definition may contain errors.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_833', N'Post query method &1.&2 failed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_834', N'Error executing post query method &1.&2: parameter [&3] not found.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_835', N'Unable to save User Defined Fields: row ID (RowPointer) property was not found [&1]', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_836', N'Custom load method &1.&2 did not return a result set', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_837', N'Sequence', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_838', N'EventName', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_839', N'Template Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_84', N'The sum of &1 must be &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_840', N'Application Schema Columns', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_841', N'Key Sequence must be greater than 0.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_842', N'IDO Linked Database', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_843', N'IDO Link Database', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_844', N'Is Character', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_845', N'Is Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_846', N'Is Optimistic Lock', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_847', N'Send BOD', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_848', N'One or more &1 exist with [&2: &3].  Delete is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_849', N'One or more &1 exist with [&2: &3] and [&4: &5].  Delete is not allowed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_85', N'At least one &1 must exist for &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_850', N'Warning: Changing this Event Actions for Event &1 will result in no longer being able to edit it through the Workflow Wizard form.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_851', N'Queued Event.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_852', N'Queue ID', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_853', N'Times Attempted', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_854', N'IDO Link Column', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_855', N'Key', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_856', N'View Name', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_857', N'The &1, &2, &3 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_858', N'The &1, &2, &3, &4, &5 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_859', N'The &1, &2, &3, &4, &5, &6 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_86', N'&1 must exist where &2 is &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_860', N'The &1, &2, &3, &4, &5, &6, &7 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_861', N'The &1, &2, &3, &4, &5, &6, &7, &8 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_862', N'The &1, &2, &3, &4, &5, &6, &7, &8, &9 combination entered is not valid.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_863', N'Cannot delete record. At least one &1 exists for this &2, &3, &4 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_864', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5, &6, &7, &8 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_865', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_866', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5, &6, &7, &8, &9 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_867', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5, &6 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_868', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5, &6, &7, &8, &9, &10 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_869', N'Cannot delete record. At least one &1 exists for this &2, &3, &4, &5, &6, &7 combination.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_87', N'&1 must exist where &2 is one of: &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_871', N'Database table alias [&1] is invalid because it is a reserved SQL keyword.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_872', N'Database table alias [&1] is invalid because it contains one or more invalid characters.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_873', N'No rows have been defined for New Data Maintenance to process.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_874', N'Table &1 already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_875', N'IDO &1 already exists.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_876', N'Table and IDO created.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_877', N'Transaction must be in effect to call &1', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_878', N'Failure in function dbo.GetXactState()', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_879', N'Lock request timed out', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_88', N'&1 must be a multiple of &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_880', N'Lock request was cancelled', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_881', N'Lock request was chosen as a deadlock victim', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_882', N'Parameter validation or other call error', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_883', N'Critical Number Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_884', N'Critical Number Category/User Permission', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_885', N'Critical Number Global Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_886', N'Critical Numbers', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_887', N'Critical Number Drilldown', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_888', N'Critical Number Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_889', N'Critical Number User Permission', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_89', N'&1 must not be between &2 and &3.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_890', N'Critical Number Snapshot', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_891', N'Critical Number User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_892', N'Critical Number Input Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_893', N'DataView', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_894', N'DataSearch Source', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_895', N'DataSearch Source Search Property', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_896', N'DataSearch Source Show Property', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_897', N'DataSearch Source User Permission', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_898', N'DataSearch Source Group Permission', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_899', N'DataView Action', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_90', N'&1 that has [&2: &3] may not be changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_900', N'DataView Style', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_901', N'Discover File', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_902', N'Event Action awaiting file discovery', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_91', N'&1 that has [&2: &3] and [&4: &5] may not be changed.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_92', N'&1 may not be &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_93', N'&1 may not be less than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_94', N'&1 may not be equal to &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_95', N'&1 may not be equal to &2 for &3 that has [&4: &5].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_96', N'&1 may not be equal to &2 for &3 that has [&4: &5] and [&6: &7].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_97', N'&1 may not be equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_98', N'&1 may not be equal to &2 for &3 that has [&4: &5] and [&6: &7] and [&8: &9] and [&A: &B].', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_983', N'Description', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_984', N'Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_985', N'Can Drill Down', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_986', N'Can Run', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_987', N'Can Update Parameters', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_988', N'Update Users', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_989', N'Category', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_99', N'&1 may not be greater than &2.', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_990', N'User', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_991', N'Receive Email', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_992', N'Critical Number', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_993', N'Parameter', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_994', N'Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_995', N'Active', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_996', N'Alert Operator', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_997', N'Use Alert', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_998', N'Alert Value', N'1033', N'Core', 0
GO

EXEC AddApplicationMessage2Sp N'MG_999', N'Canned Critical Number', N'1033', N'Core', 0
GO

/************************
 * ObjectMainMessages
 ************************/

EXEC AddObjectMainMessage2Sp
  N'@!Alert', 5, N'MG_1084', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!blank', 5, N'MG_549', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Call', 5, N'MG_637', 0, N'Call to a remote method in a DLL', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Character', 5, N'MG_1105', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Columns', 5, N'MG_1102', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Combination', 5, N'MG_1116', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Configuration', 5, N'MG_643', 0, N'Configuration to which to connect', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ConfigurationName', 5, N'MG_644', 0, N'Configuration Name in Config Manager', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Connect', 5, N'MG_642', 0, N'Connect to a database or configuration', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Count', 5, N'MG_1082', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!CreateProcedure1', 5, N'MG_1320', 16, N'Create procedure in dbo.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!CreateProcedure2', 5, N'MG_1321', 16, N'Must start with create procedure.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!CreateProcedure3', 5, N'MG_1322', 16, N'Create procedure missing.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!CriticalNumbersAsOf:', 5, N'MG_1078', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!CustomAssembly', 5, N'MG_685', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DataType', 5, N'MG_1111', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Date', 5, N'MG_1057', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Decimal', 5, N'MG_1101', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DefaultTypesRange', 5, N'MG_743', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DisabledRules', 5, N'MG_609', 0, N'All rules disabled for object.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DisabledSiteRules', 5, N'MG_610', 0, N'All rules disabled for sites.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DynamicSql1', 5, N'MG_1323', 16, N'Dynamic sp call not allowed.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DynamicSql2', 5, N'MG_1324', 16, N'EXECUTE () not allowed.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!DynamicSql3', 5, N'MG_1325', 16, N'sp_executesql not allowed.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Edit', 5, N'MG_583', 16, N'Edit (As in Edit file privilege)', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Error', 5, N'MG_646', 0, N'Error that has occurred', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ErrorCode', 5, N'MG_647', 0, N'External (non-Mongoose, non-SyteLine) Error Code', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventAccountInactive', 5, N'MG_1311', 16, N'Inactive account has been disabled.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventBadCredentials', 5, N'MG_669', 16, N'Invalid user or password', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventInvalidConfig', 5, N'MG_668', 16, N'Invalid config for event.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventName', 5, N'MG_838', 16, N'EventName', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventNoSessions', 5, N'MG_667', 16, N'No sessions for event login attempt.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventPasswordExpired', 5, N'MG_670', 16, N'Password expired', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventTokenAuthenticationFailed', 5, N'MG_1312', 16, N'Token Authentication has failed.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventUnknownLoginFailure', 5, N'MG_671', 16, N'Login failed unexpectedly', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventUserDisabled', 5, N'MG_665', 16, N'User disabled.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!EventUserLocked', 5, N'MG_666', 16, N'User locked out.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Exec', 5, N'MG_638', 16, N'Execute a Stored Procedure', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Execute', 5, N'MG_584', 16, N'Execute (as in Execulte privilege)', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ExternalPrefix', 5, N'MG_1326', 16, N'External procedure naming.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Form', 5, N'MG_1095', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!FormComponent', 5, N'MG_1092', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!FormEventHandler', 5, N'MG_1094', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!FormVariable', 5, N'MG_1093', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Goal', 5, N'MG_1083', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!GotoSequence', 5, N'MG_660', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Integer', 5, N'MG_1103', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!KeyField', 5, N'MG_1117', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!LicenseValidation', 5, N'MG_1098', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!LineNoError', 5, N'MG_1316', 16, N'Line number', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Load', 5, N'MG_649', 0, N'Load a DLL into memory', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Message', 5, N'MG_672', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!MismatchedParenthesis', 5, N'MG_1107', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!MismatchedQuotes', 5, N'MG_1106', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Module', 5, N'MG_1099', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Month', 5, N'MG_1089', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoFormPrivilege', 5, N'MG_605', 16, N'Text message.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoIntranetUrl', 5, N'MG_618', 0, N'No url defined.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoLinkedServer', 5, N'MG_615', 0, N'SQL Server not linked.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoReplBugFound', 5, N'MG_619', 0, N'No replication setup problems found.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoReplicationFreeSql', 5, N'MG_604', 16, N'Text message.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoReplTrigger', 5, N'MG_611', 0, N'Replication trigger missing.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoReplUserGroup', 5, N'MG_617', 0, N'Replication user.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!NoReplUserModule', 5, N'MG_616', 0, N'Replication user.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Of', 5, N'MG_1080', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!OptimisticUpdateError', 5, N'MG_694', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Parameters', 5, N'MG_641', 0, N'Parameters for a call to a Stored Procedure', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ParmsSiteNoExist', 5, N'MG_608', 0, N'Usage instructions', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Prepare', 5, N'MG_640', 0, N'to Prepare something', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ProcedureName', 5, N'MG_645', 0, N'Name of a Stored Procedure', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ProcedureNotFound', 5, N'MG_1317', 16, N'Procedure not found.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Process', 5, N'MG_753', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!PropertyClass', 5, N'MG_687', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Quarter', 5, N'MG_1088', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Read', 5, N'MG_582', 16, N'Read (as is in Read from a file)', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ReplicationOnObjectSpUsage', 5, N'MG_607', 0, N'Usage instructions', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ReplicationSubmitInvalidOperation', 5, N'MG_603', 16, N'Text message.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ReplTriggerDisabled', 5, N'MG_612', 0, N'Replication trigger disabled.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!RetainSiteNotFalse', 5, N'MG_1120', 16, N'In some cases, rep object category retain site can not be false.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ScopeName', 5, N'MG_1067', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ScopeType', 5, N'MG_1069', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Sequence', 5, N'MG_837', 16, N'Sequence', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Source', 5, N'MG_648', 0, N'Source of an external error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!StoredProcedure', 5, N'MG_639', 0, N'SQL Stored Procedure', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!SuspendsWorkflowObjects', 5, N'MG_679', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:C', 5, N'MG_551', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:D', 5, N'MG_552', 0, N'Test Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:FN', 5, N'MG_553', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:IF', 5, N'MG_554', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:L', 5, N'MG_555', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:P', 5, N'MG_556', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:PK', 5, N'MG_557', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:RF', 5, N'MG_558', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:S', 5, N'MG_559', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:TF', 5, N'MG_560', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:TR', 5, N'MG_561', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:U', 5, N'MG_562', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:UQ', 5, N'MG_563', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:V', 5, N'MG_564', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!sysobjects:X', 5, N'MG_550', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!ThreeNotAllowed', 5, N'MG_1319', 16, N'Originally for drop table x not allowed, but generally useful.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Today', 5, N'MG_1091', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Total:', 5, N'MG_1085', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!TwoPartIdentifiers', 5, N'MG_1318', 16, N'Two part identifier only.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Type', 5, N'MG_1081', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!UETImpactSchema', 5, N'MG_567', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!UnsubstitutedFunction', 5, N'MG_1108', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!UserName', 5, N'MG_684', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Warning', 5, N'MG_1086', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Week', 5, N'MG_1090', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!WorkingDays:', 5, N'MG_1079', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@!Year', 5, N'MG_1087', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%add', 5, N'MG_464', 0, N'Command Text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%copy', 5, N'MG_467', 0, N'Command Text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%delete', 5, N'MG_526', 0, N'Command Text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%save', 5, N'MG_465', 0, N'Command Text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%SetEventParameter', 5, N'MG_714', 0, N'Command text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@%update', 5, N'MG_466', 0, N'Command Text', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.ModifiedPayloadAccess:D', 5, N'MG_1329', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.ModifiedPayloadAccess:H', 5, N'MG_1334', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.ModifiedPayloadAccess:R', 5, N'MG_1345', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.PayloadAccess:D', 5, N'MG_1329', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.PayloadAccess:H', 5, N'MG_1334', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.PayloadAccess:R', 5, N'MG_1345', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.UnmodifiedPayloadAccess:D', 5, N'MG_1329', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.UnmodifiedPayloadAccess:H', 5, N'MG_1334', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionState.UnmodifiedPayloadAccess:R', 5, N'MG_1345', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:AchieveMilestone', 5, N'MG_726', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Audit', 5, N'MG_731', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Branch', 5, N'MG_723', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:CallDatabaseMethod', 5, N'MG_738', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:CallIDOMethod', 5, N'MG_737', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:CallWebService', 5, N'MG_739', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DiscoverFile', 5, N'MG_901', 16, N'Event Action Discover File', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DispatchIDOMethod', 5, N'MG_1462', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DispatchIDORequest', 5, N'MG_735', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DispatchLoadCollection', 5, N'MG_1463', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DispatchLoadIDORow', 5, N'MG_1464', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:DispatchUpdateCollection', 5, N'MG_1465', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:ExecuteIDORequest', 5, N'MG_736', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Fail', 5, N'MG_729', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Finish', 5, N'MG_728', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:GenerateEvent', 5, N'MG_727', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Goto', 5, N'MG_724', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:LoadCollection', 5, N'MG_733', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:LoadIDORow', 5, N'MG_732', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Notify', 5, N'MG_719', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Prompt', 5, N'MG_720', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:RunBackgroundTask', 5, N'MG_740', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:SendBOD', 5, N'MG_847', 16, N'Event Action Send BOD', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:SendEmail', 5, N'MG_742', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:SetAttributes', 5, N'MG_725', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:SetValues', 5, N'MG_730', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Sleep', 5, N'MG_722', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:TransformXML', 5, N'MG_741', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:UpdateCollection', 5, N'MG_734', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionType:Wait', 5, N'MG_721', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionVariableAccess.Access:D', 5, N'MG_1329', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionVariableAccess.Access:H', 5, N'MG_1334', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionVariableAccess.Access:M', 5, N'MG_1440', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionVariableAccess.Access:R', 5, N'MG_1345', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventActionVariableAccess.Access:W', 5, N'MG_1349', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:A', 5, N'MG_1327', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:B', 5, N'MG_1442', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:E', 5, N'MG_1331', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:F', 5, N'MG_1332', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:I', 5, N'MG_1336', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventHandler.Chrono:L', 5, N'MG_1337', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventInitialVariable.DefaultAccess:D', 5, N'MG_1329', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventInitialVariable.DefaultAccess:H', 5, N'MG_1334', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventInitialVariable.DefaultAccess:M', 5, N'MG_1440', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventInitialVariable.DefaultAccess:R', 5, N'MG_1345', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:EventInitialVariable.DefaultAccess:W', 5, N'MG_1349', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:intranet.ReportServerDeploymentMode:N', 5, N'MG_1340', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:intranet.ReportServerDeploymentMode:S', 5, N'MG_1346', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:intranet.SMTPDeliveryMethod:I', 5, N'MG_1342', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:intranet.SMTPDeliveryMethod:N', 5, N'MG_1341', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:intranet.SMTPDeliveryMethod:S', 5, N'MG_1347', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ListYesNo:0', 5, N'MG_1109', 0, N'List Item Pair Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ListYesNo:1', 5, N'MG_1110', 0, N'List Item Pair Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ObjectType:1', 5, N'MG_565', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ObjectType:2', 5, N'MG_566', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:A', 5, N'MG_1328', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:H', 5, N'MG_1335', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:M', 5, N'MG_1441', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:Q', 5, N'MG_1339', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:R', 5, N'MG_1438', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.emp_type:X', 5, N'MG_1344', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.name_code:F', 5, N'MG_1333', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:parms.name_code:S', 5, N'MG_1348', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:production_batch.status:A', 5, N'MG_1077', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:production_batch.status:C', 5, N'MG_1439', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:QueueTransport:H', 5, N'MG_752', 16, N'List Item Pair Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:QueueTransport:J', 5, N'MG_751', 16, N'List Item Pair Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ReplDocAttribute.ValueSourceType:Literal', 5, N'MG_1338', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ReplDocAttribute.ValueSourceType:PropertyTag', 5, N'MG_1343', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ReplDocElement.ValueSourceType:DynamicSubcollection', 5, N'MG_1330', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ReplDocElement.ValueSourceType:Literal', 5, N'MG_1338', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:ReplDocElement.ValueSourceType:PropertyTag', 5, N'MG_1343', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:UpdateCollection.ActionType:Delete', 5, N'MG_526', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:UpdateCollection.ActionType:Insert', 5, N'MG_705', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@:UpdateCollection.ActionType:Update', 5, N'MG_466', 0, N'Item caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@a1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@a2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aa1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AaaInvoices.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aaCo2s.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aaCo3s.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aaCo4s.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aaCoItems.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@aaCos.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AaInvoices.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AaPayments.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AbcInvoices.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations', 5, N'MG_1137', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.Id', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.ObjectName1', 5, N'MG_455', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.ObjectName2', 5, N'MG_456', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.ObjectType', 5, N'MG_421', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AccountAuthorizations.UserFlag', 5, N'MG_457', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ActiveBGTasks', 5, N'MG_1139', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ActiveBGTasks.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ActiveBGTasks.TaskNumber', 5, N'MG_447', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn', 5, N'MG_1140', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.ColumnName', 5, N'MG_569', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.NextkeyAddlKeys', 5, N'MG_1476', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.NextkeyGenerator', 5, N'MG_1477', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.NextkeyPrefix', 5, N'MG_1470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppColumn.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ApplicationMessages', 5, N'MG_1141', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ApplicationMessages.MessageLanguage', 5, N'MG_419', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ApplicationMessages.MessageNo', 5, N'MG_423', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ApplicationMessages.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ApplicationMessages.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppModule', 5, N'MG_1142', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppModule.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppModule.ModuleName', 5, N'MG_484', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppModule.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppModule.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable', 5, N'MG_1143', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.DisallowUpdate', 5, N'MG_1361', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.IgnoreInsert', 5, N'MG_1374', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.IgnoreUpdate', 5, N'MG_1375', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.IupTriggerModifiesNewRows', 5, N'MG_1389', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.KeepClusteringKeys', 5, N'MG_1390', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.NextKeyReverseKeyOrder', 5, N'MG_1394', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.RegisterNewKey', 5, N'MG_1404', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.RememberIdentity', 5, N'MG_1405', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.TestOutsideLockForNewKey', 5, N'MG_1424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.Update_AllRegardlessOfBaseTableChanges', 5, N'MG_1427', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.UseRPOnInsert', 5, N'MG_1433', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppTable.UseRPOnUpdate', 5, N'MG_1434', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppView.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AppView.ViewName', 5, N'MG_1064', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@atable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLog', 5, N'MG_471', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLog.AuditLogToken', 5, N'MG_472', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLog.MessageType', 5, N'MG_473', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLog.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLogTypes', 5, N'MG_1144', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLogTypes.MessageType', 5, N'MG_420', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@AuditLogTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskDefinitions', 5, N'MG_1145', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskDefinitions.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskDefinitions.TaskName', 5, N'MG_444', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskHistory', 5, N'MG_1146', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskHistory.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BGTaskHistory.TaskNumber', 5, N'MG_447', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@blob_test_tbl.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BODTemplate', 5, N'MG_1147', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BODTemplate.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BODTemplate.TemplateName', 5, N'MG_839', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BPProduct', 5, N'MG_1148', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BPProduct.BusinessPartnerName', 5, N'MG_1253', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BPProduct.Product', 5, N'MG_1254', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BPProduct.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@BrandKit.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@btable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbNDMW.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW10.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW4.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW5.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW6.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW7.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@cbTestNDMW8.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes', 5, N'MG_1149', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.ClassNoteToken', 5, N'MG_434', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.NoteHeaderToken', 5, N'MG_430', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.NoteType', 5, N'MG_1119', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.SystemNoteToken', 5, N'MG_432', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ClassNotes.UserNoteToken', 5, N'MG_433', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConfigParms', 5, N'MG_1150', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConfigParms.ConfigurationName', 5, N'MG_644', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConfigParms.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConfigParms.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConfigParms.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConnectionInformation', 5, N'MG_1151', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConnectionInformation.ConnectionID', 5, N'MG_474', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ConnectionInformation.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY', 5, N'MG_1152', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY.C_INBOX_ID', 5, N'MG_1255', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_ENTRY.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_HEADERS', 5, N'MG_1153', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_HEADERS.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_HEADERS.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_HEADERS.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_INBOX_HEADERS.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY', 5, N'MG_1154', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY.C_OUTBOX_ID', 5, N'MG_1256', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_ENTRY.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_HEADERS', 5, N'MG_1155', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_HEADERS.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_HEADERS.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_HEADERS.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_OUTBOX_HEADERS.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_PROPERTY', 5, N'MG_1156', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_PROPERTY.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_PROPERTY.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_PROPERTY.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@COR_PROPERTY.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreEmpAddrHAA.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAAEmployee.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAAndmw1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAAndmw2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAATBL1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAATBL2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAATbltest3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAATEST.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CoreHAATEST2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CountryPack', 5, N'MG_1157', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CountryPack.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CountryPack.Option', 5, N'MG_1257', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@CountryPack.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Customer3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Customer88.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Customer91.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Customers.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DBStatus', 5, N'MG_1158', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DBStatus.ParmKey', 5, N'MG_1029', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DBStatus.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRManualCreate.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM10.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM11.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM12.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM13.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM14.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM15.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM16.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM17.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM18.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM7.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM8.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM8s.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DDRTestNDM9.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefaultTypes', 5, N'MG_1118', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefaultTypes.DefaultType', 5, N'MG_1118', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefaultTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefineVarables.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefineVariables.ConnectionID', 5, N'MG_474', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefineVariables.ProcessID', 5, N'MG_1258', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefineVariables.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DefineVariables.VariableName', 5, N'MG_475', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DemoOrders.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocTypeFormProperty.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject', 5, N'MG_804', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject.DocumentName', 5, N'MG_810', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject.DocumentType', 5, N'MG_791', 16, N'Column caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject.Internal', 5, N'MG_1380', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObject.Sequence', 5, N'MG_811', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference', 5, N'MG_809', 0, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.DocumentObjectRowPointer', 5, N'MG_806', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.RefSequence', 5, N'MG_814', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.Suspend', 5, N'MG_678', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentObjectReference.TableRowPointer', 5, N'MG_794', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentType', 5, N'MG_812', 16, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentType.DocumentType', 5, N'MG_791', 16, N'Document type', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentType.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@DocumentType.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@dtproperties.id', 5, N'MG_468', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@dtproperties.property', 5, N'MG_469', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@dtproperties.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EmailTemplate.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EmailType', 5, N'MG_783', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EmailType.Description', 5, N'MG_477', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EmailType.EmailType', 5, N'MG_783', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EmailType.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_INBOUND_DUPLICATE', 5, N'MG_1159', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_INBOUND_DUPLICATE.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_INBOUND_DUPLICATE.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_PREVIOUS_VERSION_MEDIATION', 5, N'MG_1160', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_PREVIOUS_VERSION_MEDIATION.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_PREVIOUS_VERSION_MEDIATION.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_VARIATION_ID_MEDIATION', 5, N'MG_1161', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_VARIATION_ID_MEDIATION.C_ID', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ESB_VARIATION_ID_MEDIATION.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event', 5, N'MG_1162', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.EventHasChanged', 5, N'MG_1368', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.EventName', 5, N'MG_650', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.IsFrameworkEvent', 5, N'MG_1382', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.IsFrameworkIDOEvent', 5, N'MG_1383', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.IsFrameworkIDOSuspendableEvent', 5, N'MG_1384', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Event.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction', 5, N'MG_652', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction.EventHandlerRowPointer', 5, N'MG_1261', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAction.Sequence', 5, N'MG_661', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionParameterParsing', 5, N'MG_706', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState', 5, N'MG_655', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.EventActionRowPointer', 5, N'MG_1262', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.EventHandlerStateRowPointer', 5, N'MG_1263', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.ModifiedPayloadAccess', 5, N'MG_1392', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.PayloadAccess', 5, N'MG_1399', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionState.UnmodifiedPayloadAccess', 5, N'MG_1426', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess', 5, N'MG_1163', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.Access', 5, N'MG_1350', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.EventActionRowPointer', 5, N'MG_1262', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventActionVariableAccess.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAsynchEvent', 5, N'MG_709', 0, N'Pseudo-row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventAsynchHandler', 5, N'MG_710', 0, N'Pseudo-row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocument', 5, N'MG_809', 0, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocument.AttachmentName', 5, N'MG_813', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocument.EventStateId', 5, N'MG_1264', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocument.RefSequence', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocument.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocumentObject', 5, N'MG_805', 0, N'Pseudo-row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocumentObject.DocumentName', 5, N'MG_747', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocumentObject.EventStateId', 5, N'MG_1264', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocumentObject.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventDocumentObject.Sequence', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventFileWatcherAction', 5, N'MG_902', 0, N'caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventGlobalConstant', 5, N'MG_1164', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventGlobalConstant.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventGlobalConstant.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventGlobalConstant.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventGlobalConstant.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler', 5, N'MG_651', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Active', 5, N'MG_1077', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Chrono', 5, N'MG_1357', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.EditableByWizard', 5, N'MG_1363', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.EventName', 5, N'MG_650', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.IgnoreFailure', 5, N'MG_1373', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Obsolete', 5, N'MG_1396', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Overridable', 5, N'MG_1397', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Sequence', 5, N'MG_662', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Suspend', 5, N'MG_678', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Synchronous', 5, N'MG_1421', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandler.Transactional', 5, N'MG_1425', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerOrRevision', 5, N'MG_693', 0, N'Column(s) label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerRevision', 5, N'MG_1165', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerRevision.EventRevisionRowPointer', 5, N'MG_1265', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerRevision.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerRevision.Sequence', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState', 5, N'MG_654', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.EventHandlerRowPointer', 5, N'MG_1261', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.EventStateRowPointer', 5, N'MG_1266', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.RestartCurrentAction', 5, N'MG_1407', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.Retryable', 5, N'MG_1409', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.RetryFromCurrentAction', 5, N'MG_1410', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.Status', 5, N'MG_803', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.TimeOutDestSequence', 5, N'MG_713', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventHandlerState.VotingOpen', 5, N'MG_1437', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialState', 5, N'MG_691', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialState.InitialStateName', 5, N'MG_1267', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialState.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialState.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialState.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable', 5, N'MG_1166', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.DefaultAccess', 5, N'MG_1359', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.EventInitialStateRowPointer', 5, N'MG_1268', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.Persistent', 5, N'MG_1401', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInitialVariable.ValueIsGlobalConstantName', 5, N'MG_1435', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter', 5, N'MG_1167', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.EventParmId', 5, N'MG_1269', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.IsOutput', 5, N'MG_1385', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventInputParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage', 5, N'MG_764', 0, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.HasBeenRead', 5, N'MG_1371', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.IsSavedMessage', 5, N'MG_1386', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.Question', 5, N'MG_766', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.SelectedChoice', 5, N'MG_767', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessage.Subject', 5, N'MG_765', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageCategory', 5, N'MG_1168', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageCategory.Category', 5, N'MG_1002', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageCategory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageVariable', 5, N'MG_1169', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageVariable.EventMessageId', 5, N'MG_1270', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageVariable.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventMessageVariable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter', 5, N'MG_1170', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter.EventParmId', 5, N'MG_1271', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventOutputParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter', 5, N'MG_716', 0, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.EventParmId', 5, N'MG_1271', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.IsOutput', 5, N'MG_715', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.Name', 5, N'MG_451', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue', 5, N'MG_1171', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.Id', 5, N'MG_852', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.TimesAttempted', 5, N'MG_853', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventQueue.Transactional', 5, N'MG_1425', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventRetestableAction', 5, N'MG_711', 0, N'Pseudo-row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventRevision', 5, N'MG_1172', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventRevision.EventName', 5, N'MG_650', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventRevision.EventRevision', 5, N'MG_1172', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventRevision.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventSessionTally.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState', 5, N'MG_653', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.AnyHandlersFailed', 5, N'MG_1354', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.BeginDate', 5, N'MG_718', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.EventTitle', 5, N'MG_717', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.RolledBack', 5, N'MG_1411', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.Status', 5, N'MG_803', 16, N'Message for substitution', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.Status:2', 5, N'MG_802', 16, N'Message for substitution', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.Suspended', 5, N'MG_1419', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.SuspendValidatingMode', 5, N'MG_1420', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventState.Transactional', 5, N'MG_1425', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup', 5, N'MG_656', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup.EventGroupId', 5, N'MG_657', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup.EventStateRowPointer', 5, N'MG_1266', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventStateGroup.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTimedOutAction', 5, N'MG_712', 0, N'Pseudo-row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger', 5, N'MG_692', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.Active', 5, N'MG_1077', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.EditableByWizard', 5, N'MG_1363', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.EventTriggerId', 5, N'MG_1273', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.RequestedBy', 5, N'MG_708', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTrigger.Transactional', 5, N'MG_1425', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter', 5, N'MG_1173', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter.EventTriggerRowPointer', 5, N'MG_1274', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventTriggerParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable', 5, N'MG_1174', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.EventHandlerStateRowPointer', 5, N'MG_1263', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.Persistent', 5, N'MG_1401', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@EventVariable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExtendableStoredProcedure.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExternalDataStore', 5, N'MG_1175', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExternalDataStore.AccessKey', 5, N'MG_1275', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExternalDataStore.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExtSystemTransLog.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ExtSystemTransLog.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@FileServer.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@FK_SearchPreferenceList_SearchItemName', 18, N'MG_392', 16, N'Search Item cannot be deleted', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Galactic.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMTest2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMTest3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMTest4.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMWpfTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GMWpfTesting.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GroupNames', 5, N'MG_1176', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GroupNames.GroupId', 5, N'MG_1276', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GroupNames.GroupName', 5, N'MG_446', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@GroupNames.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HAACLASSTEST.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HAAIdoProjects.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HAATBL.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HAATEST_1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HelloUniverse.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@HelloWorld2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ido.Properties.PropertyName', 5, N'MG_469', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ido.Property', 5, N'MG_703', 0, N'Row caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOAliases.AliasProgID', 5, N'MG_1277', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOAliases.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOCollection', 5, N'MG_676', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOCollection.CollectionName', 5, N'MG_677', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOFilter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOFilters.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn', 5, N'MG_1177', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.ColumnName', 5, N'MG_569', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.IdoLinkDatabase', 5, N'MG_843', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.IsKey', 5, N'MG_855', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedColumn.ViewColumnName', 5, N'MG_1278', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedDatabase', 5, N'MG_842', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedDatabase.IdoLinkDatabase', 5, N'MG_843', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedDatabase.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedTable', 5, N'MG_1178', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedTable.IdoLinkDatabase', 5, N'MG_843', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedTable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedTable.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IdoLinkedTable.ViewName', 5, N'MG_856', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOMethodParameters.ParameterName', 5, N'MG_696', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOMethodParameters.Sequence', 5, N'MG_697', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOMethods.MethodName', 5, N'MG_698', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOProperties.PropertyName', 5, N'MG_469', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IDOTable.TableAlias', 5, N'MG_680', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet', 5, N'MG_476', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.description', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.intranet_name', 5, N'MG_478', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.IsExternal', 5, N'MG_1133', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.output_format', 5, N'MG_479', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.queue_server', 5, N'MG_548', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.ReportServerDeploymentMode', 5, N'MG_1406', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.SMTPDeliveryMethod', 5, N'MG_1417', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.SMTPEnableSSL', 5, N'MG_1418', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.SMTPServer', 5, N'MG_664', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@intranet.Transport', 5, N'MG_750', 16, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetLicensing', 5, N'MG_673', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetReports.BGReportType', 5, N'MG_744', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetReports.intranet_name', 5, N'MG_476', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable', 5, N'MG_1179', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable.intranet_name', 5, N'MG_476', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable.Processed', 5, N'MG_1403', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedTable.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable', 5, N'MG_1180', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.IntranetName', 5, N'MG_1279', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.Processed', 5, N'MG_1403', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.Shareable', 5, N'MG_1415', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.Shared', 5, N'MG_1416', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTable.UpdateRefId', 5, N'MG_1429', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault', 5, N'MG_1181', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.Shareable', 5, N'MG_1415', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@IntranetSharedUserTableDefault.UpdateRefId', 5, N'MG_1429', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Issue_179366.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Issue_182753.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Issue149806.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@item_all.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@jc_Test2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@jc_UserLangTests.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LanguageIDs', 5, N'MG_1182', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LanguageIDs.LanguageCode', 5, N'MG_1280', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LanguageIDs.LanguageID', 5, N'MG_480', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LanguageIDs.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@License.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LoginCfg.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LongRowPointerMap', 5, N'MG_1183', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LongRowPointerMap.LongRowPointer', 5, N'MG_1281', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LongRowPointerMap.ObjectName', 5, N'MG_422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@LongRowPointerMap.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MCB_Test100.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbColLengthTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbColLengthTest2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbColLengthTest3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbOrderDetails301.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbOrdertest300.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbOrdertest3002.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbOrdertest301.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest101.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest101Split.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest102.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest200.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest206.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mcbTest555.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@me_Test1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Members1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MessageTypes', 5, N'MG_1184', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MessageTypes.MessageCode', 5, N'MG_438', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MessageTypes.MessageType', 5, N'MG_420', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MessageTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGBUSDocuments.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGBUSElementAttributes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGBUSElements.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSourceMaps', 5, N'MG_1185', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSourceMaps.DefaultDataSource', 5, N'MG_481', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSourceMaps.ProgID', 5, N'MG_482', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSourceMaps.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSources', 5, N'MG_1186', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSources.Name', 5, N'MG_483', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MGDataSources.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers', 5, N'MG_1187', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers.ModuleName', 5, N'MG_484', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers.ObjectName', 5, N'MG_485', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers.ObjectType', 5, N'MG_486', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers.OriginalModuleName', 5, N'MG_487', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ModuleMembers.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Modules', 5, N'MG_1188', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Modules.ModuleName', 5, N'MG_484', 0, N'Attribute Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Modules.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@mptest9.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@MyNewTestForm.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NewColumnStaging.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NextKeys.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteHeaders', 5, N'MG_1189', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteHeaders.NoteFlag', 5, N'MG_1282', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteHeaders.NoteHeaderToken', 5, N'MG_430', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteHeaders.ObjectName', 5, N'MG_422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteHeaders.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NotesContentShadow.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NotesSiteMap', 5, N'MG_1190', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NotesSiteMap.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteTypes', 5, N'MG_1119', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteTypes.NoteType', 5, N'MG_1119', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoteTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@NoUniqueKeyTestTable.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectBuildMessages', 5, N'MG_459', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectBuildMessages.MessageType', 5, N'MG_420', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectBuildMessages.ObjectName', 5, N'MG_422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectBuildMessages.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectBuildMessages.SequenceNo', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectMainMessages', 5, N'MG_460', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectMainMessages.MessageType', 5, N'MG_420', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectMainMessages.ObjectName', 5, N'MG_422', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectMainMessages.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.NoteHeaderToken', 5, N'MG_430', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.NoteType', 5, N'MG_1119', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.ObjectNoteToken', 5, N'MG_435', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.RefRowPointer', 5, N'MG_1283', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.SpecificNoteToken', 5, N'MG_431', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.SystemNoteToken', 5, N'MG_432', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectNotes.UserNoteToken', 5, N'MG_433', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectSentEmail.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectTypes', 5, N'MG_1191', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectTypes.ObjectCode', 5, N'MG_442', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectTypes.ObjectType', 5, N'MG_421', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ObjectTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjectDepends.ChildObjectID', 5, N'MG_1284', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjectDepends.ChildType', 5, N'MG_1285', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjectDepends.ParentObjectID', 5, N'MG_1286', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjectDepends.ParentType', 5, N'MG_1287', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjects', 5, N'MG_1192', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjects.ObjectID', 5, N'MG_439', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTObjects.ObjectName', 5, N'MG_422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTTableColumns.ColumnID', 5, N'MG_1288', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ODTTableColumns.TableID', 5, N'MG_1289', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@OutputFormats.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@OutriggerProfile.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@OutriggerProfileOptions.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms', 5, N'MG_488', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.analytical_ledger', 5, N'MG_1353', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.capitalize', 5, N'MG_1356', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.default_ending_from_starting', 5, N'MG_1358', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.ec_reporting', 5, N'MG_1362', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.emp_type', 5, N'MG_1365', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.enable_multiple_fsb', 5, N'MG_1366', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.gl_print_post', 5, N'MG_1370', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.hide_parent_grid_columns', 5, N'MG_1372', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.name_code', 5, N'MG_1393', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.parm_key', 5, N'MG_489', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.print_name', 5, N'MG_1402', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.rsvd1', 5, N'MG_1412', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.rsvd2', 5, N'MG_1413', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.secure_control_accounts', 5, N'MG_1414', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.site', 5, N'MG_490', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.site_group', 5, N'MG_491', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.site_ref', 5, N'MG_490', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.use_external_gl', 5, N'MG_1430', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms.use_widget_preferences', 5, N'MG_1431', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms_all.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@parms_all.site_ref', 5, N'MG_492', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters', 5, N'MG_633', 16, N'Enforce Mix Case 0 or 1', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters.EnforceDigit', 5, N'MG_1367', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters.MinimumPasswordExpiration', 5, N'MG_1391', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters.ParmKey', 5, N'MG_489', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters.PasswordExpiration', 5, N'MG_1398', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PasswordParameters.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PK_Test.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Printer', 5, N'MG_1193', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Printer.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Printer.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Printer.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PrintPreview.PreviewNumber', 5, N'MG_493', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PrintPreview.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog', 5, N'MG_1194', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog.LineNum', 5, N'MG_504', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog.ProcessID', 5, N'MG_1258', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessErrorLog.UserName', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessLineNumbers', 5, N'MG_1195', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessLineNumbers.ProcessID', 5, N'MG_1258', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProcessLineNumbers.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductDbFiles.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductPatches.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductPatchItems.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductSPItems', 5, N'MG_1196', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductVersion', 5, N'MG_1197', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ProductVersion.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PropertyClasses.ClassName', 5, N'MG_524', 0, N'ClassName column description', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Publication', 5, N'MG_781', 0, N'Column label', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Publication.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Publication.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Publication.PublicationName', 5, N'MG_1290', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Publication.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategory', 5, N'MG_780', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategory.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategory.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategory.PublicationCategory', 5, N'MG_780', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication', 5, N'MG_1198', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.IsSystemRecord', 5, N'MG_1387', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.PublicationCategory', 5, N'MG_780', 16, N'Column Label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.PublicationName', 5, N'MG_1290', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationCategoryPublication.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber', 5, N'MG_790', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.Email', 5, N'MG_663', 0, N'Column Label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.KeyValue', 5, N'MG_1314', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.KeyValue2', 5, N'MG_1315', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.PublicationName', 5, N'MG_1290', 0, N'Column Label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@PublicationSubscriber.Username', 5, N'MG_545', 0, N'Column Label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEvent', 5, N'MG_851', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEvent.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEvent.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEvent.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEvent.Suspend', 5, N'MG_678', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEventHandler.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEventHandler.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@QueuedEventHandler.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_category', 5, N'MG_494', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_category.category', 5, N'MG_495', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_category.description', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_category.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category', 5, N'MG_496', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category.category', 5, N'MG_495', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category.object_name', 5, N'MG_485', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category.object_type', 5, N'MG_486', 0, N'Attribute Identifier', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category.retain_site', 5, N'MG_1408', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_object_category.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule', 5, N'MG_497', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.category', 5, N'MG_495', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.description', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.disable_repl', 5, N'MG_498', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.source_site', 5, N'MG_499', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.target_site', 5, N'MG_500', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rep_rule.update_all_columns', 5, N'MG_1428', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute', 5, N'MG_1199', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.AttributeName', 5, N'MG_1291', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.DocumentName', 5, N'MG_747', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.ElementRowPointer', 5, N'MG_1292', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.IncludeForNullValuedElement', 5, N'MG_1376', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocAttribute.ValueSourceType', 5, N'MG_1436', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocElement.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocElement.IsToLogicalId', 5, N'MG_1388', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocElement.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocElement.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocElement.ValueSourceType', 5, N'MG_1436', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound', 5, N'MG_1200', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound.BODNoun', 5, N'MG_758', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound.BODVerb', 5, N'MG_759', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocInbound.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocObject', 5, N'MG_746', 16, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocObject.DocumentName', 5, N'MG_747', 16, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound', 5, N'MG_757', 16, N'Table Caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.ActiveForManualRequest', 5, N'MG_1351', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.AppliesToIDOAction', 5, N'MG_755', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.AppliesToIDOMethodName', 5, N'MG_1293', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.AppliesToIDOName', 5, N'MG_1294', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.BODNoun', 5, N'MG_758', 16, N'Column Caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.BODVerb', 5, N'MG_759', 16, N'Column Caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.EligibleForBackgroundManualRequest', 5, N'MG_1364', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.intranet_name', 5, N'MG_476', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutbound.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter', 5, N'MG_1201', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter.FilterSequence', 5, N'MG_1295', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter.ReplDocOutboundRowPointer', 5, N'MG_1296', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocOutboundFilter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocument', 5, N'MG_745', 16, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocument.DocumentName', 5, N'MG_747', 16, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocument.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocument.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplDocument.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRows3', 5, N'MG_1202', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRows3.OperationNumber', 5, N'MG_501', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRows3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRowsErrors', 5, N'MG_1203', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRowsErrors.OperationNumber', 5, N'MG_501', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicatedRowsErrors.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReplicationOperationCounter.Counter', 5, N'MG_1297', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReportOptions.AutoView', 5, N'MG_1355', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReportOptions.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReportOptions.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReportOptions.TaskName', 5, N'MG_502', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReportOptions.Username', 5, N'MG_503', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReusableNotesToSite', 5, N'MG_1204', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ReusableNotesToSite.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values', 5, N'MG_1205', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values.comp_name', 5, N'MG_1063', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values.form_name', 5, N'MG_1298', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values.id', 5, N'MG_1136', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rpt_opt_values.UserId', 5, N'MG_427', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rv_Customer.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rvCustomer.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@rv-Customer.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@satTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@save_ApplicationMessages.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@save_ObjectBuildMessages.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@save_ObjectMainMessages.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchItem', 5, N'MG_800', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchItem.ColumnName', 5, N'MG_569', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchItem.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchItem.SearchItemName', 5, N'MG_1299', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchItem.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchPreferenceList', 5, N'MG_1206', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchPreferenceList.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchPreferenceList.SearchGroup', 5, N'MG_1300', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchPreferenceList.SearchItemName', 5, N'MG_1299', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SearchPreferenceList.Username', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Servers.ServerName', 5, N'MG_702', 16, N'Table Column Name', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SessionContextNames', 5, N'MG_1207', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SessionContextNames.ProcessID', 5, N'MG_1258', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SessionContextNames.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValues.LineNum', 5, N'MG_504', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValues.OperationNumber', 5, N'MG_501', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValues.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValuesErrors', 5, N'MG_1208', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValuesErrors.LineNum', 5, N'MG_504', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValuesErrors.OldNew', 5, N'MG_505', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValuesErrors.OperationNumber', 5, N'MG_501', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@ShadowValuesErrors.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site', 5, N'MG_490', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.app_db_name', 5, N'MG_614', 0, N'Table column name.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.description', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.intranet_name', 5, N'MG_478', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.lang_code', 5, N'MG_506', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.reports_to_site', 5, N'MG_507', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.site', 5, N'MG_490', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.site_name', 5, N'MG_508', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.source_site', 5, N'MG_499', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.strings_table', 5, N'MG_815', 0, N'Strings table desc', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.system_type', 5, N'MG_509', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.target_site', 5, N'MG_500', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.time_zone', 5, N'MG_510', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site.type', 5, N'MG_511', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_group', 5, N'MG_512', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_group.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_group.site', 5, N'MG_492', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_group.site_group', 5, N'MG_512', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy', 5, N'MG_513', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy.eff_date', 5, N'MG_514', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy.obs_date', 5, N'MG_515', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy.reports_to_site', 5, N'MG_507', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_hierarchy.site', 5, N'MG_516', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_link_info', 5, N'MG_675', 0, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_link_info.from_site', 5, N'MG_517', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_link_info.linked_server_name', 5, N'MG_606', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_link_info.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_link_info.to_site', 5, N'MG_518', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_live_link.from_site', 5, N'MG_517', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_live_link.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@site_live_link.to_site', 5, N'MG_518', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteConnectionInformation', 5, N'MG_1209', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteConnectionInformation.ConnectionID', 5, N'MG_474', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteConnectionInformation.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteConnectionInformation.Site', 5, N'MG_490', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@sitenet', 5, N'MG_519', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@sitenet.from_site', 5, N'MG_517', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@sitenet.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@sitenet.to_site', 5, N'MG_518', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteTypeModuleMap.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteUserMap', 5, N'MG_520', 0, N'Table label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteUserMap.FromSite', 5, N'MG_492', 0, N'Table label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteUserMap.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SiteUserMap.ToSite', 5, N'MG_492', 0, N'Table label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SoHoOrgChart.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SpecificNotes', 5, N'MG_1210', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SpecificNotes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SpecificNotes.SpecificNoteToken', 5, N'MG_431', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@StartupMethod.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@StartupMethod.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@StartupMethod.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@syscolumns', 5, N'MG_568', 0, N'Table Name', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@syscolumns.name', 5, N'MG_569', 0, N'Column Label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@system_type', 5, N'MG_509', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@system_type.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@system_type.system_type', 5, N'MG_509', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemNotes', 5, N'MG_1211', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemNotes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemNotes.SystemNoteToken', 5, N'MG_432', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemProcessDefaults', 5, N'MG_1212', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemProcessDefaults.DefaultType', 5, N'MG_521', 0, N'Text Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@SystemProcessDefaults.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class', 5, N'MG_522', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.active', 5, N'MG_523', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.allow_record_assoc', 5, N'MG_1352', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.class_name', 5, N'MG_524', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.extend_all_recs', 5, N'MG_1369', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.order_', 5, N'MG_525', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.sys_delete', 5, N'MG_526', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class.table_name', 5, N'MG_527', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed', 5, N'MG_1213', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.active', 5, N'MG_1077', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.allow_record_assoc', 5, N'MG_1352', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.extend_all_recs', 5, N'MG_1369', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.sys_delete', 5, N'MG_526', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_committed.table_name', 5, N'MG_527', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted', 5, N'MG_1214', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.active', 5, N'MG_1077', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.allow_record_assoc', 5, N'MG_1352', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.extend_all_recs', 5, N'MG_1369', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@table_class_impacted.table_name', 5, N'MG_527', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskExclusion', 5, N'MG_1215', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskExclusion.ExcludedTask', 5, N'MG_450', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskExclusion.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskExclusion.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskExclusion.TaskName', 5, N'MG_444', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskList.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskTypes', 5, N'MG_1216', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TaskTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tempSQLTableTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TestKeys.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TestsIDO.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TestTableGoutam.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TestTableRS5345.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TestTaskName.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TimeZoneData.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_ClassNotes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_DocumentObject.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_DocumentObjectReference.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_DocumentType.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_NoteHeaders.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_ObjectNotes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_SpecificNotes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_SystemNotes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@tmp_UserNotes.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpEventHandler', 5, N'MG_1217', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpEventHandler.EventName', 5, N'MG_650', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpEventHandler.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpEventHandler.Sequence', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpStagingNewDataMaintenance', 5, N'MG_1218', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpStagingNewDataMaintenance.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpStagingNewDataMaintenance.ProcessID', 5, N'MG_1258', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TmpStagingNewDataMaintenance.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TonyTest.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_NDMW_MV.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_ReqCTD.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_SUB_1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_SUB_2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB_SUB_3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPB99.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPBNDMWLang.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPBRounding.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPBTest_1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TPBTest_174213.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TrackRows', 5, N'MG_1219', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TrackRows.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TrackRows.SessionID', 5, N'MG_529', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@TrackRows.TrackedOperType', 5, N'MG_1302', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UpdateCollection.ActionType', 5, N'MG_704', 0, N'Pseudo-column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class', 5, N'MG_530', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.class_desc', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.class_name', 5, N'MG_524', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.sys_delete', 5, N'MG_526', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.sys_has_fields', 5, N'MG_1422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class.sys_has_tables', 5, N'MG_1423', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed', 5, N'MG_1220', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed.sys_delete', 5, N'MG_526', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed.sys_has_fields', 5, N'MG_1422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_committed.sys_has_tables', 5, N'MG_1423', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld', 5, N'MG_531', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld.class_name', 5, N'MG_524', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld.fld_name', 5, N'MG_532', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld.order_', 5, N'MG_525', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld.sys_delete', 5, N'MG_526', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_committed', 5, N'MG_1221', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_committed.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_committed.fld_name', 5, N'MG_533', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_committed.sys_delete', 5, N'MG_526', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_impacted', 5, N'MG_1222', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_impacted.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_impacted.fld_name', 5, N'MG_533', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_fld_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_impacted', 5, N'MG_1223', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_impacted.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_impacted.sys_has_fields', 5, N'MG_1422', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_impacted.sys_has_tables', 5, N'MG_1423', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_record_assoc', 5, N'MG_1224', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_record_assoc.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_record_assoc.RecordRowPointer', 5, N'MG_534', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_class_record_assoc.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld', 5, N'MG_535', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld.fld_desc', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld.fld_name', 5, N'MG_533', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld.sys_delete', 5, N'MG_526', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_committed', 5, N'MG_1225', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_committed.fld_name', 5, N'MG_533', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_committed.sys_delete', 5, N'MG_526', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_impacted', 5, N'MG_1226', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_impacted.fld_name', 5, N'MG_533', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_widget.widget_blank', 5, N'MG_536', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_fld_widget.widget_frequency', 5, N'MG_537', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index', 5, N'MG_538', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.class_name', 5, N'MG_524', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.index_active', 5, N'MG_523', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.index_desc', 5, N'MG_477', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.index_name', 5, N'MG_539', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.index_unique', 5, N'MG_540', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.index_word', 5, N'MG_1379', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index.sys_delete', 5, N'MG_526', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed', 5, N'MG_1227', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.index_name', 5, N'MG_541', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.index_unique', 5, N'MG_1378', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.index_word', 5, N'MG_1379', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_committed.sys_delete', 5, N'MG_526', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld', 5, N'MG_542', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.class_name', 5, N'MG_524', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.fld_name', 5, N'MG_532', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.index_asc', 5, N'MG_1377', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.index_name', 5, N'MG_539', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.index_seq', 5, N'MG_543', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed', 5, N'MG_1228', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.fld_name', 5, N'MG_532', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.index_asc', 5, N'MG_1377', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.index_name', 5, N'MG_541', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.index_seq', 5, N'MG_543', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_committed.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted', 5, N'MG_1229', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.fld_name', 5, N'MG_532', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.index_asc', 5, N'MG_1377', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.index_name', 5, N'MG_541', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.index_seq', 5, N'MG_543', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_fld_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted', 5, N'MG_1230', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted.class_name', 5, N'MG_528', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted.index_name', 5, N'MG_541', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted.index_unique', 5, N'MG_1378', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted.index_word', 5, N'MG_1379', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@user_index_impacted.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar', 5, N'MG_1231', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.AppointmentName', 5, N'MG_1303', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.DeleteAfterReminder', 5, N'MG_1360', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.EndTime', 5, N'MG_1304', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.StartTime', 5, N'MG_1305', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserCalendar.UserId', 5, N'MG_427', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedFields', 5, N'MG_1232', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedFields.RowId', 5, N'MG_449', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedFields.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedFields.TableName', 5, N'MG_424', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypes', 5, N'MG_1233', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypes.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypes.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypeValues', 5, N'MG_1234', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypeValues.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypeValues.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypeValues.TypeName', 5, N'MG_452', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserDefinedTypeValues.Value', 5, N'MG_453', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail', 5, N'MG_789', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.EmailAddress', 5, N'MG_663', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.EmailType', 5, N'MG_783', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.RowPointer', 2, N'MG_470', 0, N'Column lable', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserEmail.Username', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserGroupMap', 5, N'MG_1235', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserGroupMap.GroupId', 5, N'MG_454', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserGroupMap.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserGroupMap.UserId', 5, N'MG_427', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserModules', 5, N'MG_1236', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserModules.ModuleName', 5, N'MG_484', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserModules.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserModules.UserId', 5, N'MG_544', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames', 5, N'MG_1040', 0, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Usernames.EmailAddress', 5, N'MG_663', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.EmailNotificationsType', 5, N'MG_787', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.EmailPromptsEmailType', 5, N'MG_786', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.PrimaryEmailType', 5, N'MG_788', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.SendEmailNotifications', 5, N'MG_785', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Usernames.SendEmailNotificationsType', 5, N'MG_782', 0, N'Column Label', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.SendEmailPrompts', 5, N'MG_784', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.UseEmailReplyTo', 5, N'MG_1432', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.UserId', 5, N'MG_545', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.UserName', 5, N'MG_545', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNames.WorkstationLogin', 5, N'MG_1449', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@usernames_all.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNotes', 5, N'MG_1237', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNotes.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserNotes.UserNoteToken', 5, N'MG_433', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory', 5, N'MG_1238', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory.PasswordAgeCount', 5, N'MG_1306', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserPasswordHistory.Username', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserProcessDefaults', 5, N'MG_1239', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserProcessDefaults.DefaultType', 5, N'MG_1118', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserProcessDefaults.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserProcessDefaults.UserName', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask', 5, N'MG_1240', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.DeleteAfterReminder', 5, N'MG_1360', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.InWorkflow', 5, N'MG_1381', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.NoteExistsFlag', 5, N'MG_1395', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.TaskName', 5, N'MG_444', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@UserTask.UserId', 5, N'MG_427', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategory', 5, N'MG_883', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategory.Category', 5, N'MG_1002', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategory.Description', 5, N'MG_1001', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser', 5, N'MG_884', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.CanDrilldown', 5, N'MG_1035', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.CanRun', 5, N'MG_1036', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.CanUpdateParameters', 5, N'MG_987', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.CanUser', 5, N'MG_1038', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.Category', 5, N'MG_1002', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.ReceiveEmail', 5, N'MG_1041', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBCategoryUser.Username', 5, N'MG_545', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataView', 5, N'MG_893', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataView.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataView.ViewName', 5, N'MG_1064', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction', 5, N'MG_899', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.Active', 5, N'MG_1077', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.Caption', 5, N'MG_1075', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.ClassName', 5, N'MG_524', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.IDOName', 5, N'MG_1074', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.PropertyName', 5, N'MG_1071', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.ScopeName', 5, N'MG_1067', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewAction.ScopeType', 5, N'MG_1069', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewColumn', 5, N'MG_1241', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewColumn.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewColumn.Seq', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewColumn.ViewName', 5, N'MG_1064', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewGroup', 5, N'MG_1242', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewGroup.GroupName', 5, N'MG_446', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewGroup.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewGroup.ViewName', 5, N'MG_1064', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewIDO', 5, N'MG_1243', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewIDO.IDOAlias', 5, N'MG_571', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewIDO.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewIDO.ViewName', 5, N'MG_1064', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout', 5, N'MG_1244', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.ComponentName', 5, N'MG_1063', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.DefaultView', 5, N'MG_1070', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.LayoutName', 5, N'MG_1065', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.ScopeName', 5, N'MG_1067', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.ScopeType', 5, N'MG_1069', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.SourceType', 5, N'MG_1068', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewLayout.ViewName', 5, N'MG_1064', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewParameter', 5, N'MG_1466', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewParameter.Operator', 5, N'MG_1467', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewUser', 5, N'MG_1245', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewUser.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewUser.Username', 5, N'MG_545', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDataViewUser.ViewName', 5, N'MG_1064', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown', 5, N'MG_887', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.AlertOperator', 5, N'MG_1010', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.AlertUse', 5, N'MG_1011', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.AlertValue', 5, N'MG_1012', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.ColumnHeader', 5, N'MG_1013', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.ColumnSize', 5, N'MG_1014', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.Description', 5, N'MG_1001', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.GoalOperator', 5, N'MG_1003', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.GoalUse', 5, N'MG_1004', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.GoalValue', 5, N'MG_1005', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.KPINum', 5, N'MG_1000', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldown.Seq', 5, N'MG_1022', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownCategory', 5, N'MG_1246', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownCategory.Category', 5, N'MG_1002', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownCategory.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownCategory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownColumn', 5, N'MG_1247', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownColumn.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownColumn.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownColumn.Seq', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownFilter', 5, N'MG_1248', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownFilter.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownFilter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownFilter.Seq', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownParameter', 5, N'MG_1249', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownParameter.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownParameter.Name', 5, N'MG_1061', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBDrilldownParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI', 5, N'MG_886', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.Active', 5, N'MG_1077', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.Aggregate', 5, N'MG_1113', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.AlertOperator', 5, N'MG_1010', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.AlertUse', 5, N'MG_1011', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.AlertValue', 5, N'MG_1012', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.CannedKPINum', 5, N'MG_999', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.Category', 5, N'MG_1002', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.Description', 5, N'MG_1001', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.GoalOperator', 5, N'MG_1003', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.GoalUse', 5, N'MG_1004', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.GoalValue', 5, N'MG_1005', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.KPINum', 5, N'MG_1000', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPI.ShortDescription', 5, N'MG_1008', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPICategory', 5, N'MG_1250', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPICategory.Category', 5, N'MG_1002', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPICategory.KPINum', 5, N'MG_1000', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPICategory.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIDrilldown', 5, N'MG_1251', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIDrilldown.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIDrilldown.KPINum', 5, N'MG_1000', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIDrilldown.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIFilter', 5, N'MG_892', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIFilter.KPINum', 5, N'MG_1000', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIFilter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIFilter.Seq', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIParameter', 5, N'MG_885', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIParameter.KPINum', 5, N'MG_1000', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIParameter.Name', 5, N'MG_993', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIParameter.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIParameter.Value', 5, N'MG_453', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser', 5, N'MG_889', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.CanDrilldown', 5, N'MG_1035', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.CanRun', 5, N'MG_1036', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.CanUpdateParameters', 5, N'MG_1037', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.CanUser', 5, N'MG_1038', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.KPINum', 5, N'MG_1000', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.ReceiveEmail', 5, N'MG_1041', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBKPIUser.Username', 5, N'MG_545', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters', 5, N'MG_888', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.AlertColor', 5, N'MG_1024', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.AlertSymbol', 5, N'MG_1025', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.GoalColor', 5, N'MG_1027', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.GoalSymbol', 5, N'MG_1028', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.ParmKey', 5, N'MG_1029', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.ShowSnapshot', 5, N'MG_1032', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.WarningColor', 5, N'MG_1033', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBParameters.WarningSymbol', 5, N'MG_1034', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSet.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSource', 5, N'MG_894', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSource.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSource.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceColumn', 5, N'MG_896', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceColumn.PropertyName', 5, N'MG_1071', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceColumn.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceColumn.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceGroup', 5, N'MG_898', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceGroup.GroupName', 5, N'MG_1072', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceGroup.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceGroup.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceItem', 5, N'MG_895', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceItem.PropertyName', 5, N'MG_1071', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceItem.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceItem.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceSet.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceUser', 5, N'MG_897', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceUser.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceUser.SourceName', 5, N'MG_1066', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSearchSourceUser.Username', 5, N'MG_545', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot', 5, N'MG_890', 0, N'Table caption', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.ActualValue', 5, N'MG_1042', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.AlertDescription', 5, N'MG_1043', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.AlertOperator', 5, N'MG_1010', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.AlertUse', 5, N'MG_1011', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.AlertValue', 5, N'MG_1012', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.Category', 5, N'MG_1002', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.Color', 5, N'MG_1054', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.Description', 5, N'MG_1001', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.GoalDescription', 5, N'MG_1043', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.GoalOperator', 5, N'MG_1003', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.GoalUse', 5, N'MG_1004', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.GoalValue', 5, N'MG_1005', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.KPINum', 5, N'MG_1000', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.Seq', 5, N'MG_814', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.ShortDescription', 5, N'MG_1008', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.SnapshotDate', 5, N'MG_1057', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSnapshot.Symbol', 5, N'MG_1055', 0, N'Column caption', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSubDrilldown', 5, N'MG_1252', 16, N'Table caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSubDrilldown.DrillNum', 5, N'MG_1307', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSubDrilldown.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBSubDrilldown.SubDrillNum', 5, N'MG_1308', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBTmpDrilldowns.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WBTmpKPIs.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WEB_Product.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Workflows.Action', 5, N'MG_546', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Workflows.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@Workflows.WindowID', 5, N'MG_547', 0, N'Column caption', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WorkflowTemplates.RowPointer', 5, N'MG_470', 0, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@WPFTestGM.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x10.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x12.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x13.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x14.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x15.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x17.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x19.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x2.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x20.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x21.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x3.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x4.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x5.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x7.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x8.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@x9.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'@xz1.RowPointer', 5, N'MG_470', 16, N'Column label', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AccountAuthorizationsIx1', 17, N'MG_387', 16, N'This message is displayed when PRIMAY KEY ''AccountAuthorizationsIx1'' constraint fails on the ObjectName1/ObjectType/ObjectName2/UserFlag/Id combination.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ActiveBGTasksIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''ActiveBGTasksIx0'' constraint fails on TaskNumber.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AddAuditLogEntrySp', 5, N'MG_379', 16, N'This message is displayed when there is an error inserting a record into the AuditLog table.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AllocationAssignRix', 17, N'MG_383', 16, N'This message is displayed when User Defined Fields is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AltMessageTypesCk1', 17, N'MG_418', 16, N'This message is displayed when TABLE CHECK ''AltMessageTypesCk1'' constraint fails on table: AuditLogTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AltNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''AltNoteExistsFlagCk1'' constraint fails on table: AuditLogTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AmeMessageLanguageCk1', 17, N'MG_395', 16, N'This message is displayed when COLUMN CHECK ''AmeMessageLanguageCk1'' constraint fails on table: ApplicationMessages, column: MessageLanguage.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AmeMessageNoCk1', 17, N'MG_381', 16, N'This message is displayed when COLUMN CHECK ''AmeMessageNoCk1'' constraint fails on table: ApplicationMessages, column: MessageNo.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AmeNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''AmeNoteExistsFlag'' constraint fails on table: ApplicationMessages, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ApplicationMessages', 1, N'MG_369', 16, N'This message is displayed when validation of Application Messages failes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ApplicationMessagesIx0', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''ApplicationMessagesIx0'' constraint fails on ApplicationMessages.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'atableRcx', 17, N'MG_383', 16, N'This message is displayed when Base message [@atable] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'atablesIx1', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogFk1', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''AuditLogFk1'' constraint fails during INSERT or UPDATE of MessageType.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogFk1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''AuditLogFk1'' constraint fails during DELETE of MessageType.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''AuditLogIx0'' constraint fails on AuditLogToken.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''AuditLogNoteExistsFlagCk1'' constraint fails on table: AuditLog, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogTypesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''AuditLogTypesIx0'' constraint fails on MessageType.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditLogTypesRcx', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''AuditLogTypesRcx'' constraint fails on RowPointer.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'AuditMessageTypeValidSp', 8, N'MG_369', 16, N'This message is displayed there is an invalid Audit Message Type.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BGTaskDefinitionsIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''BGTaskDefinitionsIx0'' constraint fails on TaskName.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BGTaskDefinitionsRcx', 17, N'MG_383', 16, N'This message is displayed when Background Task Definitions is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BGTaskHistoryIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''BGTaskHistoryIx0'' constraint fails on TaskNumber.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BGTaskSubmitSp', 5, N'MG_416', 16, N'This message is displayed when more than one instance of a single instance task is started.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'btableRcx', 17, N'MG_383', 16, N'This message is displayed when Base message [@btable] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'btablesIx1', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BtdExclusiveFlagCk1', 17, N'MG_417', 16, N'This message is displayed when COLUMN CHECK ''BtdExclusiveFlagCk1'' constraint fails on table: BGTaskDefinitions, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'BtdNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''BtdNoteExistsFlagCk1'' constraint fails on table: BGTaskDefinitions, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CF_rep_object_category_skip_delete', 17, N'MG_772', 16, N'Skip delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CF_rep_object_category_skip_insert', 17, N'MG_772', 16, N'Skip insert must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CF_rep_object_category_skip_update', 17, N'MG_772', 16, N'Skip update must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CheckTaskExclusionSp', 5, N'MG_403', 16, N'This message is displayed when a background task is execute which is blocked by other running tasks.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'childFK1', 17, N'MG_372', 16, N'This message is displayed when <topic, itype> is/are updated on a(n) Base message [@child] is not defined. to a value that does not exist in any Base message [@p1] is not defined.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'childFK1', 18, N'MG_405', 16, N'This message is displayed when Base message [@p1] is not defined. exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ActiveBGTasks_mst_NoteExistsFlag', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''CK_ActiveBGTasks_mst_NoteExistsFlag'' constraint fails on table: ActiveBgTasks, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppColumn_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppColumn_KeySequence', 17, N'MG_841', 16, N'Lockout duration positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppColumn_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ApplicationMessages_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppModule_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppModule_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_DisallowUpdate', 17, N'MG_772', 16, N'Disallow Update must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_IgnoreInsert', 17, N'MG_772', 16, N'Ignore Insert must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_IgnoreUpdate', 17, N'MG_772', 16, N'Ignore Update must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_IupTriggerModifiesNewRows', 17, N'MG_772', 16, N'Iup Trigger Modifies New Rows must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_KeepClusteringKeys', 17, N'MG_772', 16, N'Keep Clustering Keys must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_NextKeyReverseKeyOrder', 17, N'MG_772', 16, N'Next Key Reverse Key Order must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_RegisterNewKey', 17, N'MG_772', 16, N'Register New Key must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_RememberIdentity', 17, N'MG_772', 16, N'Remember Identity must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_TestOutsideLockForNewKey', 17, N'MG_772', 16, N'Test Outside Lock For New Key must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_Update_AllRegardlessOfBaseTableChanges', 17, N'MG_772', 16, N'Update All Regardless Of Base Table Changes must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_UseRPOnInsert', 17, N'MG_772', 16, N'Use RP On Insert must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_AppTable_UseRPOnUpdate', 17, N'MG_772', 16, N'Use RP On Update must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_BGTaskHistory_mst_NoteExistsFlag', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''CK_BGTaskHistory_mst_NoteExistsFlag'' constraint fails on table: BGTaskHistory, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ConfigParms_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ConfigParms_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_INBOX_ENTRY_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_INBOX_ENTRY_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_INBOX_HEADERS_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_INBOX_HEADERS_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_OUTBOX_ENTRY_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_OUTBOX_ENTRY_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_OUTBOX_HEADERS_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_OUTBOX_HEADERS_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_PROPERTY_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_COR_PROPERTY_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_CountryPack_Option', 17, N'MG_82', 16, N'The Option must be L(Localizations) or T(Translations).', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DefaultType_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DefineVarables_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObject_Internal', 17, N'MG_772', 16, N'Internal must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObject_InternalOnlyFlag', 17, N'MG_796', 16, N'Internal check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObject_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObject_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObjectReference_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObjectReference_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentObjectReference_Suspend', 17, N'MG_772', 16, N'Suspend must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentType_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_DocumentType_NoteExistsFlag', 17, N'MG_410', 16, N'Note exists', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_EventHasChanged', 17, N'MG_772', 16, N'EventHasChanged must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_IsFrameworkEvent', 17, N'MG_772', 16, N'IsFrameworkEvent must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_IsFrameworkIDOEvent', 17, N'MG_772', 16, N'IsFrameworkIDOEvent must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_IsFrameworkIDOSuspendableEvent', 17, N'MG_772', 16, N'IsFrameworkIDOSuspendableEvent must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Event_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventAction_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventAction_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_ModifiedPayloadAccess', 17, N'MG_1446', 16, N'This message is displayed when data entered for ModifiedPayloadAccess must be Default, Hidden or Read Only.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_PayloadAccess', 17, N'MG_1446', 16, N'This message is displayed when data entered for PayloadAccess must be Default, Hidden or Read Only.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_PayloadOneNonDefault', 17, N'MG_1458', 16, N'This message is displayed when CHECK ''CK_EventActionState_PayloadOneNonDefault'' constraint fails on table: EventActionState.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionState_UnmodifiedPayloadAccess', 17, N'MG_1446', 16, N'This message is displayed when data entered for UnmodifiedPayloadAccess must be Default, Hidden or Read Only.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionVariableAccess_Access', 17, N'MG_1447', 16, N'The Access must be Default, Hidden, Mandatory, Read-Only or Writable.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionVariableAccess_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventActionVariableAccess_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventGlobalConstant_mst_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventGlobalConstant_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Active', 17, N'MG_772', 16, N'Active must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Chrono', 17, N'MG_1448', 16, N'The Chronology must be After, Before, Exclusive Instead, First, Instead or Last.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_EditableByWizard', 17, N'MG_772', 16, N'EditableByWizard must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_IgnoreFailure', 17, N'MG_772', 16, N'IgnoreFailure must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Obsolete', 17, N'MG_772', 16, N'Obsolete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Overridable', 17, N'MG_772', 16, N'Overridable must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Suspend', 17, N'MG_772', 16, N'Suspend must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Synchronous', 17, N'MG_772', 16, N'Synchronous must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandler_Transactional', 17, N'MG_772', 16, N'Transactional must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandlerState_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandlerState_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandlerState_RestartCurrentAction', 17, N'MG_772', 16, N'RestartCurrentAction must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandlerState_Status', 17, N'MG_1452', 16, N'Status must be 0(Success), 1(Failure), 2(Running) or 3.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventHandlerState_VotingOpen', 17, N'MG_772', 16, N'VotingOpen must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialState_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialState_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialVariable_DefaultAccess', 17, N'MG_1447', 16, N'The DefaultAccess must be Default, Hidden, Mandatory, Read-Only or Writable.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialVariable_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialVariable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialVariable_Persistent', 17, N'MG_772', 16, N'Persistent must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInitialVariable_ValueIsGlobalConstantName', 17, N'MG_772', 16, N'ValueIsGlobalConstantName must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInputParameter_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInputParameter_IsOutput', 17, N'MG_772', 16, N'IsOutput must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventInputParameter_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventMessage_HasBeenRead', 17, N'MG_772', 16, N'HasBeenRead must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventMessage_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventMessage_IsSavedMessage', 17, N'MG_772', 16, N'IsSavedMessage must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventMessage_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventOutputParameter_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventOutputParameter_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventParameter_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventParameter_IsOutput', 17, N'MG_772', 16, N'IsOutput must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventParameter_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventQueue_mst_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventQueue_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventQueue_mst_Transactional', 17, N'MG_772', 16, N'Transactional must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_AnyHandlersFailed', 17, N'MG_772', 16, N'AnyHandlersFailed must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_Retryable', 17, N'MG_772', 16, N'Retryable must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_RetryFromCurrentAction', 17, N'MG_772', 16, N'RetryFromCurrentAction must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_RolledBack', 17, N'MG_772', 16, N'RolledBack must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_Status', 17, N'MG_1446', 16, N'Status must be 0(Success), 1(Failure) or 2(Running).', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_Suspended', 17, N'MG_772', 16, N'Suspended must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_SuspendValidatingMode', 17, N'MG_772', 16, N'SuspendValidatingMode must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventState_Transactional', 17, N'MG_772', 16, N'Transactional must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventStateGroup_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventStateGroup_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTrigger_mst_Active', 17, N'MG_772', 16, N'Active must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTrigger_mst_EditableByWizard', 17, N'MG_772', 16, N'EditableByWizard must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTrigger_mst_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTrigger_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTrigger_mst_Transactional', 17, N'MG_772', 16, N'Transactional must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTriggerParameter_mst_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventTriggerParameter_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventVariable_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventVariable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_EventVariable_Persistent', 17, N'MG_772', 16, N'Persistent must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ExtSystemTransLog_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedColumn_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedColumn_IsCharacter', 17, N'MG_394', 16, N'This message is displayed when COLUMN CHECK CK_IdoLinkedColumn_IsCharacter fails.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedColumn_IsKey', 17, N'MG_394', 16, N'This message is displayed when COLUMN CHECK CK_IdoLinkedColumn_IsKey fails.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedColumn_IsOptimisticLock', 17, N'MG_394', 16, N'This message is displayed when COLUMN CHECK CK_IdoLinkedColumn_IsOptimisticLock fails.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedColumn_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedDatabase_DbType', 17, N'MG_1123', 16, N'This message is displayed when an invalid database type is entered.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedDatabase_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedDatabase_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedTable_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IdoLinkedTable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_intranet_IsExternal', 17, N'MG_772', 16, N'IsExternal must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_intranet_ReportServerDeploymentMode', 17, N'MG_82', 16, N'Report Server Deployment Mode should be Native Mode or SharePoint Integrated Mode.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_intranet_SMTPDeliveryMethod', 17, N'MG_1446', 16, N'This message is displayed when data entered for SMTPDeliveryMethod must be Pickup Directory From IIS, Network or Specified Pickup Directory.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_intranet_SMTPEnableSSL', 17, N'MG_772', 16, N'SMTPEnableSSL must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_intranet_Transport', 17, N'MG_1459', 16, N'The Transport must be H(HTTP/Internet Protocol) or J(ESB/Enterprise Service Bus).', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedTable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedTable_Processed', 17, N'MG_772', 16, N'Processed must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedTable_Shared', 17, N'MG_772', 16, N'Shared must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_Processed', 17, N'MG_772', 16, N'Processed must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_Shareable', 17, N'MG_772', 16, N'Shareable must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_Shared', 17, N'MG_772', 16, N'Shared must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTable_UpdateRefId', 17, N'MG_772', 16, N'UpdateRefId must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTableDefault_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTableDefault_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTableDefault_Shareable', 17, N'MG_772', 16, N'Shareable must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_IntranetSharedUserTableDefault_UpdateRefId', 17, N'MG_772', 16, N'UpdateRefId must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_OutriggerProfile_DatabaseType', 17, N'MG_1123', 16, N'This message is displayed when an invalid database type is entered.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_OutriggerProfile_QueryTimeout', 17, N'MG_1124', 16, N'This message is displayed if the query timeout is out of bounds.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_analytical_ledger', 17, N'MG_772', 16, N'analytical ledger must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_capitalize', 17, N'MG_772', 16, N'capitalize must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_default_ending_from_starting', 17, N'MG_772', 16, N'default ending from starting must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_ec_reporting', 17, N'MG_772', 16, N'ec reporting must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_emp_type', 17, N'MG_1448', 16, N'The emp type must be Agriculture, Household, Military, Medicare Qualified Government Employment, Regular or Railroad.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_enable_multiple_fsb', 17, N'MG_772', 16, N'enable multiple fsb must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_gl_print_post', 17, N'MG_772', 16, N'gl print post must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_hide_parent_grid_columns', 17, N'MG_772', 16, N'hide parent grid columns must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_name_code', 17, N'MG_82', 16, N'Name code should be Given Name First or Surname First.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_parm_key', 17, N'MG_69', 16, N'The parm key entered must be 0.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_post_jour', 17, N'MG_772', 16, N'post jour must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_print_name', 17, N'MG_772', 16, N'print name must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_rsvd1', 17, N'MG_772', 16, N'rsvd1 must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_rsvd2', 17, N'MG_772', 16, N'rsvd2 must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_secure_control_accounts', 17, N'MG_772', 16, N'secure control accounts must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_use_external_gl', 17, N'MG_772', 16, N'use external gl must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_parms_mst_use_widget_preferences', 17, N'MG_772', 16, N'use widget preferences must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_EnforceDigit', 17, N'MG_772', 16, N'EnforceDigit must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_EnforceMixCase', 17, N'MG_620', 16, N'Enforce Mix Case 0 or 1', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_EnforceNumUse', 17, N'MG_621', 16, N'Enforce Number Use 0 or 1', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_EnforceSpecialChar', 17, N'MG_622', 16, N'Enforce Special Character Use 0 or 1', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_InWorkflow', 17, N'MG_634', 16, N'Note exists flag 0 or 1.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_LockoutDuration', 17, N'MG_623', 16, N'Lockout duration positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_MinimumPasswordExpiration', 17, N'MG_777', 16, N'Minimum Password Expiration must be greater than or equal to 0.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_NoteExistsFlag', 17, N'MG_410', 16, N'Note exists flag 0 or 1.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_NumberOfRetries', 17, N'MG_625', 16, N'Number of Retries positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_ParmKey', 17, N'MG_626', 16, N'Parm Key must be 0.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordExpiration', 17, N'MG_777', 16, N'Password Expiration must be greater than or equal to 0.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordExpiration1', 17, N'MG_627', 16, N'Password Warning <= Expiration.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordExpiration2', 17, N'MG_1309', 16, N'Password Expiration Positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordHistoryCount', 17, N'MG_798', 16, N'Password history count', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordLengthMax', 17, N'MG_629', 16, N'Password max length.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordLengthMin', 17, N'MG_630', 16, N'Password min length positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordLengths', 17, N'MG_624', 16, N'Password min length <= max.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PasswordParameters_PasswordWarning', 17, N'MG_631', 16, N'Password warning positive.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Printer_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Printer_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Publication_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Publication_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationCategory_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationCategory_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationCategoryPublication_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationCategoryPublication_IsSystemRecord', 17, N'MG_772', 16, N'IsSystemRecord must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationCategoryPublication_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationSubscriber_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_PublicationSubscriber_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_QueuedEvent_mst_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_QueuedEvent_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_QueuedEvent_mst_Suspend', 17, N'MG_772', 16, N'Suspend must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_QueuedEventHandler_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_QueuedEventHandler_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_rep_object_category_object_type', 17, N'MG_1446', 16, N'The object type must be 1(Table), 2(SP) or 3(XML Document).', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_rep_object_category_retain_site', 17, N'MG_772', 16, N'retain site must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_rep_object_category_skip_method', 17, N'MG_772', 16, N'Skip method must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_rep_rule_disable_repl', 17, N'MG_772', 16, N'disable repl must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocAttribute_IncludeForNullValuedElement', 17, N'MG_772', 16, N'IncludeForNullValuedElement must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocAttribute_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocAttribute_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocAttribute_ValueSourceType', 17, N'MG_82', 16, N'Value Source Type should be Literal or PropertyTag.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocElement_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocElement_IsToLogicalId', 17, N'MG_772', 16, N'IsToLogicalId must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocElement_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocElement_ValueSourceType', 17, N'MG_1446', 16, N'This message is displayed when data entered for ValueSourceType must be Dynamic Subcollection, Literal or PropertyTag.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocInbound_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocInbound_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutbound_ActiveForManualRequest', 17, N'MG_772', 16, N'Active For Manual Request must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutbound_AppliesToIDOAction', 17, N'MG_1446', 16, N'Applies To IDO Action must be Invoke, LoadCollection or UpdateCollection.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutbound_EligibleForBackgroundManualRequest', 17, N'MG_772', 16, N'Eligible For Background Manual Request must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutbound_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutbound_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutboundFilter_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocOutboundFilter_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocument_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReplDocument_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReportOptions_mst_AutoView', 17, N'MG_772', 16, N'AutoView must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_ReportOptions_mst_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_site_link_info_disable_repl', 17, N'MG_772', 16, N'disable repl must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_site_type', 17, N'MG_82', 16, N'The type must be E(Entity) or S(Site).', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_StartupMethod_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_StartupMethod_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_active', 17, N'MG_772', 16, N'active must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_allow_record_assoc', 17, N'MG_772', 16, N'allow record assoc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_committed_active', 17, N'MG_772', 16, N'active must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_committed_allow_record_assoc', 17, N'MG_772', 16, N'allow record assoc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_committed_extend_all_recs', 17, N'MG_772', 16, N'extend all recs must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_committed_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_extend_all_recs', 17, N'MG_772', 16, N'extend all recs must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_impacted_active', 17, N'MG_772', 16, N'active must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_impacted_allow_record_assoc', 17, N'MG_772', 16, N'allow record assoc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_impacted_extend_all_recs', 17, N'MG_772', 16, N'extend all recs must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_table_class_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_update_all_columns', 17, N'MG_772', 16, N'update all columns must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_committed_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_committed_sys_has_fields', 17, N'MG_772', 16, N'sys has fields must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_committed_sys_has_tables', 17, N'MG_772', 16, N'sys has tables must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_fld_committed_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_fld_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_impacted_sys_has_fields', 17, N'MG_772', 16, N'sys has fields must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_impacted_sys_has_tables', 17, N'MG_772', 16, N'sys has tables must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_sys_has_fields', 17, N'MG_772', 16, N'sys has fields must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_class_sys_has_tables', 17, N'MG_772', 16, N'sys has tables must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_fld_committed_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_fld_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_committed_index_unique', 17, N'MG_772', 16, N'index unique must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_committed_index_word', 17, N'MG_772', 16, N'index word must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_committed_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_fld_committed_index_asc', 17, N'MG_772', 16, N'index asc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_fld_impacted_index_asc', 17, N'MG_772', 16, N'index asc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_fld_index_asc', 17, N'MG_772', 16, N'index asc must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_impacted_index_unique', 17, N'MG_772', 16, N'index unique must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_impacted_index_word', 17, N'MG_772', 16, N'index word must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_index_unique', 17, N'MG_772', 16, N'index unique must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_index_word', 17, N'MG_772', 16, N'index word must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_user_index_sys_delete', 17, N'MG_772', 16, N'sys delete must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserCalendar_DeleteAfterReminder', 17, N'MG_772', 16, N'DeleteAfterReminder must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserCalendar_EndTime', 17, N'MG_777', 16, N'Ending Time must be greater than or equal to Starting Time', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserCalendar_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserCalendar_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserCalendar_RemindDateTime', 17, N'MG_774', 16, N'Reminder Time must be less than or equal to Starting Time', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserEmail_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserEmail_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Usernames_PasswordNeverExpires', 17, N'MG_635', 16, N'Password never expires flag 0 or 1.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserNames_SendEmailNotifications', 17, N'MG_772', 16, N'SendEmailNotifications must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserNames_SendEmailPrompts', 17, N'MG_772', 16, N'SendEmailPrompts must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_Usernames_Status', 17, N'MG_632', 16, N'Valid Username Status values.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserNames_UseEmailReplyTo', 17, N'MG_772', 16, N'UseEmailReplyTo must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserPasswordHistory_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserPasswordHistory_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserTask_DeleteAfterReminder', 17, N'MG_772', 16, N'DeleteAfterReminder must be 0 or 1.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserTask_InWorkflow', 17, N'MG_634', 16, N'In workflow check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CK_UserTask_NoteExistsFlag', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesCk1', 17, N'MG_398', 16, N'This message is displayed when TABLE CHECK ''ClassNotesCk1'' constraint fails on table: ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesCk2', 17, N'MG_398', 16, N'This message is displayed when TABLE CHECK ''ClassNotesCk2'' constraint fails on table: ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesCk3', 17, N'MG_396', 16, N'This message is displayed when TABLE CHECK ''ClassNotesCk3'' constraint fails on table: ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk1', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk1'' constraint fails during INSERT or UPDATE of ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk1'' constraint fails during DELETE of NoteHeaders.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk2', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk2'' constraint fails during INSERT or UPDATE of ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk2', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk2'' constraint fails during DELETE of NoteTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk3', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk3'' constraint fails during INSERT or UPDATE of ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk3', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk3'' constraint fails during DELETE of SystemNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk4', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk4'' constraint fails during INSERT or UPDATE of ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesFk4', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ClassNotesFk4'' constraint fails during DELETE of UserNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''ClassNotesIx0'' constraint fails on ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ClassNotesIx2', 17, N'MG_386', 16, N'This message is displayed when UNIQUE ''ClassNotesIx2'' constraint fails on ClassNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'CnsNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''CnsNoteExistsFlag'' constraint fails on table: ClassNotes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ConnectionInformationIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'COR_INBOX_HEADERS_FK1', 17, N'MG_369', 16, N'This message is displayed when <C_INBOX_ID> is/are updated on a(n) Core Inbox Headers to a value that does not exist in any Core Inbox Entry', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'COR_INBOX_HEADERS_FK1', 18, N'MG_404', 16, N'This message is displayed when Core Inbox Entry exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'COR_OUTBOX_HEADERS_FK1', 17, N'MG_369', 16, N'This message is displayed when <C_OUTBOX_ID> is/are updated on a(n) Core Outbox Headers to a value that does not exist in any Core Outbox Entry', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'COR_OUTBOX_HEADERS_FK1', 18, N'MG_404', 16, N'This message is displayed when Core Outbox Entry exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DefaultType', 8, N'MG_369', 16, N'This message is displayed when an invalid Default Type is selected.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DefaultTypes', 7, N'MG_373', 16, N'This message is displayed when delete of system Default Types fails.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DefaultTypesIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''DefaultTypesIx1'' constraint fails on DefaultTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DefaultTypesRcx', 17, N'MG_383', 16, N'This message is displayed when Default Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DetAllowUserDfltFlagCk1', 17, N'MG_394', 16, N'This message is displayed when COLUMN CHECK ''DetAllowUserDfltFlagCk1'' constraint fails on table: DefaultTypes, column: AllowUserDfltFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DetDefaultTypeCk1', 17, N'MG_411', 16, N'This message is displayed when COLUMN CHECK ''DetDefaultTypeCk1'' constraint fails on table: DefaultTypes, column: DefaultType.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'DetNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''DetNoteExistsFlagCk1'' constraint fails on table: DefaultTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E_FRM_APP_LOCK_CANCELLED', 5, N'MG_761', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E_FRM_APP_LOCK_DEADLOCK', 5, N'MG_762', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E_FRM_APP_LOCK_INVALID_PARM', 5, N'MG_763', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E_FRM_APP_LOCK_TIMEOUT', 5, N'MG_760', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E_FRM_RECORD_NOT_FOUND', 5, N'MG_683', 16, N'Generic record not found message.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=#MustExist0', 5, N'MG_10', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=AppLockFail1', 5, N'MG_879', 16, N'Lock request timed out', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=AppLockFail2', 5, N'MG_880', 16, N'Lock request was cancelled', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=AppLockFail3', 5, N'MG_881', 16, N'Lock request was chosen as a deadlock victim', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=AppLockFail999', 5, N'MG_882', 16, N'Parameter validation or other call error', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed', 5, N'MG_11', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed0', 5, N'MG_12', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed1', 5, N'MG_13', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed2', 5, N'MG_14', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed3', 5, N'MG_15', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdFailed4', 5, N'MG_16', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdInvalid', 5, N'MG_17', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdInvalid0', 5, N'MG_18', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdInvalid1', 5, N'MG_19', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdInvalid2', 5, N'MG_20', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=CmdInvalid3', 5, N'MG_21', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=DBNoConnect', 5, N'MG_22', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ErrorInField', 5, N'MG_23', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=EventInfiniteWait', 5, N'MG_659', 16, N'Inifnite wait in event handling.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist1', 5, N'MG_24', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist2', 5, N'MG_25', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist3', 5, N'MG_26', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist4', 5, N'MG_27', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist5', 5, N'MG_28', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Exist6', 5, N'MG_29', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistEvery2', 5, N'MG_30', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistFor', 5, N'MG_31', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistFor>', 5, N'MG_32', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIs1', 5, N'MG_33', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIs2', 5, N'MG_34', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIsAndIs0', 5, N'MG_808', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIsAndIs1', 5, N'MG_35', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIsAndIs3', 5, N'MG_36', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForIsAndIsAndIs', 5, N'MG_37', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForNot', 5, N'MG_38', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ExistForTypeNot', 5, N'MG_39', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FailureFunctionGetXactState', 5, N'MG_878', 16, N'Failure in function dbo.GetXactState()', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FormatsExceeded', 5, N'MG_40', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FormNoWhenIntranetLicensing', 5, N'MG_674', 16, N'Form disallowed when intranet licensing used.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_ALREADY_IMPERSONATING', 5, N'MG_596', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_BASE_TABLE_UPDATE_FAILED', 5, N'MG_700', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_BEGIN_TRANS', 5, N'MG_597', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CANT_POST_INPROC_WORKFLOW', 5, N'MG_581', 16, N'SymixOle Error - Post Inproc Workflow', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CHECKING_LICENSING', 5, N'MG_591', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_COMMIT_NAMED_TXN', 5, N'MG_585', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_COMMIT_TRANS', 5, N'MG_598', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CONCURRENT_LOGIN_LIMIT', 5, N'MG_595', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CREATE_IDODBCONNECTION', 5, N'MG_574', 16, N'SymixOle Error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CREATE_NAMED_TXN', 5, N'MG_602', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CUSTOM_LOAD_METHOD_INVALID_RESULT', 5, N'MG_821', 16, N'Custom load method returned an invalid result', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CUSTOM_LOAD_METHOD_MAY_NOT_BE_INVOKED_DIRECTLY', 5, N'MG_828', 16, N'Method is a custom load method and my not be invoked directly.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CUSTOM_LOAD_METHOD_NO_RESULT', 5, N'MG_836', 16, N'Custom load method did not return a result set', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_CUSTOM_SAVE_FAILED', 5, N'MG_636', 16, N'IDO runtime message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_EXEC_POST_QUERY_METHOD_PARAM_NOT_FOUND', 5, N'MG_834', 16, N'Error executing post query method: parameter not found', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_IDO_MISSING_PROPERTY', 1, N'MG_682', 16, N'IDO missing property message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_IDO_MISSING_PROPERTY', 5, N'MG_823', 16, N'Property not found in the result set', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_IDO_PROPERTY_NOT_VALID', 5, N'MG_822', 16, N'Property not valid for an IDO', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INCORRECT_OLD_PASSWORD', 5, N'MG_799', 16, N'The current password during a password change is wrong.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INCORRECT_PASSWORD', 5, N'MG_589', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INSERT_FAILED', 5, N'MG_701', 16, N'Application Base Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_IDO_NAME', 1, N'MG_681', 16, N'Invalid IDO name message.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_IDO_SAVE_MULTIPLE_RECS', 5, N'MG_576', 16, N'IDO runtime message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_INTRINSIC_METHOD', 5, N'MG_819', 16, N'Invalid intrinsic method', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_ORDER_BY', 5, N'MG_577', 16, N'SymixOle Error - Order By', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_POST_QUERY_SPEC', 5, N'MG_818', 16, N'Invalid post query specification', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_POST_QUERY_SPEC_AT_POS', 5, N'MG_817', 16, N'Invalid post query specification with position', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVALID_PROPERTY_NAME_IN_CUSTOM_UPDATE', 5, N'MG_824', 16, N'Invalid property name in custom update method', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_INVOKING_METHOD_EXT_CLASS_NOT_FOUND', 5, N'MG_830', 16, N'Error invoking method.  Extension class for IDO not found', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_LOADING_USER_PRIVILEGES', 5, N'MG_593', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_METHOD_IN_CUSTOM_UPDATE_DOES_NOT_EXIST', 5, N'MG_826', 16, N'Method in custom update does not exist', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_METHOD_MAY_NOT_BE_SPECIFIED_AS_CUSTOM_LOAD_M', 5, N'MG_829', 16, N'Method may not be specified as a custom load method', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_METHOD_NOT_FOUND', 5, N'MG_827', 16, N'Method not found', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_MQ_NOT_INSTALLED', 5, N'MG_578', 16, N'SymixOle error - Message Queue support not installed', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_NAMED_TXN_NOT_FOUND', 5, N'MG_586', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_OBJECT_NOT_LICENSED', 5, N'MG_590', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_OPEN_DB_CONNECTION_FAILED', 5, N'MG_601', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_OPTIMISTIC_LOCK_FAIL_DELETE', 5, N'MG_573', 16, N'Optimistic Lock - delete error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_OPTIMISTIC_LOCK_FAIL_UPDATE', 5, N'MG_572', 16, N'Optimistic lock - Update error.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_POST_QUERY_METHOD_FAILED', 5, N'MG_833', 16, N'Post query method failed', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_POST_TO_WORKFLOW', 5, N'MG_579', 16, N'SymixOle Error - Workflow post', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_PRIVILEGE_NOT_GRANTED', 5, N'MG_580', 16, N'SymixOle.dll - IDO privilege error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_PROPERTY_IN_CUSTOM_UPDATE_NOT_INCLUDED', 5, N'MG_825', 16, N'Property in custom update method was not included in update request', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_REFRESH_MISSING_KEYS', 5, N'MG_575', 16, N'SymixOle Error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_REFRESH_MULTIPLE_RECORDS', 5, N'MG_576', 16, N'SymixOle Refresh Record error', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_REFRESH_UPDATE_IDO_MAY_CONTAIN_ERRORS', 5, N'MG_832', 16, N'Error refreshing update item. The IDO definition may contain errors', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_REFRESH_UPDATE_KEY_PROPERTY_NOT_FOUND', 5, N'MG_831', 16, N'Error refreshing update item by keys.  Key property not found', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_ROLLBACK_NAMED_TXN', 5, N'MG_587', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_ROLLBACK_TRANS', 5, N'MG_599', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_SESSION_COUNT_LIMIT', 5, N'MG_600', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_UNABLE_TO_SAVE_USER_DEF_FIELD_PROPERTY_NOT_F', 5, N'MG_835', 16, N'Unable to save User Defined Fields: row ID (RowPointer) property was not found', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_UNKNOWN_CHECKING_LICENSING', 5, N'MG_592', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_UNKNOWN_LOADING_USER_PRIVILEGES', 5, N'MG_594', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=FRM_USER_NOT_FOUND', 5, N'MG_588', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IDOAlreadyExists', 5, N'MG_875', 16, N'IDO already exists', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IntranetShared1', 5, N'MG_1126', 16, N'Site sharing error', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Invalid', 5, N'MG_41', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Invalid2', 5, N'MG_1115', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Invalid22', 5, N'MG_1471', 16, N'Invalid data.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Invalid5', 5, N'MG_42', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=InvalidChar', 5, N'MG_43', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=InvalidUpdateWhen', 5, N'MG_1468', 16, N'Next keys update when validation.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=InvalidUsingWithWhere2', 5, N'MG_1134', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCancelled', 5, N'MG_688', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCheckedOut', 5, N'MG_686', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCheckeOut', 5, N'MG_686', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare', 5, N'MG_44', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare<>', 5, N'MG_45', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare<>1', 5, N'MG_46', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare<>2', 5, N'MG_47', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare>1', 5, N'MG_48', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare>2', 5, N'MG_49', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare>3', 5, N'MG_50', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare>4', 5, N'MG_51', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare>Not1', 5, N'MG_52', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare0', 5, N'MG_53', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare1', 5, N'MG_54', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare2', 5, N'MG_55', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare3', 5, N'MG_56', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompare4', 5, N'MG_57', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareBefore1', 5, N'MG_58', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareCantSet3', 5, N'MG_59', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareCantSet4', 5, N'MG_60', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareListNot1', 5, N'MG_61', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareNot1', 5, N'MG_62', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsCompareSumFor1', 5, N'MG_63', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsInvalidFor', 5, N'MG_64', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=IsNotCheckedOut', 5, N'MG_1313', 16, N'Not checked out', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=LicensedUsersExceeded2', 5, N'MG_65', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MaximumDurationExceeded1', 5, N'MG_707', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MayNotDeleteSystemDefined1', 5, N'MG_373', 16, N'May not delete system defined <whatever>', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ModuleUsersMustBeRemoved2', 5, N'MG_66', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Msg', 5, N'MG_67', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustBetween', 5, N'MG_68', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare', 5, N'MG_69', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare<', 5, N'MG_70', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare=', 5, N'MG_71', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare=1', 5, N'MG_72', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare=2', 5, N'MG_73', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare=3', 5, N'MG_74', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare=4', 5, N'MG_75', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare>', 5, N'MG_76', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare>0', 5, N'MG_77', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare0', 5, N'MG_78', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare1', 5, N'MG_79', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompare2', 5, N'MG_80', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompareBefore1', 5, N'MG_81', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompareIsOrIs', 5, N'MG_82', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompareList', 5, N'MG_83', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustCompareListSum', 5, N'MG_84', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustExistFor0', 5, N'MG_85', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustExistIs', 5, N'MG_86', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustExistIsList', 5, N'MG_87', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustMultiple', 5, N'MG_88', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=MustNotBetween', 5, N'MG_89', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NewFormLicenseInvalid', 5, N'MG_658', 16, N'A base licensing message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NextKeyLength', 5, N'MG_1472', 16, N'Invalid data.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NextKeyPregenerator', 5, N'MG_1478', 16, N'Upgrade error', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NextKeyValidator1', 5, N'MG_1473', 16, N'Invalid data.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NextKeyValidator2', 5, N'MG_1474', 16, N'Invalid data.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NextKeyValidator3', 5, N'MG_1475', 16, N'Invalid data.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoChange1', 5, N'MG_90', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoChange2', 5, N'MG_91', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare', 5, N'MG_92', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare<', 5, N'MG_93', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare=', 5, N'MG_94', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare=1', 5, N'MG_95', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare=2', 5, N'MG_96', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare=3', 5, N'MG_97', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare=4', 5, N'MG_98', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare>', 5, N'MG_99', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare>1', 5, N'MG_100', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare>2', 5, N'MG_101', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare0', 5, N'MG_102', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare1', 5, N'MG_103', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare2', 5, N'MG_104', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare3', 5, N'MG_105', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompare4', 5, N'MG_106', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCompareLen>', 5, N'MG_107', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreate', 5, N'MG_108', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreate0', 5, N'MG_109', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreate1', 5, N'MG_110', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreate3', 5, N'MG_111', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreateFor1', 5, N'MG_112', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoCreateIs0', 5, N'MG_113', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoDeleteForIs', 5, N'MG_801', 16, N'This is a base message for substitutions.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExist0', 5, N'MG_114', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExist1', 5, N'MG_115', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExist2', 5, N'MG_116', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExist3', 5, N'MG_117', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExist4', 5, N'MG_118', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistFor0', 5, N'MG_119', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistFor1', 5, N'MG_120', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistFor2', 5, N'MG_121', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistFor3', 5, N'MG_122', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistFor4', 5, N'MG_123', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForAfter2', 5, N'MG_124', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIs', 5, N'MG_125', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIs1', 5, N'MG_126', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIs2', 5, N'MG_127', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIs3', 5, N'MG_128', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIs4', 5, N'MG_129', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIsAndIs1', 5, N'MG_130', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIsAndIsAndIs1', 5, N'MG_131', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForIsAndIsAndMatches', 5, N'MG_132', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForNotAfter', 5, N'MG_133', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForNotAfter2', 5, N'MG_134', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistForWhere1AndForWhere1', 5, N'MG_749', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistIs', 5, N'MG_135', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistIs0', 5, N'MG_136', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistIs1', 5, N'MG_137', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistIs2', 5, N'MG_138', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistIs3', 5, N'MG_139', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoExistOr1', 5, N'MG_807', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoFunct', 5, N'MG_140', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoRecursive', 5, N'MG_141', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoRemove1', 5, N'MG_142', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoRemove2', 5, N'MG_143', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoRemove3', 5, N'MG_144', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NoRowsDefinedForNewDataMaintenanceToProcess', 5, N'MG_873', 16, N'No rows defined for New Data Maintenance to process.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=NotUsedIn', 5, N'MG_145', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=OSInvalid', 5, N'MG_146', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=OtherProgramStop', 5, N'MG_147', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=PasswordHistory', 5, N'MG_797', 16, N'Password history error', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=PasswordMinimumAge', 5, N'MG_1310', 16, N'Minimum age', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=PrintPreviewCancelled', 5, N'MG_148', 16, N'Text Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Recursive1', 5, N'MG_149', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=RemFirstLast', 5, N'MG_150', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Remove0', 5, N'MG_151', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=Remove1', 5, N'MG_152', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ReportsToSiteSameAsSite', 5, N'MG_153', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SessionDeleted', 5, N'MG_154', 16, N'Error raised by InitSessionSp if a user''s session is deleted', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=ShouldCompare', 5, N'MG_155', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SiteCmdFailed', 5, N'MG_156', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SiteExist1', 5, N'MG_157', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SiteNoExist1', 5, N'MG_158', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SiteNotBetween', 5, N'MG_159', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=SiteNotFound', 5, N'MG_1125', 16, N'Invalid site from a configuration.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TableAliasInvalidInvalidCharacters', 5, N'MG_872', 16, N'Database table alias [&1] is invalid because it contains one or more invalid characters.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TableAliasInvalidSQLKeyword', 5, N'MG_871', 16, N'Database table alias [&1] is invalid because it is a reserved SQL keyword.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TableAlreadyExists', 5, N'MG_874', 16, N'Table already exists', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TableAndIDOCreated', 5, N'MG_876', 16, N'Table and IDO created', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TaskAlreadyRunningPreventTaskFromBeingRun', 5, N'MG_1114', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'E=TransMustBeInEffectToCall', 5, N'MG_877', 16, N'Transaction must be in effect to call &1', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_DocumentObject_DocumentType', 17, N'MG_369', 16, N'Document Type', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_DocumentObject_DocumentType', 18, N'MG_392', 16, N'DocumentObjectFK1 constraint failure on delete.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_DocumentObjectReference_DocumentRowPointer', 17, N'MG_369', 16, N'Document Row does not exist', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_DocumentObjectReference_DocumentRowPointer', 18, N'MG_392', 16, N'Can''t delete document because it is referenced.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_EmailTemplate_mst_EmailTemplate_mst', 17, N'MG_857', 16, N'This message is displayed when <TemplateName, FormName, SiteRef> is/are updated on a(n) Base message [@EmailTemplate] is not defined. to a value that does not exist in any Base message [@EmailTemplate] is not defined.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_EmailTemplate_mst_EmailTemplate_mst', 18, N'MG_407', 16, N'This message is displayed when Base message [@EmailTemplate] is not defined. exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_EventDocumentObject_DocumentType', 17, N'MG_369', 16, N'This message is displayed when <DocumentType> is/are updated on a(n) Event Document to a value that does not exist in any Document Type', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_EventDocumentObject_DocumentType', 18, N'MG_404', 16, N'This message is displayed when Document Type exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 17, N'MG_372', 16, N'Ido Linked Database, Table', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 18, N'MG_405', 16, N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName constraint failure on delete.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_IdoLinkedTable_IdoLinkDatabase', 17, N'MG_369', 16, N'Ido Link Database', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_IdoLinkedTable_IdoLinkDatabase', 18, N'MG_392', 16, N'Foreign Key IdoLinkedTable_IdoLinkDatabase constraint failure on delete.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_parms_mst_site', 17, N'MG_369', 16, N'This message is displayed when <site> is/are updated on a(n) General Parameters to a value that does not exist in any Site', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_parms_mst_site', 18, N'MG_404', 16, N'This message is displayed when Site exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_ReportOptions_mst_PrinterName', 17, N'MG_369', 16, N'This message is displayed when <PrinterName> is/are updated on a(n) Base message [@ReportOptions] is not defined. to a value that does not exist in any Printer', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_ReportOptions_mst_PrinterName', 18, N'MG_404', 16, N'This message is displayed when Printer exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_SearchPreferenceList_SearchItemName', 17, N'MG_369', 16, N'This message is displayed when <SearchItemName> is/are updated on a(n) Search Preference List to a value that does not exist in any Search Item', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'FK_SearchPreferenceList_SearchItemName', 18, N'MG_392', 16, N'Search Item cannot be deleted', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GroupName', 8, N'MG_369', 16, N'This message is displayed when an invalid Group Name is entered.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GroupNamesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''GroupNamesIx0'' constraint fails on GroupId.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'GroupNamesIx2', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''GroupNamesIx2'' constraint fails on GroupName.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Changed', 5, N'MG_160', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Created', 5, N'MG_161', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Delete', 5, N'MG_162', 0, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Detected', 5, N'MG_163', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Displayed', 5, N'MG_164', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Invalid', 5, N'MG_165', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Partial', 5, N'MG_166', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Partial2', 5, N'MG_167', 0, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Post', 5, N'MG_168', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Processed', 5, N'MG_169', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Removed', 5, N'MG_170', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=#Selected', 5, N'MG_171', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Adjust', 5, N'MG_172', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=AdjustFor1', 5, N'MG_173', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Changed', 5, N'MG_174', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Changed0', 5, N'MG_175', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdInvalid', 5, N'MG_176', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdMustPerform', 5, N'MG_177', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdPerform', 5, N'MG_178', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdPerformed', 5, N'MG_179', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdShouldPerform', 5, N'MG_180', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdSucceeded', 5, N'MG_181', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdSucceeded1', 5, N'MG_182', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdSucceeded2', 5, N'MG_183', 0, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=CmdSucceeded3', 5, N'MG_184', 0, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ContactSysAdmin', 5, N'MG_185', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Distributed', 5, N'MG_186', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Enter1', 5, N'MG_187', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist0', 5, N'MG_188', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist1', 5, N'MG_189', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist2', 5, N'MG_190', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist3', 5, N'MG_191', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist4', 5, N'MG_192', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Exist5', 5, N'MG_193', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor', 5, N'MG_194', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor<>', 5, N'MG_195', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor<>0', 5, N'MG_196', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor<1', 5, N'MG_197', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor=', 5, N'MG_198', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor=1', 5, N'MG_199', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor0', 5, N'MG_200', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistFor1', 5, N'MG_201', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForAmbig0', 5, N'MG_202', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForAmbigIs0', 5, N'MG_203', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIs', 5, N'MG_204', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIs0', 5, N'MG_205', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIs1', 5, N'MG_206', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIs2', 5, N'MG_207', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIsAndIs', 5, N'MG_208', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIsAndIsAndIs', 5, N'MG_209', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForIsNot', 5, N'MG_210', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForList1', 5, N'MG_211', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ExistForNot', 5, N'MG_212', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=FirstFor1', 5, N'MG_213', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=FirstFor2', 5, N'MG_214', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=InfoChanged', 5, N'MG_215', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare', 5, N'MG_216', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<', 5, N'MG_217', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<>', 5, N'MG_218', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<>1', 5, N'MG_219', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<>2', 5, N'MG_220', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<>3', 5, N'MG_221', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<>4', 5, N'MG_222', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<1', 5, N'MG_223', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<2', 5, N'MG_224', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare<3', 5, N'MG_225', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=', 5, N'MG_226', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=0', 5, N'MG_227', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=1', 5, N'MG_228', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=2', 5, N'MG_229', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=3', 5, N'MG_230', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=4', 5, N'MG_231', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare=ForBetween1', 5, N'MG_232', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare>', 5, N'MG_233', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare>1', 5, N'MG_234', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare0', 5, N'MG_235', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare1', 5, N'MG_236', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare2', 5, N'MG_237', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare3', 5, N'MG_238', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompare4', 5, N'MG_239', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareAfter0', 5, N'MG_240', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareFirst0', 5, N'MG_241', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareIsAndIs1', 5, N'MG_242', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareLast0', 5, N'MG_243', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareListNot', 5, N'MG_244', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareListNot1', 5, N'MG_245', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot', 5, N'MG_246', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot*', 5, N'MG_247', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot0', 5, N'MG_248', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot1', 5, N'MG_249', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot2', 5, N'MG_250', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareNot3', 5, N'MG_251', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareWillSet0', 5, N'MG_252', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareWillSet2', 5, N'MG_253', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=IsCompareWillSet3', 5, N'MG_254', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=Locked', 5, N'MG_255', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ManyExistIs', 5, N'MG_256', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=MayCompare', 5, N'MG_257', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=MayCompareList', 5, N'MG_258', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=MustInstall', 5, N'MG_259', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoChange3', 5, N'MG_260', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExist0', 5, N'MG_261', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExist1', 5, N'MG_262', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExist2', 5, N'MG_263', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExist3', 5, N'MG_264', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExist4', 5, N'MG_265', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor', 5, N'MG_266', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor>', 5, N'MG_267', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor>1', 5, N'MG_268', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor0', 5, N'MG_269', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor1', 5, N'MG_270', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor2', 5, N'MG_271', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistFor3', 5, N'MG_272', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForBetween', 5, N'MG_273', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForIs2', 5, N'MG_274', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForIs3', 5, N'MG_275', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForIsAndIs', 5, N'MG_276', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForIsOrIs1', 5, N'MG_277', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistForNotAfter1', 5, N'MG_278', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NoExistIs', 5, N'MG_279', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=NotEqual', 5, N'MG_280', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ReportSubmitted', 5, N'MG_281', 0, N'Text Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SiteIsCompare0', 5, N'MG_282', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SiteIsCompare1', 5, N'MG_283', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SiteNoExist1', 5, N'MG_284', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SiteNoExist2', 5, N'MG_285', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SiteNoExist3', 5, N'MG_286', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=SSIntegrationOff', 5, N'MG_695', 0, N'Displayed when SS integration is off upon check-in.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=TableName', 5, N'MG_1469', 16, N'Informational table name', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=ValuesOverridden', 5, N'MG_287', 0, N'Text Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WasCompareIsSet', 5, N'MG_288', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WasCompareIsSet=2', 5, N'MG_289', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WillNotSet', 5, N'MG_290', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WillNotSet1', 5, N'MG_291', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WillSet0', 5, N'MG_292', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'I=WillSet1', 5, N'MG_293', 0, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IDOAliasesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''IDOAliasesIx0'' constraint fails on IDOAliases.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IdoCollectionExtendsValidSp', 5, N'MG_779', 16, N'The leaf node of an IDO replacement chain is given.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IDORestrictDeleteGeneric', 5, N'MG_848', 16, N'Delete not allowed because of IDO Restrict delete rule', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IDORestrictDeleteGeneric2', 5, N'MG_849', 16, N'Delete not allowed because of IDO Restrict delete rule', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_a1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@a1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_a2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@a2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aa1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aa1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aaCo2s_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aaCo2s] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aaCo3s_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aaCo3s] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aaCo4s_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aaCo4s] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aaCoItems_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aaCoItems] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_aaCos_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@aaCos] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AaInvoices_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@AaInvoices] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AaPayments_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@AaPayments] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AbcInvoices_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@AbcInvoices] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AccountAuthorizations_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Account Authorizations is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ActiveBGTasks_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Active Background Tasks is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AppColumn_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Application Schema Columns Metadata is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ApplicationMessages_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Application Messages is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AppModule_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Application Schema Modules Metadata is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AppTable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Application Schema Tables Metadata is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AppView_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@AppView] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_AuditLog_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Audit Log is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_BGTaskHistory_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Background Task History is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_BODTemplate_RowPointer', 17, N'MG_383', 16, N'This message is displayed when BOD Template is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_BPProduct_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Business Partner Product is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_BrandKit_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@BrandKit] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbNDMW_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbNDMW] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW10_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW10] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW4_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW4] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW5_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW5] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW6_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW6] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW7_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW7] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_cbTestNDMW8_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@cbTestNDMW8] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ClassNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Class Notes is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ConfigParms_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Configuration Parameters is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ConnectionInformation_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Connection Information is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_COR_INBOX_ENTRY_RowPointer', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''IX_COR_INBOX_ENTRY_RowPointer'' constraint fails on RowPointer..', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_COR_INBOX_HEADERS_RowPointer', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''IX_COR_INBOX_HEADERS_RowPointer'' constraint fails on RowPointer..', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_COR_OUTBOX_ENTRY_RowPointer', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''IX_COR_OUTBOX_ENTRY_RowPointer'' constraint fails on RowPointer..', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_COR_OUTBOX_HEADERS_RowPointer', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''IX_COR_OUTBOX_HEADERS_RowPointer'' constraint fails on RowPointer..', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_COR_PROPERTY_RowPointer', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''IX_COR_PROPERTY_RowPointer'' constraint fails on RowPointer..', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreEmpAddrHAA_mst_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreEmpAddrHAA] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAAEmployee_mst_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAAEmployee] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAAndmw1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAAndmw1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAAndmw2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAAndmw2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAATBL1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAATBL1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAATBL2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAATBL2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAATbltest3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAATbltest3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAATEST_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAATEST] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CoreHAATEST2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@CoreHAATEST2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_CountryPack_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Country Pack is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Customer3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Customer3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Customer88_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Customer88] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Customer91_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Customer91] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Customers_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Customers] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DBStatus_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Database Status is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRManualCreate_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRManualCreate] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM10_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM10] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM11_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM11] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM12_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM12] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM13_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM13] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM14_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM14] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM15_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM15] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM16_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM16] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM17_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM17] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM18_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM18] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM7_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM7] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM8_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM8] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM8s_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM8s] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DDRTestNDM9_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DDRTestNDM9] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DefineVariables_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DefineVariables] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DemoOrders_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@DemoOrders] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DocumentObject_RowPointer', 17, N'MG_383', 16, N'Rowpointer', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DocumentObjectReference_RowPointer', 17, N'MG_383', 16, N'Rowpointer unique', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DocumentObjectReference_TableName_RowPointer_Re', 17, N'MG_385', 16, N'unique index', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, N'MG_385', 16, N'This message is displayed when Attached Document is inserted/updated with values of TableName, TableRowPointer, RefSequence already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_DocumentType_RowPointer', 17, N'MG_383', 16, N'RowPointer unique', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EmailTemplate_mst_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@EmailTemplate] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EmailType_RowPointer', 17, N'MG_383', 16, N'This message is displayed when E-mail Type is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ESB_INBOUND_DUPLICATE_RowPointer', 17, N'MG_383', 16, N'This message is displayed when ESB Inbound Duplicate is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ESB_PREVIOUS_VERSION_MEDIATION_RowPointer', 17, N'MG_383', 16, N'This message is displayed when ESB Previous Version Mediation is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ESB_VARIATION_ID_MEDIATION_RowPointer', 17, N'MG_383', 16, N'This message is displayed when ESB Variation ID Mediation is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Event_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventAction_EventHandler_Sequence', 17, N'MG_384', 16, N'This message is displayed when Event Action is inserted/updated with values of EventHandlerRowPointer, Sequence already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventActionState_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Action State is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventActionVariableAccess_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Action Variable Access is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventDocument_EventStateId_AttachmentName', 17, N'MG_384', 16, N'This message is displayed when Attached Document is inserted/updated with values of EventStateId, AttachmentName already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventDocument_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Attached Document is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventDocumentObject_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Document is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventGlobalConstant_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Event Global Constant is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventHandler_Event_Sequence', 17, N'MG_384', 16, N'Displayed when UNIQUE ''IX_EventHandler_Event_Sequencer'' constraint fails', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventHandlerRevision_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Handler Revision is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventHandlerState_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Handler State is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventInitialState_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Initial State is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventInitialVariable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Initial Variable is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventInputParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Input Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventMessageCategory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Message Category is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventMessageVariable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Message Variable is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventOutputParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Output Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventQueue_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Event Queue is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventRevision_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Revision is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventSessionTally_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@EventSessionTally] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventStateGroup_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event State Group is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventTrigger_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Event Trigger is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventTriggerParameter_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Event Trigger Parameter is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_EventVariable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Event Variable is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ExtendableProc_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@ExtendableStoredProcedure] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ExternalDataStore_RowPointer', 17, N'MG_383', 16, N'This message is displayed when External Data Store is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_FileServer_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@FileServer] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Galactic_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Galactic] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMTest_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMTest] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMTest2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMTest2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMTest3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMTest3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMTest4_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMTest4] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMWpfTest_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMWpfTest] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GMWpfTesting_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@GMWpfTesting] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_GroupNames_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Group Names is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HAACLASSTEST_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HAACLASSTEST] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HAAIdoProjects_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HAAIdoProjects] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HAATBL_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HAATBL] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HAATEST_1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HAATEST_1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HelloUniverse_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HelloUniverse] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_HelloWorld2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@HelloWorld2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IdoLinkedColumn_RowPointer', 17, N'MG_383', 16, N'This message is displayed when IDO Linked Column is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IdoLinkedColumn_ViewColumnName', 17, N'MG_385', 16, N'This message is displayed when IDO Linked Column is inserted/updated with values of IdoLinkDatabase, TableName, ViewColumnName already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IdoLinkedDatabase_RowPointer', 17, N'MG_383', 16, N'Rowpointer', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IdoLinkedTable_RowPointer', 17, N'MG_383', 16, N'Rowpointer', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IdoLinkedTable_View', 17, N'MG_383', 16, N'View', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_intranet_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Intranet is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IntranetSharedTable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Intranet Shared Table is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IntranetSharedUserTable_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Intranet Shared User Table is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_IntranetSharedUserTableDefault_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Intranet Shared User Table Default is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Issue_179366_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Issue_179366] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Issue_182753_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Issue_182753] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Issue149806_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Issue149806] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_jc_Test2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@jc_Test2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_jc_UserLangTests_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@jc_UserLangTests] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_LanguageIDs_LanguageCode', 17, N'MG_383', 16, N'This message is displayed when Language IDs is inserted/updated with values of LanguageCode already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_LanguageIDs_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Language IDs is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_LongRowPointerMap_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Long Row Pointer Map is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_MCB_Test100_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@MCB_Test100] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbColLengthTest_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbColLengthTest] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbColLengthTest2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbColLengthTest2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbColLengthTest3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbColLengthTest3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbOrderDetails301_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbOrderDetails301] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbOrdertest300_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbOrdertest300] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbOrdertest3002_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbOrdertest3002] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbOrdertest301_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbOrdertest301] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest101_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest101] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest101Split_mst_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest101Split] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest102_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest102] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest200_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest200] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest206_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest206] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mcbTest555_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mcbTest555] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_me_Test1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@me_Test1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Members1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@Members1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_MGBUSDocuments_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@MGBUSDocuments] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_MGDataSourceMaps_RowPointer', 17, N'MG_383', 16, N'This message is displayed when MG Data Source Maps is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_MGDataSources_RowPointer', 17, N'MG_383', 16, N'This message is displayed when MG Data Sources is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ModuleMembers_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Module Members is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Modules_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Modules is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_mptest9_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@mptest9] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_MyNewTestForm_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@MyNewTestForm] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_NewColumnStaging_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@NewColumnStaging] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_NoteHeaders_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Note Headers is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_NotesSiteMap_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Notes Site Map is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ObjectNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@ObjectNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ObjSE_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Base message [@ObjectSentEmail] is not defined. is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_OutriggerProfile_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@OutriggerProfile] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_OutriggerProfileOptions_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@OutriggerProfileOptions] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_PasswordParameters_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Password Parameters is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_PK_Test_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@PK_Test] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Printer_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Printer is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ProcessErrorLog', 17, N'MG_384', 16, N'This message is displayed when Process Error Log is inserted/updated with values of ProcessID, LineNum already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ProcessLineNumbers_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Process Line Numbers is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ProductPatches_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@ProductPatches] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ProductVersion_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Product Version is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_Publication_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Publication is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_PublicationCategory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Publication Category is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_PublicationCategoryPublication_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Publication Category Publication is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, N'MG_387', 16, N'This message is displayed when Publication Subscriber is inserted/updated with values of PublicationName, Username, Email, KeyValue, KeyValue2 already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rep_category_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Replication Category is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rep_object_category_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Replication Category Object is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rep_rule_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Replication Rule is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocAttribute_DocumentName', 17, N'MG_385', 16, N'This message is displayed when Replication Document Attributes is inserted/updated with values of DocumentName, ElementRowPointer, AttributeName already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocInbound_BODNoun', 17, N'MG_384', 16, N'This message is displayed when Replication Document Inbound is inserted/updated with values of BODNoun, BODVerb already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocOutbound_AppliesToIDOName', 17, N'MG_386', 16, N'This message is displayed when Replication Document Outbound Cross-Reference is inserted/updated with values of AppliesToIDOName, AppliesToIDOMethodName, AppliesToIDOAction, intranet_name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocOutboundFilter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Replication Document Outbound Filter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocument_AppliesToIDOName', 17, N'MG_385', 16, N'This message is displayed when UNIQUE ''IX_ReplDocument_AppliesToIDOName'' constraint fails on ReplDocument.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplDocument_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Replication Document is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplicatedRows3_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Replicated Rows 3 is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReplicatedRowsErrors_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Replicated Rows Errors is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReportOptions_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Base message [@ReportOptions] is not defined. is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ReusableNotesToSite_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Reusable Notes To Site is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rpt_opt', 17, N'MG_385', 16, N'This message is displayed when Base message [@rpt_opt] is not defined. is inserted/updated with values of UserId, form_name, id already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rpt_opt_values', 17, N'MG_386', 16, N'This message is displayed when Report Option Values is inserted/updated with values of UserId, form_name, id, comp_name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rv_Customer_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@rv_Customer] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rvCustomer_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@rvCustomer] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_rv-Customer_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@rv-Customer] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_satTest_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@satTest] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SearchItem_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Search Item is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SearchItem_Table_Column', 17, N'MG_384', 16, N'This message is displayed when Search Item is inserted/updated with values of TableName, ColumnName already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SearchPreferenceList_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Search Preference List is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SessionContextNames_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Session Context Names is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_ShadowValuesErrors_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when Shadow Value Errors is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_site_group_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Multi-Site Group ID is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_site_hierarchy', 17, N'MG_385', 16, N'This message is displayed when Site-Hierarchy is inserted/updated with values of site, reports_to_site, eff_date already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_site_link_info_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Live Linked Site Information is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_site_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Site is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SiteConnectionInformation_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Site Connection Information is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SiteTypeModuleMap_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@SiteTypeModuleMap] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SiteUserMap_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Site-User Map is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SoHoOrgChart_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@SoHoOrgChart] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SpecificNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Specific Notes is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_system_type_RowPointer', 17, N'MG_383', 16, N'This message is displayed when System Type is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_SystemNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when System Notes is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_table_class_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Table Class Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_table_class_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Table Class Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_table_class_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Table/Class is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_testkeys_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TestKeys] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TestsIDO_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TestsIDO] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TestTableGoutam_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TestTableGoutam] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TestTableRS5345_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TestTableRS5345] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TestTaskName_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TestTaskName] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TimeZoneData_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TimeZoneData] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_ClassNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_ClassNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_DocumentObject_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_DocumentObject] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_DocumentObjectReference_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_DocumentObjectReference] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, N'MG_385', 16, N'This message is displayed when Base message [@tmp_DocumentObjectReference] is not defined. is inserted/updated with values of TableName, TableRowPointer, RefSequence already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_DocumentType_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_DocumentType] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_NoteHeaders_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_NoteHeaders] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_ObjectNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_ObjectNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_SpecificNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_SpecificNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_SystemNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_SystemNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_tmp_UserNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@tmp_UserNotes] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TmpEventHandler_Event_Sequence', 17, N'MG_384', 16, N'This message is displayed when Temporary Event Handler is inserted/updated with values of EventName, Sequence already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TmpStagingNewDataMaintenance_RowPointer', 17, N'MG_383', 16, N'This message is displayed when New Data Maintenance Staging Data is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TonyTest_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TonyTest] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_NDMW_MV_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_NDMW_MV] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_ReqCTD_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_ReqCTD] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_SUB_1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_SUB_1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_SUB_2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_SUB_2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB_SUB_3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB_SUB_3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPB99_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPB99] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPBNDMWLang_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPBNDMWLang] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPBRounding_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPBRounding] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPBTest_1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPBTest_1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TPBTest_174213_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@TPBTest_174213] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_TrackRows_All', 17, N'MG_385', 16, N'This message is displayed when Track Rows is inserted/updated with values of SessionID, TrackedOperType, RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Class Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_fld_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Class Field Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_fld_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Class Field Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_fld_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Class/Field is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Class Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_record_assoc_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Class Record Associate is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_class_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User-Extended Tables'' Class is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_fld_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Field Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_fld_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Field Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_fld_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Field is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_committed_fld_name', 17, N'MG_385', 16, N'This message is displayed when User Index Field Committed is inserted/updated with values of class_name, index_name, fld_name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_committed_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index Field Committed is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_fld_name', 17, N'MG_385', 16, N'This message is displayed when User Index-Field is inserted/updated with values of class_name, index_name, fld_name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_impacted_fld_name', 17, N'MG_385', 16, N'This message is displayed when User Index Field Impacted is inserted/updated with values of class_name, index_name, fld_name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index Field Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_fld_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index-Field is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_impacted_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index Impacted is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_user_index_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Index is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserCalendar', 17, N'MG_773', 16, N'Appointment entered is already exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserDefinedFields_RowId', 17, N'MG_383', 16, N'This message is displayed when User Defined Fields is inserted/updated with values of RowId already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserEmail_Username_Type', 17, N'MG_384', 16, N'This message is displayed when UNIQUE ''IX_UserEmail_Username_Type'' constraint fails on UserEmail.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserGroupMap_mst_RowPointer', 17, N'MG_384', 16, N'This message is displayed when User Group Map is inserted/updated with values of RowPointer, SiteRef already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserModules_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Modules is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserNames_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserNotes_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Notes is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserPasswordHistory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Password History is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_UserTask_RowPointer', 17, N'MG_383', 16, N'This message is displayed when User Task is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBCategory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Category is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBCategoryUser_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Category/User Permission is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataView_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataView is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewAction_ScopeType', 17, N'MG_388', 16, N'This message is displayed when DataView Action is inserted/updated with values of ScopeType, ScopeName, ClassName, IDOName, PropertyName, Caption already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewColumn_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewColumn] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewGroup_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewGroup] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewIDO_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewIDO] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewLayout_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewLayout] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewParameter] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDataViewUser_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDataViewUser] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDrilldown_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Drilldown is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDrilldownCategory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDrilldownCategory] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDrilldownColumn_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDrilldownColumn] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDrilldownFilter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDrilldownFilter] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBDrilldownParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBDrilldownParameter] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPI_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Numbers is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPICategory_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBKPICategory] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPIDrilldown_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBKPIDrilldown] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPIFilter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Input Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPIParameter_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Global Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBKPIUser_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number User Permission is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBParameters_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Parameter is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSet_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBSearchSet] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSource_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataSearch Source is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSourceColumn_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataSearch Source Show Property is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSourceGroup_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataSearch Source Group Permission is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSourceItem_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataSearch Source Search Property is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSourceSet_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBSearchSourceSet] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSearchSourceUser_RowPointer', 17, N'MG_383', 16, N'This message is displayed when DataSearch Source User Permission is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSnapshot_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Critical Number Snapshot is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WBSubDrilldown_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WBSubDrilldown] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WEB_Product_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WEB_Product] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_WPFTestGM_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@WPFTestGM] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x10_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x10] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x12_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x12] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x13_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x13] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x14_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x14] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x15_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x15] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x17_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x17] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x19_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x19] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x2_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x2] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x20_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x20] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x21_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x21] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x3_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x3] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x4_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x4] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x5_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x5] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x7_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x7] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x8_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x8] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_x9_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@x9] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'IX_xz1_RowPointer', 17, N'MG_383', 16, N'This message is displayed when Base message [@xz1] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'lead_time:item:INSERT', 5, N'MG_400', 16, N'Non null constraint', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'LoginCfgIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MessageTypesCk1', 17, N'MG_411', 16, N'This message is displayed when TABLE CHECK ''MessageTypesCk1'' constraint fails on table: MessageTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MessageTypesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''MessageTypesIx0'' constraint fails on MessageTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MessageTypesIx2', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''MessageTypesIx2'' constraint fails on MessageTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MessageTypesRcx', 17, N'MG_383', 16, N'This message is displayed when Message Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MtpMessageCodeUpr', 17, N'MG_393', 16, N'This message is displayed when TABLE CHECK ''MtpMessageCodeUpr'' constraint fails on table: MessageTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'MtpNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''MtpNoteExistsFlag'' constraint fails on table: MessageTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NheNoteFlagCk1', 17, N'MG_399', 16, N'This message is displayed when COLUMN CHECK ''NheNoteFlagCk1'' constraint fails on table: NoteHeaders, column: NoteFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NhsNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''NhsNoteExistsFlag'' constraint fails on table: NoteHeaders, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NoteHeadersIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''NoteHeadersIx0'' constraint fails on NoteHeaders.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NoteHeadersIx2', 17, N'MG_384', 16, N'This message is displayed when UNIQUE ''NoteHeadersIx2'' constraint fails on NoteHeaders.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NoteTypeCk1', 17, N'MG_411', 16, N'This message is displayed when TABLE CHECK ''NoteTypeCk1'' constraint fails on table: NoteTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NoteTypesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''NoteTypesIx0'' constraint fails on NoteTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NoteTypesRcx', 17, N'MG_383', 16, N'This message is displayed when Note Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NtsNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''NtsNoteExistsFlag'' constraint fails on table: NoteTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'NULL_COLUMN', 17, N'MG_400', 16, N'Null constraint', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessages', 0, N'MG_368', 16, N'This message is displayed when delete of Object Build Messages failes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessages', 4, N'MG_371', 16, N'This message is displayed when Object Main Messages exists as a child of other table.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessagesFk2', 17, N'MG_372', 16, N'This message is displayed when <ObjectName, MessageType> is/are updated on a(n) Object Build Messages to a value that does not exist in any Object Main Messages', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessagesFk2', 18, N'MG_405', 16, N'This message is displayed when Object Main Messages exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessagesIx0', 17, N'MG_385', 16, N'This message is displayed when PRIMAY KEY ''ObjectBuildMessagesIx0'' constraint fails on ObjectBuildMessages.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectBuildMessagesRcx', 17, N'MG_383', 16, N'This message is displayed when Object Build Messages is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessages', 1, N'MG_372', 16, N'This message is displayed when validation of Object Main Messages failes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessages', 4, N'MG_371', 16, N'This message is displayed when Object Main Messages exists as a child of other table.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesFk1', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectMainMessagesFk1'' constraint fails during INSERT or UPDATE of ObjectMainMessages.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesFk1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectMainMessagesFk1'' constraint fails during DELETE of MessageTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesFk2', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectMainMessagesFk2'' constraint fails during INSERT or UPDATE of ObjectMainMessages.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesFk2', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectMainMessagesFk2'' constraint fails during DELETE of ObjectTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesIx0', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''ObjectMainMessagesIx0'' constraint fails on ObjectMainMessages.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectMainMessagesRcx', 17, N'MG_383', 16, N'This message is displayed when Object Main Messages is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesCk1', 17, N'MG_412', 16, N'This message is displayed when TABLE CHECK ''ObjectNotesChk1'' constraint fails on table: ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesCk2', 17, N'MG_414', 16, N'This message is displayed when TABLE CHECK ''ObjectNotesChk2'' constraint fails on table: ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesCk3', 17, N'MG_413', 16, N'This message is displayed when TABLE CHECK ''ObjectNotesChk3'' constraint fails on table: ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesCk4', 17, N'MG_415', 16, N'This message is displayed when TABLE CHECK ''ObjectNotesChk4'' constraint fails on table: ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk1', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk1'' constraint fails during INSERT or UPDATE of ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk1'' constraint fails during DELETE of NoteHeaders.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk2', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk2'' constraint fails during INSERT or UPDATE of ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk2', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk2'' constraint fails during DELETE of NoteTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk3', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk3'' constraint fails during INSERT or UPDATE of ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk3', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk3'' constraint fails during DELETE of SystemNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk4', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk4'' constraint fails during INSERT or UPDATE of ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk4', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk4'' constraint fails during DELETE of UserNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk5', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk5'' constraint fails during INSERT or UPDATE of ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesFk5', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''ObjectNotesFk5'' constraint fails during DELETE of SpecificNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''ObjectNotesIx0'' constraint fails on ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectNotesIx2', 17, N'MG_388', 16, N'This message is displayed when UNIQUE ''ObjectNotesIx2'' constraint fails on ObjectNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectTypesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''ObjectTypesIx0'' constraint fails on ObjectTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectTypesIx2', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''ObjectTypesIx2'' constraint fails on ObjectTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjectTypesRcx', 17, N'MG_383', 16, N'This message is displayed when Object Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObjNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''ObjNoteExistsFlag'' constraint fails on table: ObjectNotes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObmNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''ObmNoteExistsFlag'' constraint fails on table: ObjectBuildMessages, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ObmSequenceNoCk1', 17, N'MG_381', 16, N'This message is displayed when COLUMN CHECK ''ObmSequenceNoCk1'' constraint fails on table: ObjectBuildMessages, column: SequenceNo.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ODTObjectDependsIx1', 17, N'MG_386', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ODTObjectsIx1', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ODTObjectsRcx', 17, N'MG_383', 16, N'This message is displayed when ODT Objects is inserted/updated with values of ObjectID already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ODTTableColumnsIx1', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OfoNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''BtdNoteExistsFlagCk1'' constraint fails on table: BGTaskDefinitions, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OmmMessageSeverityCk1', 17, N'MG_395', 16, N'This message is displayed when COLUMN CHECK ''OmmMessageSeverityCk1'' constraint fails on table: ObjectMainMessages, column: MessageSeverity.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OmmNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''OmmNoteExistsFlag'' constraint fails on table: ObjectMainMessages, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OtyNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''OtyNoteExistsFlag'' constraint fails on table: ObjectTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OtyObjectCodeUpr', 17, N'MG_393', 16, N'This message is displayed when TABLE CHECK ''OtyObjectCodeUpr'' constraint fails on table: ObjectTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OutputFormat', 8, N'MG_402', 16, N'Data entered not valid', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'OutputFormatsIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''OutputFormatsIx1'' constraint fails on OutputFormat.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'parmsFk7', 17, N'MG_369', 16, N'This message is displayed when <site> is/are updated on a(n) General Parameters to a value that does not exist in Site.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'parmsFk7', 18, N'MG_404', 16, N'This message is displayed when a Site is deleted but a(n) General Parameters refers to it by <site>.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PerLineNumCk1', 17, N'MG_76', 16, N'The LineNum entered must be greater than 0.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PerNoteExistsFlagCk1', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__look_dat__C239006859717D86', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__Property__45BA1E9B7DD0703B', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__sysdiagrams__1EE1BBE2', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__testbod__607AFDE042CFA5FE', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__testit__BA94ED2927C6AA07', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK__yyy__BA94ED2938FC2301', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AaInvoices_RID', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AccountAuthorizations_mst', 17, N'MG_388', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ActiveBGTasks_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AppColumn', 17, N'MG_384', 16, N'Primary key', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ApplicationMessages', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AppModule', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AppTable', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_AppView', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_BGTaskHistory_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_blob_test_tbl', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_BODTemplate', 17, N'MG_383', 16, N'Note: a message displayed when PRIMAY KEY ''PK_BODTemplate'' constraint fails', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_BPProduct', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_cbNDMW', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_cbTestNDMW', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ConfigParms', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_COR_INBOX_ENTRY', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_COR_INBOX_HEADERS', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_COR_OUTBOX_ENTRY', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_COR_OUTBOX_HEADERS', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_COR_PROPERTY', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_CountryPack', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DatabaseLocations', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DBStatus', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DefineVariables', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DemoOrders', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DocTypeFormProperty', 17, N'MG_386', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DocumentObject', 17, N'MG_384', 16, N'Primary key', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DocumentObjectReference', 17, N'MG_385', 16, N'Primary key', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_DocumentType', 17, N'MG_383', 16, N'Primary key', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'pk_dtproperties', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EmailTemplate_mst', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EmailType', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ESB_INBOUND_DUPLICATE', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ESB_PREVIOUS_VERSION_MEDIATION', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ESB_VARIATION_ID_MEDIATION', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Event', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventAction', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventActionState', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventActionVariableAccess', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventDocument', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventDocumentObject', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventGlobalConstant_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventHandler', 17, N'MG_383', 16, N'splayed when UNIQUE ''PK_EventHandler'' constraint fails on RowPointer', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventHandlerRevision', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventHandlerState', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventInitialState', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventInitialVariable', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventInputParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventMessage', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventMessageCategory', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventMessageVariable', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventOutputParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventQueue_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventRevision', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventSessionTally', 17, N'MG_386', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventState', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventStateGroup', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventTrigger_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventTriggerParameter_mst', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_EventVariable', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ExtendableStoredProcedure', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ExternalDataStore', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ExtSystemTransLog', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_FileServer', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Galactic', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_HAACLASSTEST', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_HAAIdoProjects', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IDOAliases', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IDOFilter', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IdoLinkedColumn', 17, N'MG_385', 16, N'Primary key', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IdoLinkedDatabase', 17, N'MG_383', 16, N'Note: a message displayed when PRIMAY KEY ''PK_BODTemplate'' constraint fails', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IdoLinkedTable', 17, N'MG_384', 16, N'Primary key', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_intranet', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IntranetReports', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IntranetSharedTable', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IntranetSharedUserTable', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_IntranetSharedUserTableDefault', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Issue_179366', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_LanguageIDs', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_License', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_LongRowPointerMap', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_mcbColLengthTest', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MethodParameters', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MethodResultSets', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Methods', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MGBUSDocuments', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MGBUSElements', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MGBUSElementsAttributes', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MGDataSourceMap', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ModuleMembers', 17, N'MG_386', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Modules', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_MyNewTestForm', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_NewColumnStaging', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_NextKeys_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_NotesContentShadow', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_NotesSiteMap', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ObjectSentEmail_mst', 17, N'MG_387', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_OutriggerProfile', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_OutriggerProfileOptions', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_parms', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_parms_all', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_parms_mst', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_parms_mst_all', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PasswordParameters', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Printer', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PrintPreview', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ProductDbFiles', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ProductPatches', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ProductPatchItems', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Properties', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PropertyClasses', 17, N'MG_383', 16, N'Primary Key constraint message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Publication', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PublicationCategory', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PublicationCategoryPublication', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_PublicationSubscriber', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_QueuedEvent_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_QueuedEventHandler', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rep_category', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rep_object_category', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rep_rule', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocAttribute', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocElement', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocInbound', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocOutbound', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocOutboundFilter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplDocument', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplicatedRows3_mst', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplicatedRowsErrors', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReplicatedRowsErrors_mst', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReportOptions_mst', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ReusableNotesToSite', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_RID', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rpt_opt', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rpt_opt_values', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_rv_Customer', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SearchItem', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SearchPreferenceList', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Servers', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ShadowValues', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ShadowValuesErrors', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_ShadowValuesErrors_mst', 17, N'MG_386', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_site', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_site_group', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_site_hierarchy', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_site_live_link', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SiteConnectionInformation', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SiteLinkInfo', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SiteTypeModuleMap', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SiteUserMap', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_SoHoOrgChart', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_StartupMethod', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_system_type', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_table_class', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_table_class_committed', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_table_class_impacted', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Tables', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_tempSQLTableTest', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_test_seq', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_testkeys', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TestsIDO', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TestTableGoutam', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TestTaskName', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TimeZoneData', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_tmp_DocumentObject', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_tmp_DocumentObjectReference', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_tmp_DocumentType', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TmpEventHandler', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TmpStagingNewDataMaintenance', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TonyTest', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TPB_NDMW_MV', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TPB_ReqCTD', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TPBNDMWLang', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TPBRounding', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TPBTest_1', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_TrackRows', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_committed', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_fld', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_fld_committed', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_fld_impacted', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_impacted', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_class_record_assoc', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_fld', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_fld_committed', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_fld_impacted', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index_committed', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index_fld', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index_fld_committed', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index_fld_impacted', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_user_index_impacted', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserCalendar', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserDefinedFields', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserEmail', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserGroupMap_mst', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserModules', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserPasswordHistory', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_UserTask', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBCategory', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBCategoryUser', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataView', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewAction', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewColumn', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewGroup', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewIDO', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewLayout', 17, N'MG_387', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDataViewUser', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDrilldown', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDrilldownCategory', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDrilldownColumn', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDrilldownFilter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBDrilldownParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPI', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPICategory', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPIDrilldown', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPIFilter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPIParameter', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBKPIUser', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBParameters', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSet', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSource', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSourceColumn', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSourceGroup', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSourceItem', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSourceSet', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSearchSourceUser', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSnapshot', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBSubDrilldown', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBTmpDrilldowns', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_WBTmpKPIs', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_Workflows', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_x2', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PK_zJCTest', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ProcessErrorLogIx1', 17, N'MG_385', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ProcessErrorLogRcx', 17, N'MG_383', 16, N'This message is displayed when Process Error Log is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ProcessLineNumbersIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationCategoryPublicationFK1', 17, N'MG_369', 16, N'This message is displayed when <PublicationCategory> is/are updated on a(n) Publication Category Publication to a value that does not exist in any Publication Category', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationCategoryPublicationFK1', 18, N'MG_404', 16, N'This message is displayed when Publication Category exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationCategoryPublicationFK2', 17, N'MG_369', 16, N'This message is displayed when <PublicationName> is/are updated on a(n) Publication Category Publication to a value that does not exist in any Publication', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationCategoryPublicationFK2', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''PublicationCategoryPublicationFK2'' constraint fails during DELETE of Publication Category.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationFK1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''PublicationFK1'' constraint fails during DELETE of Publication Category.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationSubscriberFK1', 17, N'MG_369', 16, N'This message is displayed when <PublicationName> is/are updated on a(n) Publication Subscriber to a value that does not exist in any Publication', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'PublicationSubscriberFK1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''PublicationSubscriberFK1'' constraint fails during DELETE of Publication Name', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=#FunctInUseNoYes', 5, N'MG_294', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=AcceptChangesYesNoCancel', 5, N'MG_295', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdContinueNoYes', 5, N'MG_296', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerform0NoYes', 5, N'MG_297', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerform1NoYes', 5, N'MG_298', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerform1NoYesAbort', 5, N'MG_299', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerform2NoYes', 5, N'MG_300', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerform3NoYes', 5, N'MG_301', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerformFromToNoYes', 5, N'MG_302', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=CmdPerformNoYes', 5, N'MG_303', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Create0NoYes', 5, N'MG_304', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Create1NoYes', 5, N'MG_305', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Create2NoYes', 5, N'MG_306', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Create3NoYes', 5, N'MG_307', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Create4NoYes', 5, N'MG_308', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Exist3YesNo', 5, N'MG_309', 16, N'Text Alias String', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=ExistForIs0NoYes', 5, N'MG_310', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=ExistUMYesNo', 5, N'MG_311', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=ExtendYesNo', 5, N'MG_312', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=FunctPerform0YesNo', 5, N'MG_313', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=FunctPerform1YesNoCancel', 5, N'MG_314', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=FunctPerformNoYes', 5, N'MG_315', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=FunctPerformYesNo', 5, N'MG_316', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=FunctPerformYesNoCancel', 5, N'MG_317', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare<>NoYes', 5, N'MG_318', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare<2NoYes', 5, N'MG_319', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare<NoYes', 5, N'MG_320', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare>1YesNo', 5, N'MG_321', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare>NoYes', 5, N'MG_322', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare1NoYes', 5, N'MG_323', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare2NoYes', 5, N'MG_324', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompare3NoYes', 5, N'MG_325', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompareWillSet0NoYes', 5, N'MG_326', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompareWillSet1NoYes', 5, N'MG_327', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompareWillSet2NoYes', 5, N'MG_328', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompareWillSet3NoYes', 5, N'MG_329', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=IsCompareWillSet4NoYes', 5, N'MG_330', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=NoExist1NoYes', 5, N'MG_331', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=NoExist2NoYes', 5, N'MG_332', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=NoExist3NoYes', 5, N'MG_333', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=NoExist4NoYes', 5, N'MG_334', 16, N'Application Base Message', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=Remove1NoYes', 5, N'MG_335', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=RemoveFor0NoYes', 5, N'MG_336', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=RemoveFor4NoYes', 5, N'MG_337', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=ShouldCompareNoYes', 5, N'MG_338', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=SiteNotBetweenNoYes', 5, N'MG_339', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=TextYesNoCancel', 5, N'MG_340', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCompare>0NoYes', 5, N'MG_341', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCompare>2NoYes', 5, N'MG_342', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCompare>3NoYes', 5, N'MG_343', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCompare0NoYes', 5, N'MG_344', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCompareNoYes', 5, N'MG_345', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillCreate=0NoYes', 5, N'MG_346', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Q=WillNotCreateFor1NoYes', 5, N'MG_347', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk1', 17, N'MG_369', 16, N'This message is displayed when the category specified does not exist.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk1', 18, N'MG_404', 16, N'This message is displayed when a category exists for a rep_rule', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk2', 17, N'MG_369', 16, N'This message is displayed when the site specified does not exist.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk2', 18, N'MG_404', 16, N'This message is displayed when a rep_rule exists for a site', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk3', 17, N'MG_369', 16, N'This message is displayed when the site specified does not exist.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'rep_ruleFk3', 18, N'MG_404', 16, N'This message is displayed when a rep_rule exists for a site', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'ReplicationOperationCounterIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SessionContextNamesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'Site_1_NotLiveLinkedToSite_2', 5, N'MG_1135', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'siteFk1', 17, N'MG_369', 16, N'This message is displayed when the intranet name specified does not exist.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'siteFk1', 18, N'MG_404', 16, N'This message is displayed when a site exists for an intranet', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'siteFk2', 17, N'MG_369', 16, N'This message is displayed when the system type specified does not exist.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'siteFk2', 18, N'MG_404', 16, N'This message is displayed when a site exists for an intranet', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SpecificNotesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''SpecificNotesIx0'' constraint fails on SpecificNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SpnNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''SpnNoteExistsFlag'' constraint fails on table: SpecificNotes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SydDefaultValueUpr', 17, N'MG_393', 16, N'This message is displayed when TABLE CHECK ''SydDefaultValueUpr'' constraint fails on table: SystemProcessDefaults.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SydNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''SydNoteExistsFlagCk1'' constraint fails on table: SystemProcessDefaults, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SynNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''SynNoteExistsFlag'' constraint fails on table: SystemNotes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SystemNotesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''SystemNotesIx0'' constraint fails on SystemNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SystemProcessDefaultsFk1', 17, N'MG_369', 16, N'This message is displayed when FOREIGN KEY ''SystemProcessDefaultsFk1'' constraint fails  during INSERT or UPDATE of SystemProcessDefaults.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SystemProcessDefaultsFk1', 18, N'MG_392', 16, N'This message is displayed when FOREIGN KEY ''SystemProcessDefaultsFk1'' constraint fails  during DELETE of DefaultTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SystemProcessDefaultsIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''SystemProcessDefaultsIx1'' constraint fails on SystemProcessDefaults.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'SystemProcessDefaultsRcx', 17, N'MG_383', 16, N'This message is displayed when System Process Defaults is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskExclusionIx0', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''TaskExclusionIx0'' constraint fails on the TaskName/ExcludedTask combination.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskExclusionRcx', 17, N'MG_383', 16, N'This message is displayed when Task Exclusion is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskListIx1', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskListRcx', 17, N'MG_383', 16, N'This message is displayed when Base message [@TaskList] is not defined. is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskName', 8, N'MG_369', 16, N'This message is displayed when data entered for TaskName is not valid.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypes', 7, N'MG_373', 16, N'This message is displayed when delete of a system Task Type fails.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypesCdvalidSp', 8, N'MG_369', 16, N'This message is displayed when data entered for Task Code is not valid.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypesCk1', 17, N'MG_411', 16, N'This message is displayed when TABLE CHECK ''TaskTypesCk1'' constraint fails on table: TaskTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypesIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''TaskTypesIx1'' constraint fails on TaskTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypesIx2', 17, N'MG_383', 16, N'This message is displayed when UNIQUE ''TaskTypesIx2'' constraint fails on TaskTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TaskTypesRcx', 17, N'MG_383', 16, N'This message is displayed when Task Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TexNoteExistsFlagCk1', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_ClassNotesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_ClassNotesIx2', 17, N'MG_386', 16, N'This message is displayed when Base message [@tmp_ClassNotes] is not defined. is inserted/updated with values of NoteHeaderToken, NoteType, SystemNoteToken, UserNoteToken already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_NoteHeadersIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_NoteHeadersIx2', 17, N'MG_384', 16, N'This message is displayed when Base message [@tmp_NoteHeaders] is not defined. is inserted/updated with values of ObjectName, NoteFlag already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_ObjectNotesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_ObjectNotesIx2', 17, N'MG_388', 16, N'This message is displayed when Base message [@tmp_ObjectNotes] is not defined. is inserted/updated with values of NoteHeaderToken, NoteType, SystemNoteToken, UserNoteToken, SpecificNoteToken, RefRowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_SpecificNotesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_SystemNotesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'tmp_UserNotesIx0', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TteNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''TteNoteExistsFlag'' constraint fails on table: TaskTypes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'TteTaskCodeUpr', 17, N'MG_393', 16, N'This message is displayed when TABLE CHECK ''TteTaskCodeUpr'' constraint fails on table: TaskTypes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UdpNoteExistsFlagCk1', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UdvNoteExistsFlagCk1', 17, N'MG_410', 16, N'note exists check', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UK_principal_name', 17, N'MG_384', 16, N'This message is displayed when Base message [@sysdiagrams] is not defined. is inserted/updated with values of principal_id, name already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UnsNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''UnsNoteExistsFlag'' constraint fails on table: UserNotes, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UpdNoteExistsFlagCk1', 17, N'MG_410', 16, N'This message is displayed when COLUMN CHECK ''UpdNoteExistsFlagCk1'' constraint fails on table: UserProcessDefaults, column: NoteExistsFlag.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UQ_MethodParam_Seq', 17, N'MG_383', 16, N'Primary Key Message', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserDefinedFieldsIx0', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''UserDefinedFieldsIx0'' constraint fails on the TableName/RowId combination.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserDefinedTypesIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''UserDefinedTypesIx1'' constraint fails on Name.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserDefinedTypesRcx', 17, N'MG_383', 16, N'This message is displayed when User Defined Types is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserDefinedTypeValuesIx1', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''UserDefinedTypeValuesIx1'' constraint fails on the TypeName/Value combination.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserDefinedTypeValuesRcx', 17, N'MG_383', 16, N'This message is displayed when User Defined Type Values is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserGroupMapIx0', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''UserGroupMapIx0'' constraint fails on the UserId/GroupId combination.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserName', 8, N'MG_369', 16, N'This message is displayed when an invalid User Name is entered.', 1, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserNamesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''UserNamesIx0'' constraint fails on UserId.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserNamesIx1', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''UserNamesIx1'' constraint fails on Username.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserNotesIx0', 17, N'MG_383', 16, N'This message is displayed when PRIMAY KEY ''UserNotesIx0'' constraint fails on UserNotes.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserProcessDefaultsFk1', 17, N'MG_369', 16, N'This message is displayed when <DefaultType> is/are updated on a(n) User Process Defaults to a value that does not exist in any Default Types', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserProcessDefaultsFk1', 18, N'MG_404', 16, N'This message is displayed when Default Types exists', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserProcessDefaultsIx1', 17, N'MG_384', 16, N'This message is displayed when PRIMAY KEY ''UserProcessDefaultsIx1'' constraint fails on UserProcessDefaults.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'UserProcessDefaultsRcx', 17, N'MG_383', 16, N'This message is displayed when User Process Defaults is inserted/updated with values of RowPointer already existing on another record.', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=Exist1', 5, N'MG_348', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=Exist2', 5, N'MG_349', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=ExistFor<', 5, N'MG_350', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=FunctInUse', 5, N'MG_351', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare', 5, N'MG_352', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare=2', 5, N'MG_353', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare=3', 5, N'MG_354', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare>1', 5, N'MG_355', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare0', 5, N'MG_356', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare1', 5, N'MG_357', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompare2', 5, N'MG_358', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=IsCompareNot1', 5, N'MG_359', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=LicenseIntializationDataNotFound1', 5, N'MG_360', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoExist1', 5, N'MG_361', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoExist2', 5, N'MG_362', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoExistForIs1', 5, N'MG_363', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoExistForIs2', 5, N'MG_364', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoExistForIs3', 5, N'MG_365', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NoneSelected', 5, N'MG_366', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=NotEditableByWizard', 5, N'MG_850', 1, N'Not Editable By Wizard', 0, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'W=WillCompare1', 5, N'MG_367', 16, N'This is a base message for substitutions.', 2, N'Core', 0
GO

EXEC AddObjectMainMessage2Sp
  N'xyz_pk', 17, N'MG_384', 16, N'Primary Key Message', 0, N'Core', 0
GO

/************************
 * ObjectBuildMessages
 ************************/

EXEC AddObjectBuildMessageSp  N'@!NoFormPrivilege', 5, 1, N'MG_466'
GO

EXEC AddObjectBuildMessageSp  N'@FK_SearchPreferenceList_SearchItemName', 18, 1, N'MG_800'
GO

EXEC AddObjectBuildMessageSp  N'AccountAuthorizationsIx1', 17, 1, N'MG_455'
GO

EXEC AddObjectBuildMessageSp  N'AccountAuthorizationsIx1', 17, 2, N'MG_421'
GO

EXEC AddObjectBuildMessageSp  N'AccountAuthorizationsIx1', 17, 3, N'MG_456'
GO

EXEC AddObjectBuildMessageSp  N'AccountAuthorizationsIx1', 17, 4, N'MG_457'
GO

EXEC AddObjectBuildMessageSp  N'AccountAuthorizationsIx1', 17, 5, N'MG_458'
GO

EXEC AddObjectBuildMessageSp  N'ActiveBGTasksIx0', 17, 1, N'MG_447'
GO

EXEC AddObjectBuildMessageSp  N'AllocationAssignRix', 17, 1, N'MG_1', N'@UserDefinedFields.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'AmeMessageLanguageCk1', 17, 1, N'MG_419'
GO

EXEC AddObjectBuildMessageSp  N'AmeMessageNoCk1', 17, 1, N'MG_423'
GO

EXEC AddObjectBuildMessageSp  N'ApplicationMessages', 1, 1, N'MG_423'
GO

EXEC AddObjectBuildMessageSp  N'ApplicationMessagesIx0', 17, 1, N'MG_423'
GO

EXEC AddObjectBuildMessageSp  N'ApplicationMessagesIx0', 17, 2, N'MG_419'
GO

EXEC AddObjectBuildMessageSp  N'atableRcx', 17, 1, N'MG_1', N'@atable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'atablesIx1', 17, 1, N'MG_1', N'@atable.ID'
GO

EXEC AddObjectBuildMessageSp  N'AuditLogFk1', 17, 1, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'AuditLogFk1', 18, 1, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'AuditLogIx0', 17, 1, N'MG_462'
GO

EXEC AddObjectBuildMessageSp  N'AuditLogTypesIx0', 17, 1, N'MG_463'
GO

EXEC AddObjectBuildMessageSp  N'AuditLogTypesRcx', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'AuditMessageTypeValidSp', 8, 1, N'MG_463'
GO

EXEC AddObjectBuildMessageSp  N'BGTaskDefinitionsIx0', 17, 1, N'MG_444'
GO

EXEC AddObjectBuildMessageSp  N'BGTaskDefinitionsRcx', 17, 1, N'MG_1', N'@BGTaskDefinitions.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'BGTaskHistoryIx0', 17, 1, N'MG_444'
GO

EXEC AddObjectBuildMessageSp  N'btableRcx', 17, 1, N'MG_1', N'@btable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'btablesIx1', 17, 1, N'MG_1', N'@btable.Name'
GO

EXEC AddObjectBuildMessageSp  N'CF_rep_object_category_skip_delete', 17, 1, N'MG_768'
GO

EXEC AddObjectBuildMessageSp  N'CF_rep_object_category_skip_insert', 17, 1, N'MG_769'
GO

EXEC AddObjectBuildMessageSp  N'CF_rep_object_category_skip_update', 17, 1, N'MG_770'
GO

EXEC AddObjectBuildMessageSp  N'childFK1', 17, 1, N'MG_1', N'@p1.itype'
GO

EXEC AddObjectBuildMessageSp  N'childFK1', 17, 2, N'MG_1', N'@p1.topic'
GO

EXEC AddObjectBuildMessageSp  N'childFK1', 18, 1, N'MG_1', N'@child'
GO

EXEC AddObjectBuildMessageSp  N'childFK1', 18, 2, N'MG_1', N'@p1.itype'
GO

EXEC AddObjectBuildMessageSp  N'childFK1', 18, 3, N'MG_1', N'@p1.topic'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_DisallowUpdate', 17, 1, N'MG_1361'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_IgnoreInsert', 17, 1, N'MG_1374'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_IgnoreUpdate', 17, 1, N'MG_1375'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_IupTriggerModifiesNewRows', 17, 1, N'MG_1389'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_KeepClusteringKeys', 17, 1, N'MG_1390'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_NextKeyReverseKeyOrder', 17, 1, N'MG_1394'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_RegisterNewKey', 17, 1, N'MG_1404'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_RememberIdentity', 17, 1, N'MG_1405'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_TestOutsideLockForNewKey', 17, 1, N'MG_1424'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_Update_AllRegardlessOfBaseTableChanges', 17, 1, N'MG_1427'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_UseRPOnInsert', 17, 1, N'MG_1433'
GO

EXEC AddObjectBuildMessageSp  N'CK_AppTable_UseRPOnUpdate', 17, 1, N'MG_1434'
GO

EXEC AddObjectBuildMessageSp  N'CK_CountryPack_Option', 17, 1, N'MG_1', N'@CountryPack.Option'
GO

EXEC AddObjectBuildMessageSp  N'CK_CountryPack_Option', 17, 2, N'MG_1456'
GO

EXEC AddObjectBuildMessageSp  N'CK_CountryPack_Option', 17, 3, N'MG_1457'
GO

EXEC AddObjectBuildMessageSp  N'CK_DocumentObject_Internal', 17, 1, N'MG_1380'
GO

EXEC AddObjectBuildMessageSp  N'CK_DocumentObjectReference_Suspend', 17, 1, N'MG_678'
GO

EXEC AddObjectBuildMessageSp  N'CK_Event_EventHasChanged', 17, 1, N'MG_1368'
GO

EXEC AddObjectBuildMessageSp  N'CK_Event_IsFrameworkEvent', 17, 1, N'MG_1382'
GO

EXEC AddObjectBuildMessageSp  N'CK_Event_IsFrameworkIDOEvent', 17, 1, N'MG_1383'
GO

EXEC AddObjectBuildMessageSp  N'CK_Event_IsFrameworkIDOSuspendableEvent', 17, 1, N'MG_1384'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_ModifiedPayloadAccess', 17, 1, N'MG_1', N'@EventActionState.ModifiedPayloadAccess'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_ModifiedPayloadAccess', 17, 2, N'MG_1329'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_ModifiedPayloadAccess', 17, 3, N'MG_1334'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_ModifiedPayloadAccess', 17, 4, N'MG_1345'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_PayloadAccess', 17, 1, N'MG_1', N'@EventActionState.PayloadAccess'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_PayloadAccess', 17, 2, N'MG_1329'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_PayloadAccess', 17, 3, N'MG_1334'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_PayloadAccess', 17, 4, N'MG_1345'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_UnmodifiedPayloadAccess', 17, 1, N'MG_1', N'@EventActionState.UnmodifiedPayloadAccess'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_UnmodifiedPayloadAccess', 17, 2, N'MG_1329'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_UnmodifiedPayloadAccess', 17, 3, N'MG_1334'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionState_UnmodifiedPayloadAccess', 17, 4, N'MG_1345'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 1, N'MG_1', N'@EventActionVariableAccess.Access'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 2, N'MG_1329'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 3, N'MG_1334'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 4, N'MG_1440'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 5, N'MG_1345'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventActionVariableAccess_Access', 17, 6, N'MG_1349'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Active', 17, 1, N'MG_1077'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 1, N'MG_1', N'@EventHandler.Chrono'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 2, N'MG_1327'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 3, N'MG_1442'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 4, N'MG_1331'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 5, N'MG_1332'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 6, N'MG_1336'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Chrono', 17, 7, N'MG_1337'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_EditableByWizard', 17, 1, N'MG_1363'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_IgnoreFailure', 17, 1, N'MG_1373'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Obsolete', 17, 1, N'MG_1396'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Overridable', 17, 1, N'MG_1397'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Suspend', 17, 1, N'MG_678'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Synchronous', 17, 1, N'MG_1421'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandler_Transactional', 17, 1, N'MG_1425'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_RestartCurrentAction', 17, 1, N'MG_1407'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_Status', 17, 1, N'MG_1', N'@EventHandlerState.Status'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_Status', 17, 2, N'MG_1450'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_Status', 17, 3, N'MG_1451'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_Status', 17, 4, N'MG_802'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_Status', 17, 5, N'MG_1453'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventHandlerState_VotingOpen', 17, 1, N'MG_1437'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 1, N'MG_1', N'@EventInitialVariable.DefaultAccess'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 2, N'MG_1329'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 3, N'MG_1334'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 4, N'MG_1440'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 5, N'MG_1345'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_DefaultAccess', 17, 6, N'MG_1349'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_Persistent', 17, 1, N'MG_1401'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInitialVariable_ValueIsGlobalConstantName', 17, 1, N'MG_1435'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventInputParameter_IsOutput', 17, 1, N'MG_1385'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventMessage_HasBeenRead', 17, 1, N'MG_1371'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventMessage_IsSavedMessage', 17, 1, N'MG_1386'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventParameter_IsOutput', 17, 1, N'MG_715'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventQueue_mst_Transactional', 17, 1, N'MG_1425'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_AnyHandlersFailed', 17, 1, N'MG_1354'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Retryable', 17, 1, N'MG_1409'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_RetryFromCurrentAction', 17, 1, N'MG_1410'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_RolledBack', 17, 1, N'MG_1411'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Status', 17, 1, N'MG_1', N'@EventState.Status'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Status', 17, 2, N'MG_1450'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Status', 17, 3, N'MG_1451'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Status', 17, 4, N'MG_802'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Suspended', 17, 1, N'MG_1419'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_SuspendValidatingMode', 17, 1, N'MG_1420'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventState_Transactional', 17, 1, N'MG_1425'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventTrigger_mst_Active', 17, 1, N'MG_1077'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventTrigger_mst_EditableByWizard', 17, 1, N'MG_1363'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventTrigger_mst_Transactional', 17, 1, N'MG_1425'
GO

EXEC AddObjectBuildMessageSp  N'CK_EventVariable_Persistent', 17, 1, N'MG_1401'
GO

EXEC AddObjectBuildMessageSp  N'CK_IdoLinkedColumn_IsCharacter', 17, 1, N'MG_844'
GO

EXEC AddObjectBuildMessageSp  N'CK_IdoLinkedColumn_IsKey', 17, 1, N'MG_845'
GO

EXEC AddObjectBuildMessageSp  N'CK_IdoLinkedColumn_IsOptimisticLock', 17, 1, N'MG_846'
GO

EXEC AddObjectBuildMessageSp  N'CK_IdoLinkedDatabase_DbType', 17, 1, N'MG_1121'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_IsExternal', 17, 1, N'MG_1133'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_ReportServerDeploymentMode', 17, 1, N'MG_1', N'@intranet.ReportServerDeploymentMode'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_ReportServerDeploymentMode', 17, 2, N'MG_1340'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_ReportServerDeploymentMode', 17, 3, N'MG_1346'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_SMTPDeliveryMethod', 17, 1, N'MG_1', N'@intranet.SMTPDeliveryMethod'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_SMTPDeliveryMethod', 17, 2, N'MG_1342'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_SMTPDeliveryMethod', 17, 3, N'MG_1341'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_SMTPDeliveryMethod', 17, 4, N'MG_1347'
GO

EXEC AddObjectBuildMessageSp  N'CK_intranet_SMTPEnableSSL', 17, 1, N'MG_1418'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedTable_Processed', 17, 1, N'MG_1403'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedTable_Shared', 17, 1, N'MG_1416'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTable_Processed', 17, 1, N'MG_1403'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTable_Shareable', 17, 1, N'MG_1415'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTable_Shared', 17, 1, N'MG_1416'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTable_UpdateRefId', 17, 1, N'MG_1429'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTableDefault_Shareable', 17, 1, N'MG_1415'
GO

EXEC AddObjectBuildMessageSp  N'CK_IntranetSharedUserTableDefault_UpdateRefId', 17, 1, N'MG_1429'
GO

EXEC AddObjectBuildMessageSp  N'CK_OutriggerProfile_DatabaseType', 17, 1, N'MG_1121'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_analytical_ledger', 17, 1, N'MG_1353'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_capitalize', 17, 1, N'MG_1356'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_default_ending_from_starting', 17, 1, N'MG_1358'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_ec_reporting', 17, 1, N'MG_1362'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 1, N'MG_1', N'@parms.emp_type'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 2, N'MG_1328'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 3, N'MG_1335'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 4, N'MG_1441'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 5, N'MG_1339'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 6, N'MG_1438'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_emp_type', 17, 7, N'MG_1344'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_enable_multiple_fsb', 17, 1, N'MG_1366'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_gl_print_post', 17, 1, N'MG_1370'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_hide_parent_grid_columns', 17, 1, N'MG_1372'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_name_code', 17, 1, N'MG_1', N'@parms.name_code'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_name_code', 17, 2, N'MG_1333'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_name_code', 17, 3, N'MG_1348'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_parm_key', 17, 1, N'MG_1', N'@parms.parm_key'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_parm_key', 17, 2, N'MG_1445'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_post_jour', 17, 1, N'MG_1443'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_print_name', 17, 1, N'MG_1402'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_rsvd1', 17, 1, N'MG_1412'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_rsvd2', 17, 1, N'MG_1413'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_secure_control_accounts', 17, 1, N'MG_1414'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_use_external_gl', 17, 1, N'MG_1430'
GO

EXEC AddObjectBuildMessageSp  N'CK_parms_mst_use_widget_preferences', 17, 1, N'MG_1431'
GO

EXEC AddObjectBuildMessageSp  N'CK_PasswordParameters_EnforceDigit', 17, 1, N'MG_1367'
GO

EXEC AddObjectBuildMessageSp  N'CK_PasswordParameters_MinimumPasswordExpiration', 17, 1, N'MG_1', N'@PasswordParameters.MinimumPasswordExpiration'
GO

EXEC AddObjectBuildMessageSp  N'CK_PasswordParameters_MinimumPasswordExpiration', 17, 2, N'MG_1445'
GO

EXEC AddObjectBuildMessageSp  N'CK_PasswordParameters_PasswordExpiration', 17, 1, N'MG_1', N'@PasswordParameters.PasswordExpiration'
GO

EXEC AddObjectBuildMessageSp  N'CK_PasswordParameters_PasswordExpiration', 17, 2, N'MG_1445'
GO

EXEC AddObjectBuildMessageSp  N'CK_PublicationCategoryPublication_IsSystemRecord', 17, 1, N'MG_1387'
GO

EXEC AddObjectBuildMessageSp  N'CK_QueuedEvent_mst_Suspend', 17, 1, N'MG_678'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_object_type', 17, 1, N'MG_1', N'@rep_object_category.object_type'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_object_type', 17, 2, N'MG_565'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_object_type', 17, 3, N'MG_1454'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_object_type', 17, 4, N'MG_1455'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_retain_site', 17, 1, N'MG_1408'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_object_category_skip_method', 17, 1, N'MG_771'
GO

EXEC AddObjectBuildMessageSp  N'CK_rep_rule_disable_repl', 17, 1, N'MG_498'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocAttribute_IncludeForNullValuedElement', 17, 1, N'MG_1376'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocAttribute_ValueSourceType', 17, 1, N'MG_1', N'@ReplDocAttribute.ValueSourceType'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocAttribute_ValueSourceType', 17, 2, N'MG_1338'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocAttribute_ValueSourceType', 17, 3, N'MG_1343'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocElement_IsToLogicalId', 17, 1, N'MG_1388'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocElement_ValueSourceType', 17, 1, N'MG_1', N'@ReplDocElement.ValueSourceType'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocElement_ValueSourceType', 17, 2, N'MG_1330'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocElement_ValueSourceType', 17, 3, N'MG_1338'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocElement_ValueSourceType', 17, 4, N'MG_1343'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_ActiveForManualRequest', 17, 1, N'MG_1351'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_AppliesToIDOAction', 17, 1, N'MG_1', N'@ReplDocOutbound.AppliesToIDOAction'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_AppliesToIDOAction', 17, 2, N'MG_1460'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_AppliesToIDOAction', 17, 3, N'MG_733'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_AppliesToIDOAction', 17, 4, N'MG_734'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReplDocOutbound_EligibleForBackgroundManualRequest', 17, 1, N'MG_1364'
GO

EXEC AddObjectBuildMessageSp  N'CK_ReportOptions_mst_AutoView', 17, 1, N'MG_1355'
GO

EXEC AddObjectBuildMessageSp  N'CK_site_link_info_disable_repl', 17, 1, N'MG_1444'
GO

EXEC AddObjectBuildMessageSp  N'CK_site_type', 17, 1, N'MG_1', N'@site.type'
GO

EXEC AddObjectBuildMessageSp  N'CK_site_type', 17, 2, N'MG_1461'
GO

EXEC AddObjectBuildMessageSp  N'CK_site_type', 17, 3, N'MG_490'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_active', 17, 1, N'MG_523'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_allow_record_assoc', 17, 1, N'MG_1352'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_committed_active', 17, 1, N'MG_1077'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_committed_allow_record_assoc', 17, 1, N'MG_1352'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_committed_extend_all_recs', 17, 1, N'MG_1369'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_committed_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_extend_all_recs', 17, 1, N'MG_1369'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_impacted_active', 17, 1, N'MG_1077'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_impacted_allow_record_assoc', 17, 1, N'MG_1352'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_impacted_extend_all_recs', 17, 1, N'MG_1369'
GO

EXEC AddObjectBuildMessageSp  N'CK_table_class_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_update_all_columns', 17, 1, N'MG_1428'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_committed_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_committed_sys_has_fields', 17, 1, N'MG_1422'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_committed_sys_has_tables', 17, 1, N'MG_1423'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_fld_committed_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_fld_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_impacted_sys_has_fields', 17, 1, N'MG_1422'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_impacted_sys_has_tables', 17, 1, N'MG_1423'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_sys_has_fields', 17, 1, N'MG_1422'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_class_sys_has_tables', 17, 1, N'MG_1423'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_fld_committed_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_fld_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_committed_index_unique', 17, 1, N'MG_1378'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_committed_index_word', 17, 1, N'MG_1379'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_committed_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_fld_committed_index_asc', 17, 1, N'MG_1377'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_fld_impacted_index_asc', 17, 1, N'MG_1377'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_fld_index_asc', 17, 1, N'MG_1377'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_impacted_index_unique', 17, 1, N'MG_1378'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_impacted_index_word', 17, 1, N'MG_1379'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_index_unique', 17, 1, N'MG_540'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_index_word', 17, 1, N'MG_1379'
GO

EXEC AddObjectBuildMessageSp  N'CK_user_index_sys_delete', 17, 1, N'MG_526'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserCalendar_DeleteAfterReminder', 17, 1, N'MG_1360'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserCalendar_EndTime', 17, 1, N'MG_778'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserCalendar_EndTime', 17, 2, N'MG_776'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserCalendar_RemindDateTime', 17, 1, N'MG_775'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserCalendar_RemindDateTime', 17, 2, N'MG_776'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserNames_SendEmailNotifications', 17, 1, N'MG_785'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserNames_SendEmailPrompts', 17, 1, N'MG_784'
GO

EXEC AddObjectBuildMessageSp  N'CK_Usernames_Status', 17, 1, N'MG_1', N'@!Connect'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserNames_UseEmailReplyTo', 17, 1, N'MG_1432'
GO

EXEC AddObjectBuildMessageSp  N'CK_UserTask_DeleteAfterReminder', 17, 1, N'MG_1360'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk1', 17, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk1', 17, 2, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk2', 17, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk2', 17, 2, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk3', 17, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesCk3', 17, 2, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk1', 17, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk1', 18, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk2', 17, 1, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk2', 18, 1, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk3', 17, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk3', 18, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk4', 17, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesFk4', 18, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesIx0', 17, 1, N'MG_434'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesIx2', 17, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesIx2', 17, 2, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesIx2', 17, 3, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ClassNotesIx2', 17, 4, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ConnectionInformationIx0', 17, 1, N'MG_1', N'@ConnectionInformation.ConnectionID'
GO

EXEC AddObjectBuildMessageSp  N'COR_INBOX_HEADERS_FK1', 17, 1, N'MG_1', N'@COR_INBOX_ENTRY.C_INBOX_ID'
GO

EXEC AddObjectBuildMessageSp  N'COR_INBOX_HEADERS_FK1', 18, 1, N'MG_1', N'@COR_INBOX_HEADERS'
GO

EXEC AddObjectBuildMessageSp  N'COR_INBOX_HEADERS_FK1', 18, 2, N'MG_1', N'@COR_INBOX_ENTRY.C_INBOX_ID'
GO

EXEC AddObjectBuildMessageSp  N'COR_OUTBOX_HEADERS_FK1', 17, 1, N'MG_1', N'@COR_OUTBOX_ENTRY.C_OUTBOX_ID'
GO

EXEC AddObjectBuildMessageSp  N'COR_OUTBOX_HEADERS_FK1', 18, 1, N'MG_1', N'@COR_OUTBOX_HEADERS'
GO

EXEC AddObjectBuildMessageSp  N'COR_OUTBOX_HEADERS_FK1', 18, 2, N'MG_1', N'@COR_OUTBOX_ENTRY.C_OUTBOX_ID'
GO

EXEC AddObjectBuildMessageSp  N'DefaultType', 8, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'DefaultTypes', 7, 1, N'MG_461'
GO

EXEC AddObjectBuildMessageSp  N'DefaultTypesIx1', 17, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'DefaultTypesRcx', 17, 1, N'MG_1', N'@DefaultTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'DetAllowUserDfltFlagCk1', 17, 1, N'MG_443'
GO

EXEC AddObjectBuildMessageSp  N'FK_DocumentObject_DocumentType', 17, 1, N'MG_791'
GO

EXEC AddObjectBuildMessageSp  N'FK_DocumentObject_DocumentType', 18, 1, N'MG_791'
GO

EXEC AddObjectBuildMessageSp  N'FK_DocumentObjectReference_DocumentRowPointer', 17, 1, N'MG_795'
GO

EXEC AddObjectBuildMessageSp  N'FK_DocumentObjectReference_DocumentRowPointer', 18, 1, N'MG_795'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 17, 1, N'MG_1', N'@EmailTemplate.FormName'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 17, 2, N'MG_1', N'@EmailTemplate.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 17, 3, N'MG_1', N'@EmailTemplate.TemplateName'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 18, 1, N'MG_1', N'@EmailTemplate'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 18, 2, N'MG_1', N'@EmailTemplate.FormName'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 18, 3, N'MG_1', N'@EmailTemplate.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'FK_EmailTemplate_mst_EmailTemplate_mst', 18, 4, N'MG_1', N'@EmailTemplate.TemplateName'
GO

EXEC AddObjectBuildMessageSp  N'FK_EventDocumentObject_DocumentType', 17, 1, N'MG_1', N'@DocumentType.DocumentType'
GO

EXEC AddObjectBuildMessageSp  N'FK_EventDocumentObject_DocumentType', 18, 1, N'MG_1', N'@EventDocumentObject'
GO

EXEC AddObjectBuildMessageSp  N'FK_EventDocumentObject_DocumentType', 18, 2, N'MG_1', N'@DocumentType.DocumentType'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 17, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 17, 2, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 18, 1, N'MG_854'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 18, 3, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedColumn_IdoLinkDatabase_TableName', 18, 4, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedTable_IdoLinkDatabase', 17, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'FK_IdoLinkedTable_IdoLinkDatabase', 18, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'FK_parms_mst_site', 17, 1, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'FK_parms_mst_site', 18, 1, N'MG_1', N'@parms'
GO

EXEC AddObjectBuildMessageSp  N'FK_parms_mst_site', 18, 2, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'FK_ReportOptions_mst_PrinterName', 17, 1, N'MG_1', N'@Printer.PrinterName'
GO

EXEC AddObjectBuildMessageSp  N'FK_ReportOptions_mst_PrinterName', 18, 1, N'MG_1', N'@ReportOptions'
GO

EXEC AddObjectBuildMessageSp  N'FK_ReportOptions_mst_PrinterName', 18, 2, N'MG_1', N'@Printer.PrinterName'
GO

EXEC AddObjectBuildMessageSp  N'FK_SearchPreferenceList_SearchItemName', 17, 1, N'MG_1', N'@SearchItem.SearchItemName'
GO

EXEC AddObjectBuildMessageSp  N'FK_SearchPreferenceList_SearchItemName', 18, 1, N'MG_800'
GO

EXEC AddObjectBuildMessageSp  N'GroupName', 8, 1, N'MG_446'
GO

EXEC AddObjectBuildMessageSp  N'GroupNamesIx0', 17, 1, N'MG_454'
GO

EXEC AddObjectBuildMessageSp  N'GroupNamesIx2', 17, 2, N'MG_446'
GO

EXEC AddObjectBuildMessageSp  N'IDOAliasesIx0', 17, 1, N'MG_571'
GO

EXEC AddObjectBuildMessageSp  N'IX_a1_RowPointer', 17, 1, N'MG_1', N'@a1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_a2_RowPointer', 17, 1, N'MG_1', N'@a2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aa1_RowPointer', 17, 1, N'MG_1', N'@aa1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aaCo2s_RowPointer', 17, 1, N'MG_1', N'@aaCo2s.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aaCo3s_RowPointer', 17, 1, N'MG_1', N'@aaCo3s.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aaCo4s_RowPointer', 17, 1, N'MG_1', N'@aaCo4s.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aaCoItems_RowPointer', 17, 1, N'MG_1', N'@aaCoItems.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_aaCos_RowPointer', 17, 1, N'MG_1', N'@aaCos.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AaInvoices_RowPointer', 17, 1, N'MG_1', N'@AaInvoices.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AaPayments_RowPointer', 17, 1, N'MG_1', N'@AaPayments.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AbcInvoices_RowPointer', 17, 1, N'MG_1', N'@AbcInvoices.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AccountAuthorizations_mst_RowPointer', 17, 1, N'MG_1', N'@AccountAuthorizations.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AccountAuthorizations_mst_RowPointer', 17, 2, N'MG_1', N'@AccountAuthorizations.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_ActiveBGTasks_mst_RowPointer', 17, 1, N'MG_1', N'@ActiveBGTasks.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ActiveBGTasks_mst_RowPointer', 17, 2, N'MG_1', N'@ActiveBGTasks.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_AppColumn_RowPointer', 17, 1, N'MG_1', N'@AppColumn.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ApplicationMessages_RowPointer', 17, 1, N'MG_1', N'@ApplicationMessages.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AppModule_RowPointer', 17, 1, N'MG_1', N'@AppModule.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AppTable_RowPointer', 17, 1, N'MG_1', N'@AppTable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AppView_RowPointer', 17, 1, N'MG_1', N'@AppView.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_AuditLog_RowPointer', 17, 1, N'MG_1', N'@AuditLog.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_BGTaskHistory_mst_RowPointer', 17, 1, N'MG_1', N'@BGTaskHistory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_BGTaskHistory_mst_RowPointer', 17, 2, N'MG_1', N'@BGTaskHistory.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_BODTemplate_RowPointer', 17, 1, N'MG_1', N'@BODTemplate.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_BPProduct_RowPointer', 17, 1, N'MG_1', N'@BPProduct.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_BrandKit_RowPointer', 17, 1, N'MG_1', N'@BrandKit.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbNDMW_RowPointer', 17, 1, N'MG_1', N'@cbNDMW.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW10_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW10.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW2_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW3_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW4_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW4.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW5_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW5.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW6_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW6.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW7_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW7.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_cbTestNDMW8_RowPointer', 17, 1, N'MG_1', N'@cbTestNDMW8.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ClassNotes_RowPointer', 17, 1, N'MG_1', N'@ClassNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ConfigParms_RowPointer', 17, 1, N'MG_1', N'@ConfigParms.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ConnectionInformation_RowPointer', 17, 1, N'MG_1', N'@ConnectionInformation.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_COR_INBOX_ENTRY_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_COR_INBOX_HEADERS_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_COR_OUTBOX_ENTRY_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_COR_OUTBOX_HEADERS_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_COR_PROPERTY_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreEmpAddrHAA_mst_RowPointer', 17, 1, N'MG_1', N'@CoreEmpAddrHAA.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAAEmployee_mst_RowPointer', 17, 1, N'MG_1', N'@CoreHAAEmployee.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAAndmw1_RowPointer', 17, 1, N'MG_1', N'@CoreHAAndmw1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAAndmw2_RowPointer', 17, 1, N'MG_1', N'@CoreHAAndmw2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAATBL1_RowPointer', 17, 1, N'MG_1', N'@CoreHAATBL1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAATBL2_RowPointer', 17, 1, N'MG_1', N'@CoreHAATBL2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAATbltest3_RowPointer', 17, 1, N'MG_1', N'@CoreHAATbltest3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAATEST_RowPointer', 17, 1, N'MG_1', N'@CoreHAATEST.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CoreHAATEST2_RowPointer', 17, 1, N'MG_1', N'@CoreHAATEST2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_CountryPack_RowPointer', 17, 1, N'MG_1', N'@CountryPack.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Customer3_RowPointer', 17, 1, N'MG_1', N'@Customer3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Customer88_RowPointer', 17, 1, N'MG_1', N'@Customer88.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Customer91_RowPointer', 17, 1, N'MG_1', N'@Customer91.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Customers_RowPointer', 17, 1, N'MG_1', N'@Customers.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DBStatus_RowPointer', 17, 1, N'MG_1', N'@DBStatus.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRManualCreate_RowPointer', 17, 1, N'MG_1', N'@DDRManualCreate.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM1_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM10_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM10.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM11_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM11.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM12_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM12.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM13_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM13.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM14_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM14.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM15_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM15.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM16_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM16.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM17_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM17.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM18_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM18.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM7_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM7.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM8_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM8.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM8s_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM8s.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DDRTestNDM9_RowPointer', 17, 1, N'MG_1', N'@DDRTestNDM9.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DefineVariables_RowPointer', 17, 1, N'MG_1', N'@DefineVariables.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DemoOrders_RowPointer', 17, 1, N'MG_1', N'@DemoOrders.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObject_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_Re', 17, 1, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_Re', 17, 2, N'MG_794'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_Re', 17, 3, N'MG_793'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 1, N'MG_1', N'@DocumentObjectReference.RefSequence'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 2, N'MG_1', N'@DocumentObjectReference.TableName'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 3, N'MG_1', N'@DocumentObjectReference.TableRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_DocumentType_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_EmailTemplate_mst_RowPointer', 17, 1, N'MG_1', N'@EmailTemplate.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EmailType_RowPointer', 17, 1, N'MG_1', N'@EmailType.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ESB_INBOUND_DUPLICATE_RowPointer', 17, 1, N'MG_1', N'@ESB_INBOUND_DUPLICATE.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ESB_PREVIOUS_VERSION_MEDIATION_RowPointer', 17, 1, N'MG_1', N'@ESB_PREVIOUS_VERSION_MEDIATION.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ESB_VARIATION_ID_MEDIATION_RowPointer', 17, 1, N'MG_1', N'@ESB_VARIATION_ID_MEDIATION.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Event_RowPointer', 17, 1, N'MG_1', N'@Event.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventAction_EventHandler_Sequence', 17, 1, N'MG_1', N'@EventAction.EventHandlerRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventAction_EventHandler_Sequence', 17, 2, N'MG_1', N'@EventAction.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventActionState_RowPointer', 17, 1, N'MG_1', N'@EventActionState.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventActionVariableAccess_RowPointer', 17, 1, N'MG_1', N'@EventActionVariableAccess.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventDocument_EventStateId_AttachmentName', 17, 1, N'MG_1', N'@EventDocument.AttachmentName'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventDocument_EventStateId_AttachmentName', 17, 2, N'MG_1', N'@EventDocument.EventStateId'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventDocument_RowPointer', 17, 1, N'MG_1', N'@EventDocument.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventDocumentObject_RowPointer', 17, 1, N'MG_1', N'@EventDocumentObject.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventGlobalConstant_mst_RowPointer', 17, 1, N'MG_1', N'@EventGlobalConstant.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventGlobalConstant_mst_RowPointer', 17, 2, N'MG_1', N'@EventGlobalConstant.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventHandler_Event_Sequence', 17, 1, N'MG_1', N'@!EventName'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventHandler_Event_Sequence', 17, 2, N'MG_1', N'@!Sequence'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventHandlerRevision_RowPointer', 17, 1, N'MG_1', N'@EventHandlerRevision.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventHandlerState_RowPointer', 17, 1, N'MG_1', N'@EventHandlerState.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventInitialState_RowPointer', 17, 1, N'MG_1', N'@EventInitialState.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventInitialVariable_RowPointer', 17, 1, N'MG_1', N'@EventInitialVariable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventInputParameter_RowPointer', 17, 1, N'MG_1', N'@EventInputParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventMessageCategory_RowPointer', 17, 1, N'MG_1', N'@EventMessageCategory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventMessageVariable_RowPointer', 17, 1, N'MG_1', N'@EventMessageVariable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventOutputParameter_RowPointer', 17, 1, N'MG_1', N'@EventOutputParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventParameter_RowPointer', 17, 1, N'MG_1', N'@EventParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventQueue_mst_RowPointer', 17, 1, N'MG_1', N'@EventQueue.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventQueue_mst_RowPointer', 17, 2, N'MG_1', N'@EventQueue.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventRevision_RowPointer', 17, 1, N'MG_1', N'@EventRevision.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventSessionTally_RowPointer', 17, 1, N'MG_1', N'@EventSessionTally.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventStateGroup_RowPointer', 17, 1, N'MG_1', N'@EventStateGroup.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventTrigger_mst_RowPointer', 17, 1, N'MG_1', N'@EventTrigger.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventTrigger_mst_RowPointer', 17, 2, N'MG_1', N'@EventTrigger.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventTriggerParameter_mst_RowPointer', 17, 1, N'MG_1', N'@EventTriggerParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventTriggerParameter_mst_RowPointer', 17, 2, N'MG_1', N'@EventTriggerParameter.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_EventVariable_RowPointer', 17, 1, N'MG_1', N'@EventVariable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ExtendableProc_RowPointer', 17, 1, N'MG_1', N'@ExtendableStoredProcedure.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ExternalDataStore_RowPointer', 17, 1, N'MG_1', N'@ExternalDataStore.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_FileServer_RowPointer', 17, 1, N'MG_1', N'@FileServer.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Galactic_RowPointer', 17, 1, N'MG_1', N'@Galactic.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMTest_RowPointer', 17, 1, N'MG_1', N'@GMTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMTest2_RowPointer', 17, 1, N'MG_1', N'@GMTest2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMTest3_RowPointer', 17, 1, N'MG_1', N'@GMTest3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMTest4_RowPointer', 17, 1, N'MG_1', N'@GMTest4.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMWpfTest_RowPointer', 17, 1, N'MG_1', N'@GMWpfTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GMWpfTesting_RowPointer', 17, 1, N'MG_1', N'@GMWpfTesting.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_GroupNames_RowPointer', 17, 1, N'MG_1', N'@GroupNames.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HAACLASSTEST_RowPointer', 17, 1, N'MG_1', N'@HAACLASSTEST.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HAAIdoProjects_RowPointer', 17, 1, N'MG_1', N'@HAAIdoProjects.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HAATBL_RowPointer', 17, 1, N'MG_1', N'@HAATBL.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HAATEST_1_RowPointer', 17, 1, N'MG_1', N'@HAATEST_1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HelloUniverse_RowPointer', 17, 1, N'MG_1', N'@HelloUniverse.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_HelloWorld2_RowPointer', 17, 1, N'MG_1', N'@HelloWorld2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedColumn_RowPointer', 17, 1, N'MG_1', N'@IdoLinkedColumn.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedColumn_ViewColumnName', 17, 1, N'MG_1', N'@IdoLinkedColumn.IdoLinkDatabase'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedColumn_ViewColumnName', 17, 2, N'MG_1', N'@IdoLinkedColumn.TableName'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedColumn_ViewColumnName', 17, 3, N'MG_1', N'@IdoLinkedColumn.ViewColumnName'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedDatabase_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedTable_RowPointer', 17, 1, N'MG_470'
GO

EXEC AddObjectBuildMessageSp  N'IX_IdoLinkedTable_View', 17, 1, N'MG_564'
GO

EXEC AddObjectBuildMessageSp  N'IX_intranet_RowPointer', 17, 1, N'MG_1', N'@intranet.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_IntranetSharedTable_RowPointer', 17, 1, N'MG_1', N'@IntranetSharedTable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_IntranetSharedUserTable_RowPointer', 17, 1, N'MG_1', N'@IntranetSharedUserTable.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_IntranetSharedUserTableDefault_RowPointer', 17, 1, N'MG_1', N'@IntranetSharedUserTableDefault.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Issue_179366_RowPointer', 17, 1, N'MG_1', N'@Issue_179366.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Issue_182753_RowPointer', 17, 1, N'MG_1', N'@Issue_182753.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Issue149806_RowPointer', 17, 1, N'MG_1', N'@Issue149806.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_jc_Test2_RowPointer', 17, 1, N'MG_1', N'@jc_Test2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_jc_UserLangTests_RowPointer', 17, 1, N'MG_1', N'@jc_UserLangTests.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_LanguageIDs_LanguageCode', 17, 1, N'MG_1', N'@LanguageIDs.LanguageCode'
GO

EXEC AddObjectBuildMessageSp  N'IX_LanguageIDs_RowPointer', 17, 1, N'MG_1', N'@LanguageIDs.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_LongRowPointerMap_RowPointer', 17, 1, N'MG_1', N'@LongRowPointerMap.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_MCB_Test100_RowPointer', 17, 1, N'MG_1', N'@MCB_Test100.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbColLengthTest_RowPointer', 17, 1, N'MG_1', N'@mcbColLengthTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbColLengthTest2_RowPointer', 17, 1, N'MG_1', N'@mcbColLengthTest2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbColLengthTest3_RowPointer', 17, 1, N'MG_1', N'@mcbColLengthTest3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbOrderDetails301_RowPointer', 17, 1, N'MG_1', N'@mcbOrderDetails301.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbOrdertest300_RowPointer', 17, 1, N'MG_1', N'@mcbOrdertest300.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbOrdertest3002_RowPointer', 17, 1, N'MG_1', N'@mcbOrdertest3002.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbOrdertest301_RowPointer', 17, 1, N'MG_1', N'@mcbOrdertest301.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest101_RowPointer', 17, 1, N'MG_1', N'@mcbTest101.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest101Split_mst_RowPointer', 17, 1, N'MG_1', N'@mcbTest101Split.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest102_RowPointer', 17, 1, N'MG_1', N'@mcbTest102.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest200_RowPointer', 17, 1, N'MG_1', N'@mcbTest200.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest206_RowPointer', 17, 1, N'MG_1', N'@mcbTest206.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mcbTest555_RowPointer', 17, 1, N'MG_1', N'@mcbTest555.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_me_Test1_RowPointer', 17, 1, N'MG_1', N'@me_Test1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Members1_RowPointer', 17, 1, N'MG_1', N'@Members1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_MGBUSDocuments_RowPointer', 17, 1, N'MG_1', N'@MGBUSDocuments.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_MGDataSourceMaps_RowPointer', 17, 1, N'MG_1', N'@MGDataSourceMaps.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_MGDataSources_RowPointer', 17, 1, N'MG_1', N'@MGDataSources.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ModuleMembers_RowPointer', 17, 1, N'MG_1', N'@ModuleMembers.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Modules_RowPointer', 17, 1, N'MG_1', N'@Modules.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_mptest9_RowPointer', 17, 1, N'MG_1', N'@mptest9.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_MyNewTestForm_RowPointer', 17, 1, N'MG_1', N'@MyNewTestForm.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_NewColumnStaging_RowPointer', 17, 1, N'MG_1', N'@NewColumnStaging.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_NoteHeaders_RowPointer', 17, 1, N'MG_1', N'@NoteHeaders.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_NotesSiteMap_RowPointer', 17, 1, N'MG_1', N'@NotesSiteMap.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ObjectNotes_RowPointer', 17, 1, N'MG_1', N'@ObjectNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ObjSE_RowPointer', 17, 1, N'MG_1', N'@ObjectSentEmail.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ObjSE_RowPointer', 17, 2, N'MG_1', N'@ObjectSentEmail.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_OutriggerProfile_RowPointer', 17, 1, N'MG_1', N'@OutriggerProfile.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_OutriggerProfileOptions_RowPointer', 17, 1, N'MG_1', N'@OutriggerProfileOptions.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_PasswordParameters_RowPointer', 17, 1, N'MG_1', N'@PasswordParameters.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_PK_Test_RowPointer', 17, 1, N'MG_1', N'@PK_Test.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Printer_RowPointer', 17, 1, N'MG_1', N'@Printer.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ProcessErrorLog', 17, 1, N'MG_1', N'@ProcessErrorLog.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'IX_ProcessErrorLog', 17, 2, N'MG_1', N'@ProcessErrorLog.ProcessID'
GO

EXEC AddObjectBuildMessageSp  N'IX_ProcessLineNumbers_RowPointer', 17, 1, N'MG_1', N'@ProcessLineNumbers.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ProductPatches_RowPointer', 17, 1, N'MG_1', N'@ProductPatches.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ProductVersion_RowPointer', 17, 1, N'MG_1', N'@ProductVersion.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_Publication_RowPointer', 17, 1, N'MG_1', N'@Publication.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationCategory_RowPointer', 17, 1, N'MG_1', N'@PublicationCategory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationCategoryPublication_RowPointer', 17, 1, N'MG_1', N'@PublicationCategoryPublication.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, 1, N'MG_1', N'@PublicationSubscriber.Email'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, 2, N'MG_1', N'@PublicationSubscriber.KeyValue'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, 3, N'MG_1', N'@PublicationSubscriber.KeyValue2'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, 4, N'MG_1', N'@PublicationSubscriber.PublicationName'
GO

EXEC AddObjectBuildMessageSp  N'IX_PublicationSubscriber_Username_Email_KeyValues', 17, 5, N'MG_1', N'@PublicationSubscriber.Username'
GO

EXEC AddObjectBuildMessageSp  N'IX_rep_category_RowPointer', 17, 1, N'MG_1', N'@rep_category.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_rep_object_category_RowPointer', 17, 1, N'MG_1', N'@rep_object_category.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_rep_rule_RowPointer', 17, 1, N'MG_1', N'@rep_rule.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocAttribute_DocumentName', 17, 1, N'MG_1', N'@ReplDocAttribute.AttributeName'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocAttribute_DocumentName', 17, 2, N'MG_1', N'@ReplDocAttribute.DocumentName'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocAttribute_DocumentName', 17, 3, N'MG_1', N'@ReplDocAttribute.ElementRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocInbound_BODNoun', 17, 1, N'MG_1', N'@ReplDocInbound.BODNoun'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocInbound_BODNoun', 17, 2, N'MG_1', N'@ReplDocInbound.BODVerb'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocOutbound_AppliesToIDOName', 17, 1, N'MG_1', N'@ReplDocOutbound.AppliesToIDOAction'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocOutbound_AppliesToIDOName', 17, 2, N'MG_1', N'@ReplDocOutbound.AppliesToIDOMethodName'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocOutbound_AppliesToIDOName', 17, 3, N'MG_1', N'@ReplDocOutbound.AppliesToIDOName'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocOutbound_AppliesToIDOName', 17, 4, N'MG_1', N'@ReplDocOutbound.intranet_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocOutboundFilter_RowPointer', 17, 1, N'MG_1', N'@ReplDocOutboundFilter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocument_AppliesToIDOName', 17, 2, N'MG_754'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocument_AppliesToIDOName', 17, 3, N'MG_755'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocument_AppliesToIDOName', 17, 4, N'MG_756'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplDocument_RowPointer', 17, 1, N'MG_1', N'@ReplDocument.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplicatedRows3_mst_RowPointer', 17, 1, N'MG_1', N'@ReplicatedRows3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplicatedRows3_mst_RowPointer', 17, 2, N'MG_1', N'@ReplicatedRows3.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplicatedRowsErrors_mst_RowPointer', 17, 1, N'MG_1', N'@ReplicatedRowsErrors.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReplicatedRowsErrors_mst_RowPointer', 17, 2, N'MG_1', N'@ReplicatedRowsErrors.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReportOptions_mst_RowPointer', 17, 1, N'MG_1', N'@ReportOptions.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReportOptions_mst_RowPointer', 17, 2, N'MG_1', N'@ReportOptions.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_ReusableNotesToSite_RowPointer', 17, 1, N'MG_1', N'@ReusableNotesToSite.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt', 17, 1, N'MG_1', N'@rpt_opt.form_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt', 17, 2, N'MG_1', N'@rpt_opt.id'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt', 17, 3, N'MG_1', N'@rpt_opt.UserId'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt_values', 17, 1, N'MG_1', N'@rpt_opt_values.comp_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt_values', 17, 2, N'MG_1', N'@rpt_opt_values.form_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt_values', 17, 3, N'MG_1', N'@rpt_opt_values.id'
GO

EXEC AddObjectBuildMessageSp  N'IX_rpt_opt_values', 17, 4, N'MG_1', N'@rpt_opt_values.UserId'
GO

EXEC AddObjectBuildMessageSp  N'IX_rv_Customer_RowPointer', 17, 1, N'MG_1', N'@rv_Customer.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_rvCustomer_RowPointer', 17, 1, N'MG_1', N'@rvCustomer.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_rv-Customer_RowPointer', 17, 1, N'MG_1', N'@rv-Customer.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_satTest_RowPointer', 17, 1, N'MG_1', N'@satTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SearchItem_RowPointer', 17, 1, N'MG_1', N'@SearchItem.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SearchItem_Table_Column', 17, 1, N'MG_1', N'@SearchItem.ColumnName'
GO

EXEC AddObjectBuildMessageSp  N'IX_SearchItem_Table_Column', 17, 2, N'MG_1', N'@SearchItem.TableName'
GO

EXEC AddObjectBuildMessageSp  N'IX_SearchPreferenceList_RowPointer', 17, 1, N'MG_1', N'@SearchPreferenceList.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SessionContextNames_RowPointer', 17, 1, N'MG_1', N'@SessionContextNames.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ShadowValuesErrors_mst_RowPointer', 17, 1, N'MG_1', N'@ShadowValuesErrors.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_ShadowValuesErrors_mst_RowPointer', 17, 2, N'MG_1', N'@ShadowValuesErrors.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_group_RowPointer', 17, 1, N'MG_1', N'@site_group.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_hierarchy', 17, 1, N'MG_1', N'@site_hierarchy.eff_date'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_hierarchy', 17, 2, N'MG_1', N'@site_hierarchy.reports_to_site'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_hierarchy', 17, 3, N'MG_1', N'@site_hierarchy.site'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_link_info_RowPointer', 17, 1, N'MG_1', N'@site_link_info.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_site_RowPointer', 17, 1, N'MG_1', N'@site.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SiteConnectionInformation_RowPointer', 17, 1, N'MG_1', N'@SiteConnectionInformation.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SiteTypeModuleMap_RowPointer', 17, 1, N'MG_1', N'@SiteTypeModuleMap.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SiteUserMap_RowPointer', 17, 1, N'MG_1', N'@SiteUserMap.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SoHoOrgChart_RowPointer', 17, 1, N'MG_1', N'@SoHoOrgChart.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SpecificNotes_RowPointer', 17, 1, N'MG_1', N'@SpecificNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_system_type_RowPointer', 17, 1, N'MG_1', N'@system_type.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_SystemNotes_RowPointer', 17, 1, N'MG_1', N'@SystemNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_table_class_committed_RowPointer', 17, 1, N'MG_1', N'@table_class_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_table_class_impacted_RowPointer', 17, 1, N'MG_1', N'@table_class_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_table_class_RowPointer', 17, 1, N'MG_1', N'@table_class.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_testkeys_RowPointer', 17, 1, N'MG_1', N'@TestKeys.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TestsIDO_RowPointer', 17, 1, N'MG_1', N'@TestsIDO.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TestTableGoutam_RowPointer', 17, 1, N'MG_1', N'@TestTableGoutam.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TestTableRS5345_RowPointer', 17, 1, N'MG_1', N'@TestTableRS5345.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TestTaskName_RowPointer', 17, 1, N'MG_1', N'@TestTaskName.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TimeZoneData_RowPointer', 17, 1, N'MG_1', N'@TimeZoneData.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_ClassNotes_RowPointer', 17, 1, N'MG_1', N'@tmp_ClassNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentObject_RowPointer', 17, 1, N'MG_1', N'@tmp_DocumentObject.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentObjectReference_RowPointer', 17, 1, N'MG_1', N'@tmp_DocumentObjectReference.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 1, N'MG_1', N'@tmp_DocumentObjectReference.RefSequence'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 2, N'MG_1', N'@tmp_DocumentObjectReference.TableName'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentObjectReference_TableName_RowPointer_RefSequence', 17, 3, N'MG_1', N'@tmp_DocumentObjectReference.TableRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_DocumentType_RowPointer', 17, 1, N'MG_1', N'@tmp_DocumentType.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_NoteHeaders_RowPointer', 17, 1, N'MG_1', N'@tmp_NoteHeaders.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_ObjectNotes_RowPointer', 17, 1, N'MG_1', N'@tmp_ObjectNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_SpecificNotes_RowPointer', 17, 1, N'MG_1', N'@tmp_SpecificNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_SystemNotes_RowPointer', 17, 1, N'MG_1', N'@tmp_SystemNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_tmp_UserNotes_RowPointer', 17, 1, N'MG_1', N'@tmp_UserNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TmpEventHandler_Event_Sequence', 17, 1, N'MG_1', N'@TmpEventHandler.EventName'
GO

EXEC AddObjectBuildMessageSp  N'IX_TmpEventHandler_Event_Sequence', 17, 2, N'MG_1', N'@TmpEventHandler.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'IX_TmpStagingNewDataMaintenance_RowPointer', 17, 1, N'MG_1', N'@TmpStagingNewDataMaintenance.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TonyTest_RowPointer', 17, 1, N'MG_1', N'@TonyTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_1_RowPointer', 17, 1, N'MG_1', N'@TPB_1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_2_RowPointer', 17, 1, N'MG_1', N'@TPB_2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_3_RowPointer', 17, 1, N'MG_1', N'@TPB_3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_NDMW_MV_RowPointer', 17, 1, N'MG_1', N'@TPB_NDMW_MV.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_ReqCTD_RowPointer', 17, 1, N'MG_1', N'@TPB_ReqCTD.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_SUB_1_RowPointer', 17, 1, N'MG_1', N'@TPB_SUB_1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_SUB_2_RowPointer', 17, 1, N'MG_1', N'@TPB_SUB_2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB_SUB_3_RowPointer', 17, 1, N'MG_1', N'@TPB_SUB_3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPB99_RowPointer', 17, 1, N'MG_1', N'@TPB99.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPBNDMWLang_RowPointer', 17, 1, N'MG_1', N'@TPBNDMWLang.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPBRounding_RowPointer', 17, 1, N'MG_1', N'@TPBRounding.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPBTest_1_RowPointer', 17, 1, N'MG_1', N'@TPBTest_1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TPBTest_174213_RowPointer', 17, 1, N'MG_1', N'@TPBTest_174213.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TrackRows_All', 17, 1, N'MG_1', N'@TrackRows.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_TrackRows_All', 17, 2, N'MG_1', N'@TrackRows.SessionID'
GO

EXEC AddObjectBuildMessageSp  N'IX_TrackRows_All', 17, 3, N'MG_1', N'@TrackRows.TrackedOperType'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_committed_RowPointer', 17, 1, N'MG_1', N'@user_class_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_fld_committed_RowPointer', 17, 1, N'MG_1', N'@user_class_fld_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_fld_impacted_RowPointer', 17, 1, N'MG_1', N'@user_class_fld_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_fld_RowPointer', 17, 1, N'MG_1', N'@user_class_fld.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_impacted_RowPointer', 17, 1, N'MG_1', N'@user_class_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_record_assoc_RowPointer', 17, 1, N'MG_1', N'@user_class_record_assoc.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_class_RowPointer', 17, 1, N'MG_1', N'@user_class.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_fld_committed_RowPointer', 17, 1, N'MG_1', N'@user_fld_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_fld_impacted_RowPointer', 17, 1, N'MG_1', N'@user_fld_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_fld_RowPointer', 17, 1, N'MG_1', N'@user_fld.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_committed_RowPointer', 17, 1, N'MG_1', N'@user_index_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_committed_fld_name', 17, 1, N'MG_1', N'@user_index_fld_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_committed_fld_name', 17, 2, N'MG_1', N'@user_index_fld_committed.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_committed_fld_name', 17, 3, N'MG_1', N'@user_index_fld_committed.index_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_committed_RowPointer', 17, 1, N'MG_1', N'@user_index_fld_committed.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_fld_name', 17, 1, N'MG_1', N'@user_index_fld.class_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_fld_name', 17, 2, N'MG_1', N'@user_index_fld.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_fld_name', 17, 3, N'MG_1', N'@user_index_fld.index_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_impacted_fld_name', 17, 1, N'MG_1', N'@user_index_fld_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_impacted_fld_name', 17, 2, N'MG_1', N'@user_index_fld_impacted.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_impacted_fld_name', 17, 3, N'MG_1', N'@user_index_fld_impacted.index_name'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_impacted_RowPointer', 17, 1, N'MG_1', N'@user_index_fld_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_fld_RowPointer', 17, 1, N'MG_1', N'@user_index_fld.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_impacted_RowPointer', 17, 1, N'MG_1', N'@user_index_impacted.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_user_index_RowPointer', 17, 1, N'MG_1', N'@user_index.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserDefinedFields_RowId', 17, 1, N'MG_1', N'@UserDefinedFields.RowId'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserEmail_Username_Type', 17, 1, N'MG_1', N'@UserEmail.Username'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserEmail_Username_Type', 17, 2, N'MG_1', N'@UserEmail.EmailType'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserGroupMap_mst_RowPointer', 17, 1, N'MG_1', N'@UserGroupMap.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserGroupMap_mst_RowPointer', 17, 2, N'MG_1', N'@UserGroupMap.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserModules_RowPointer', 17, 1, N'MG_1', N'@UserModules.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserNames_RowPointer', 17, 1, N'MG_1', N'@UserNames.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserNotes_RowPointer', 17, 1, N'MG_1', N'@UserNotes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserPasswordHistory_RowPointer', 17, 1, N'MG_1', N'@UserPasswordHistory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_UserTask_RowPointer', 17, 1, N'MG_1', N'@UserTask.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBCategory_RowPointer', 17, 1, N'MG_1', N'@WBCategory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBCategoryUser_RowPointer', 17, 1, N'MG_1', N'@WBCategoryUser.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataView_RowPointer', 17, 1, N'MG_1', N'@WBDataView.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 1, N'MG_1', N'@WBDataViewAction.ScopeType'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 2, N'MG_1', N'@WBDataViewAction.ScopeName'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 3, N'MG_1', N'@WBDataViewAction.ClassName'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 4, N'MG_1', N'@WBDataViewAction.IDOName'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 5, N'MG_1', N'@WBDataViewAction.PropertyName'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewAction_ScopeType', 17, 6, N'MG_1', N'@WBDataViewAction.Caption'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewColumn_RowPointer', 17, 1, N'MG_1', N'@WBDataViewColumn.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewGroup_RowPointer', 17, 1, N'MG_1', N'@WBDataViewGroup.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewIDO_RowPointer', 17, 1, N'MG_1', N'@WBDataViewIDO.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewLayout_RowPointer', 17, 1, N'MG_1', N'@WBDataViewLayout.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewParameter_RowPointer', 17, 1, N'MG_1', N'@WBDataViewParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDataViewUser_RowPointer', 17, 1, N'MG_1', N'@WBDataViewUser.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDrilldown_RowPointer', 17, 1, N'MG_1', N'@WBDrilldown.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDrilldownCategory_RowPointer', 17, 1, N'MG_1', N'@WBDrilldownCategory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDrilldownColumn_RowPointer', 17, 1, N'MG_1', N'@WBDrilldownColumn.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDrilldownFilter_RowPointer', 17, 1, N'MG_1', N'@WBDrilldownFilter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBDrilldownParameter_RowPointer', 17, 1, N'MG_1', N'@WBDrilldownParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPI_RowPointer', 17, 1, N'MG_1', N'@WBKPI.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPICategory_RowPointer', 17, 1, N'MG_1', N'@WBKPICategory.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPIDrilldown_RowPointer', 17, 1, N'MG_1', N'@WBKPIDrilldown.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPIFilter_RowPointer', 17, 1, N'MG_1', N'@WBKPIFilter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPIParameter_RowPointer', 17, 1, N'MG_1', N'@WBKPIParameter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBKPIUser_RowPointer', 17, 1, N'MG_1', N'@WBKPIUser.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBParameters_RowPointer', 17, 1, N'MG_1', N'@WBParameters.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSet_RowPointer', 17, 1, N'MG_1', N'@WBSearchSet.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSource_RowPointer', 17, 1, N'MG_1', N'@WBSearchSource.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSourceColumn_RowPointer', 17, 1, N'MG_1', N'@WBSearchSourceColumn.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSourceGroup_RowPointer', 17, 1, N'MG_1', N'@WBSearchSourceGroup.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSourceItem_RowPointer', 17, 1, N'MG_1', N'@WBSearchSourceItem.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSourceSet_RowPointer', 17, 1, N'MG_1', N'@WBSearchSourceSet.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSearchSourceUser_RowPointer', 17, 1, N'MG_1', N'@WBSearchSourceUser.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSnapshot_RowPointer', 17, 1, N'MG_1', N'@WBSnapshot.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WBSubDrilldown_RowPointer', 17, 1, N'MG_1', N'@WBSubDrilldown.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WEB_Product_RowPointer', 17, 1, N'MG_1', N'@WEB_Product.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_WPFTestGM_RowPointer', 17, 1, N'MG_1', N'@WPFTestGM.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x10_RowPointer', 17, 1, N'MG_1', N'@x10.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x12_RowPointer', 17, 1, N'MG_1', N'@x12.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x13_RowPointer', 17, 1, N'MG_1', N'@x13.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x14_RowPointer', 17, 1, N'MG_1', N'@x14.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x15_RowPointer', 17, 1, N'MG_1', N'@x15.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x17_RowPointer', 17, 1, N'MG_1', N'@x17.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x19_RowPointer', 17, 1, N'MG_1', N'@x19.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x2_RowPointer', 17, 1, N'MG_1', N'@x2.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x20_RowPointer', 17, 1, N'MG_1', N'@x20.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x21_RowPointer', 17, 1, N'MG_1', N'@x21.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x3_RowPointer', 17, 1, N'MG_1', N'@x3.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x4_RowPointer', 17, 1, N'MG_1', N'@x4.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x5_RowPointer', 17, 1, N'MG_1', N'@x5.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x7_RowPointer', 17, 1, N'MG_1', N'@x7.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x8_RowPointer', 17, 1, N'MG_1', N'@x8.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_x9_RowPointer', 17, 1, N'MG_1', N'@x9.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'IX_xz1_RowPointer', 17, 1, N'MG_1', N'@xz1.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'lead_time:item:INSERT', 5, 1, N'MG_400'
GO

EXEC AddObjectBuildMessageSp  N'LoginCfgIx0', 17, 1, N'MG_1', N'@LoginCfg.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'MessageTypesIx0', 17, 1, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'MessageTypesIx2', 17, 1, N'MG_438'
GO

EXEC AddObjectBuildMessageSp  N'MessageTypesRcx', 17, 1, N'MG_1', N'@MessageTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'MtpMessageCodeUpr', 17, 1, N'MG_438'
GO

EXEC AddObjectBuildMessageSp  N'NheNoteFlagCk1', 17, 1, N'MG_440'
GO

EXEC AddObjectBuildMessageSp  N'NoteHeadersIx0', 17, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'NoteHeadersIx2', 17, 1, N'MG_439'
GO

EXEC AddObjectBuildMessageSp  N'NoteHeadersIx2', 17, 2, N'MG_440'
GO

EXEC AddObjectBuildMessageSp  N'NoteTypesIx0', 17, 1, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'NoteTypesRcx', 17, 1, N'MG_1', N'@NoteTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessages', 0, 1, N'MG_459'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessages', 4, 1, N'MG_459'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesFk2', 17, 1, N'MG_1', N'@ObjectMainMessages.MessageType'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesFk2', 17, 2, N'MG_1', N'@ObjectMainMessages.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesFk2', 18, 1, N'MG_1', N'@ObjectBuildMessages'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesFk2', 18, 2, N'MG_1', N'@ObjectMainMessages.MessageType'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesFk2', 18, 3, N'MG_1', N'@ObjectMainMessages.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesIx0', 17, 1, N'MG_422'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesIx0', 17, 2, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesIx0', 17, 3, N'MG_426'
GO

EXEC AddObjectBuildMessageSp  N'ObjectBuildMessagesRcx', 17, 1, N'MG_1', N'@ObjectBuildMessages.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessages', 1, 1, N'MG_422'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessages', 1, 2, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessages', 4, 1, N'MG_460'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesFk1', 17, 1, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesFk1', 18, 1, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesFk2', 17, 1, N'MG_421'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesFk2', 18, 1, N'MG_421'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesIx0', 17, 1, N'MG_422'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesIx0', 17, 2, N'MG_420'
GO

EXEC AddObjectBuildMessageSp  N'ObjectMainMessagesRcx', 17, 1, N'MG_1', N'@ObjectMainMessages.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk1', 17, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk1', 18, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk2', 17, 1, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk2', 18, 1, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk3', 17, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk3', 18, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk4', 17, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk4', 18, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk5', 17, 1, N'MG_431'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesFk5', 18, 1, N'MG_431'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx0', 17, 1, N'MG_435'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 1, N'MG_430'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 2, N'MG_429'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 3, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 4, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 5, N'MG_431'
GO

EXEC AddObjectBuildMessageSp  N'ObjectNotesIx2', 17, 6, N'MG_428'
GO

EXEC AddObjectBuildMessageSp  N'ObjectTypesIx0', 17, 1, N'MG_421'
GO

EXEC AddObjectBuildMessageSp  N'ObjectTypesIx2', 17, 1, N'MG_442'
GO

EXEC AddObjectBuildMessageSp  N'ObjectTypesRcx', 17, 1, N'MG_1', N'@ObjectTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'ObmSequenceNoCk1', 17, 1, N'MG_426'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectDependsIx1', 17, 1, N'MG_1', N'@ODTObjectDepends.ChildObjectID'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectDependsIx1', 17, 2, N'MG_1', N'@ODTObjectDepends.ChildType'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectDependsIx1', 17, 3, N'MG_1', N'@ODTObjectDepends.ParentObjectID'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectDependsIx1', 17, 4, N'MG_1', N'@ODTObjectDepends.ParentType'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectsIx1', 17, 1, N'MG_1', N'@ODTObjects.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'ODTObjectsRcx', 17, 1, N'MG_1', N'@ODTObjects.ObjectID'
GO

EXEC AddObjectBuildMessageSp  N'ODTTableColumnsIx1', 17, 1, N'MG_1', N'@ODTTableColumns.ColumnID'
GO

EXEC AddObjectBuildMessageSp  N'ODTTableColumnsIx1', 17, 2, N'MG_1', N'@ODTTableColumns.TableID'
GO

EXEC AddObjectBuildMessageSp  N'OmmMessageSeverityCk1', 17, 1, N'MG_441'
GO

EXEC AddObjectBuildMessageSp  N'OtyObjectCodeUpr', 17, 1, N'MG_442'
GO

EXEC AddObjectBuildMessageSp  N'OutputFormat', 8, 1, N'MG_448'
GO

EXEC AddObjectBuildMessageSp  N'OutputFormatsIx1', 17, 1, N'MG_448'
GO

EXEC AddObjectBuildMessageSp  N'parmsFk7', 17, 1, N'MG_1', N'@parms.site'
GO

EXEC AddObjectBuildMessageSp  N'parmsFk7', 18, 1, N'MG_1', N'@parms'
GO

EXEC AddObjectBuildMessageSp  N'parmsFk7', 18, 2, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'PerLineNumCk1', 17, 1, N'MG_1', N'@ProcessErrorLog.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'PerLineNumCk1', 17, 2, N'MG_1445'
GO

EXEC AddObjectBuildMessageSp  N'PK__look_dat__C239006859717D86', 17, 1, N'MG_1', N'@look_data.main_id'
GO

EXEC AddObjectBuildMessageSp  N'PK__Property__45BA1E9B7DD0703B', 17, 1, N'MG_1', N'@PropertyLabels.CollectionName'
GO

EXEC AddObjectBuildMessageSp  N'PK__Property__45BA1E9B7DD0703B', 17, 2, N'MG_1', N'@PropertyLabels.PropertyName'
GO

EXEC AddObjectBuildMessageSp  N'PK__sysdiagrams__1EE1BBE2', 17, 1, N'MG_1', N'@sysdiagrams.diagram_id'
GO

EXEC AddObjectBuildMessageSp  N'PK__testbod__607AFDE042CFA5FE', 17, 1, N'MG_1', N'@testbod.keyid'
GO

EXEC AddObjectBuildMessageSp  N'PK__testit__BA94ED2927C6AA07', 17, 1, N'MG_1', N'@testit.data1'
GO

EXEC AddObjectBuildMessageSp  N'PK__yyy__BA94ED2938FC2301', 17, 1, N'MG_1', N'@yyy.data1'
GO

EXEC AddObjectBuildMessageSp  N'PK_AaInvoices_RID', 17, 1, N'MG_1', N'@AaInvoices.RID'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 1, N'MG_1', N'@AccountAuthorizations.Id'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 2, N'MG_1', N'@AccountAuthorizations.ObjectName1'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 3, N'MG_1', N'@AccountAuthorizations.ObjectName2'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 4, N'MG_1', N'@AccountAuthorizations.ObjectType'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 5, N'MG_1', N'@AccountAuthorizations.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_AccountAuthorizations_mst', 17, 6, N'MG_1', N'@AccountAuthorizations.UserFlag'
GO

EXEC AddObjectBuildMessageSp  N'PK_ActiveBGTasks_mst', 17, 1, N'MG_1', N'@ActiveBGTasks.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_ActiveBGTasks_mst', 17, 2, N'MG_1', N'@ActiveBGTasks.TaskNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_AppColumn', 17, 1, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'PK_AppColumn', 17, 2, N'MG_569'
GO

EXEC AddObjectBuildMessageSp  N'PK_ApplicationMessages', 17, 1, N'MG_1', N'@ApplicationMessages.MessageLanguage'
GO

EXEC AddObjectBuildMessageSp  N'PK_ApplicationMessages', 17, 2, N'MG_1', N'@ApplicationMessages.MessageNo'
GO

EXEC AddObjectBuildMessageSp  N'PK_AppModule', 17, 1, N'MG_1', N'@AppModule.ModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_AppTable', 17, 1, N'MG_1', N'@AppTable.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_AppView', 17, 1, N'MG_1', N'@AppView.ViewName'
GO

EXEC AddObjectBuildMessageSp  N'PK_BGTaskHistory_mst', 17, 1, N'MG_1', N'@BGTaskHistory.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_BGTaskHistory_mst', 17, 2, N'MG_1', N'@BGTaskHistory.TaskNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_blob_test_tbl', 17, 1, N'MG_1', N'@blob_test_tbl.tbl_id'
GO

EXEC AddObjectBuildMessageSp  N'PK_BODTemplate', 17, 1, N'MG_839'
GO

EXEC AddObjectBuildMessageSp  N'PK_BPProduct', 17, 1, N'MG_1', N'@BPProduct.BusinessPartnerName'
GO

EXEC AddObjectBuildMessageSp  N'PK_BPProduct', 17, 2, N'MG_1', N'@BPProduct.Product'
GO

EXEC AddObjectBuildMessageSp  N'PK_cbNDMW', 17, 1, N'MG_1', N'@cbNDMW.FirstName'
GO

EXEC AddObjectBuildMessageSp  N'PK_cbNDMW', 17, 2, N'MG_1', N'@cbNDMW.LastName'
GO

EXEC AddObjectBuildMessageSp  N'PK_cbTestNDMW', 17, 1, N'MG_1', N'@cbTestNDMW.CustomerID'
GO

EXEC AddObjectBuildMessageSp  N'PK_ConfigParms', 17, 1, N'MG_1', N'@ConfigParms.ConfigurationName'
GO

EXEC AddObjectBuildMessageSp  N'PK_COR_INBOX_ENTRY', 17, 1, N'MG_1', N'@COR_INBOX_ENTRY.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_COR_INBOX_HEADERS', 17, 1, N'MG_1', N'@COR_INBOX_HEADERS.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_COR_OUTBOX_ENTRY', 17, 1, N'MG_1', N'@COR_OUTBOX_ENTRY.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_COR_OUTBOX_HEADERS', 17, 1, N'MG_1', N'@COR_OUTBOX_HEADERS.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_COR_PROPERTY', 17, 1, N'MG_1', N'@COR_PROPERTY.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_CountryPack', 17, 1, N'MG_1', N'@CountryPack.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_CountryPack', 17, 2, N'MG_1', N'@CountryPack.Option'
GO

EXEC AddObjectBuildMessageSp  N'PK_DatabaseLocations', 17, 1, N'MG_1', N'@MGDataSources.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_DBStatus', 17, 1, N'MG_1', N'@DBStatus.ParmKey'
GO

EXEC AddObjectBuildMessageSp  N'PK_DefineVariables', 17, 1, N'MG_1', N'@DefineVariables.ConnectionID'
GO

EXEC AddObjectBuildMessageSp  N'PK_DefineVariables', 17, 2, N'MG_1', N'@DefineVariables.VariableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_DemoOrders', 17, 1, N'MG_1', N'@DemoOrders.OrderNo'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocTypeFormProperty', 17, 1, N'MG_1', N'@DocTypeFormProperty.DocumentType'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocTypeFormProperty', 17, 2, N'MG_1', N'@DocTypeFormProperty.FormName'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocTypeFormProperty', 17, 3, N'MG_1', N'@DocTypeFormProperty.PropertyName'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocTypeFormProperty', 17, 4, N'MG_1', N'@DocTypeFormProperty.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentObject', 17, 1, N'MG_747'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentObject', 17, 2, N'MG_792'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentObjectReference', 17, 1, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentObjectReference', 17, 2, N'MG_794'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentObjectReference', 17, 3, N'MG_795'
GO

EXEC AddObjectBuildMessageSp  N'PK_DocumentType', 17, 1, N'MG_791'
GO

EXEC AddObjectBuildMessageSp  N'pk_dtproperties', 17, 1, N'MG_1', N'@dtproperties.id'
GO

EXEC AddObjectBuildMessageSp  N'pk_dtproperties', 17, 2, N'MG_1', N'@dtproperties.property'
GO

EXEC AddObjectBuildMessageSp  N'PK_EmailTemplate_mst', 17, 1, N'MG_1', N'@EmailTemplate.FormName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EmailTemplate_mst', 17, 2, N'MG_1', N'@EmailTemplate.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_EmailTemplate_mst', 17, 3, N'MG_1', N'@EmailTemplate.TemplateName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EmailType', 17, 1, N'MG_1', N'@EmailType.EmailType'
GO

EXEC AddObjectBuildMessageSp  N'PK_ESB_INBOUND_DUPLICATE', 17, 1, N'MG_1', N'@ESB_INBOUND_DUPLICATE.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_ESB_PREVIOUS_VERSION_MEDIATION', 17, 1, N'MG_1', N'@ESB_PREVIOUS_VERSION_MEDIATION.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_ESB_VARIATION_ID_MEDIATION', 17, 1, N'MG_1', N'@ESB_VARIATION_ID_MEDIATION.C_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_Event', 17, 1, N'MG_1', N'@Event.EventName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventAction', 17, 1, N'MG_1', N'@EventAction.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventActionState', 17, 1, N'MG_1', N'@EventActionState.EventActionRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventActionState', 17, 2, N'MG_1', N'@EventActionState.EventHandlerStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventActionVariableAccess', 17, 1, N'MG_1', N'@EventActionVariableAccess.EventActionRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventActionVariableAccess', 17, 2, N'MG_1', N'@EventActionVariableAccess.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventDocument', 17, 1, N'MG_1', N'@EventDocument.EventStateId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventDocument', 17, 2, N'MG_1', N'@EventDocument.RefSequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventDocumentObject', 17, 1, N'MG_1', N'@EventDocumentObject.DocumentName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventDocumentObject', 17, 2, N'MG_1', N'@EventDocumentObject.EventStateId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventDocumentObject', 17, 3, N'MG_1', N'@EventDocumentObject.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventGlobalConstant_mst', 17, 1, N'MG_1', N'@EventGlobalConstant.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventGlobalConstant_mst', 17, 2, N'MG_1', N'@EventGlobalConstant.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventHandler', 17, 1, N'MG_1', N'@EventHandler'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventHandlerRevision', 17, 1, N'MG_1', N'@EventHandlerRevision.EventRevisionRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventHandlerRevision', 17, 2, N'MG_1', N'@EventHandlerRevision.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventHandlerState', 17, 1, N'MG_1', N'@EventHandlerState.EventHandlerRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventHandlerState', 17, 2, N'MG_1', N'@EventHandlerState.EventStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventInitialState', 17, 1, N'MG_1', N'@EventInitialState.InitialStateName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventInitialVariable', 17, 1, N'MG_1', N'@EventInitialVariable.EventInitialStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventInitialVariable', 17, 2, N'MG_1', N'@EventInitialVariable.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventInputParameter', 17, 1, N'MG_1', N'@EventInputParameter.EventParmId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventInputParameter', 17, 2, N'MG_1', N'@EventInputParameter.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventMessage', 17, 1, N'MG_1', N'@EventMessage.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventMessageCategory', 17, 1, N'MG_1', N'@EventMessageCategory.Category'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventMessageVariable', 17, 1, N'MG_1', N'@EventMessageVariable.EventMessageId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventMessageVariable', 17, 2, N'MG_1', N'@EventMessageVariable.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventOutputParameter', 17, 1, N'MG_1', N'@EventOutputParameter.EventParmId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventOutputParameter', 17, 2, N'MG_1', N'@EventOutputParameter.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventParameter', 17, 1, N'MG_1', N'@EventParameter.EventParmId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventParameter', 17, 2, N'MG_1', N'@EventParameter.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventQueue_mst', 17, 1, N'MG_1', N'@EventQueue.Id'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventQueue_mst', 17, 2, N'MG_1', N'@EventQueue.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventRevision', 17, 1, N'MG_1', N'@EventRevision.EventName'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventRevision', 17, 2, N'MG_1', N'@EventRevision.EventRevision'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventSessionTally', 17, 1, N'MG_1', N'@EventSessionTally.Choice'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventSessionTally', 17, 2, N'MG_1', N'@EventSessionTally.EventHandlerStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventSessionTally', 17, 3, N'MG_1', N'@EventSessionTally.EventStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventSessionTally', 17, 4, N'MG_1', N'@EventSessionTally.SessionID'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventState', 17, 1, N'MG_1', N'@EventState.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventStateGroup', 17, 1, N'MG_1', N'@EventStateGroup.EventGroupId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventStateGroup', 17, 2, N'MG_1', N'@EventStateGroup.EventStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventTrigger_mst', 17, 1, N'MG_1', N'@EventTrigger.EventTriggerId'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventTrigger_mst', 17, 2, N'MG_1', N'@EventTrigger.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventTriggerParameter_mst', 17, 1, N'MG_1', N'@EventTriggerParameter.EventTriggerRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventTriggerParameter_mst', 17, 2, N'MG_1', N'@EventTriggerParameter.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventTriggerParameter_mst', 17, 3, N'MG_1', N'@EventTriggerParameter.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventVariable', 17, 1, N'MG_1', N'@EventVariable.EventHandlerStateRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_EventVariable', 17, 2, N'MG_1', N'@EventVariable.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_ExtendableStoredProcedure', 17, 1, N'MG_1', N'@ExtendableStoredProcedure.ProcedureName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ExternalDataStore', 17, 1, N'MG_1', N'@ExternalDataStore.AccessKey'
GO

EXEC AddObjectBuildMessageSp  N'PK_ExtSystemTransLog', 17, 1, N'MG_1', N'@ExtSystemTransLog.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_FileServer', 17, 1, N'MG_1', N'@FileServer.ServerName'
GO

EXEC AddObjectBuildMessageSp  N'PK_Galactic', 17, 1, N'MG_1', N'@Galactic.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_HAACLASSTEST', 17, 1, N'MG_1', N'@HAACLASSTEST.NAME'
GO

EXEC AddObjectBuildMessageSp  N'PK_HAAIdoProjects', 17, 1, N'MG_1', N'@HAAIdoProjects.PROJECT_ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_IDOAliases', 17, 1, N'MG_1', N'@IDOAliases.AliasProgID'
GO

EXEC AddObjectBuildMessageSp  N'PK_IDOFilter', 17, 1, N'MG_1', N'@IDOFilter.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedColumn', 17, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedColumn', 17, 2, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedColumn', 17, 3, N'MG_569'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedDatabase', 17, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedTable', 17, 1, N'MG_843'
GO

EXEC AddObjectBuildMessageSp  N'PK_IdoLinkedTable', 17, 2, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'PK_intranet', 17, 1, N'MG_1', N'@intranet.intranet_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetReports', 17, 1, N'MG_1', N'@IntranetReports.intranet_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetReports', 17, 2, N'MG_1', N'@IntranetReports.BGReportType'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetSharedTable', 17, 1, N'MG_1', N'@IntranetSharedTable.intranet_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetSharedTable', 17, 2, N'MG_1', N'@IntranetSharedTable.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetSharedUserTable', 17, 1, N'MG_1', N'@IntranetSharedUserTable.IntranetName'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetSharedUserTable', 17, 2, N'MG_1', N'@IntranetSharedUserTable.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_IntranetSharedUserTableDefault', 17, 1, N'MG_1', N'@IntranetSharedUserTableDefault.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_Issue_179366', 17, 1, N'MG_1', N'@Issue_179366.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_LanguageIDs', 17, 1, N'MG_1', N'@LanguageIDs.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_License', 17, 1, N'MG_1', N'@License.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_LongRowPointerMap', 17, 1, N'MG_1', N'@LongRowPointerMap.LongRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_LongRowPointerMap', 17, 2, N'MG_1', N'@LongRowPointerMap.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'PK_mcbColLengthTest', 17, 1, N'MG_1', N'@mcbColLengthTest.ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_MethodParameters', 17, 1, N'MG_1', N'@IDOMethodParameters.ParameterName'
GO

EXEC AddObjectBuildMessageSp  N'PK_MethodResultSets', 17, 1, N'MG_1', N'@IDOMethodParameters.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_Methods', 17, 1, N'MG_1', N'@IDOMethods.MethodName'
GO

EXEC AddObjectBuildMessageSp  N'PK_MGBUSDocuments', 17, 1, N'MG_1', N'@MGBUSDocuments.DocumentName'
GO

EXEC AddObjectBuildMessageSp  N'PK_MGBUSElements', 17, 1, N'MG_1', N'@MGBUSElements.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_MGBUSElementsAttributes', 17, 1, N'MG_1', N'@MGBUSElementAttributes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_MGDataSourceMap', 17, 1, N'MG_1', N'@MGDataSourceMaps.ProgID'
GO

EXEC AddObjectBuildMessageSp  N'PK_MGDataSourceMap', 17, 2, N'MG_1', N'@MGDataSourceMaps.DefaultDataSource'
GO

EXEC AddObjectBuildMessageSp  N'PK_ModuleMembers', 17, 1, N'MG_1', N'@ModuleMembers.ObjectType'
GO

EXEC AddObjectBuildMessageSp  N'PK_ModuleMembers', 17, 2, N'MG_1', N'@ModuleMembers.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ModuleMembers', 17, 3, N'MG_1', N'@ModuleMembers.ModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ModuleMembers', 17, 4, N'MG_1', N'@ModuleMembers.OriginalModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_Modules', 17, 1, N'MG_1', N'@Modules.ModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_MyNewTestForm', 17, 1, N'MG_1', N'@MyNewTestForm.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_NewColumnStaging', 17, 1, N'MG_1', N'@NewColumnStaging.BatchID'
GO

EXEC AddObjectBuildMessageSp  N'PK_NewColumnStaging', 17, 2, N'MG_1', N'@NewColumnStaging.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_NextKeys_mst', 17, 1, N'MG_1', N'@NextKeys.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_NextKeys_mst', 17, 2, N'MG_1', N'@NextKeys.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_NotesContentShadow', 17, 1, N'MG_1', N'@NotesContentShadow.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_NotesSiteMap', 17, 1, N'MG_1', N'@NotesSiteMap.FromNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'PK_NotesSiteMap', 17, 2, N'MG_1', N'@NotesSiteMap.FromSite'
GO

EXEC AddObjectBuildMessageSp  N'PK_NotesSiteMap', 17, 3, N'MG_1', N'@NotesSiteMap.TypeOfNote'
GO

EXEC AddObjectBuildMessageSp  N'PK_ObjectSentEmail_mst', 17, 1, N'MG_1', N'@ObjectSentEmail.FormName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ObjectSentEmail_mst', 17, 2, N'MG_1', N'@ObjectSentEmail.Seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_ObjectSentEmail_mst', 17, 3, N'MG_1', N'@ObjectSentEmail.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_ObjectSentEmail_mst', 17, 4, N'MG_1', N'@ObjectSentEmail.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ObjectSentEmail_mst', 17, 5, N'MG_1', N'@ObjectSentEmail.TableRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_OutriggerProfile', 17, 1, N'MG_1', N'@OutriggerProfile.ProfileName'
GO

EXEC AddObjectBuildMessageSp  N'PK_OutriggerProfileOptions', 17, 1, N'MG_1', N'@OutriggerProfileOptions.OptionName'
GO

EXEC AddObjectBuildMessageSp  N'PK_OutriggerProfileOptions', 17, 2, N'MG_1', N'@OutriggerProfileOptions.ProfileName'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms', 17, 1, N'MG_1', N'@parms.parm_key'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms_all', 17, 1, N'MG_1', N'@parms_all.site_ref'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms_all', 17, 2, N'MG_1', N'@parms_all.parm_key'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms_mst', 17, 1, N'MG_1', N'@parms.parm_key'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms_mst_all', 17, 1, N'MG_1', N'@parms.parm_key'
GO

EXEC AddObjectBuildMessageSp  N'PK_parms_mst_all', 17, 2, N'MG_1', N'@parms.site_ref'
GO

EXEC AddObjectBuildMessageSp  N'PK_PasswordParameters', 17, 1, N'MG_1', N'@PasswordParameters.ParmKey'
GO

EXEC AddObjectBuildMessageSp  N'PK_Printer', 17, 1, N'MG_1', N'@Printer.PrinterName'
GO

EXEC AddObjectBuildMessageSp  N'PK_PrintPreview', 17, 1, N'MG_1', N'@PrintPreview.PreviewNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ProductDbFiles', 17, 1, N'MG_1', N'@ProductDbFiles.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ProductPatches', 17, 1, N'MG_1', N'@ProductPatches.PatchFile'
GO

EXEC AddObjectBuildMessageSp  N'PK_ProductPatchItems', 17, 1, N'MG_1', N'@ProductPatchItems.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_Properties', 17, 1, N'MG_1', N'@IDOProperties.PropertyName'
GO

EXEC AddObjectBuildMessageSp  N'PK_PropertyClasses', 17, 1, N'MG_1', N'@PropertyClasses.ClassName'
GO

EXEC AddObjectBuildMessageSp  N'PK_Publication', 17, 1, N'MG_1', N'@Publication'
GO

EXEC AddObjectBuildMessageSp  N'PK_PublicationCategory', 17, 1, N'MG_1', N'@PublicationCategory'
GO

EXEC AddObjectBuildMessageSp  N'PK_PublicationCategoryPublication', 17, 1, N'MG_1', N'@PublicationCategory'
GO

EXEC AddObjectBuildMessageSp  N'PK_PublicationSubscriber', 17, 1, N'MG_1', N'@PublicationSubscriber.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_QueuedEvent_mst', 17, 1, N'MG_1', N'@QueuedEvent.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_QueuedEvent_mst', 17, 2, N'MG_1', N'@QueuedEvent.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_QueuedEventHandler', 17, 1, N'MG_1', N'@QueuedEventHandler.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_category', 17, 1, N'MG_1', N'@rep_category.category'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_object_category', 17, 1, N'MG_1', N'@rep_object_category.category'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_object_category', 17, 2, N'MG_1', N'@rep_object_category.object_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_object_category', 17, 3, N'MG_1', N'@rep_object_category.object_type'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_rule', 17, 1, N'MG_1', N'@rep_rule.source_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_rule', 17, 2, N'MG_1', N'@rep_rule.target_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_rep_rule', 17, 3, N'MG_1', N'@rep_rule.category'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocAttribute', 17, 1, N'MG_1', N'@ReplDocAttribute.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocElement', 17, 1, N'MG_1', N'@ReplDocElement.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocInbound', 17, 1, N'MG_1', N'@ReplDocInbound.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocOutbound', 17, 1, N'MG_1', N'@ReplDocOutbound.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocOutboundFilter', 17, 1, N'MG_1', N'@ReplDocOutboundFilter.FilterSequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocOutboundFilter', 17, 2, N'MG_1', N'@ReplDocOutboundFilter.ReplDocOutboundRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplDocument', 17, 1, N'MG_1', N'@ReplDocument.DocumentName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRows3_mst', 17, 1, N'MG_1', N'@ReplicatedRows3.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRows3_mst', 17, 2, N'MG_1', N'@ReplicatedRows3.RefRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRows3_mst', 17, 3, N'MG_1', N'@ReplicatedRows3.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRowsErrors', 17, 1, N'MG_1', N'@ReplicatedRowsErrors.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRowsErrors_mst', 17, 1, N'MG_1', N'@ReplicatedRowsErrors.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReplicatedRowsErrors_mst', 17, 2, N'MG_1', N'@ReplicatedRowsErrors.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReportOptions_mst', 17, 1, N'MG_1', N'@ReportOptions.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReportOptions_mst', 17, 2, N'MG_1', N'@ReportOptions.TaskName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReportOptions_mst', 17, 3, N'MG_1', N'@ReportOptions.Username'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReusableNotesToSite', 17, 1, N'MG_1', N'@ReusableNotesToSite.NoteToken'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReusableNotesToSite', 17, 2, N'MG_1', N'@ReusableNotesToSite.Site'
GO

EXEC AddObjectBuildMessageSp  N'PK_ReusableNotesToSite', 17, 3, N'MG_1', N'@ReusableNotesToSite.TypeOfNote'
GO

EXEC AddObjectBuildMessageSp  N'PK_RID', 17, 1, N'MG_1', N'@AaPayments.RID'
GO

EXEC AddObjectBuildMessageSp  N'PK_rpt_opt', 17, 1, N'MG_1', N'@rpt_opt.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_rpt_opt_values', 17, 1, N'MG_1', N'@rpt_opt_values.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_rv_Customer', 17, 1, N'MG_1', N'@rv_Customer.ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_SearchItem', 17, 1, N'MG_1', N'@SearchItem.SearchItemName'
GO

EXEC AddObjectBuildMessageSp  N'PK_SearchPreferenceList', 17, 1, N'MG_1', N'@SearchPreferenceList.SearchGroup'
GO

EXEC AddObjectBuildMessageSp  N'PK_SearchPreferenceList', 17, 2, N'MG_1', N'@SearchPreferenceList.SearchItemName'
GO

EXEC AddObjectBuildMessageSp  N'PK_SearchPreferenceList', 17, 3, N'MG_1', N'@SearchPreferenceList.Username'
GO

EXEC AddObjectBuildMessageSp  N'PK_Servers', 17, 1, N'MG_1', N'@Servers.ServerName'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValues', 17, 1, N'MG_1', N'@ShadowValues.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValues', 17, 2, N'MG_1', N'@ShadowValues.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValues', 17, 3, N'MG_1', N'@ShadowValues.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors', 17, 1, N'MG_1', N'@ShadowValuesErrors.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors', 17, 2, N'MG_1', N'@ShadowValuesErrors.OldNew'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors', 17, 3, N'MG_1', N'@ShadowValuesErrors.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors_mst', 17, 1, N'MG_1', N'@ShadowValuesErrors.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors_mst', 17, 2, N'MG_1', N'@ShadowValuesErrors.OldNew'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors_mst', 17, 3, N'MG_1', N'@ShadowValuesErrors.OperationNumber'
GO

EXEC AddObjectBuildMessageSp  N'PK_ShadowValuesErrors_mst', 17, 4, N'MG_1', N'@ShadowValuesErrors.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_site', 17, 1, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'PK_site_group', 17, 1, N'MG_1', N'@site_group.site_group'
GO

EXEC AddObjectBuildMessageSp  N'PK_site_group', 17, 2, N'MG_1', N'@site_group.site'
GO

EXEC AddObjectBuildMessageSp  N'PK_site_hierarchy', 17, 1, N'MG_1', N'@site_hierarchy.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_site_live_link', 17, 1, N'MG_1', N'@site_live_link.from_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_site_live_link', 17, 2, N'MG_1', N'@site_live_link.to_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteConnectionInformation', 17, 1, N'MG_1', N'@SiteConnectionInformation.ConnectionID'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteConnectionInformation', 17, 2, N'MG_1', N'@SiteConnectionInformation.Site'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteLinkInfo', 17, 1, N'MG_1', N'@site_link_info.from_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteLinkInfo', 17, 2, N'MG_1', N'@site_link_info.to_site'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteTypeModuleMap', 17, 1, N'MG_1', N'@SiteTypeModuleMap.ModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteTypeModuleMap', 17, 2, N'MG_1', N'@SiteTypeModuleMap.SiteType'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteUserMap', 17, 1, N'MG_1', N'@SiteUserMap.ToSite'
GO

EXEC AddObjectBuildMessageSp  N'PK_SiteUserMap', 17, 2, N'MG_1', N'@SiteUserMap.FromSite'
GO

EXEC AddObjectBuildMessageSp  N'PK_SoHoOrgChart', 17, 1, N'MG_1', N'@SoHoOrgChart.id'
GO

EXEC AddObjectBuildMessageSp  N'PK_StartupMethod', 17, 1, N'MG_1', N'@StartupMethod.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_system_type', 17, 1, N'MG_1', N'@system_type.system_type'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class', 17, 1, N'MG_1', N'@table_class.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class', 17, 2, N'MG_1', N'@table_class.table_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class', 17, 3, N'MG_1', N'@table_class.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class_committed', 17, 1, N'MG_1', N'@table_class_committed.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class_committed', 17, 2, N'MG_1', N'@table_class_committed.table_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class_committed', 17, 3, N'MG_1', N'@table_class_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class_impacted', 17, 1, N'MG_1', N'@table_class_impacted.table_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_table_class_impacted', 17, 2, N'MG_1', N'@table_class_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_Tables', 17, 1, N'MG_1', N'@IDOTable.TableAlias'
GO

EXEC AddObjectBuildMessageSp  N'PK_tempSQLTableTest', 17, 1, N'MG_1', N'@tempSQLTableTest.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_test_seq', 17, 1, N'MG_1', N'@test_seq.Seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_testkeys', 17, 1, N'MG_1', N'@TestKeys.key1'
GO

EXEC AddObjectBuildMessageSp  N'PK_testkeys', 17, 2, N'MG_1', N'@TestKeys.key2'
GO

EXEC AddObjectBuildMessageSp  N'PK_TestsIDO', 17, 1, N'MG_1', N'@TestsIDO.ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_TestTableGoutam', 17, 1, N'MG_1', N'@TestTableGoutam.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_TestTaskName', 17, 1, N'MG_1', N'@TestTaskName.TaskName'
GO

EXEC AddObjectBuildMessageSp  N'PK_TimeZoneData', 17, 1, N'MG_1', N'@TimeZoneData.TimeZone'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentObject', 17, 1, N'MG_1', N'@tmp_DocumentObject.DocumentName'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentObject', 17, 2, N'MG_1', N'@tmp_DocumentObject.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentObjectReference', 17, 1, N'MG_1', N'@tmp_DocumentObjectReference.DocumentObjectRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentObjectReference', 17, 2, N'MG_1', N'@tmp_DocumentObjectReference.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentObjectReference', 17, 3, N'MG_1', N'@tmp_DocumentObjectReference.TableRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_tmp_DocumentType', 17, 1, N'MG_1', N'@tmp_DocumentType.DocumentType'
GO

EXEC AddObjectBuildMessageSp  N'PK_TmpEventHandler', 17, 1, N'MG_1', N'@TmpEventHandler.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_TmpStagingNewDataMaintenance', 17, 1, N'MG_1', N'@TmpStagingNewDataMaintenance.Name'
GO

EXEC AddObjectBuildMessageSp  N'PK_TmpStagingNewDataMaintenance', 17, 2, N'MG_1', N'@TmpStagingNewDataMaintenance.ProcessID'
GO

EXEC AddObjectBuildMessageSp  N'PK_TonyTest', 17, 1, N'MG_1', N'@TonyTest.FieldOne'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPB_NDMW_MV', 17, 1, N'MG_1', N'@TPB_NDMW_MV.EmailType'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPB_ReqCTD', 17, 1, N'MG_1', N'@TPB_ReqCTD.Code'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPBNDMWLang', 17, 1, N'MG_1', N'@TPBNDMWLang.ID'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPBRounding', 17, 1, N'MG_1', N'@TPBRounding.Code'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPBTest_1', 17, 1, N'MG_1', N'@TPBTest_1.MessageLanguage'
GO

EXEC AddObjectBuildMessageSp  N'PK_TPBTest_1', 17, 2, N'MG_1', N'@TPBTest_1.MessageNo'
GO

EXEC AddObjectBuildMessageSp  N'PK_TrackRows', 17, 1, N'MG_1', N'@TrackRows.SessionID'
GO

EXEC AddObjectBuildMessageSp  N'PK_TrackRows', 17, 2, N'MG_1', N'@TrackRows.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class', 17, 1, N'MG_1', N'@user_class.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_committed', 17, 1, N'MG_1', N'@user_class_committed.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_committed', 17, 2, N'MG_1', N'@user_class_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld', 17, 1, N'MG_1', N'@user_class_fld.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld', 17, 2, N'MG_1', N'@user_class_fld.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld_committed', 17, 1, N'MG_1', N'@user_class_fld_committed.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld_committed', 17, 2, N'MG_1', N'@user_class_fld_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld_committed', 17, 3, N'MG_1', N'@user_class_fld_committed.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld_impacted', 17, 1, N'MG_1', N'@user_class_fld_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_fld_impacted', 17, 2, N'MG_1', N'@user_class_fld_impacted.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_impacted', 17, 1, N'MG_1', N'@user_class_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_record_assoc', 17, 1, N'MG_1', N'@user_class_record_assoc.RecordRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_class_record_assoc', 17, 2, N'MG_1', N'@user_class_record_assoc.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_fld', 17, 1, N'MG_1', N'@user_fld.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_fld_committed', 17, 1, N'MG_1', N'@user_fld_committed.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_fld_committed', 17, 2, N'MG_1', N'@user_fld_committed.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_fld_impacted', 17, 1, N'MG_1', N'@user_fld_impacted.fld_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index', 17, 1, N'MG_1', N'@user_index.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index', 17, 2, N'MG_1', N'@user_index.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_committed', 17, 1, N'MG_1', N'@user_index_committed.sys_delete'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_committed', 17, 2, N'MG_1', N'@user_index_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_committed', 17, 3, N'MG_1', N'@user_index_committed.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld', 17, 1, N'MG_1', N'@user_index_fld.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld', 17, 2, N'MG_1', N'@user_index_fld.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld', 17, 3, N'MG_1', N'@user_index_fld.index_seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_committed', 17, 1, N'MG_1', N'@user_index_fld_committed.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_committed', 17, 2, N'MG_1', N'@user_index_fld_committed.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_committed', 17, 3, N'MG_1', N'@user_index_fld_committed.index_seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_impacted', 17, 1, N'MG_1', N'@user_index_fld_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_impacted', 17, 2, N'MG_1', N'@user_index_fld_impacted.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_fld_impacted', 17, 3, N'MG_1', N'@user_index_fld_impacted.index_seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_impacted', 17, 1, N'MG_1', N'@user_index_impacted.class_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_user_index_impacted', 17, 2, N'MG_1', N'@user_index_impacted.index_name'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserCalendar', 17, 1, N'MG_1', N'@UserCalendar.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserDefinedFields', 17, 1, N'MG_1', N'@UserDefinedFields.RowId'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserDefinedFields', 17, 2, N'MG_1', N'@UserDefinedFields.TableName'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserEmail', 17, 1, N'MG_1', N'@UserEmail.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserGroupMap_mst', 17, 1, N'MG_1', N'@UserGroupMap.GroupId'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserGroupMap_mst', 17, 2, N'MG_1', N'@UserGroupMap.SiteRef'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserGroupMap_mst', 17, 3, N'MG_1', N'@UserGroupMap.UserId'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserModules', 17, 1, N'MG_1', N'@UserModules.UserId'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserModules', 17, 2, N'MG_1', N'@UserModules.ModuleName'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserPasswordHistory', 17, 1, N'MG_1', N'@UserPasswordHistory.PasswordAgeCount'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserPasswordHistory', 17, 2, N'MG_1', N'@UserPasswordHistory.Username'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserTask', 17, 1, N'MG_1', N'@UserTask.TaskName'
GO

EXEC AddObjectBuildMessageSp  N'PK_UserTask', 17, 2, N'MG_1', N'@UserTask.UserId'
GO

EXEC AddObjectBuildMessageSp  N'PK_WBDataViewParameter', 17, 1, N'MG_1', N'@WBDataViewParameter.Seq'
GO

EXEC AddObjectBuildMessageSp  N'PK_WBDataViewParameter', 17, 2, N'MG_1', N'@WBDataViewParameter.ViewName'
GO

EXEC AddObjectBuildMessageSp  N'PK_WBSearchSet', 17, 1, N'MG_1', N'@WBSearchSet.SetName'
GO

EXEC AddObjectBuildMessageSp  N'PK_WBSearchSourceSet', 17, 1, N'MG_1', N'@WBSearchSourceSet.SetName'
GO

EXEC AddObjectBuildMessageSp  N'PK_WBSearchSourceSet', 17, 2, N'MG_1', N'@WBSearchSourceSet.SourceName'
GO

EXEC AddObjectBuildMessageSp  N'PK_Workflows', 17, 1, N'MG_1', N'@Workflows.WindowID'
GO

EXEC AddObjectBuildMessageSp  N'PK_Workflows', 17, 2, N'MG_1', N'@Workflows.Action'
GO

EXEC AddObjectBuildMessageSp  N'PK_x2', 17, 1, N'MG_1', N'@x2.x2'
GO

EXEC AddObjectBuildMessageSp  N'PK_zJCTest', 17, 1, N'MG_1', N'@zJCTest.ID'
GO

EXEC AddObjectBuildMessageSp  N'ProcessErrorLogIx1', 17, 1, N'MG_1', N'@ProcessErrorLog.LineNum'
GO

EXEC AddObjectBuildMessageSp  N'ProcessErrorLogIx1', 17, 2, N'MG_1', N'@ProcessErrorLog.ProcessID'
GO

EXEC AddObjectBuildMessageSp  N'ProcessErrorLogIx1', 17, 3, N'MG_1', N'@ProcessErrorLog.UserName'
GO

EXEC AddObjectBuildMessageSp  N'ProcessErrorLogRcx', 17, 1, N'MG_1', N'@ProcessErrorLog.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'ProcessLineNumbersIx0', 17, 1, N'MG_1', N'@ProcessLineNumbers.ProcessID'
GO

EXEC AddObjectBuildMessageSp  N'PublicationCategoryPublicationFK1', 17, 1, N'MG_1', N'@PublicationCategory.PublicationCategory'
GO

EXEC AddObjectBuildMessageSp  N'PublicationCategoryPublicationFK1', 18, 1, N'MG_1', N'@PublicationCategoryPublication'
GO

EXEC AddObjectBuildMessageSp  N'PublicationCategoryPublicationFK1', 18, 2, N'MG_1', N'@PublicationCategory.PublicationCategory'
GO

EXEC AddObjectBuildMessageSp  N'PublicationCategoryPublicationFK2', 17, 1, N'MG_1', N'@Publication.PublicationName'
GO

EXEC AddObjectBuildMessageSp  N'PublicationCategoryPublicationFK2', 18, 1, N'MG_1', N'@Publication'
GO

EXEC AddObjectBuildMessageSp  N'PublicationFK1', 18, 1, N'MG_1', N'@PublicationCategory'
GO

EXEC AddObjectBuildMessageSp  N'PublicationSubscriberFK1', 17, 1, N'MG_1', N'@Publication.PublicationName'
GO

EXEC AddObjectBuildMessageSp  N'PublicationSubscriberFK1', 18, 1, N'MG_1', N'@Publication'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk1', 17, 1, N'MG_1', N'@rep_category.category'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk1', 18, 1, N'MG_1', N'@rep_rule'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk1', 18, 2, N'MG_1', N'@rep_category'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk2', 17, 1, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk2', 18, 1, N'MG_1', N'@rep_rule'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk2', 18, 2, N'MG_1', N'@site'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk3', 17, 1, N'MG_1', N'@site.site'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk3', 18, 1, N'MG_1', N'@rep_rule'
GO

EXEC AddObjectBuildMessageSp  N'rep_ruleFk3', 18, 2, N'MG_1', N'@site'
GO

EXEC AddObjectBuildMessageSp  N'ReplicationOperationCounterIx0', 17, 1, N'MG_1', N'@ReplicationOperationCounter.Counter'
GO

EXEC AddObjectBuildMessageSp  N'SessionContextNamesIx0', 17, 1, N'MG_1', N'@SessionContextNames.ProcessID'
GO

EXEC AddObjectBuildMessageSp  N'siteFk1', 17, 1, N'MG_1', N'@intranet.intranet_name'
GO

EXEC AddObjectBuildMessageSp  N'siteFk1', 18, 1, N'MG_1', N'@site'
GO

EXEC AddObjectBuildMessageSp  N'siteFk1', 18, 2, N'MG_1', N'@intranet'
GO

EXEC AddObjectBuildMessageSp  N'siteFk2', 17, 1, N'MG_1', N'@system_type.system_type'
GO

EXEC AddObjectBuildMessageSp  N'siteFk2', 18, 1, N'MG_1', N'@site'
GO

EXEC AddObjectBuildMessageSp  N'siteFk2', 18, 2, N'MG_1', N'@system_type'
GO

EXEC AddObjectBuildMessageSp  N'SpecificNotesIx0', 17, 1, N'MG_431'
GO

EXEC AddObjectBuildMessageSp  N'SydDefaultValueUpr', 17, 1, N'MG_445'
GO

EXEC AddObjectBuildMessageSp  N'SystemNotesIx0', 17, 1, N'MG_432'
GO

EXEC AddObjectBuildMessageSp  N'SystemProcessDefaultsFk1', 17, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'SystemProcessDefaultsFk1', 18, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'SystemProcessDefaultsIx1', 17, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'SystemProcessDefaultsRcx', 17, 1, N'MG_1', N'@SystemProcessDefaults.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'TaskExclusionIx0', 17, 1, N'MG_444'
GO

EXEC AddObjectBuildMessageSp  N'TaskExclusionIx0', 17, 2, N'MG_450'
GO

EXEC AddObjectBuildMessageSp  N'TaskExclusionRcx', 17, 1, N'MG_1', N'@TaskExclusion.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'TaskListIx1', 17, 1, N'MG_1', N'@TaskList.TaskID'
GO

EXEC AddObjectBuildMessageSp  N'TaskListRcx', 17, 1, N'MG_1', N'@TaskList.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'TaskName', 8, 1, N'MG_444'
GO

EXEC AddObjectBuildMessageSp  N'TaskTypes', 7, 1, N'MG_425'
GO

EXEC AddObjectBuildMessageSp  N'TaskTypesCdvalidSp', 8, 1, N'MG_436'
GO

EXEC AddObjectBuildMessageSp  N'TaskTypesIx1', 17, 1, N'MG_425'
GO

EXEC AddObjectBuildMessageSp  N'TaskTypesIx2', 17, 1, N'MG_436'
GO

EXEC AddObjectBuildMessageSp  N'TaskTypesRcx', 17, 1, N'MG_1', N'@TaskTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ClassNotesIx0', 17, 1, N'MG_1', N'@tmp_ClassNotes.ClassNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ClassNotesIx2', 17, 1, N'MG_1', N'@tmp_ClassNotes.NoteHeaderToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ClassNotesIx2', 17, 2, N'MG_1', N'@tmp_ClassNotes.NoteType'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ClassNotesIx2', 17, 3, N'MG_1', N'@tmp_ClassNotes.SystemNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ClassNotesIx2', 17, 4, N'MG_1', N'@tmp_ClassNotes.UserNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_NoteHeadersIx0', 17, 1, N'MG_1', N'@tmp_NoteHeaders.NoteHeaderToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_NoteHeadersIx2', 17, 1, N'MG_1', N'@tmp_NoteHeaders.NoteFlag'
GO

EXEC AddObjectBuildMessageSp  N'tmp_NoteHeadersIx2', 17, 2, N'MG_1', N'@tmp_NoteHeaders.ObjectName'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx0', 17, 1, N'MG_1', N'@tmp_ObjectNotes.ObjectNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 1, N'MG_1', N'@tmp_ObjectNotes.NoteHeaderToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 2, N'MG_1', N'@tmp_ObjectNotes.NoteType'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 3, N'MG_1', N'@tmp_ObjectNotes.RefRowPointer'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 4, N'MG_1', N'@tmp_ObjectNotes.SpecificNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 5, N'MG_1', N'@tmp_ObjectNotes.SystemNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_ObjectNotesIx2', 17, 6, N'MG_1', N'@tmp_ObjectNotes.UserNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_SpecificNotesIx0', 17, 1, N'MG_1', N'@tmp_SpecificNotes.SpecificNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_SystemNotesIx0', 17, 1, N'MG_1', N'@tmp_SystemNotes.SystemNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'tmp_UserNotesIx0', 17, 1, N'MG_1', N'@tmp_UserNotes.UserNoteToken'
GO

EXEC AddObjectBuildMessageSp  N'TteTaskCodeUpr', 17, 1, N'MG_436'
GO

EXEC AddObjectBuildMessageSp  N'UK_principal_name', 17, 1, N'MG_1', N'@sysdiagrams.name'
GO

EXEC AddObjectBuildMessageSp  N'UK_principal_name', 17, 2, N'MG_1', N'@sysdiagrams.principal_id'
GO

EXEC AddObjectBuildMessageSp  N'UQ_MethodParam_Seq', 17, 1, N'MG_1', N'@IDOMethodParameters.Sequence'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedFieldsIx0', 17, 1, N'MG_424'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedFieldsIx0', 17, 2, N'MG_449'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedTypesIx1', 17, 1, N'MG_451'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedTypesRcx', 17, 1, N'MG_1', N'@UserDefinedTypes.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedTypeValuesIx1', 17, 1, N'MG_452'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedTypeValuesIx1', 17, 2, N'MG_453'
GO

EXEC AddObjectBuildMessageSp  N'UserDefinedTypeValuesRcx', 17, 1, N'MG_1', N'@UserDefinedTypeValues.RowPointer'
GO

EXEC AddObjectBuildMessageSp  N'UserGroupMapIx0', 17, 1, N'MG_427'
GO

EXEC AddObjectBuildMessageSp  N'UserGroupMapIx0', 17, 2, N'MG_454'
GO

EXEC AddObjectBuildMessageSp  N'UserName', 8, 1, N'MG_545'
GO

EXEC AddObjectBuildMessageSp  N'UserNamesIx0', 17, 1, N'MG_427'
GO

EXEC AddObjectBuildMessageSp  N'UserNamesIx1', 17, 1, N'MG_545'
GO

EXEC AddObjectBuildMessageSp  N'UserNotesIx0', 17, 1, N'MG_433'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsFk1', 17, 1, N'MG_1', N'@DefaultTypes.DefaultType'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsFk1', 18, 1, N'MG_1', N'@UserProcessDefaults'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsFk1', 18, 2, N'MG_1', N'@DefaultTypes.DefaultType'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsIx1', 17, 1, N'MG_437'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsIx1', 17, 2, N'MG_545'
GO

EXEC AddObjectBuildMessageSp  N'UserProcessDefaultsRcx', 17, 1, N'MG_1', N'@UserProcessDefaults.RowPointer'
GO

