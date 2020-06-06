##---------------------------------------------------------------------------##
##  File:
##	@(#) iso8859.pl 2.2 98/08/10 23:19:53
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      Routines to process data encoded in iso8859 character sets.
##---------------------------------------------------------------------------##
##    Copyright (C) 1996,1998	Earl Hood, earlhood@usa.net
##
##    This program is free software; you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation; either version 2 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program; if not, write to the Free Software
##    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
##    02111-1307, USA
##---------------------------------------------------------------------------##

package iso_8859;

###############################################################################
##	Mapping arrays for characters to entity references
###############################################################################

##---------------------------------------------------------------------------
##      US-ASCII/Common characters
##---------------------------------------------------------------------------

%US_ASCII_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0x26,	"&amp;",	# ISOnum : Ampersand
    0x3C,	"&lt;", 	# ISOnum : Less-than sign
    0x3E,	"&gt;", 	# ISOnum : Greater-than sign

    0xA0,	"&nbsp;",	# ISOnum : NO-BREAK SPACE
);

##---------------------------------------------------------------------------
##      ISO-8859-1: Latin-1
##---------------------------------------------------------------------------

%ISO_8859_1_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&iexcl;",	# ISOnum : INVERTED EXCLAMATION MARK
    0xA2,	"&cent;",	# ISOnum : CENT SIGN
    0xA3,	"&pound;",	# ISOnum : POUND SIGN
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA5,	"&yen;",	# ISOnum : YEN SIGN
    0xA6,	"&brvbar;",	# ISOnum : BROKEN BAR
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&copy;",	# ISOnum : COPYRIGHT SIGN
    0xAA,	"&ordf;",	# ISOnum : FEMININE ORDINAL INDICATOR
    0xAB,	"&laquo;",	# ISOnum : LEFT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xAC,	"&not;",	# ISOnum : NOT SIGN
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&reg;",	# ISOnum : REGISTERED SIGN
    0xAF,	"&macr;",	# ISOdia : OVERLINE (MACRON)
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&plusmn;",	# ISOnum : PLUS-MINUS SIGN
    0xB2,	"&sup2;",	# ISOnum : SUPERSCRIPT TWO
    0xB3,	"&sup3;",	# ISOnum : SUPERSCRIPT THREE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&micro;",	# ISOnum : MICRO SIGN
    0xB6,	"&para;",	# ISOnum : PILCROW SIGN
    0xB7,	"&middot;",	# ISOnum : MIDDLE DOT
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&sup1;",	# ISOnum : SUPERSCRIPT ONE
    0xBA,	"&ordm;",	# ISOnum : MASCULINE ORDINAL INDICATOR
    0xBB,	"&raquo;",	# ISOnum : RIGHT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xBC,	"&frac14;",	# ISOnum : VULGAR FRACTION ONE QUARTER
    0xBD,	"&half;",	# ISOnum : VULGAR FRACTION ONE HALF
    0xBE,	"&frac34;",	# ISOnum : VULGAR FRACTION THREE QUARTERS
    0xBF,	"&iquest;",	# ISOnum : INVERTED QUESTION MARK
    0xC0,	"&Agrave;",	# ISOlat1: LATIN CAPITAL LETTER A WITH GRAVE
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	"&Atilde;",	# ISOlat1: LATIN CAPITAL LETTER A WITH TILDE
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Aring;",	# ISOlat1: LATIN CAPITAL LETTER A WITH RING
				#	   ABOVE
    0xC6,	"&AElig;",	# ISOlat1: LATIN CAPITAL LETTER AE
    0xC7,	"&Ccedil;",	# ISOlat1: LATIN CAPITAL LETTER C WITH CEDILLA
    0xC8,	"&Egrave;",	# ISOlat1: LATIN CAPITAL LETTER E WITH GRAVE
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Ecirc;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   CIRCUMFLEX
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Igrave;",	# ISOlat1: LATIN CAPITAL LETTER I WITH GRAVE
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Iuml;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   DIAERESIS
    0xD0,	"&ETH;",	# ISOlat1: LATIN CAPITAL LETTER ETH (Icelandic)
    0xD1,	"&Ntilde;",	# ISOlat1: LATIN CAPITAL LETTER N WITH TILDE
    0xD2,	"&Ograve;",	# ISOlat1: LATIN CAPITAL LETTER O WITH GRAVE
    0xD3,	"&Oacute;",	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Otilde;",	# ISOlat1: LATIN CAPITAL LETTER O WITH TILDE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xD8,	"&Oslash;",	# ISOlat1: LATIN CAPITAL LETTER O WITH STROKE
    0xD9,	"&Ugrave;",	# ISOlat1: LATIN CAPITAL LETTER U WITH GRAVE
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Ucirc;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Yacute;",	# ISOlat1: LATIN CAPITAL LETTER Y WITH ACUTE
    0xDE,	"&THORN;",	# ISOlat1: LATIN CAPITAL LETTER THORN
				#	   (Icelandic)
    0xDF,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	"&agrave;",	# ISOlat1: LATIN SMALL LETTER A WITH GRAVE
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE3,	"&atilde;",	# ISOlat1: LATIN SMALL LETTER A WITH TILDE
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	"&aring;",	# ISOlat1: LATIN SMALL LETTER A WITH RING ABOVE
    0xE6,	"&aelig;",	# ISOlat1: LATIN SMALL LETTER AE
    0xE7,	"&ccedil;",	# ISOlat1: LATIN SMALL LETTER C WITH CEDILLA
    0xE8,	"&egrave;",	# ISOlat1: LATIN SMALL LETTER E WITH GRAVE
    0xE9,	"&eacute;",	# ISOlat1: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	"&ecirc;",	# ISOlat1: LATIN SMALL LETTER E WITH CIRCUMFLEX
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	"&igrave;",	# ISOlat1: LATIN SMALL LETTER I WITH GRAVE
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	"&iuml;",	# ISOlat1: LATIN SMALL LETTER I WITH DIAERESIS
    0xF0,	"&eth;",	# ISOlat1: LATIN SMALL LETTER ETH (Icelandic)
    0xF1,	"&ntilde;",	# ISOlat1: LATIN SMALL LETTER N WITH TILDE
    0xF2,	"&ograve;",	# ISOlat1: LATIN SMALL LETTER O WITH GRAVE
    0xF3,	"&oacute;",	# ISOlat1: LATIN SMALL LETTER O WITH ACUTE
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	"&otilde;",	# ISOlat1: LATIN SMALL LETTER O WITH TILDE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	"&divide;",	# ISOnum : DIVISION SIGN
    0xF8,	"&oslash;",	# ISOlat1: LATIN SMALL LETTER O WITH STROKE
    0xF9,	"&ugrave;",	# ISOlat1: LATIN SMALL LETTER U WITH GRAVE
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	"&ucirc;",	# ISOlat1: LATIN SMALL LETTER U WITH CIRCUMFLEX
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	"&yacute;",	# ISOlat1: LATIN SMALL LETTER Y WITH ACUTE
    0xFE,	"&thorn;",	# ISOlat1: LATIN SMALL LETTER THORN
				#	   (Icelandic)
    0xFF,	"&yuml;",	# ISOlat1: LATIN SMALL LETTER Y WITH DIAERESIS
);

##---------------------------------------------------------------------------
##	ISO-8859-2: Latin-2
##---------------------------------------------------------------------------

