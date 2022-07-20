/*
* **************************************************************
*                                                              *
* NOTICE                                                       *
*                                                              *
* THIS SOFTWARE IS THE PROPERTY OF AND CONTAINS                *
* CONFIDENTIAL INFORMATION OF INFOR AND/ OR ITS AFFILIATES     *
* OR SUBSIDIARIES AND SHALL NOT BE DISCLOSED WITHOUT PRIOR     *
* WRITTEN PERMISSION.LICENSED CUSTOMERS MAY COPY AND           *
* ADAPT THIS SOFTWARE FOR THEIR OWN USE IN ACCORDANCE WITH     *
* THE TERMS OF THEIR SOFTWARE LICENSE AGREEMENT.               *
* ALL OTHER RIGHTS RESERVED.                                   *
*                                                              *
* (c)COPYRIGHT 2020 INFOR.ALL RIGHTS RESERVED.                 *
* THE WORD AND DESIGN MARKS SET FORTH HEREIN ARE               *
* TRADEMARKS AND / OR REGISTERED TRADEMARKS OF INFOR           *
* AND / OR ITS AFFILIATES AND SUBSIDIARIES. ALL RIGHTS         *
* RESERVED.ALL OTHER TRADEMARKS LISTED HEREIN ARE              *
* THE PROPERTY OF THEIR RESPECTIVE OWNERS.                     *
*                                                              *
* **************************************************************
*/
/* MediaType */
--Add existing media type

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'%')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'%', N'application/x-trash', 1, N'%', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'~')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'~', N'application/x-trash', 1, N'~', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'323')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'323', N'text/h323', 1, N'323', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'3gp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'3gp', N'video/3gpp', 1, N'3gp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'7z')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'7z', N'application/x-7z-compressed', 1, N'7z', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'abw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'abw', N'application/x-abiword', 1, N'abw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ai')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ai', N'application/postscript', 1, N'ai', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'aif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'aif', N'audio/x-aiff', 1, N'aif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'aifc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'aifc', N'audio/x-aiff', 1, N'aifc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'aiff')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'aiff', N'audio/x-aiff', 1, N'aiff', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'alc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'alc', N'chemical/x-alchemy', 1, N'alc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'amr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'amr', N'audio/amr', 1, N'amr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'anx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'anx', N'application/annodex', 1, N'anx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'apk')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'apk', N'application/vnd.android.package-archive', 1, N'apk', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'art')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'art', N'image/x-jg', 1, N'art', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'asc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'asc', N'text/plain', 1, N'asc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'asf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'asf', N'video/x-ms-asf', 1, N'asf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'asn')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'asn', N'chemical/x-ncbi-asn1', 1, N'asn', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'aso')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'aso', N'chemical/x-ncbi-asn1-binary', 1, N'aso', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'asx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'asx', N'video/x-ms-asf', 1, N'asx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'atom')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'atom', N'application/atom+xml', 1, N'atom', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'atomcat')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'atomcat', N'application/atomcat+xml', 1, N'atomcat', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'atomsrv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'atomsrv', N'application/atomserv+xml', 1, N'atomsrv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'au')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'au', N'audio/basic', 1, N'au', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'avi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'avi', N'video/x-msvideo', 1, N'avi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'awb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'awb', N'audio/amr-wb', 1, N'awb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'axa')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'axa', N'audio/annodex', 1, N'axa', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'axv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'axv', N'video/annodex', 1, N'axv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'b')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'b', N'chemical/x-molconn-Z', 1, N'b', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bak')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bak', N'application/x-trash', 1, N'bak', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bat')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bat', N'application/x-msdos-program', 1, N'bat', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bcpio')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bcpio', N'application/x-bcpio', 1, N'bcpio', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bib')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bib', N'text/x-bibtex', 1, N'bib', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bin', N'application/octet-stream', 1, N'bin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bmp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bmp', N'image/x-ms-bmp', 1, N'BMP', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'boo')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'boo', N'text/x-boo', 1, N'boo', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'book')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'book', N'application/x-maker', 1, N'book', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'brf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'brf', N'text/plain', 1, N'brf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'bsd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'bsd', N'chemical/x-crossfire', 1, N'bsd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'c')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'c', N'text/x-csrc', 1, N'c', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'c++')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'c++', N'text/x-c++src', 1, N'c++', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'c3d')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'c3d', N'chemical/x-chem3d', 1, N'c3d', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cab')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cab', N'application/x-cab', 1, N'cab', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cac')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cac', N'chemical/x-cache', 1, N'cac', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cache')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cache', N'chemical/x-cache', 1, N'cache', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cap')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cap', N'application/cap', 1, N'cap', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cascii')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cascii', N'chemical/x-cactvs-binary', 1, N'cascii', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cat')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cat', N'application/vnd.ms-pki.seccat', 1, N'cat', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cbin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cbin', N'chemical/x-cactvs-binary', 1, N'cbin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cbr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cbr', N'application/x-cbr', 1, N'cbr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cbz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cbz', N'application/x-cbz', 1, N'cbz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cc', N'text/x-c++src', 1, N'cc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cda')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cda', N'application/x-cdf', 1, N'cda', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cdf', N'application/x-cdf', 1, N'cdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cdr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cdr', N'image/x-coreldraw', 1, N'cdr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cdt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cdt', N'image/x-coreldrawtemplate', 1, N'cdt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cdx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cdx', N'chemical/x-cdx', 1, N'cdx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cdy')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cdy', N'application/vnd.cinderella', 1, N'cdy', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cef')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cef', N'chemical/x-cxf', 1, N'cef', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cer')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cer', N'chemical/x-cerius', 1, N'cer', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'chm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'chm', N'chemical/x-chemdraw', 1, N'chm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'chrt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'chrt', N'application/x-kchart', 1, N'chrt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cif', N'chemical/x-cif', 1, N'cif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'class')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'class', N'application/java-vm', 1, N'class', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cls')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cls', N'text/x-tex', 1, N'cls', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cmdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cmdf', N'chemical/x-cmdf', 1, N'cmdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cml', N'chemical/x-cml', 1, N'cml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cod')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cod', N'application/vnd.rim.cod', 1, N'cod', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'com')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'com', N'application/x-msdos-program', 1, N'com', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'component')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'component', N'application/octet-stream', 1, N'component', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cpa')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cpa', N'chemical/x-compass', 1, N'cpa', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cpio')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cpio', N'application/x-cpio', 1, N'cpio', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cpp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cpp', N'text/x-c++src', 1, N'cpp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cpt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cpt', N'application/mac-compactpro', 1, N'cpt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cr2')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cr2', N'image/x-canon-cr2', 1, N'cr2', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'crl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'crl', N'application/x-pkcs7-crl', 1, N'crl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'crt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'crt', N'application/x-x509-ca-cert', 1, N'crt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'crw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'crw', N'image/x-canon-crw', 1, N'crw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'csf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'csf', N'chemical/x-cache-csf', 1, N'csf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'csh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'csh', N'application/x-csh', 1, N'csh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'csm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'csm', N'chemical/x-csml', 1, N'csm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'csml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'csml', N'chemical/x-csml', 1, N'csml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'css')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'css', N'text/css', 1, N'css', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'csv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'csv', N'text/csv', 1, N'csv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ctab')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ctab', N'chemical/x-cactvs-binary', 1, N'ctab', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ctx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ctx', N'chemical/x-ctx', 1, N'ctx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cu')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cu', N'application/cu-seeme', 1, N'cu', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cub')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cub', N'chemical/x-gaussian-cube', 1, N'cub', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cxf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cxf', N'chemical/x-cxf', 1, N'cxf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'cxx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'cxx', N'text/x-c++src', 1, N'cxx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'd', N'text/x-dsrc', 1, N'd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dat')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dat', N'application/x-ns-proxy-autoconfig', 1, N'dat', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'davmount')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'davmount', N'application/davmount+xml', 1, N'davmount', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dcr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dcr', N'application/x-director', 1, N'dcr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'deb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'deb', N'application/x-debian-package', 1, N'deb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'der')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'der', N'application/x-x509-ca-cert', 1, N'der', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dif', N'video/dv', 1, N'dif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'diff')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'diff', N'text/x-diff', 1, N'diff', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dir')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dir', N'application/x-director', 1, N'dir', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'djv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'djv', N'image/vnd.djvu', 1, N'djv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'djvu')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'djvu', N'image/vnd.djvu', 1, N'djvu', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dl', N'video/dl', 1, N'dl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dll')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dll', N'application/x-msdos-program', 1, N'dll', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dmg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dmg', N'application/x-apple-diskimage', 1, N'dmg', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dms')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dms', N'application/x-dms', 1, N'dms', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'doc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'doc', N'application/msword', 1, N'doc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'docx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, N'docx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dot')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dot', N'application/msword', 1, N'dot', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dotx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dotx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 1, N'dotx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dv', N'video/dv', 1, N'dv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dvi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dvi', N'application/x-dvi', 1, N'dvi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dx', N'chemical/x-jcamp-dx', 1, N'dx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'dxr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'dxr', N'application/x-director', 1, N'dxr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'emb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'emb', N'chemical/x-embl-dl-nucleotide', 1, N'emb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'embl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'embl', N'chemical/x-embl-dl-nucleotide', 1, N'embl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'eml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'eml', N'message/rfc822', 1, N'eml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ent')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ent', N'chemical/x-ncbi-asn1-ascii', 1, N'ent', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'eps')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'eps', N'application/postscript', 1, N'eps', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'eps2')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'eps2', N'application/postscript', 1, N'eps2', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'eps3')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'eps3', N'application/postscript', 1, N'eps3', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'epsf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'epsf', N'application/postscript', 1, N'epsf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'epsi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'epsi', N'application/postscript', 1, N'epsi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'erf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'erf', N'image/x-epson-erf', 1, N'erf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'es')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'es', N'application/ecmascript', 1, N'es', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'etx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'etx', N'text/x-setext', 1, N'etx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'exe')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'exe', N'application/x-msdos-program', 1, N'exe', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ez')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ez', N'application/andrew-inset', 1, N'ez', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fb', N'application/x-maker', 1, N'fb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fbdoc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fbdoc', N'application/x-maker', 1, N'fbdoc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fch')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fch', N'chemical/x-gaussian-checkpoint', 1, N'fch', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fchk')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fchk', N'chemical/x-gaussian-checkpoint', 1, N'fchk', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fig')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fig', N'application/x-xfig', 1, N'fig', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'flac')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'flac', N'audio/flac', 1, N'flac', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fli')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fli', N'video/fli', 1, N'fli', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'flv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'flv', N'video/x-flv', 1, N'flv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'fm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'fm', N'application/x-maker', 1, N'fm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'frame')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'frame', N'application/x-maker', 1, N'frame', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'frm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'frm', N'application/x-maker', 1, N'frm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gal')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gal', N'chemical/x-gaussian-log', 1, N'gal', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gam')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gam', N'chemical/x-gamess-input', 1, N'gam', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gamin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gamin', N'chemical/x-gamess-input', 1, N'gamin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gau')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gau', N'chemical/x-gaussian-input', 1, N'gau', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gcd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gcd', N'text/x-pcs-gcd', 1, N'gcd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gcf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gcf', N'application/x-graphing-calculator', 1, N'gcf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gcg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gcg', N'chemical/x-gcg8-sequence', 1, N'gcg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gen')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gen', N'chemical/x-genbank', 1, N'gen', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gf', N'application/x-tex-gf', 1, N'gf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gif', N'image/gif', 1, N'gif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gjc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gjc', N'chemical/x-gaussian-input', 1, N'gjc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gjf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gjf', N'chemical/x-gaussian-input', 1, N'gjf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gl', N'video/gl', 1, N'gl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gnumeric')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gnumeric', N'application/x-gnumeric', 1, N'gnumeric', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gpt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gpt', N'chemical/x-mopac-graph', 1, N'gpt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gsf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gsf', N'application/x-font', 1, N'gsf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gsm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gsm', N'audio/x-gsm', 1, N'gsm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'gtar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'gtar', N'application/x-gtar', 1, N'gtar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'h')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'h', N'text/x-chdr', 1, N'h', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'h++')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'h++', N'text/x-c++hdr', 1, N'h++', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hdf', N'application/x-hdf', 1, N'hdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hh', N'text/x-c++hdr', 1, N'hh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hin', N'chemical/x-hin', 1, N'hin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hpp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hpp', N'text/x-c++hdr', 1, N'hpp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hqx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hqx', N'application/mac-binhex40', 1, N'hqx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hs')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hs', N'text/x-haskell', 1, N'hs', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hta')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hta', N'application/hta', 1, N'hta', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'htc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'htc', N'text/x-component', 1, N'htc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'htm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'htm', N'text/html', 1, N'htm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'html')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'html', N'text/html', 1, N'html', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'hxx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'hxx', N'text/x-c++hdr', 1, N'hxx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iac')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iac', N'application/octet-stream', 1, N'iac', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iads')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iads', N'application/octet-stream', 1, N'iads', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iap')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iap', N'application/octet-stream', 1, N'iap', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ica')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ica', N'application/x-ica', 1, N'ica', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ice')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ice', N'x-conference/x-cooltalk', 1, N'ice', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ico')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ico', N'image/x-icon', 1, N'ICON', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ics')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ics', N'text/calendar', 1, N'ics', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'icz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'icz', N'text/calendar', 1, N'icz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ief')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ief', N'image/ief', 1, N'ief', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iges')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iges', N'model/iges', 1, N'iges', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'igs')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'igs', N'model/iges', 1, N'igs', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iii')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iii', N'application/x-iphone', 1, N'iii', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'info')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'info', N'application/x-info', 1, N'info', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'inp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'inp', N'chemical/x-gamess-input', 1, N'inp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ins')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ins', N'application/x-internet-signup', 1, N'ins', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ionapi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ionapi', N'application/octet-stream', 1, N'ionapi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'iso')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'iso', N'application/x-iso9660-image', 1, N'iso', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'isp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'isp', N'application/x-internet-signup', 1, N'isp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ist')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ist', N'chemical/x-isostar', 1, N'ist', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'istr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'istr', N'chemical/x-isostar', 1, N'istr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jad')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jad', N'text/vnd.sun.j2me.app-descriptor', 1, N'jad', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jam')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jam', N'application/x-jam', 1, N'jam', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jar', N'application/java-archive', 1, N'jar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'java')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'java', N'text/x-java', 1, N'java', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jdx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jdx', N'chemical/x-jcamp-dx', 1, N'jdx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jks')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jks', N'application/octet-stream', 1, N'jks', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jmz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jmz', N'application/x-jmol', 1, N'jmz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jng')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jng', N'image/x-jng', 1, N'jng', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jnlp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jnlp', N'application/x-java-jnlp-file', 1, N'jnlp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jpe')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jpe', N'image/jpeg', 1, N'JPEG', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jpeg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jpeg', N'image/jpeg', 1, N'JPEG', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'jpg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'jpg', N'image/jpeg', 1, N'JPEG', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'js')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'js', N'application/javascript', 1, N'js', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'json')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'json', N'application/json', 1, N'json', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kar', N'audio/midi', 1, N'kar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'key')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'key', N'application/pgp-keys', 1, N'key', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kil')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kil', N'application/x-killustrator', 1, N'kil', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kin', N'chemical/x-kinemage', 1, N'kin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kml', N'application/vnd.google-earth.kml+xml', 1, N'kml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kmz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kmz', N'application/vnd.google-earth.kmz', 1, N'kmz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kpr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kpr', N'application/x-kpresenter', 1, N'kpr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kpt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kpt', N'application/x-kpresenter', 1, N'kpt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ksp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ksp', N'application/x-kspread', 1, N'ksp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kwd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kwd', N'application/x-kword', 1, N'kwd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'kwt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'kwt', N'application/x-kword', 1, N'kwt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'latex')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'latex', N'application/x-latex', 1, N'latex', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lha')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lha', N'application/x-lha', 1, N'lha', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lhs')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lhs', N'text/x-literate-haskell', 1, N'lhs', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lin')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lin', N'application/bbolin', 1, N'lin', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lsf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lsf', N'video/x-la-asf', 1, N'lsf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lsx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lsx', N'video/x-la-asf', 1, N'lsx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ltx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ltx', N'text/x-tex', 1, N'ltx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lyx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lyx', N'application/x-lyx', 1, N'lyx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lzh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lzh', N'application/x-lzh', 1, N'lzh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'lzx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'lzx', N'application/x-lzx', 1, N'lzx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'm3g')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'm3g', N'application/m3g', 1, N'm3g', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'm3u')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'm3u', N'audio/mpegurl', 1, N'm3u', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'm4a')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'm4a', N'audio/mpeg', 1, N'm4a', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'maker')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'maker', N'application/x-maker', 1, N'maker', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'man')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'man', N'application/x-troff-man', 1, N'man', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'manifest')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'manifest', N'text/cache-manifest', 1, N'manifest', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'map')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'map', N'application/octet-stream', 1, N'map', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mcif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mcif', N'chemical/x-mmcif', 1, N'mcif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mcm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mcm', N'chemical/x-macmolecule', 1, N'mcm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mdb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mdb', N'application/msaccess', 1, N'mdb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'me')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'me', N'application/x-troff-me', 1, N'me', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mesh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mesh', N'model/mesh', 1, N'mesh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mid')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mid', N'audio/midi', 1, N'mid', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'midi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'midi', N'audio/midi', 1, N'midi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mif', N'application/x-mif', 1, N'mif', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mkv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mkv', N'video/x-matroska', 1, N'mkv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mm', N'application/x-freemind', 1, N'mm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mmd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mmd', N'chemical/x-macromodel-input', 1, N'mmd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mmf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mmf', N'application/vnd.smaf', 1, N'mmf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mml', N'text/mathml', 1, N'mml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mmod')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mmod', N'chemical/x-macromodel-input', 1, N'mmod', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mng')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mng', N'video/x-mng', 1, N'mng', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'moc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'moc', N'text/x-moc', 1, N'moc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mol')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mol', N'chemical/x-mdl-molfile', 1, N'mol', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mol2')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mol2', N'chemical/x-mol2', 1, N'mol2', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'moo')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'moo', N'chemical/x-mopac-out', 1, N'moo', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mop')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mop', N'chemical/x-mopac-input', 1, N'mop', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mopcrt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mopcrt', N'chemical/x-mopac-input', 1, N'mopcrt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mov')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mov', N'video/quicktime', 1, N'mov', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'movie')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'movie', N'video/x-sgi-movie', 1, N'movie', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mp2')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mp2', N'audio/mpeg', 1, N'mp2', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mp3')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mp3', N'audio/mpeg', 1, N'mp3', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mp4')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mp4', N'video/mp4', 1, N'mp4', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpc', N'chemical/x-mopac-input', 1, N'mpc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpe')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpe', N'video/mpeg', 1, N'mpe', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpeg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpeg', N'video/mpeg', 1, N'mpeg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpega')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpega', N'audio/mpeg', 1, N'mpega', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpg', N'video/mpeg', 1, N'mpg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpga')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpga', N'audio/mpeg', 1, N'mpga', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mpv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mpv', N'video/x-matroska', 1, N'mpv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ms')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ms', N'application/x-troff-ms', 1, N'ms', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'msg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'msg', N'application/vnd.ms-outlook', 1, N'msg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'msh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'msh', N'model/mesh', 1, N'msh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'msi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'msi', N'application/x-msi', 1, N'msi', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mvb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mvb', N'chemical/x-mopac-vib', 1, N'mvb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mxf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mxf', N'application/mxf', 1, N'mxf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'mxu')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'mxu', N'video/vnd.mpegurl', 1, N'mxu', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'nb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'nb', N'application/mathematica', 1, N'nb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'nbp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'nbp', N'application/mathematica', 1, N'nbp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'nc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'nc', N'application/x-netcdf', 1, N'nc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'nef')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'nef', N'image/x-nikon-nef', 1, N'nef', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'nwc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'nwc', N'application/x-nwc', 1, N'nwc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'o')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'o', N'application/x-object', 1, N'o', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'oda')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'oda', N'application/oda', 1, N'oda', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odb', N'application/vnd.oasis.opendocument.database', 1, N'odb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odc', N'application/vnd.oasis.opendocument.chart', 1, N'odc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odf', N'application/vnd.oasis.opendocument.formula', 1, N'odf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odg', N'application/vnd.oasis.opendocument.graphics', 1, N'odg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odi', N'application/vnd.oasis.opendocument.image', 1, N'odi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odm', N'application/vnd.oasis.opendocument.text-master', 1, N'odm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odp', N'application/vnd.oasis.opendocument.presentation', 1, N'odp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ods')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ods', N'application/vnd.oasis.opendocument.spreadsheet', 1, N'ods', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'odt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'odt', N'application/vnd.oasis.opendocument.text', 1, N'odt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'oga')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'oga', N'audio/ogg', 1, N'oga', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ogg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ogg', N'audio/ogg', 1, N'ogg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ogv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ogv', N'video/ogg', 1, N'ogv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ogx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ogx', N'application/ogg', 1, N'ogx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'old')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'old', N'application/x-trash', 1, N'old', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'orf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'orf', N'image/x-olympus-orf', 1, N'orf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'otg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'otg', N'application/vnd.oasis.opendocument.graphics-template', 1, N'otg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'oth')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'oth', N'application/vnd.oasis.opendocument.text-web', 1, N'oth', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'otp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'otp', N'application/vnd.oasis.opendocument.presentation-template', 1, N'otp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ots')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ots', N'application/vnd.oasis.opendocument.spreadsheet-template', 1, N'ots', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ott')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ott', N'application/vnd.oasis.opendocument.text-template', 1, N'ott', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'oza')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'oza', N'application/x-oz-application', 1, N'oza', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'p')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'p', N'text/x-pascal', 1, N'p', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'p12')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'p12', N'application/x-pkcs12', 1, N'p12', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'p7r')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'p7r', N'application/x-pkcs7-certreqresp', 1, N'p7r', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pac')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pac', N'application/x-ns-proxy-autoconfig', 1, N'pac', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pas')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pas', N'text/x-pascal', 1, N'pas', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pat')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pat', N'image/x-coreldrawpattern', 1, N'pat', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'patch')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'patch', N'text/x-diff', 1, N'patch', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pbm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pbm', N'image/x-portable-bitmap', 1, N'pbm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pcap')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pcap', N'application/cap', 1, N'pcap', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pcf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pcf', N'application/x-font', 1, N'pcf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pcf.Z')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pcf.Z', N'application/x-font', 1, N'pcf.Z', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pcx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pcx', N'image/pcx', 1, N'pcx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pdb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pdb', N'chemical/x-pdb', 1, N'pdb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pdf', N'application/pdf', 1, N'pdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pfa')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pfa', N'application/x-font', 1, N'pfa', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pfb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pfb', N'application/x-font', 1, N'pfb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pfx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pfx', N'application/x-pkcs12', 1, N'pfx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pgm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pgm', N'image/x-portable-graymap', 1, N'pgm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pgn')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pgn', N'application/x-chess-pgn', 1, N'pgn', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pgp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pgp', N'application/pgp-signature', 1, N'pgp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'php')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'php', N'application/x-httpd-php', 1, N'php', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'php3')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'php3', N'application/x-httpd-php3', 1, N'php3', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'php3p')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'php3p', N'application/x-httpd-php3-preprocessed', 1, N'php3p', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'php4')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'php4', N'application/x-httpd-php4', 1, N'php4', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'php5')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'php5', N'application/x-httpd-php5', 1, N'php5', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'phps')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'phps', N'application/x-httpd-php-source', 1, N'phps', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pht')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pht', N'application/x-httpd-php', 1, N'pht', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'phtml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'phtml', N'application/x-httpd-php', 1, N'phtml', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pk')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pk', N'application/x-tex-pk', 1, N'pk', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pl', N'text/x-perl', 1, N'pl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pls')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pls', N'audio/x-scpls', 1, N'pls', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pm', N'text/x-perl', 1, N'pm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'png')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'png', N'image/png', 1, N'png', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pnm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pnm', N'image/x-portable-anymap', 1, N'pnm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pot')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pot', N'text/plain', 1, N'pot', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'potx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'potx', N'application/vnd.openxmlformats-officedocument.presentationml.template', 1, N'potx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ppm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ppm', N'image/x-portable-pixmap', 1, N'ppm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pps')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pps', N'application/vnd.ms-powerpoint', 1, N'pps', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ppsx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ppsx', N'application/vnd.openxmlformats-officedocument.presentationml.slideshow', 1, N'ppsx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ppt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ppt', N'application/vnd.ms-powerpoint', 1, N'ppt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pptx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pptx', N'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1, N'pptx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'prf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'prf', N'application/pics-rules', 1, N'prf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'prt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'prt', N'chemical/x-ncbi-asn1-ascii', 1, N'prt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ps')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ps', N'application/postscript', 1, N'ps', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'psd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'psd', N'image/x-photoshop', 1, N'psd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'py')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'py', N'text/x-python', 1, N'py', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pyc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pyc', N'application/x-python-code', 1, N'pyc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'pyo')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'pyo', N'application/x-python-code', 1, N'pyo', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'qgs')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'qgs', N'application/x-qgis', 1, N'qgs', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'qt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'qt', N'video/quicktime', 1, N'qt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'qtl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'qtl', N'application/x-quicktimeplayer', 1, N'qtl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ra')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ra', N'audio/x-pn-realaudio', 1, N'ra', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ram')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ram', N'audio/x-pn-realaudio', 1, N'ram', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rar', N'application/rar', 1, N'rar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ras')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ras', N'image/x-cmu-raster', 1, N'ras', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rb', N'application/x-ruby', 1, N'rb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rd', N'chemical/x-mdl-rdfile', 1, N'rd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rdf', N'application/rdf+xml', 1, N'rdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rgb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rgb', N'image/x-rgb', 1, N'rgb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rhtml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rhtml', N'application/x-httpd-eruby', 1, N'rhtml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rm', N'audio/x-pn-realaudio', 1, N'rm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'roff')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'roff', N'application/x-troff', 1, N'roff', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ros')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ros', N'chemical/x-rosdal', 1, N'ros', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rpm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rpm', N'application/x-redhat-package-manager', 1, N'rpm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rss')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rss', N'application/rss+xml', 1, N'rss', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rtf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rtf', N'application/rtf', 1, N'rtf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rtx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rtx', N'text/richtext', 1, N'rtx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'rxn')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'rxn', N'chemical/x-mdl-rxnfile', 1, N'rxn', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'scala')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'scala', N'text/x-scala', 1, N'scala', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'scr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'scr', N'application/x-silverlight', 1, N'scr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sct')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sct', N'text/scriptlet', 1, N'sct', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sd', N'chemical/x-mdl-sdfile', 1, N'sd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sd2')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sd2', N'audio/x-sd2', 1, N'sd2', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sda')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sda', N'application/vnd.stardivision.draw', 1, N'sda', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sdc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sdc', N'application/vnd.stardivision.calc', 1, N'sdc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sdd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sdd', N'application/vnd.stardivision.impress', 1, N'sdd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sdf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sdf', N'application/vnd.stardivision.math', 1, N'sdf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sds')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sds', N'application/vnd.stardivision.chart', 1, N'sds', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sdw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sdw', N'application/vnd.stardivision.writer', 1, N'sdw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ser')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ser', N'application/java-serialized-object', 1, N'ser', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sgf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sgf', N'application/x-go-sgf', 1, N'sgf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sgl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sgl', N'application/vnd.stardivision.writer-global', 1, N'sgl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sh')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sh', N'application/x-sh', 1, N'sh', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'shar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'shar', N'application/x-shar', 1, N'shar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'shp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'shp', N'application/x-qgis', 1, N'shp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'shtml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'shtml', N'text/html', 1, N'shtml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'shx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'shx', N'application/x-qgis', 1, N'shx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sid')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sid', N'audio/prs.sid', 1, N'sid', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sik')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sik', N'application/x-trash', 1, N'sik', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'silo')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'silo', N'model/mesh', 1, N'silo', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sis')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sis', N'application/vnd.symbian.install', 1, N'sis', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sisx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sisx', N'x-epoc/x-sisx-app', 1, N'sisx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sit')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sit', N'application/x-stuffit', 1, N'sit', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sitx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sitx', N'application/x-stuffit', 1, N'sitx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'skd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'skd', N'application/x-koan', 1, N'skd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'skm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'skm', N'application/x-koan', 1, N'skm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'skp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'skp', N'application/x-koan', 1, N'skp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'skt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'skt', N'application/x-koan', 1, N'skt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'smi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'smi', N'application/smil', 1, N'smi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'smil')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'smil', N'application/smil', 1, N'smil', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'snd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'snd', N'audio/basic', 1, N'snd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'spc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'spc', N'chemical/x-galactic-spc', 1, N'spc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'spl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'spl', N'application/futuresplash', 1, N'spl', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'spx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'spx', N'audio/ogg', 1, N'spx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sql')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sql', N'application/octet-stream', 1, N'sql', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'src')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'src', N'application/x-wais-source', 1, N'src', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'stc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'stc', N'application/vnd.sun.xml.calc.template', 1, N'stc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'std')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'std', N'application/vnd.sun.xml.draw.template', 1, N'std', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sti')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sti', N'application/vnd.sun.xml.impress.template', 1, N'sti', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'stl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'stl', N'application/vnd.ms-pki.stl', 1, N'stl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'stw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'stw', N'application/vnd.sun.xml.writer.template', 1, N'stw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sty')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sty', N'text/x-tex', 1, N'sty', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sv4cpio')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sv4cpio', N'application/x-sv4cpio', 1, N'sv4cpio', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sv4crc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sv4crc', N'application/x-sv4crc', 1, N'sv4crc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'svg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'svg', N'image/svg+xml', 1, N'svg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'svgz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'svgz', N'image/svg+xml', 1, N'svgz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sw', N'chemical/x-swissprot', 1, N'sw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'swf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'swf', N'application/x-shockwave-flash', 1, N'swf', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'swfl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'swfl', N'application/x-shockwave-flash', 1, N'swfl', 0)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxc', N'application/vnd.sun.xml.calc', 1, N'sxc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxd', N'application/vnd.sun.xml.draw', 1, N'sxd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxg')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxg', N'application/vnd.sun.xml.writer.global', 1, N'sxg', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxi', N'application/vnd.sun.xml.impress', 1, N'sxi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxm', N'application/vnd.sun.xml.math', 1, N'sxm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'sxw')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'sxw', N'application/vnd.sun.xml.writer', 1, N'sxw', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N't')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N't', N'application/x-troff', 1, N't', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tar', N'application/x-tar', 1, N'tar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'taz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'taz', N'application/x-gtar', 1, N'taz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tcl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tcl', N'application/x-tcl', 1, N'tcl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tex')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tex', N'text/x-tex', 1, N'tex', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'texi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'texi', N'application/x-texinfo', 1, N'texi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'texinfo')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'texinfo', N'application/x-texinfo', 1, N'texinfo', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'text')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'text', N'text/plain', 1, N'text', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tgf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tgf', N'chemical/x-mdl-tgf', 1, N'tgf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tgz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tgz', N'application/x-gtar', 1, N'tgz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tif')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tif', N'image/tiff', 1, N'TIFF', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tiff')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tiff', N'image/tiff', 1, N'TIFF', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tk')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tk', N'text/x-tcl', 1, N'tk', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tm', N'text/texmacs', 1, N'tm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'torrent')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'torrent', N'application/x-bittorrent', 1, N'torrent', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tr')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tr', N'application/x-troff', 1, N'tr', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ts')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ts', N'text/texmacs', 1, N'ts', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tsp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tsp', N'application/dsptype', 1, N'tsp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'tsv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'tsv', N'text/tab-separated-values', 1, N'tsv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'txt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'txt', N'text/plain', 1, N'txt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'udeb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'udeb', N'application/x-debian-package', 1, N'udeb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'uls')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'uls', N'text/iuls', 1, N'uls', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'ustar')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'ustar', N'application/x-ustar', 1, N'ustar', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'val')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'val', N'chemical/x-ncbi-asn1-binary', 1, N'val', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vcd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vcd', N'application/x-cdlink', 1, N'vcd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vcf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vcf', N'text/x-vcard', 1, N'vcf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vcs')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vcs', N'text/x-vcalendar', 1, N'vcs', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vmd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vmd', N'chemical/x-vmd', 1, N'vmd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vms')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vms', N'chemical/x-vamas-iso14976', 1, N'vms', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vrm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vrm', N'x-world/x-vrml', 1, N'vrm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vrml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vrml', N'model/vrml', 1, N'vrml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'vsd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'vsd', N'application/vnd.visio', 1, N'vsd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wad')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wad', N'application/x-doom', 1, N'wad', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wav')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wav', N'audio/x-wav', 1, N'wav', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wax')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wax', N'audio/x-ms-wax', 1, N'wax', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wbmp')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wbmp', N'image/vnd.wap.wbmp', 1, N'wbmp', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wbxml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wbxml', N'application/vnd.wap.wbxml', 1, N'wbxml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wk')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wk', N'application/x-123', 1, N'wk', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wm', N'video/x-ms-wm', 1, N'wm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wma')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wma', N'audio/x-ms-wma', 1, N'wma', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmd', N'application/x-ms-wmd', 1, N'wmd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wml', N'text/vnd.wap.wml', 1, N'wml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmlc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmlc', N'application/vnd.wap.wmlc', 1, N'wmlc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmls')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmls', N'text/vnd.wap.wmlscript', 1, N'wmls', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmlsc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmlsc', N'application/vnd.wap.wmlscriptc', 1, N'wmlsc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmv', N'video/x-ms-wmv', 1, N'wmv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmx', N'video/x-ms-wmx', 1, N'wmx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wmz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wmz', N'application/x-ms-wmz', 1, N'wmz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wp5')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wp5', N'application/vnd.wordperfect5.1', 1, N'wp5', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wpd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wpd', N'application/vnd.wordperfect', 1, N'wpd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wrl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wrl', N'model/vrml', 1, N'wrl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wsc')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wsc', N'text/scriptlet', 1, N'wsc', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wvx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wvx', N'video/x-ms-wvx', 1, N'wvx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'wz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'wz', N'application/x-wingz', 1, N'wz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'x3d')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'x3d', N'model/x3d+xml', 1, N'x3d', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'x3db')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'x3db', N'model/x3d+binary', 1, N'x3db', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'x3dv')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'x3dv', N'model/x3d+vrml', 1, N'x3dv', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xbm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xbm', N'image/x-xbitmap', 1, N'xbm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xcf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xcf', N'application/x-xcf', 1, N'xcf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xht')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xht', N'application/xhtml+xml', 1, N'xht', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xhtml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xhtml', N'application/xhtml+xml', 1, N'xhtml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xlb')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xlb', N'application/vnd.ms-excel', 1, N'xlb', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xls')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xls', N'application/vnd.ms-excel', 1, N'xls', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xlsx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xlsx', N'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 1, N'xlsx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xlt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xlt', N'application/vnd.ms-excel', 1, N'xlt', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xltx')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xltx', N'application/vnd.openxmlformats-officedocument.spreadsheetml.template', 1, N'xltx', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xml')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xml', N'application/xml', 1, N'xml', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xpi')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xpi', N'application/x-xpinstall', 1, N'xpi', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xpm')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xpm', N'image/x-xpixmap', 1, N'xpm', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xsd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xsd', N'application/xml', 1, N'xsd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xsl')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xsl', N'application/xml', 1, N'xsl', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xspf')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xspf', N'application/xspf+xml', 1, N'xspf', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xtel')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xtel', N'chemical/x-xtel', 1, N'xtel', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xul')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xul', N'application/vnd.mozilla.xul+xml', 1, N'xul', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xwd')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xwd', N'image/x-xwindowdump', 1, N'xwd', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'xyz')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'xyz', N'chemical/x-xyz', 1, N'xyz', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'zip')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'zip', N'application/zip', 1, N'zip', 1)

IF NOT EXISTS(SELECT 1 FROM MediaType WHERE DocumentExtension = N'zmt')
INSERT INTO MediaType(DocumentExtension, MediaType, Active, BlobFormat, AllowUpload) VALUES(N'zmt', N'chemical/x-mopac-input', 1, N'zmt', 1)

GO