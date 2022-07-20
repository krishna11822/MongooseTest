/* DataPatch for RS9136 - Validation on Process Defaults */

/* AlphaNumeric */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^[^\^\$\+\=\<\>\`\~]+$' 
WHERE DefaultType IN
(
31,  /*Report paper size*/
42,  /*NUMSORTCHAR numeric pad*/
57,  /*Admin License Module Name*/
58,  /*Prune Explorer Folder Callout*/
71  /*Datalake Prefix*/
);


/* InList - 1,0 */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:0|1)$' 
WHERE DefaultType IN
(
20,  /*Report output obfuscation*/
23,  /*IDO checkout disabled*/
24,  /*Keep successful event states*/
26,  /*Persist WinStudio metadata cache*/
35,  /*Enable audit logging*/
41,  /*Allow script language selection*/
43,  /*ION pulse interface*/
45,  /*Save record cap override*/
48,  /*Allow saving form runtime changes*/
50,  /*Enforce prefix from Access As*/
54,  /*Send Context Message on Form Focus*/
59,  /*Browser Component BG Render Interval*/
64,  /*Keep Groups in SecurityUserMaster*/
65,  /*Keep Modules In SecurityUserMaster*/
67,  /*Enable Remote Logging*/
68,  /*DateTime in Client Time Zone*/
73,  /*Ignore LogicalID in SUM SecurityRole*/
75,  /*Inbound SUM Assign Admin License*/
76,  /*Enable Inbound BOD Prioritization*/
78  /*Conditional actions case sensitive*/
);

/* Numeric */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^[0-9]+$'
WHERE DefaultType IN
(
36,  /* WinStudio max record cap */
38, /* Client minutes to ping session */
39, /* Minutes to close orphan sessions */
47, /* User inactivity threshold */
49, /* Browser inactivity lock minutes */
63, /* Round Robin Polling Interval (ms)*/
66, /* Round Robin Batch Size */
69, /* Report max record cap*/
77 /* REST Token Lifetime (sec) */
);

/* Non unicode literal */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:Default|Ansi|Smart)$' 
WHERE DefaultType = 19;

/* Collection read mode */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:COMMITTED|UNCOMMITTED)$'
WHERE DefaultType = 30;

/* Default script language */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:Visual Basic|Visual C#)$' 
WHERE DefaultType = 40;

/* Remote WinStudio Sessions */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:Allow|Deny|PerUser)$' 
WHERE DefaultType = 52;

/* Filter validation */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:High|Medium|Low)$' 
WHERE DefaultType = 56;

/* FormSync notifications email address */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$' 
WHERE DefaultType = 62;

/* Component Name as HTML Attribute */
UPDATE dbo.DefaultTypes SET DefaultRegEx = '^(?:0|1|2|3)$' 
WHERE DefaultType = 79;