%ISO_8859_2_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&Aogon;",	# ISOlat2: LATIN CAPITAL LETTER A WITH OGONEK
    0xA2,	"&breve;",	# ISOdia : BREVE
    0xA3,	"&Lstrok;",	# ISOlat2: LATIN CAPITAL LETTER L WITH STROKE
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA5,	"&Lcaron;",	# ISOlat2: LATIN CAPITAL LETTER L WITH CARON
    0xA6,	"&Sacute;",	# ISOlat2: LATIN CAPITAL LETTER S WITH ACUTE
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&Scaron;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CARON
    0xAA,	"&Scedil;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CEDILLA
    0xAB,	"&Tcaron;",	# ISOlat2: LATIN CAPITAL LETTER T WITH CARON
    0xAC,	"&Zacute;",	# ISOlat2: LATIN CAPITAL LETTER Z WITH ACUTE
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&Zcaron;",	# ISOlat2: LATIN CAPITAL LETTER Z WITH CARON
    0xAF,	"&Zdot;",	# ISOlat2: LATIN CAPITAL LETTER Z WITH DOT
				#	   ABOVE
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&aogon;",	# ISOlat2: LATIN SMALL LETTER A WITH OGONEK
    0xB2,	"&ogon;",	# ISOdia : OGONEK
    0xB3,	"&lstrok;",	# ISOlat2: LATIN SMALL LETTER L WITH STROKE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&lcaron;",	# ISOlat2: LATIN SMALL LETTER L WITH CARON
    0xB6,	"&sacute;",	# ISOlat2: LATIN SMALL LETTER S WITH ACUTE
    0xB7,	"&caron;",	# ISOdia : CARON
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&scaron;",	# ISOlat2: LATIN SMALL LETTER S WITH CARON
    0xBA,	"&scedil;",	# ISOlat2: LATIN SMALL LETTER S WITH CEDILLA
    0xBB,	"&tcaron;",	# ISOlat2: LATIN SMALL LETTER T WITH CARON
    0xBC,	"&zacute;",	# ISOlat2: LATIN SMALL LETTER Z WITH ACUTE
    0xBD,	"&dblac;",	# ISOdia : DOUBLE ACUTE ACCENT
    0xBE,	"&zcaron;",	# ISOlat2: LATIN SMALL LETTER Z WITH CARON
    0xBF,	"&zdot;",	# ISOlat2: LATIN SMALL LETTER Z WITH DOT ABOVE
    0xC0,	"&Racute;",	# ISOlat2: LATIN CAPITAL LETTER R WITH ACUTE
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	"&Abreve;",	# ISOlat2: LATIN CAPITAL LETTER A WITH BREVE
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Lacute;",	# ISOlat2: LATIN CAPITAL LETTER L WITH ACUTE
    0xC6,	"&Cacute;",	# ISOlat2: LATIN CAPITAL LETTER C WITH ACUTE
    0xC7,	"&Ccedil;",	# ISOlat2: LATIN CAPITAL LETTER C WITH CEDILLA
    0xC8,	"&Ccaron;",	# ISOlat2: LATIN CAPITAL LETTER C WITH CARON
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Eogon;",	# ISOlat2: LATIN CAPITAL LETTER E WITH OGONEK
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Ecaron;",	# ISOlat2: LATIN CAPITAL LETTER E WITH CARON
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Dcaron;",	# ISOlat2: LATIN CAPITAL LETTER D WITH CARON
    0xD0,	"&Dstrok;",	# ISOlat2: LATIN CAPITAL LETTER D WITH STROKE
    0xD1,	"&Nacute;",	# ISOlat2: LATIN CAPITAL LETTER N WITH ACUTE
    0xD2,	"&Ncaron;",	# ISOlat2: LATIN CAPITAL LETTER N WITH CARON
    0xD3,	"&Oacute;",	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Odblac;",	# ISOlat2: LATIN CAPITAL LETTER O WITH DOUBLE
				#	   ACUTE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xD8,	"&Rcaron;",	# ISOlat2: LATIN CAPITAL LETTER R WITH CARON
    0xD9,	"&Uring;",	# ISOlat2: LATIN CAPITAL LETTER U WITH RING
				#	   ABOVE
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Udblac;",	# ISOlat2: LATIN CAPITAL LETTER U WITH DOUBLE
				#	   ACUTE
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Yacute;",	# ISOlat2: LATIN CAPITAL LETTER Y WITH ACUTE
    0xDE,	"&Tcedil;",	# ISOlat2: LATIN CAPITAL LETTER T WITH CEDILLA
    0xDF,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	"&racute;",	# ISOlat2: LATIN SMALL LETTER R WITH ACUTE
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE3,	"&abreve;",	# ISOlat2: LATIN SMALL LETTER A WITH BREVE
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	"&lacute;",	# ISOlat2: LATIN SMALL LETTER L WITH ACUTE
    0xE6,	"&cacute;",	# ISOlat2: LATIN SMALL LETTER C WITH ACUTE
    0xE7,	"&ccedil;",	# ISOlat1: LATIN SMALL LETTER C WITH CEDILLA
    0xE8,	"&ccaron;",	# ISOlat2: LATIN SMALL LETTER C WITH CARON
    0xE9,	"&eacute;",	# ISOlat1: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	"&eogon;",	# ISOlat2: LATIN SMALL LETTER E WITH OGONEK
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	"&ecaron;",	# ISOlat2: LATIN SMALL LETTER E WITH CARON
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	"&dcaron;",	# ISOlat2: LATIN SMALL LETTER D WITH CARON
    0xF0,	"&dstrok;",	# ISOlat2: LATIN SMALL LETTER D WITH STROKE
    0xF1,	"&nacute;",	# ISOlat2: LATIN SMALL LETTER N WITH ACUTE
    0xF2,	"&ncaron;",	# ISOlat2: LATIN SMALL LETTER N WITH CARON
    0xF3,	"&oacute;",	# ISOlat1: LATIN SMALL LETTER O WITH ACUTE
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	"&odblac;",	# ISOlat2: LATIN SMALL LETTER O WITH DOUBLE
				#	   ACUTE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	"&divide;",	# ISOnum : DIVISION SIGN
    0xF8,	"&rcaron;",	# ISOlat2: LATIN SMALL LETTER R WITH CARON
    0xF9,	"&uring;",	# ISOlat2: LATIN SMALL LETTER U WITH RING ABOVE
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	"&udblac;",	# ISOlat2: LATIN SMALL LETTER U WITH DOUBLE
				#	   ACUTE
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	"&yacute;",	# ISOlat1: LATIN SMALL LETTER Y WITH ACUTE
    0xFE,	"&tcedil;",	# ISOlat2: LATIN SMALL LETTER T WITH CEDILLA
    0xFF,	"&dot;",	# ISOdia : DOT ABOVE
);

##---------------------------------------------------------------------------
##	ISO-8859-3: Latin-3
##---------------------------------------------------------------------------

%ISO_8859_3_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&Hstrok;",	# ISOlat2: LATIN CAPITAL LETTER H WITH STROKE
    0xA2,	"&breve;",	# ISOdia : BREVE
    0xA3,	"&pound;",	# ISOnum : POUND SIGN
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA6,	"&Hcirc;",	# ISOlat2: LATIN CAPITAL LETTER H WITH
				#	   CIRCUMFLEX
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&Idot;",	# ISOlat2: LATIN CAPITAL LETTER I WITH DOT
				#	   ABOVE
    0xAA,	"&Scedil;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CEDILLA
    0xAB,	"&Gbreve;",	# ISOlat2: LATIN CAPITAL LETTER G WITH BREVE
    0xAC,	"&Jcirc;",	# ISOlat2: LATIN CAPITAL LETTER J WITH
				#	   CIRCUMFLEX
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAF,	"&Zdot;",	# ISOlat2: LATIN CAPITAL LETTER Z WITH DOT
				#	   ABOVE
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&hstrok;",	# ISOlat2: LATIN SMALL LETTER H WITH STROKE
    0xB2,	"&sup2;",	# ISOnum : SUPERSCRIPT TWO
    0xB3,	"&sup3;",	# ISOnum : SUPERSCRIPT THREE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&micro;",	# ISOnum : MICRO SIGN
    0xB6,	"&hcirc;",	# ISOlat2: LATIN SMALL LETTER H WITH
				#	   CIRCUMFLEX
    0xB7,	"&middot;",	# ISOnum : MIDDLE DOT
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&inodot;",	# ISOlat2: LATIN SMALL LETTER I DOTLESS
    0xBA,	"&scedil;",	# ISOlat2: LATIN SMALL LETTER S WITH CEDILLA
    0xBB,	"&gbreve;",	# ISOlat2: LATIN SMALL LETTER G WITH BREVE
    0xBC,	"&jcirc;",	# ISOlat2: LATIN SMALL LETTER J WITH CIRCUMFLEX
    0xBD,	"&half;",	# ISOnum : VULGAR FRACTION ONE HALF
    0xBF,	"&zdot;",	# ISOlat2: LATIN SMALL LETTER Z WITH DOT ABOVE
    0xC0,	"&Agrave;",	# ISOlat1: LATIN CAPITAL LETTER A WITH GRAVE
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Cdot;",	# ISOlat2: LATIN CAPITAL LETTER C WITH DOT
				#	   ABOVE
    0xC6,	"&Ccirc;",	# ISOlat2: LATIN CAPITAL LETTER C WITH
				#	   CIRCUMFLEX
    0xC7,	"&Ccedil;",	# ISOlat2: LATIN CAPITAL LETTER C WITH CEDILLA
    0xC8,	"&Egrave;",	# ISOlat1: LATIN CAPITAL LETTER E WITH GRAVE
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Ecirc;",	# ISOlat2: LATIN CAPITAL LETTER E WITH
				#	   CIRCUMFLEX
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Igrave;",	# ISOlat1: LATIN CAPITAL LETTER I WITH GRAVE
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Iuml;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   DIAERESIS
    0xD1,	"&Ntilde;",	# ISOlat1: LATIN CAPITAL LETTER N WITH TILDE
    0xD2,	"&Ograve;",	# ISOlat1: LATIN CAPITAL LETTER O WITH GRAVE
    0xD3,	"&Oacute;",	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Gdot;",	# ISOlat2: LATIN CAPITAL LETTER G WITH DOT
				#	   ABOVE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xD8,	"&Gcirc;",	# ISOlat2: LATIN CAPITAL LETTER G WITH
				#	   CIRCUMFLEX
    0xD9,	"&Ugrave;",	# ISOlat1: LATIN CAPITAL LETTER U WITH GRAVE
				#	   ABOVE
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Ucirc;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Ubreve;",	# ISOlat2: LATIN CAPITAL LETTER U WITH BREVE
    0xDE,	"&Scirc;",	# ISOlat2: LATIN CAPITAL LETTER S WITH
				#	   CIRCUMFLEX
    0xDF,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	"&agrave;",	# ISOlat1: LATIN SMALL LETTER A WITH GRAVE
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	"&cdot;",	# ISOlat2: LATIN SMALL LETTER C WITH DOT ABOVE
    0xE6,	"&ccirce;",	# ISOlat2: LATIN SMALL LETTER C WITH
				#	   CIRCUMFLEX
    0xE7,	"&ccedil;",	# ISOlat1: LATIN SMALL LETTER C WITH CEDILLA
    0xE8,	"&egrave;",	# ISOlat1: LATIN SMALL LETTER E WITH GRAVE
    0xE9,	"&eacute;",	# ISOlat2: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	"&ecirc;",	# ISOlat2: LATIN SMALL LETTER E WITH
				#	   CIRCUMFLEX
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	"&igrave;",	# ISOlat1: LATIN SMALL LETTER I WITH GRAVE
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	"&iuml;",	# ISOlat1: LATIN SMALL LETTER I WITH DIAERESIS
    0xF1,	"&ntilde;",	# ISOlat1: LATIN SMALL LETTER N WITH TILDE
    0xF2,	"&ograve;",	# ISOlat1: LATIN SMALL LETTER O WITH GRAVE
    0xF3,	"&oacute;",	# ISOlat1: LATIN SMALL LETTER O WITH ACUTE
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	"&gdot;",	# ISOlat2: LATIN SMALL LETTER G WITH DOT ABOVE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	"&divide;",	# ISOnum : DIVISION SIGN
    0xF8,	"&gcirc;",	# ISOlat2: LATIN SMALL LETTER G WITH
				#	   CIRCUMFLEX
    0xF9,	"&ugrave;",	# ISOlat1: LATIN SMALL LETTER U WITH GRAVE
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	"&ucirc;",	# ISOlat1: LATIN SMALL LETTER U WITH
				#	   CIRCUMFLEX
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	"&ubreve;",	# ISOlat2: LATIN SMALL LETTER U WITH BREVE
    0xFE,	"&scirc;",	# ISOlat2: LATIN SMALL LETTER S WITH
				#	   CIRCUMFLEX
    0xFF,	"&dot;",	# ISOdia : DOT ABOVE
);

