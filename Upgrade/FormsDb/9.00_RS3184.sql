-- =============================================================
--  RS #:   3184
--  Notes:  Runtime form changes
-- =============================================================
IF (OBJECT_ID(N'[dbo].[RuntimeChanges]', N'U') IS NULL)
BEGIN
   CREATE TABLE [dbo].[RuntimeChanges](
                [FormName] [nvarchar](50) NOT NULL,
                [UserName] [nvarchar](50) NOT NULL,
                [Attributes] [nvarchar](max) NULL,
       CONSTRAINT [PK_RuntimeChanges] PRIMARY KEY CLUSTERED 
       (
          [FormName] ASC,
          [UserName] ASC
       )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END