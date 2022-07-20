IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'DEFAULT')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('DEFAULT', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'DEFAULTPAPERSIZE')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('DEFAULTPAPERSIZE', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = '10X14')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('10X14', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = '11X17')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('11X17', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'A3')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('A3', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'A4')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('A4', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'A4SMALL')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('A4SMALL', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'A5')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('A5', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'B4')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('B4', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'B5')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('B5', 1)
   
IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'CSHEET')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('CSHEET', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'DSHEET')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('DSHEET', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPE9')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPE9', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPE10')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPE10', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPE11')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPE11', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPE12')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPE12', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPE14')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPE14', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEB4')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEB4', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEB5')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEB5', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEB6')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEB6', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEC3')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEC3', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEC4')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEC4', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEC5')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEC5', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEC6')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEC6', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEC65')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEC65', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEDL')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEDL', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEITALY')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEITALY', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEMONARCH')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEMONARCH', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ENVELOPEPERSONAL')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('ENVELOPEPERSONAL', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'ESHEET')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('ESHEET', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'EXECUTIVE')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('EXECUTIVE', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'FANFOLDLEGALGERMAN')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('FANFOLDLEGALGERMAN', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'FANFOLDSTDGERMAN')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('FANFOLDSTDGERMAN', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'FANFOLDUS')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('FANFOLDUS', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'FOLIO')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('FOLIO', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'LEDGER')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord, DefaultOrientation) 
   VALUES ('LEDGER', 1, 'L')

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'LEGAL')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('LEGAL', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'LETTER')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('LETTER', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'LETTERSMALL')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('LETTERSMALL', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'NOTE')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('NOTE', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'QUARTO')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('QUARTO', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'STATEMENT')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('STATEMENT', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'TABLOID')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('TABLOID', 1)

IF NOT EXISTS (SELECT 1 FROM ReportPaperSize WHERE PaperSize = 'DATAVIEWLAYOUT')
   INSERT INTO ReportPaperSize (PaperSize, IsSystemRecord) 
   VALUES ('DATAVIEWLAYOUT', 1)