##---------------------------------------------------------------------------
##	ISO-8859-4: Latin-4
##---------------------------------------------------------------------------

%ISO_8859_4_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&Aogon;",	# ISOlat2: LATIN CAPITAL LETTER A WITH OGONEK
    0xA2,	"&kgreen;",	# ISOlat2: LATIN SMALL LETTER KRA (Greenlandic)
    0xA3,	"&Rcedil;",	# ISOlat2: LATIN CAPITAL LETTER R WITH CEDILLA
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA5,	"&Itilde",     	# ISOlat2: LATIN CAPITAL LETTER I WITH TILDE
    0xA6,	"&Lcedil;",	# ISOlat2: LATIN CAPITAL LETTER L WITH CEDILLA
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&Scaron;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CARON
    0xAA,	"&Emacr;",	# ISOlat2: LATIN CAPITAL LETTER E WITH MACRON
    0xAB,	"&Gcedil;",	# ISOlat2: LATIN CAPITAL LETTER G WITH CEDILLA
    0xAC,	"&Tstrok;",	# ISOlat2: LATIN CAPITAL LETTER T WITH STROKE
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&Zcaron",     	# ISOlat2: LATIN CAPITAL LETTER Z WITH CARON
    0xAF,	"&macr;",	# ISOdia : MACRON
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&aogon;",	# ISOlat2: LATIN SMALL LETTER A WITH OGONEK
    0xB2,	"&ogon;",	# ISOdia : OGONEK
    0xB3,	"&rcedil;",	# ISOlat2: LATIN SMALL LETTER R WITH CEDILLA
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&itilde;",	# ISOlat2: LATIN SMALL LETTER I WITH TILDE
    0xB6,	"&lcedil;",	# ISOlat2: LATIN SMALL LETTER L WITH CEDILLA
    0xB7,	"&caron;",	# ISOdia : CARON
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&scaron;",	# ISOlat2: LATIN SMALL LETTER S WITH CARON
    0xBA,	"&emacr;",	# ISOlat2: LATIN SMALL LETTER E WITH MACRON
    0xBB,	"&gcedil;",	# ISOlat2: LATIN SMALL LETTER G WITH CEDILLA
    0xBC,	"&tstrok;",	# ISOlat2: LATIN SMALL LETTER J WITH STROKE
    0xBD,	"&ENG;",	# ISOlat2: LATIN CAPITAL LETTER ENG (Lappish)
    0xBE,	"&zcaron;",    	# ISOlat2: LATIN SMALL LETTER Z WITH CARON
    0xBF,	"&eng;",	# ISOlat2: LATIN SMALL LETTER ENG (Lappish)
    0xC0,	"&Amacr;",	# ISOlat1: LATIN CAPITAL LETTER A WITH MACRON
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	"&Atilde",     	# ISOlat1: LATIN CAPITAL LETTER A WITH TILDE
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Aring;",	# ISOlat1: LATIN CAPITAL LETTER A WITH RING
				#	   ABOVE
    0xC6,	"&AElig;",	# ISOlat1: LATIN CAPITAL LETTER AE
    0xC7,	"&Iogon;",	# ISOlat2: LATIN CAPITAL LETTER I WITH OGONEK
    0xC8,	"&Ccaron;",	# ISOlat2: LATIN CAPITAL LETTER C WITH CARON
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Eogon;",	# ISOlat2: LATIN CAPITAL LETTER E WITH OGONEK
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Edot;",	# ISOlat1: LATIN CAPITAL LETTER E WITH DOT
				#	   ABOVE
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Imacr;",	# ISOlat2: LATIN CAPITAL LETTER I WITH MACRON
    0xD0,	"&Dstrok",     	# ISOlat2: LATIN CAPITAL LETTER D WITH STROKE
    0xD1,	"&Ncedil;",	# ISOlat2: LATIN CAPITAL LETTER N WITH CEDILLA
    0xD2,	"&Omacr;",	# ISOlat2: LATIN CAPITAL LETTER O WITH MACRON
    0xD3,	"&Kcedil;",	# ISOlat2: LATIN CAPITAL LETTER K WITH CEDILLA
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Otilde;",	# ISOlat1: LATIN CAPITAL LETTER O WITH TILDE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xD8,	"&Oslash;",	# ISOlat1: LATIN CAPITAL LETTER O WITH STROKE
    0xD9,	"&Uogon;",	# ISOlat2: LATIN CAPITAL LETTER U WITH OGONEK
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Ucirc;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Utilde;",	# ISOlat2: LATIN CAPITAL LETTER U WITH TILDE
    0xDE,	"&Umacr;",	# ISOlat2: LATIN CAPITAL LETTER U WITH MACRON
    0xDF,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	"&amacr;",	# ISOlat1: LATIN SMALL LETTER A WITH MACRON
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE3,	"&atilde",     	# ISOlat1: LATIN SMALL LETTER A WITH TILDE
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	"&aring;",	# ISOlat1: LATIN SMALL LETTER A WITH RING ABOVE
    0xE6,	"&aelig;",	# ISOlat1: LATIN SMALL LETTER AE
    0xE7,	"&iogon;",	# ISOlat2: LATIN SMALL LETTER I WITH OGONEK
    0xE8,	"&ccaron;",	# ISOlat2: LATIN SMALL LETTER C WITH CARON
    0xE9,	"&eacute;",	# ISOlat2: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	"&eogon;",	# ISOlat2: LATIN SMALL LETTER E WITH OGONEK
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	"&edot;",	# ISOlat2: LATIN SMALL LETTER E WITH DOT ABOVE
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	"&imacr;",	# ISOlat2: LATIN SMALL LETTER I WITH MACRON
    0xF0,	"&dstrok;",    	# ISOlat2: LATIN SMALL LETTER D WITH STROKE
    0xF1,	"&ncedil;",	# ISOlat2: LATIN SMALL LETTER N WITH CEDILLA
    0xF2,	"&omacr;",	# ISOlat2: LATIN SMALL LETTER O WITH MACRON
    0xF3,	"&kcedil;",	# ISOlat2: LATIN SMALL LETTER K WITH CEDILLA
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	"&otilde;",	# ISOlat1: LATIN SMALL LETTER O WITH TILDE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	"&divide;",	# ISOnum : DIVISION SIGN
    0xF8,	"&oslash;",	# ISOlat1: LATIN SMALL LETTER O WITH STROKE
    0xF9,	"&uogon;",	# ISOlat2: LATIN SMALL LETTER U WITH OGONEK
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	"&ucirc;",	# ISOlat1: LATIN SMALL LETTER U WITH
				#	   CIRCUMFLEX
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	"&utilde;",	# ISOlat2: LATIN SMALL LETTER U WITH TILDE
    0xFE,	"&umacr;",	# ISOlat2: LATIN SMALL LETTER U WITH MACRON
    0xFF,	"&dot;",	# ISOdia : DOT ABOVE
);

##---------------------------------------------------------------------------
##      ISO-8859-5: Cyrillic
##---------------------------------------------------------------------------

%ISO_8859_5_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&IOcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER IO
    0xA2,	"&DJcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER DJE
				#	   (Serbocroatian)
    0xA3,	"&GJcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER GJE
				#	   (Macedonian)
    0xA4,	"&IEcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER UKRAINIAN IE
    0xA5,	"&DScy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER DZE
				#	   (Macedonian)
    0xA6,	"&Iukcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER
				#	   BYELORUSSIAN-UKRAINIAN I
    0xA7,	"&YIcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER YI
				#	   (Ukrainian)
    0xA8,	"&Jukcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER JE
    0xA9,	"&LJcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER LJE
    0xAA,	"&NJcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER NJE
    0xAB,	"&TSHcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER TSHE
				#	   (Serbocroatian)
    0xAC,	"&KJcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER KJE
				#	   (Macedonian)
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&Ubrcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER SHORT U
				#	   (Byelorussian)
    0xAF,	"&DZcy;",	# ISOcyr2: CYRILLIC CAPITAL LETTER DZHE
    0xB0,	"&Acy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER A
    0xB1,	"&Bcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER BE
    0xB2,	"&Vcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER VE
    0xB3,	"&Gcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER GHE
    0xB4,	"&Dcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER DE
    0xB5,	"&IEcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER IE
    0xB6,	"&ZHcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER ZHE
    0xB7,	"&Zcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER ZE
    0xB8,	"&Icy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER I
    0xB9,	"&Jcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER SHORT I
    0xBA,	"&Kcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER KA
    0xBB,	"&Lcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER EL
    0xBC,	"&Mcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER EM
    0xBD,	"&Ncy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER EN
    0xBE,	"&Ocy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER O
    0xBF,	"&Pcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER PE
    0xC0,	"&Rcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER ER
    0xC1,	"&Scy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER ES
    0xC2,	"&Tcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER TE
    0xC3,	"&Ucy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER U
    0xC4,	"&Fcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER EF
    0xC5,	"&KHcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER HA
    0xC6,	"&TScy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER TSE
    0xC7,	"&CHcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER CHE
    0xC8,	"&SHcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER SHA
    0xC9,	"&SHCHcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER SHCHA
    0xCA,	"&HARDcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER HARD SIGN
    0xCB,	"&Ycy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER YERU
    0xCC,	"&SOFTcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER SOFT SIGN
    0xCD,	"&Ecy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER E
    0xCE,	"&YUcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER YU
    0xCF,	"&YAcy;",	# ISOcyr1: CYRILLIC CAPITAL LETTER YA
    0xD0,	"&acy;",	# ISOcyr1: CYRILLIC SMALL LETTER A
    0xD1,	"&bcy;",	# ISOcyr1: CYRILLIC SMALL LETTER BE
    0xD2,	"&vcy;",	# ISOcyr1: CYRILLIC SMALL LETTER VE
    0xD3,	"&gcy;",	# ISOcyr1: CYRILLIC SMALL LETTER GHE
    0xD4,	"&dcy;",	# ISOcyr1: CYRILLIC SMALL LETTER DE
    0xD5,	"&iecy;",	# ISOcyr1: CYRILLIC SMALL LETTER IE
    0xD6,	"&zhcy;",	# ISOcyr1: CYRILLIC SMALL LETTER ZHE
    0xD7,	"&zcy;",	# ISOcyr1: CYRILLIC SMALL LETTER ZE
    0xD8,	"&icy;",	# ISOcyr1: CYRILLIC SMALL LETTER I
    0xD9,	"&jcy;",	# ISOcyr1: CYRILLIC SMALL LETTER SHORT I
    0xDA,	"&kcy;",	# ISOcyr1: CYRILLIC SMALL LETTER KA
    0xDB,	"&lcy;",	# ISOcyr1: CYRILLIC SMALL LETTER EL
    0xDC,	"&mcy;",	# ISOcyr1: CYRILLIC SMALL LETTER EM
    0xDD,	"&ncy;",	# ISOcyr1: CYRILLIC SMALL LETTER EN
    0xDE,	"&ocy;",	# ISOcyr1: CYRILLIC SMALL LETTER O
    0xDF,	"&pcy;",	# ISOcyr1: CYRILLIC SMALL LETTER PE
    0xE0,	"&rcy;",	# ISOcyr1: CYRILLIC SMALL LETTER ER
    0xE1,	"&scy;",	# ISOcyr1: CYRILLIC SMALL LETTER ES
    0xE2,	"&tcy;",	# ISOcyr1: CYRILLIC SMALL LETTER TE
    0xE3,	"&ucy;",	# ISOcyr1: CYRILLIC SMALL LETTER U
    0xE4,	"&fcy;",	# ISOcyr1: CYRILLIC SMALL LETTER EF
    0xE5,	"&khcy;",	# ISOcyr1: CYRILLIC SMALL LETTER HA
    0xE6,	"&tscy;",	# ISOcyr1: CYRILLIC SMALL LETTER TSE
    0xE7,	"&chcy;",	# ISOcyr1: CYRILLIC SMALL LETTER CHE
    0xE8,	"&shcy;",	# ISOcyr1: CYRILLIC SMALL LETTER SHA
    0xE9,	"&shchcy;",	# ISOcyr1: CYRILLIC SMALL LETTER SHCHA
    0xEA,	"&hardcy;",	# ISOcyr1: CYRILLIC SMALL LETTER HARD SIGN
    0xEB,	"&ycy;",	# ISOcyr1: CYRILLIC SMALL LETTER YERU
    0xEC,	"&softcy;",	# ISOcyr1: CYRILLIC SMALL LETTER SOFT SIGN
    0xED,	"&ecy;",	# ISOcyr1: CYRILLIC SMALL LETTER E
    0xEE,	"&yucy;",	# ISOcyr1: CYRILLIC SMALL LETTER YU
    0xEF,	"&yacy;",	# ISOcyr1: CYRILLIC SMALL LETTER YA
    0xF0,	"&numero;",	# ISOcyr1: NUMERO SIGN
    0xF1,	"&iocy;",	# ISOcyr1: CYRILLIC SMALL LETTER IO
    0xF2,	"&djcy;",	# ISOcyr2: CYRILLIC SMALL LETTER DJE
				#	   (Serbocroatian)
    0xF3,	"&gjcy;",	# ISOcyr2: CYRILLIC SMALL LETTER GJE
				#	   (Macedonian)
    0xF4,	"&iecy;",	# ISOcyr1: CYRILLIC SMALL LETTER UKRAINIAN IE
    0xF5,	"&dscy;",	# ISOcyr2: CYRILLIC SMALL LETTER DZE
				#	   (Macedonian)
    0xF6,	"&iukcy;",	# ISOcyr2: CYRILLIC SMALL LETTER
				#	   BYELORUSSIAN-UKRAINIAN I
    0xF7,	"&yicy;",	# ISOcyr2: CYRILLIC SMALL LETTER YI
				#	   (Ukrainian)
    0xF8,	"&jsercy;",	# ISOcyr2: CYRILLIC SMALL LETTER JE
    0xF9,	"&ljcy;",	# ISOcyr2: CYRILLIC SMALL LETTER LJE
    0xFA,	"&njcy;",	# ISOcyr2: CYRILLIC SMALL LETTER NJE
    0xFB,	"&tshcy;",	# ISOcyr2: CYRILLIC SMALL LETTER TSHE
				#	   (Serbocroatian)
    0xFC,	"&kjcy;",	# ISOcyr2: CYRILLIC SMALL LETTER KJE
				#	   (Macedonian)
    0xFD,	"&sect;",	# ISOnum : SECTION SIGN
    0xFE,	"&ubrcy;",	# ISOcyr2: CYRILLIC SMALL LETTER SHORT U
				#	   (Byelorussian)
    0xFF,	"&dzcy;",	# ISOcyr2: CYRILLIC SMALL LETTER DZHE
);

##---------------------------------------------------------------------------
##      ISO-8859-6: Arabic
##---------------------------------------------------------------------------
##	Note: There is no ISO entities for arabic characters.  Some of
##	      the following are non-standard entity references.  "ISOarbc"
##	      is used as the entity defining the Arabic entities in
##	      anticipation that ISO will define such an entity.

%ISO_8859_6_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xAC,	"&arcomma;",	# ISOarbc: ARABIC COMMA
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xBB,	"&arsemi;",	# ISOarbc: ARABIC SEMICOLON
    0xBF,	"&arquest;",	# ISOarbc: ARABIC QUESTION MARK
    0xC1,	"&hamz;",	# ISOarbc: ARABIC LETTER HAMZA
    0xC2,	"&alefmadd;",	# ISOarbc: ARABIC LETTER ALEF WITH MADDA ABOVE
    0xC3,	"&alefhamz;",	# ISOarbc: ARABIC LETTER ALEF WITH HAMZA ABOVE
    0xC4,	"&wawhamz;",	# ISOarbc: ARABIC LETTER WAW WITH HAMZA ABOVE
    0xC5,	"&alefhamz;",	# ISOarbc: ARABIC LETTER ALEF WITH HAMZA BELOW
    0xC6,	"&yehhamz;",	# ISOarbc: ARABIC LETTER YEH WITH HAMZA ABOVE
    0xC7,	"&alef;",	# ISOarbc: ARABIC LETTER ALEF
    0xC8,	"&beh;",	# ISOarbc: ARABIC LETTER BEH
    0xC9,	"&tehmarb;",	# ISOarbc: ARABIC LETTER TEH MARBUTA
    0xCA,	"&teh;",	# ISOarbc: ARABIC LETTER TEH
    0xCB,	"&theh;",	# ISOarbc: ARABIC LETTER THEH
    0xCC,	"&jeem;",	# ISOarbc: ARABIC LETTER JEEM
    0xCD,	"&hah;",	# ISOarbc: ARABIC LETTER HAH
    0xCE,	"&khah;",	# ISOarbc: ARABIC LETTER KHAH
    0xCF,	"&dal;",	# ISOarbc: ARABIC LETTER DAL
    0xD0,	"&thal;",	# ISOarbc: ARABIC LETTER THAL
    0xD1,	"&reh;",	# ISOarbc: ARABIC LETTER REH
    0xD2,	"&zain;",	# ISOarbc: ARABIC LETTER ZAIN
    0xD3,	"&seen;",	# ISOarbc: ARABIC LETTER SEEN
    0xD4,	"&sheen;",	# ISOarbc: ARABIC LETTER SHEEN
    0xD5,	"&sad;",	# ISOarbc: ARABIC LETTER SAD
    0xD6,	"&dad;",	# ISOarbc: ARABIC LETTER DAD
    0xD7,	"&tah;",	# ISOarbc: ARABIC LETTER TAH
    0xD8,	"&zah;",	# ISOarbc: ARABIC LETTER ZAH
    0xD9,	"&ain;",	# ISOarbc: ARABIC LETTER AIN
    0xDA,	"&ghain;",	# ISOarbc: ARABIC LETTER GHAIN
    0xE0,	"&tatweel;",	# ISOarbc: ARABIC TATWEEL
    0xE1,	"&feh;",	# ISOarbc: ARABIC LETTER FEH
    0xE2,	"&qaf;",	# ISOarbc: ARABIC LETTER QAF
    0xE3,	"&kaf;",	# ISOarbc: ARABIC LETTER KAF
    0xE4,	"&lam;",	# ISOarbc: ARABIC LETTER LAM
    0xE5,	"&meem;",	# ISOarbc: ARABIC LETTER MEEM
    0xE6,	"&noon;",	# ISOarbc: ARABIC LETTER NOON
    0xE7,	"&heh;",	# ISOarbc: ARABIC LETTER HEH
    0xE8,	"&waw;",	# ISOarbc: ARABIC LETTER WAW
    0xE9,	"&alefmaks;",	# ISOarbc: ARABIC LETTER ALEF MAKSURA
    0xEA,	"&yeh;",	# ISOarbc: ARABIC LETTER YEH
    0xEB,	"&fathatan;",	# ISOarbc: ARABIC FATHATAN
    0xEC,	"&dammatan;",	# ISOarbc: ARABIC DAMMATAN
    0xED,	"&kasratan;",	# ISOarbc: ARABIC KASRATAN
    0xEE,	"&fatha;",	# ISOarbc: ARABIC FATHA
    0xEF,	"&damma;",	# ISOarbc: ARABIC DAMMA
    0xF0,	"&kasra;",	# ISOarbc: ARABIC KASRA
    0xF1,	"&shadda;",	# ISOarbc: ARABIC SHADDA
    0xF2,	"&sukun;",	# ISOarbc: ARABIC SUKUN
);

##---------------------------------------------------------------------------
##      ISO-8859-7: Greek
##---------------------------------------------------------------------------

%ISO_8859_7_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&lsquo;",	# ISOnum : SINGLE HIGH-REVERSED-9 QUOTATION
				#	   MARK
    0xA2,	"&rsquo;",	# ISOnum : RIGHT SINGLE QUOTATION MARK
    0xA3,	"&pound;",	# ISOnum : POUND SIGN
    0xA6,	"&brvbar;",	# ISOnum : BROKEN BAR
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&copy;",	# ISOnum : COPYRIGHT SIGN
    0xAB,	"&laquo;",	# ISOnum : LEFT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xAC,	"&not;",	# ISOnum : NOT SIGN
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAF,	"&mdash;",	# ISOpub : EM DASH
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&plusmn;",	# ISOnum : PLUS-MINUS SIGN
    0xB2,	"&sup2;",	# ISOnum : SUPERSCRIPT TWO
    0xB3,	"&sup3;",	# ISOnum : SUPERSCRIPT THREE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&diagr;",	# ISOgrk?: ACUTE ACCENT AND DIAERESIS
				#	   (Tonos and Dialytika)
    0xB6,	"&Aacgr;",	# ISOgrk2: GREEK CAPITAL LETTER ALPHA WITH
				#	   ACUTE
    0xB7,	"&middot;",	# ISOnum : MIDDLE DOT
    0xB8,	"&Eacgr;",	# ISOgrk2: GREEK CAPITAL LETTER EPSILON WITH
				#	   ACUTE
    0xB9,	"&EEacgr;",	# ISOgrk2: GREEK CAPITAL LETTER ETA WITH ACUTE
    0xBA,	"&Iacgr;",	# ISOgrk2: GREEK CAPITAL LETTER IOTA WITH ACUTE
    0xBB,	"&raquo;",	# ISOnum : RIGHT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xBC,	"&Oacgr;",	# ISOgrk2: GREEK CAPITAL LETTER OMICRON WITH
				#	   ACUTE
    0xBD,	"&half;",	# ISOnum : VULGAR FRACTION ONE HALF
    0xBE,	"&Uacgr;",	# ISOgrk2: GREEK CAPITAL LETTER UPSILON WITH
				#	   ACUTE
    0xBF,	"&OHacgr;",	# ISOgrk2: GREEK CAPITAL LETTER OMEGA WITH
				#	   ACUTE
    0xC0,	"&idiagr;",	# ISOgrk2: GREEK SMALL LETTER IOTA WITH ACUTE
				#	   AND DIAERESIS
    0xC1,	"&Agr;",	# ISOgrk1: GREEK CAPITAL LETTER ALPHA
    0xC2,	"&Bgr;",	# ISOgrk1: GREEK CAPITAL LETTER BETA
    0xC3,	"&Ggr;",	# ISOgrk1: GREEK CAPITAL LETTER GAMMA
    0xC4,	"&Dgr;",	# ISOgrk1: GREEK CAPITAL LETTER DELTA
    0xC5,	"&Egr;",	# ISOgrk1: GREEK CAPITAL LETTER EPSILON
    0xC6,	"&Zgr;",	# ISOgrk1: GREEK CAPITAL LETTER ZETA
    0xC7,	"&EEgr;",	# ISOgrk1: GREEK CAPITAL LETTER ETA
    0xC8,	"&THgr;",	# ISOgrk1: GREEK CAPITAL LETTER THETA
    0xC9,	"&Igr;",	# ISOgrk1: GREEK CAPITAL LETTER IOTA
    0xCA,	"&Kgr;",	# ISOgrk1: GREEK CAPITAL LETTER KAPPA
    0xCB,	"&Lgr;",	# ISOgrk1: GREEK CAPITAL LETTER LAMDA
    0xCC,	"&Mgr;",	# ISOgrk1: GREEK CAPITAL LETTER MU
    0xCD,	"&Ngr;",	# ISOgrk1: GREEK CAPITAL LETTER NU
    0xCE,	"&Xgr;",	# ISOgrk1: GREEK CAPITAL LETTER XI
    0xCF,	"&Ogr;",	# ISOgrk1: GREEK CAPITAL LETTER OMICRON
    0xD0,	"&Pgr;",	# ISOgrk1: GREEK CAPITAL LETTER PI
    0xD1,	"&Rgr;",	# ISOgrk1: GREEK CAPITAL LETTER RHO
    0xD3,	"&Sgr;",	# ISOgrk1: GREEK CAPITAL LETTER SIGMA
    0xD4,	"&Tgr;",	# ISOgrk1: GREEK CAPITAL LETTER TAU
    0xD5,	"&Ugr;",	# ISOgrk1: GREEK CAPITAL LETTER UPSILON
    0xD6,	"&PHgr;",	# ISOgrk1: GREEK CAPITAL LETTER PHI
    0xD7,	"&KHgr;",	# ISOgrk1: GREEK CAPITAL LETTER CHI
    0xD8,	"&PSgr;",	# ISOgrk1: GREEK CAPITAL LETTER PSI
    0xD9,	"&OHgr;",	# ISOgrk1: GREEK CAPITAL LETTER OMEGA
    0xDA,	"&Idigr;",	# ISOgrk2: GREEK CAPITAL LETTER IOTA WITH
				#	   DIAERESIS
    0xDB,	"&Udigr;",	# ISOgrk2: GREEK CAPITAL LETTER UPSILON WITH
				#	   DIAERESIS
    0xDC,	"&aacgr;",	# ISOgrk2: GREEK SMALL LETTER ALPHA WITH ACUTE
    0xDD,	"&eacgr;",	# ISOgrk2: GREEK SMALL LETTER EPSILON WITH
				#	   ACUTE
    0xDE,	"&eeacgr;",	# ISOgrk2: GREEK SMALL LETTER ETA WITH ACUTE
    0xDF,	"&iacgr;",	# ISOgrk2: GREEK SMALL LETTER IOTA WITH ACUTE
    0xE0,	"&udiagr;",	# ISOgrk2: GREEK SMALL LETTER UPSILON WITH
				#	   ACUTE AND DIAERESIS
    0xE1,	"&agr;",	# ISOgrk1: GREEK SMALL LETTER ALPHA
    0xE2,	"&bgr;",	# ISOgrk1: GREEK SMALL LETTER BETA
    0xE3,	"&ggr;",	# ISOgrk1: GREEK SMALL LETTER GAMMA
    0xE4,	"&dgr;",	# ISOgrk1: GREEK SMALL LETTER DELTA
    0xE5,	"&egr;",	# ISOgrk1: GREEK SMALL LETTER EPSILON
    0xE6,	"&zgr;",	# ISOgrk1: GREEK SMALL LETTER ZETA
    0xE7,	"&eegr;",	# ISOgrk1: GREEK SMALL LETTER ETA
    0xE8,	"&thgr;",	# ISOgrk1: GREEK SMALL LETTER THETA
    0xE9,	"&igr;",	# ISOgrk1: GREEK SMALL LETTER IOTA
    0xEA,	"&kgr;",	# ISOgrk1: GREEK SMALL LETTER KAPPA
    0xEB,	"&lgr;",	# ISOgrk1: GREEK SMALL LETTER LAMDA
    0xEC,	"&mgr;",	# ISOgrk1: GREEK SMALL LETTER MU
    0xED,	"&ngr;",	# ISOgrk1: GREEK SMALL LETTER NU
    0xEE,	"&xgr;",	# ISOgrk1: GREEK SMALL LETTER XI
    0xEF,	"&ogr;",	# ISOgrk1: GREEK SMALL LETTER OMICRON
    0xF0,	"&pgr;",	# ISOgrk1: GREEK SMALL LETTER PI
    0xF1,	"&rgr;",	# ISOgrk1: GREEK SMALL LETTER RHO
    0xF2,	"&sfgr;",	# ISOgrk1: GREEK SMALL LETTER FINAL SIGMA
    0xF3,	"&sgr;",	# ISOgrk1: GREEK SMALL LETTER SIGMA
    0xF4,	"&tgr;",	# ISOgrk1: GREEK SMALL LETTER TAU
    0xF5,	"&ugr;",	# ISOgrk1: GREEK SMALL LETTER UPSILON
    0xF6,	"&phgr;",	# ISOgrk1: GREEK SMALL LETTER PHI
    0xF7,	"&khgr;",	# ISOgrk1: GREEK SMALL LETTER CHI
    0xF8,	"&psgr;",	# ISOgrk1: GREEK SMALL LETTER PSI
    0xF9,	"&ohgr;",	# ISOgrk1: GREEK SMALL LETTER OMEGA
    0xFA,	"&idigr;",	# ISOgrk2: GREEK SMALL LETTER IOTA WITH
				#	   DIAERESIS
    0xFB,	"&udigr;",	# ISOgrk2: GREEK SMALL LETTER UPSILON WITH
				#	   DIAERESIS
    0xFC,	"&oacgr;",	# ISOgrk2: GREEK SMALL LETTER OMICRON WITH
				#	   ACUTE
    0xFD,	"&uacgr;",	# ISOgrk2: GREEK SMALL LETTER UPSILON WITH
				#	   ACUTE
    0xFE,	"&ohacgr;",	# ISOgrk2: GREEK SMALL LETTER OMEGA WITH ACUTE
);

##---------------------------------------------------------------------------
##      ISO-8859-8: Hebrew
##---------------------------------------------------------------------------
##	Note: There is no ISO entities for hebrew characters.  ISOamso
##	      defines a few characters, but they are for math purposes.
##	      Some of the following are non-standard entity references.
##	      "ISOhbrw" is used as the entity defining the Hebrew entities
##	      in anticipation that ISO will define such an entity.

%ISO_8859_8_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA2,	"&cent;",	# ISOnum : CENT SIGN
    0xA3,	"&pound;",	# ISOnum : POUND SIGN
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA5,	"&yen;",	# ISOnum : YEN SIGN
    0xA6,	"&brvbar;",	# ISOnum : BROKEN BAR
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&copy;",	# ISOnum : COPYRIGHT SIGN
    0xAA,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xAB,	"&laquo;",	# ISOnum : LEFT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xAC,	"&not;",	# ISOnum : NOT SIGN
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&reg;",	# ISOnum : REGISTERED SIGN
    0xAF,	"&macr;",	# ISOdia : OVERLINE (MACRON)
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&plusmn;",	# ISOnum : PLUS-MINUS SIGN
    0xB2,	"&sup2;",	# ISOnum : SUPERSCRIPT TWO
    0xB3,	"&sup3;",	# ISOnum : SUPERSCRIPT THREE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&micro;",	# ISOnum : MICRO SIGN
    0xB6,	"&para;",	# ISOnum : PILCROW SIGN
    0xB7,	"&middot;",	# ISOnum : MIDDLE DOT
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&sup1;",	# ISOnum : SUPERSCRIPT ONE
    0xBA,	"&divide;",	# ISOlat1: DIVISION SIGN
    0xBB,	"&raquo;",	# ISOnum : RIGHT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xBC,	"&frac14;",	# ISOnum : VULGAR FRACTION ONE QUARTER
    0xBD,	"&half;",	# ISOnum : VULGAR FRACTION ONE HALF
    0xBE,	"&frac34;",	# ISOnum : VULGAR FRACTION THREE QUARTERS
    0xDF,	"&dlowbar;",	# ISOnum?: DOUBLE LOW LINE
    0xE0,	"&alef;",	# ISOhbrw: HEBREW LETTER ALEF
    0xE1,	"&bet;",	# ISOhbrw: HEBREW LETTER BET
    0xE2,	"&gimel;",	# ISOhbrw: HEBREW LETTER GIMEL
    0xE3,	"&dalet;",	# ISOhbrw: HEBREW LETTER DALET
    0xE4,	"&he;", 	# ISOhbrw: HEBREW LETTER HE
    0xE5,	"&vav;",	# ISOhbrw: HEBREW LETTER VAV
    0xE6,	"&zayin;",	# ISOhbrw: HEBREW LETTER ZAYIN
    0xE7,	"&het;",	# ISOhbrw: HEBREW LETTER HET
    0xE8,	"&tet;",	# ISOhbrw: HEBREW LETTER TET
    0xE9,	"&yod;",	# ISOhbrw: HEBREW LETTER YOD
    0xEA,	"&fkaf;",	# ISOhbrw: HEBREW LETTER FINAL KAF
    0xEB,	"&kaf;",	# ISOhbrw: HEBREW LETTER KAF
    0xEC,	"&lamed;",	# ISOhbrw: HEBREW LETTER LAMED
    0xED,	"&fmem;",	# ISOhbrw: HEBREW LETTER FINAL MEM
    0xEE,	"&mem;",	# ISOhbrw: HEBREW LETTER MEM
    0xEF,	"&fnun;",	# ISOhbrw: HEBREW LETTER FINAL NUN
    0xF0,	"&nun;",	# ISOhbrw: HEBREW LETTER NUN
    0xF1,	"&samekh;",	# ISOhbrw: HEBREW LETTER SAMEKH
    0xF2,	"&ayin;",	# ISOhbrw: HEBREW LETTER AYIN
    0xF3,	"&fpe;",	# ISOhbrw: HEBREW LETTER FINAL PE
    0xF4,	"&pe;", 	# ISOhbrw: HEBREW LETTER PE
    0xF5,	"&ftsadi;",	# ISOhbrw: HEBREW LETTER FINAL TSADI
    0xF6,	"&tsadi;",	# ISOhbrw: HEBREW LETTER TSADI
    0xF7,	"&qof;",	# ISOhbrw: HEBREW LETTER QOF
    0xF8,	"&resh;",	# ISOhbrw: HEBREW LETTER RESH
    0xF9,	"&shin;",	# ISOhbrw: HEBREW LETTER SHIN
    0xFA,	"&tav;",	# ISOhbrw: HEBREW LETTER TAV
);

##---------------------------------------------------------------------------
##      ISO-8859-9: Latin-5
##---------------------------------------------------------------------------

%ISO_8859_9_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&iexcl;",	# ISOnum : INVERTED EXCLAMATION MARK
    0xA2,	"&cent;",	# ISOnum : CENT SIGN
    0xA3,	"&pound;",	# ISOnum : POUND SIGN
    0xA4,	"&curren;",	# ISOnum : CURRENCY SIGN
    0xA5,	"&yen;",	# ISOnum : YEN SIGN
    0xA6,	"&brvbar;",	# ISOnum : BROKEN BAR
    0xA7,	"&sect;",	# ISOnum : SECTION SIGN
    0xA8,	"&die;",	# ISOdia : DIAERESIS
    0xA9,	"&copy;",	# ISOnum : COPYRIGHT SIGN
    0xAA,	"&ordf;",	# ISOnum : FEMININE ORDINAL INDICATOR
    0xAB,	"&laquo;",	# ISOnum : LEFT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xAC,	"&not;",	# ISOnum : NOT SIGN
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&reg;",	# ISOnum : REGISTERED SIGN
    0xAF,	"&macr;",	# ISOdia : OVERLINE (MACRON)
    0xB0,	"&deg;",	# ISOnum : DEGREE SIGN
    0xB1,	"&plusmn;",	# ISOnum : PLUS-MINUS SIGN
    0xB2,	"&sup2;",	# ISOnum : SUPERSCRIPT TWO
    0xB3,	"&sup3;",	# ISOnum : SUPERSCRIPT THREE
    0xB4,	"&acute;",	# ISOdia : ACUTE ACCENT
    0xB5,	"&micro;",	# ISOnum : MICRO SIGN
    0xB6,	"&para;",	# ISOnum : PILCROW SIGN
    0xB7,	"&middot;",	# ISOnum : MIDDLE DOT
    0xB8,	"&cedil;",	# ISOdia : CEDILLA
    0xB9,	"&sup1;",	# ISOnum : SUPERSCRIPT ONE
    0xBA,	"&ordm;",	# ISOnum : MASCULINE ORDINAL INDICATOR
    0xBB,	"&raquo;",	# ISOnum : RIGHT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xBC,	"&frac14;",	# ISOnum : VULGAR FRACTION ONE QUARTER
    0xBD,	"&half;",	# ISOnum : VULGAR FRACTION ONE HALF
    0xBE,	"&frac34;",	# ISOnum : VULGAR FRACTION THREE QUARTERS
    0xBF,	"&iquest;",	# ISOnum : INVERTED QUESTION MARK
    0xC0,	"&Agrave;",	# ISOlat1: LATIN CAPITAL LETTER A WITH GRAVE
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	"&Atilde;",	# ISOlat1: LATIN CAPITAL LETTER A WITH TILDE
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Aring;",	# ISOlat1: LATIN CAPITAL LETTER A WITH RING
				#	   ABOVE
    0xC6,	"&AElig;",	# ISOlat1: LATIN CAPITAL LETTER AE
    0xC7,	"&Ccedil;",	# ISOlat1: LATIN CAPITAL LETTER C WITH CEDILLA
    0xC8,	"&Egrave;",	# ISOlat1: LATIN CAPITAL LETTER E WITH GRAVE
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Ecirc;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   CIRCUMFLEX
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Igrave;",	# ISOlat1: LATIN CAPITAL LETTER I WITH GRAVE
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Iuml;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   DIAERESIS
    0xD0,	"&Gbreve;",	# ISOlat2: LATIN CAPITAL LETTER G WITH BREVE
    0xD1,	"&Ntilde;",	# ISOlat1: LATIN CAPITAL LETTER N WITH TILDE
    0xD2,	"&Ograve;",	# ISOlat1: LATIN CAPITAL LETTER O WITH GRAVE
    0xD3,	"&Oacute;",	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Otilde;",	# ISOlat1: LATIN CAPITAL LETTER O WITH TILDE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&times;",	# ISOnum : MULTIPLICATION SIGN
    0xD8,	"&Oslash;",	# ISOlat1: LATIN CAPITAL LETTER O WITH STROKE
    0xD9,	"&Ugrave;",	# ISOlat1: LATIN CAPITAL LETTER U WITH GRAVE
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Ucirc;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Idot;",	# ISOlat2: LATIN CAPITAL LETTER I WITH DOT
				#	   ABOVE
    0xDE,	"&Scedil;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CEDILLA
    0xDF,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	"&agrave;",	# ISOlat1: LATIN SMALL LETTER A WITH GRAVE
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE3,	"&atilde;",	# ISOlat1: LATIN SMALL LETTER A WITH TILDE
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	"&aring;",	# ISOlat1: LATIN SMALL LETTER A WITH RING ABOVE
    0xE6,	"&aelig;",	# ISOlat1: LATIN SMALL LETTER AE
    0xE7,	"&ccedil;",	# ISOlat1: LATIN SMALL LETTER C WITH CEDILLA
    0xE8,	"&egrave;",	# ISOlat1: LATIN SMALL LETTER E WITH GRAVE
    0xE9,	"&eacute;",	# ISOlat1: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	"&eogon;",	# ISOlat2: LATIN SMALL LETTER E WITH OGONEK
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	"&edot;",	# ISOlat2: LATIN SMALL LETTER E WITH DOT ABOVE
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	"&imacr;",	# ISOlat2: LATIN SMALL LETTER I WITH MACRON
    0xF0,	"&gbreve;",	# ISOlat2: LATIN SMALL LETTER G WITH BREVE
    0xF1,	"&ntilde;",	# ISOlat1: LATIN SMALL LETTER N WITH TILDE
    0xF2,	"&ograve;",	# ISOlat1: LATIN SMALL LETTER O WITH GRAVE
    0xF3,	"&oacute;",	# ISOlat1: LATIN SMALL LETTER O WITH ACUTE
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	"&otilde;",	# ISOlat1: LATIN SMALL LETTER O WITH TILDE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	"&divide;",	# ISOlat1: DIVISION SIGN
    0xF8,	"&oslash;",	# ISOlat1: LATIN SMALL LETTER O WITH STROKE
    0xF9,	"&ugrave;",	# ISOlat1: LATIN SMALL LETTER U WITH GRAVE
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	"&ucirc;",	# ISOlat1: LATIN SMALL LETTER U WITH CIRCUMFLEX
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	"&inodot;",    	# ISOlat2: LATIN SMALL LETTER I DOTLESS
    0xFE,	"&scedil;",	# ISOlat2: LATIN SMALL LETTER S WITH CEDILLA
    0xFF,	"&yuml;",	# ISOlat1: LATIN SMALL LETTER Y WITH DIAERESIS
);

##---------------------------------------------------------------------------
##      ISO-8859-10: Latin-6
##---------------------------------------------------------------------------

%ISO_8859_10_To_Ent = (
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	"&Aogon;",	# ISOlat1: LATIN CAPITAL LETTER A WITH OGONEK
    0xA2,	"&Emacr;",	# ISOlat2: LATIN CAPITAL LETTER E WITH MACRON
    0xA3,	"&Gcedil;",	# ISOlat2: LATIN CAPITAL LETTER G WITH CEDILLA
    0xA4,	"&Imacr;",	# ISOlat2: LATIN CAPITAL LETTER I WITH MACRON
    0xA5,	"&Itilde;",	# ISOlat2: LATIN CAPITAL LETTER I WITH TILDE
    0xA6,	"&Kcedil;",	# ISOlat2: LATIN CAPITAL LETTER K WITH CEDILLA
    0xA7,	"&Lcedil;",	# ISOlat2: LATIN CAPITAL LETTER L WITH CEDILLA
    0xA8,	"&Nacute;",	# ISOlat2: LATIN CAPITAL LETTER N WITH ACUTE
    0xA9,	"&Rcedil;",	# ISOlat2: LATIN CAPITAL LETTER R WITH CEDILLA
    0xAA,	"&Scaron;",	# ISOlat2: LATIN CAPITAL LETTER S WITH CARON
    0xAB,	"&Tstrok;",	# ISOlat2: LATIN CAPITAL LETTER T WITH STROKE
    0xAC,	"&Zcaron;",	# ISOlat2: LATIN CAPITAL LETTER Z WITH CARON
    0xAD,	"&shy;",	# ISOnum : SOFT HYPHEN
    0xAE,	"&kgreen;",	# ISOlat2: LATIN SMALL LETTER KRA (Greenlandic)
    0xAF,	"&end;",	# ISOlat?: LATIN SMALL LETTER END (Lappish)
    0xB0,	"&dstrok;",	# ISOlat2: LATIN SMALL LETTER d WITH STROKE
    0xB1,	"&aogon;",	# ISOlat2: LATIN SMALL LETTER a WITH OGONEK
    0xB2,	"&emacr;",	# ISOlat2: LATIN SMALL LETTER e WITH MACRON
    0xB3,	"&gcedil;",	# ISOlat2: LATIN SMALL LETTER g WITH CEDILLA
    0xB4,	"&imacr;",	# ISOlat2: LATIN SMALL LETTER i WITH MACRON
    0xB5,	"&itilde;",	# ISOlat2: LATIN SMALL LETTER i WITH TILDE
    0xB6,	"&kcedil;",	# ISOlat2: LATIN SMALL LETTER k WITH CEDILLA
    0xB7,	"&lcedil;",	# ISOlat2: LATIN SMALL LETTER l WITH CEDILLA
    0xB8,	"&nacute;",	# ISOlat2: LATIN SMALL LETTER n WITH ACUTE
    0xB9,	"&rcedil;",	# ISOlat2: LATIN SMALL LETTER r WITH CEDILLA
    0xBA,	"&scaron;",	# ISOlat2: LATIN SMALL LETTER s WITH CARON
    0xBB,	"&tstrok;",	# ISOlat2: LATIN SMALL LETTER t WITH STROKE
    0xBC,	"&zcaron;",	# ISOlat2: LATIN SMALL LETTER z WITH CARON
    0xBD,	"&sect;",	# ISOnum : SECTION SIGN
    0xBE,	"&szlig;",	# ISOlat1: LATIN SMALL LETTER SHARP s (German)
    0xBF,	"&eng;",	# ISOlat2: LATIN SMALL LETTER ENG (Lappish)
    0xC0,	"&Amacr;",	# ISOlat2: LATIN CAPITAL LETTER A WITH MACRON
    0xC1,	"&Aacute;",	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	"&Acirc;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	"&Atilde;",	# ISOlat1: LATIN CAPITAL LETTER A WITH TILDE
    0xC4,	"&Auml;",	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	"&Aring;",	# ISOlat1: LATIN CAPITAL LETTER A WITH RING
				#	   ABOVE
    0xC6,	"&AElig;",	# ISOlat1: LATIN CAPITAL LETTER AE
    0xC7,	"&Iogon;",	# ISOlat2: LATIN CAPITAL LETTER I WITH OGONEK
    0xC8,	"&Ccaron;",	# ISOlat2: LATIN CAPITAL LETTER C WITH CARON
    0xC9,	"&Eacute;",	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	"&Eogon;",	# ISOlat2: LATIN CAPITAL LETTER E WITH OGONEK
    0xCB,	"&Euml;",	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	"&Edot;",	# ISOlat2: LATIN CAPITAL LETTER E WITH
				#	   DOT ABOVE
    0xCD,	"&Iacute;",	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	"&Icirc;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	"&Iuml;",	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   DIAERESIS
    0xD0,	"&Dstrok;",	# ISOlat2: LATIN CAPITAL LETTER D WITH STROKE
    0xD1,	"&Ncedil;",	# ISOlat2: LATIN CAPITAL LETTER N WITH CEDILLA
    0xD2,	"&Omacr;",	# ISOlat2: LATIN CAPITAL LETTER O WITH MACRON
    0xD3,	"&Oacute;",	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	"&Ocirc;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	"&Otilde;",	# ISOlat1: LATIN CAPITAL LETTER O WITH TILDE
    0xD6,	"&Ouml;",	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	"&Utilde;",	# ISOlat2: LATIN CAPITAL LETTER U WITH TILDE
    0xD8,	"&Oslash;",	# ISOlat1: LATIN CAPITAL LETTER O WITH STROKE
    0xD9,	"&Uogon;",	# ISOlat2: LATIN CAPITAL LETTER U WITH OGONEK
    0xDA,	"&Uacute;",	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	"&Ucirc;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	"&Uuml;",	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	"&Yacute;",	# ISOlat1: LATIN CAPITAL LETTER Y WITH ACUTE
    0xDE,	"&THORN;",	# ISOlat1: LATIN CAPITAL LETTER THORN
				#	   (Icelandic)
    0xDF,	"&Umacr;",	# ISOlat2: LATIN CAPITAL LETTER U WITH MACRON
    0xE0,	"&amacr;",	# ISOlat2: LATIN SMALL LETTER a WITH MACRON
    0xE1,	"&aacute;",	# ISOlat1: LATIN SMALL LETTER a WITH ACUTE
    0xE2,	"&acirc;",	# ISOlat1: LATIN SMALL LETTER a WITH CIRCUMFLEX
    0xE3,	"&atilde;",	# ISOlat1: LATIN SMALL LETTER a WITH TILDE
    0xE4,	"&auml;",	# ISOlat1: LATIN SMALL LETTER a WITH DIAERESIS
    0xE5,	"&aring;",	# ISOlat1: LATIN SMALL LETTER a WITH RING ABOVE
    0xE6,	"&aelig;",	# ISOlat1: LATIN SMALL LETTER ae
    0xE7,	"&iogon;",	# ISOlat2: LATIN SMALL LETTER i WITH OGONEK
    0xE8,	"&ccaron;",	# ISOlat2: LATIN SMALL LETTER c WITH CARON
    0xE9,	"&eacute;",	# ISOlat1: LATIN SMALL LETTER e WITH ACUTE
    0xEA,	"&eogon;",	# ISOlat2: LATIN SMALL LETTER e WITH OGONEK
    0xEB,	"&euml;",	# ISOlat1: LATIN SMALL LETTER e WITH DIAERESIS
    0xEC,	"&edot;",	# ISOlat2: LATIN SMALL LETTER e WITH DOT ABOVE
    0xED,	"&iacute;",	# ISOlat1: LATIN SMALL LETTER i WITH ACUTE
    0xEE,	"&icirc;",	# ISOlat1: LATIN SMALL LETTER i WITH CIRCUMFLEX
    0xEF,	"&iuml;",	# ISOlat1: LATIN SMALL LETTER i WITH DIAERESIS
    0xF0,	"&eth;",	# ISOlat1: LATIN SMALL LETTER ETH (Icelandic)
    0xF1,	"&ncedil;",	# ISOlat2: LATIN SMALL LETTER n WITH CEDILLA
    0xF2,	"&omacr;",	# ISOlat2: LATIN SMALL LETTER o WITH MACRON
    0xF3,	"&oacute;",	# ISOlat1: LATIN SMALL LETTER o WITH ACUTE
    0xF4,	"&ocirc;",	# ISOlat1: LATIN SMALL LETTER o WITH CIRCUMFLEX
    0xF5,	"&otilde;",	# ISOlat1: LATIN SMALL LETTER o WITH TILDE
    0xF6,	"&ouml;",	# ISOlat1: LATIN SMALL LETTER o WITH DIAERESIS
    0xF7,	"&utilde;",	# ISOlat2: LATIN SMALL LETTER u WITH TILDE
    0xF8,	"&oslash;",	# ISOlat1: LATIN SMALL LETTER o WITH STROKE
    0xF9,	"&uogon;",	# ISOlat2: LATIN SMALL LETTER u WITH OGONEK
    0xFA,	"&uacute;",	# ISOlat1: LATIN SMALL LETTER u WITH ACUTE
    0xFB,	"&ucirc;",	# ISOlat1: LATIN SMALL LETTER u WITH CIRCUMFLEX
    0xFC,	"&uuml;",	# ISOlat1: LATIN SMALL LETTER u WITH DIAERESIS
    0xFD,	"&yacute;",	# ISOlat1: LATIN SMALL LETTER y WITH ACUTE
    0xFE,	"&thorn;",	# ISOlat1: LATIN SMALL LETTER THORN (Icelandic)
    0xFF,	"&umacr;",	# ISOlat2: LATIN SMALL LETTER u WITH MACRON
);

###############################################################################
##	Routines
###############################################################################

##---------------------------------------------------------------------------##
##	str2sgml converts a string encoded by $charset to an sgml
##	string where special characters are converted to entity
##	references.
##
##	$return_data = iso_8859'str2sgml($data, $charset, $only8bit);
##
##	If $only8bit is non-zero, than only 8-bit characters are
##	translated.
##
sub str2sgml {
    local($data, $charset, $only8bit) = ($_[0], $_[1], $_[2]);
    local($ret, $offset, $len) = ('', 0, 0);

    # Get mapping (this method works for Perl 4 and 5)
    $charset =~ tr/a-z/A-Z/;
    $charset =~ tr/-/_/;
    local(*map) = ("${charset}_To_Ent");

    # Convert string
    $len = length($data);
    while ($offset < $len) {
	$char = unpack("C", substr($data, $offset++, 1));
	if ($only8bit && $char < 0xA0) {
	    $ret .= pack("C", $char);
	} else {
	    $ret .= ($map{$char} || $US_ASCII_To_Ent{$char} ||
		     pack("C", $char));
	}
    }
    $ret;
}

##---------------------------------------------------------------------------##
1;
