##---------------------------------------------------------------------------##
##  File:
##	@(#) mhidxrc.pl 2.4 98/08/10 23:26:05
##  Author:
##      Earl Hood       earlhood@usa.net
##  Description:
##      MHonArc library defining values for various index resources
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1996-1998	Earl Hood, earlhood@usa.net
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

package mhonarc;

sub mhidxrc_set_vars {

##-----------------##
## Index resources ##
##-----------------##

$IdxTypeStr = $NOSORT ? 'Message' :
		        $SUBSORT ? 'Subject' :
			$AUTHSORT ? 'Author' :
			'Date';
## MAIN index resources
## if ($MAIN) {

    ##	Label for main index
    unless ($IDXLABEL) {
	$IDXLABEL = $IdxTypeStr . ' Index';
	$IsDefault{'IDXLABEL'} = 1;
    }

    ##	Beginning of main index page
    unless ($IDXPGBEG) {
	$IDXPGBEG =<<'EndOfStr';
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>$IDXTITLE$</TITLE>
</HEAD>
<BODY>
<H1>$IDXTITLE$</H1>
EndOfStr
	$IsDefault{'IDXPGBEG'} = 1;
    }

    ##	End of main index page
    unless ($IDXPGEND) {
	$IDXPGEND = "</BODY>\n</HTML>\n";
	$IsDefault{'IDXPGEND'} = 1;
    }

    ##	Beginning of main index list
    unless ($LIBEG) {
	$LIBEG  = '';
	$LIBEG .= "<UL>\n" .
		  '<LI><A HREF="$TIDXFNAME$">$TIDXLABEL$</A></LI>' .
		  "\n</UL>\n"  if $THREAD;
	$LIBEG .= '$PGLINK(PREV)$$PGLINK(NEXT)$' . "\n"  if $MULTIIDX;
	$LIBEG .= "<HR>\n<UL>\n";
	$IsDefault{'LIBEG'} = 1;
    }

    ## End of main index list
    unless ($LIEND) {
	$LIEND  = "</UL>\n";
	$IsDefault{'LIEND'} = 1;
    }

    ## Main index entry (start, content, and end)
    unless ($LITMPL) {
	$LITMPL =<<'EndOfStr';
<LI><STRONG>$SUBJECT$</STRONG>
<UL><LI><EM>From</EM>: $FROM$</LI></UL>
</LI>
EndOfStr
	$IsDefault{'LITMPL'} = 1;
    }

    ## Main list group resources
    unless ($AUTHBEG) {
	$AUTHBEG = ''; $IsDefault{'AUTHBEG'} = 1;
    }
    unless ($AUTHEND) {
	$AUTHEND = ''; $IsDefault{'AUTHEND'} = 1;
    }
    unless ($DAYBEG) {
	$DAYBEG = ''; $IsDefault{'DAYBEG'} = 1;
    }
    unless ($DAYEND) {
	$DAYEND = ''; $IsDefault{'DAYEND'} = 1;
    }
    unless ($SUBJECTBEG) {
	$SUBJECTBEG = ''; $IsDefault{'SUBJECTBEG'} = 1;
    }
    unless ($SUBJECTEND) {
	$SUBJECTEND = ''; $IsDefault{'SUBJECTEND'} = 1;
    }

## }

## THREAD index resources
## if ($THREAD) {

    ##	Label for thread index
    unless ($TIDXLABEL) {
	$TIDXLABEL = 'Thread Index';
	$IsDefault{'TIDXLABEL'} = 1;
    }

    ##	Beginning of thread index page
    unless ($TIDXPGBEG) {
	$TIDXPGBEG =<<'EndOfStr';
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>$TIDXTITLE$</TITLE>
</HEAD>
<BODY>
<H1>$TIDXTITLE$</H1>
EndOfStr
	$IsDefault{'TIDXPGBEG'} = 1;
    }
    ## End of thread index page
    unless ($TIDXPGEND) {
	$TIDXPGEND = "</BODY>\n</HTML>\n";
	$IsDefault{'TIDXPGEND'} = 1;
    }

    ## Head of thread index page (also contains list start markup)
    unless ($THEAD) {
	$THEAD  = '';
	$THEAD .= "<UL>\n" .
		  '<LI><A HREF="$IDXFNAME$">$IDXLABEL$</A></LI>' .
		  "\n</UL>\n"  if $MAIN;
	$THEAD .= '$PGLINK(TPREV)$$PGLINK(TNEXT)$' . "\n"  if $MULTIIDX;
	$THEAD .= "<HR>\n<UL>\n";
	$IsDefault{'THEAD'} = 1;
    }
    ## Foot of thread index page (also contains list end markup)
    unless ($TFOOT) {
	$TFOOT  = "</UL>\n";
	$IsDefault{'TFOOT'} = 1;
    }

    ## Template for thread entry with no follow-ups
    unless ($TSINGLETXT) {
	$TSINGLETXT =<<'EndOfStr';
<LI><STRONG>$SUBJECT$</STRONG>,
<EM>$FROMNAME$</EM></LI>
EndOfStr
	$IsDefault{'TSINGLETXT'} = 1;
    }

    ## Template for thread entry that is the start of a thread
    unless ($TTOPBEG) {
	$TTOPBEG =<<'EndOfStr';
<LI><STRONG>$SUBJECT$</STRONG>,
<EM>$FROMNAME$</EM>
EndOfStr
	$IsDefault{'TTOPBEG'} = 1;
    }
    ## Template for end of a thread
    unless ($TTOPEND) {
	$TTOPEND = "</LI>\n";
	$IsDefault{'TTOPEND'} = 1;
    }

    ## Template for the start of a sub-thread
    unless ($TSUBLISTBEG) {
	$TSUBLISTBEG  = "<UL>\n";
	$IsDefault{'TSUBLISTBEG'} = 1;
    }
    ## Template for the end of a sub-thread
    unless ($TSUBLISTEND) {
	$TSUBLISTEND  = "</UL>\n";
	$IsDefault{'TSUBLISTEND'} = 1;
    }

    ## Template for the start and content of a regular thread entry
    unless ($TLITXT) {
	$TLITXT =<<'EndOfStr';
<LI><STRONG>$SUBJECT$</STRONG>,
<EM>$FROMNAME$</EM>
EndOfStr
	$IsDefault{'TLITXT'} = 1;
    }
    ## Template for end of a regular thread entry
    unless ($TLIEND) {
	$TLIEND = "</LI>\n";
	$IsDefault{'TLIEND'} = 1;
    }

    ## Template for the start of subject based section
    unless ($TSUBJECTBEG) {
	$TSUBJECTBEG  = "<LI>&lt;Possible follow-up(s)&gt;</LI>\n";
	$IsDefault{'TSUBJECTBEG'} = 1;
    }
    ## Template for the end of subject based section
    unless ($TSUBJECTEND) {
	$TSUBJECTEND  = "";
	$IsDefault{'TSUBJECTEND'} = 1;
    }

    ## Template for start and content of missing message in thread
    unless ($TLINONE) {
	$TLINONE = "<LI><EM>Message not available</EM>";
	$IsDefault{'TLINONE'} = 1;
    }
    ## Template for end of missing message in thread
    unless ($TLINONEEND) {
	$TLINONEEND = "</LI>\n";
	$IsDefault{'TLINONEEND'} = 1;
    }

    ## Template for opening an indent (for cross-page threads)
    unless ($TINDENTBEG) {
	$TINDENTBEG = "<UL>\n";
	$IsDefault{'TINDENTBEG'} = 1;
    }
    ## Template for closing an indent (for cross-page threads)
    unless ($TINDENTEND) {
	$TINDENTEND = "</UL>\n";
	$IsDefault{'TINDENTEND'} = 1;
    }

    ## Template for start of a continued thread (for cross-page threads)
    unless ($TCONTBEG) {
	$TCONTBEG = '<LI><STRONG>$SUBJECTNA$</STRONG>, ' .
		    "<EM>(continued)</EM>\n";
	$IsDefault{'TCONTBEG'} = 1;
    }
    ## Template for end of a continued thread (for cross-page threads)
    unless ($TCONTEND) {
	$TCONTEND = "</LI>\n";
	$IsDefault{'TCONTEND'} = 1;
    }

    $DoMissingMsgs = $TLINONE =~ /\S/;

## }

unless ($TSLICEBEG) {
    $TSLICEBEG = "<BLOCKQUOTE><UL>\n";
    $IsDefault{'TSLICEBEG'} = 1;
}
unless ($TSLICEEND) {
    $TSLICEEND = "</UL></BLOCKQUOTE>\n";
    $IsDefault{'TSLICEEND'} = 1;
}

##-------------------##
## Message resources ##
##-------------------##

unless (@DateFields) {
    @DateFields = ('received', 'date');
    $IsDefault{'DATEFIELDS'} = 1;
}
unless (@FromFields) {
    @FromFields = ('from', 'reply-to', 'apparently-from');
    $IsDefault{'FROMFIELDS'} = 1;
}

## Beginning of message page
unless ($MSGPGBEG) {
    $MSGPGBEG =<<'EndOfStr';
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML//EN">
<HTML>
<HEAD>
<TITLE>$SUBJECTNA:72$</TITLE>
<LINK REV="made" HREF="mailto:$FROMADDR$">
</HEAD>
<BODY>
EndOfStr
    $IsDefault{'MSGPGBEG'} = 1;
}

## End of message page
unless ($MSGPGEND) {
    $MSGPGEND = "</BODY>\n</HTML>\n";
    $IsDefault{'MSGPGEND'} = 1;
}

## Subject header
unless ($SUBJECTHEADER) {
    $SUBJECTHEADER = '<H1>$SUBJECTNA$</H1>' . "\n<HR>\n";
    $IsDefault{'SUBJECTHEADER'} = 1;
}

## Separator between message data head and message data body
unless ($HEADBODYSEP) {
    $HEADBODYSEP = "<HR>\n";
    $IsDefault{'HEADBODYSEP'} = 1;
}

## Separator between end of message data and rest of page
unless ($MSGBODYEND) {
    $MSGBODYEND = "<HR>\n";
    $IsDefault{'MSGBODYEND'} = 1;
}

##---------------------------------##
## Mail header formating resources ##
##---------------------------------##

$FIELDSBEG = "<UL>\n",	$IsDefault{'FIELDSBEG'} = 1	unless $FIELDSBEG;
$FIELDSEND = "</UL>\n",	$IsDefault{'FIELDSEND'} = 1	unless $FIELDSEND;
$LABELBEG = "<LI>",	$IsDefault{'LABELBEG'} = 1  	unless $LABELBEG;
$LABELEND = ":",	$IsDefault{'LABELEND'} = 1	unless $LABELEND;
$FLDBEG  = " ", 	$IsDefault{'FLDBEG'} = 1	unless $FLDBEG;
$FLDEND  = "</LI>",	$IsDefault{'FLDEND'} = 1    	unless $FLDEND;

##-----------------------------------##
##  Next/prev message link resources ##
##-----------------------------------##

## Next/prev buttons
$NEXTBUTTON = '[<A HREF="$MSG(NEXT)$">'.$IdxTypeStr.' Next</A>]',
    $IsDefault{'NEXTBUTTON'} = 1	unless $NEXTBUTTON;
$PREVBUTTON = '[<A HREF="$MSG(PREV)$">'.$IdxTypeStr.' Prev</A>]',
    $IsDefault{'PREVBUTTON'} = 1	unless $PREVBUTTON;
$NEXTBUTTONIA = "[$IdxTypeStr Next]",
    $IsDefault{'NEXTBUTTONIA'} = 1	unless $NEXTBUTTONIA;
$PREVBUTTONIA = "[$IdxTypeStr Prev]",
    $IsDefault{'PREVBUTTONIA'} = 1	unless $PREVBUTTONIA;

## Next message link
unless ($NEXTLINK) {
    $NEXTLINK =<<EndOfStr;
<LI>Next by $IdxTypeStr:
<STRONG><A HREF="\$MSG(NEXT)\$">\$SUBJECT(NEXT)\$</A></STRONG>
</LI>
EndOfStr
    $IsDefault{'NEXTLINK'} = 1;
}

## Inactive next message link
$NEXTLINKIA = '', $IsDefault{'NEXTLINKIA'} = 1	unless $NEXTLINKIA;

## Previous message link
unless ($PREVLINK) {
    $PREVLINK =<<EndOfStr;
<LI>Prev by $IdxTypeStr:
<STRONG><A HREF="\$MSG(PREV)\$">\$SUBJECT(PREV)\$</A></STRONG>
</LI>
EndOfStr
    $IsDefault{'PREVLINK'} = 1;
}

## Inactive previous message link
$PREVLINKIA = '', $IsDefault{'PREVLINKIA'} = 1  unless $PREVLINKIA;

## Thread next/previous buttons
$TNEXTBUTTON = '[<A HREF="$MSG(TNEXT)$">Thread Next</A>]',
    $IsDefault{'TNEXTBUTTON'} = 1	unless $TNEXTBUTTON;
$TPREVBUTTON = '[<A HREF="$MSG(TPREV)$">Thread Prev</A>]',
    $IsDefault{'TPREVBUTTON'} = 1	unless $TPREVBUTTON;
$TNEXTBUTTONIA = '[Thread Next]',
    $IsDefault{'TNEXTBUTTONIA'} = 1	unless $TNEXTBUTTONIA;
$TPREVBUTTONIA = '[Thread Prev]',
    $IsDefault{'TPREVBUTTONIA'} = 1	unless $TPREVBUTTONIA;

## Next message in thread link
unless ($TNEXTLINK) {
    $TNEXTLINK =<<'EndOfStr';
<LI>Next by thread:
<STRONG><A HREF="$MSG(TNEXT)$">$SUBJECT(TNEXT)$</A></STRONG>
</LI>
EndOfStr
    $IsDefault{'TNEXTLINK'} = 1;
}

## Inactive next message in thread link
$TNEXTLINKIA = '', $IsDefault{'TNEXTLINKIA'} = 1  unless $TNEXTLINKIA;

## Previous message in thread link
unless ($TPREVLINK) {
    $TPREVLINK =<<'EndOfStr';
<LI>Prev by thread:
<STRONG><A HREF="$MSG(TPREV)$">$SUBJECT(TPREV)$</A></STRONG>
</LI>
EndOfStr
    $IsDefault{'TPREVLINK'} = 1;
}

## Inactive previous message in thread link
$TPREVLINKIA = '', $IsDefault{'TPREVLINKIA'} = 1  unless $TPREVLINKIA;

## Top links in message
if (!$TOPLINKS) {
    $TOPLINKS  = "<HR>\n";
    $TOPLINKS .= '$BUTTON(PREV)$$BUTTON(NEXT)$'
	if $MAIN;
    $TOPLINKS .= '$BUTTON(TPREV)$$BUTTON(TNEXT)$'
	if $THREAD;
    $TOPLINKS .= '[<A HREF="$IDXFNAME$#$MSGNUM$">$IDXLABEL$</A>]'
	if $MAIN;
    $TOPLINKS .= '[<A HREF="$TIDXFNAME$#$MSGNUM$">$TIDXLABEL$</A>]'
	if $THREAD;
    $IsDefault{'TOPLINKS'} = 1;
}

## Bottom links in message
if (!$BOTLINKS) {
    $BOTLINKS =  "<UL>\n";
    $BOTLINKS .= '$LINK(PREV)$$LINK(NEXT)$'  if $MAIN;
    $BOTLINKS .= '$LINK(TPREV)$$LINK(TNEXT)$'  if $THREAD;
    if ($MAIN || $THREAD) {
	$BOTLINKS .= "<LI>Index(es):\n<UL>\n";
	$BOTLINKS .= '<LI><A HREF="$IDXFNAME$#$MSGNUM$">' .
		     "<STRONG>$IdxTypeStr</STRONG></A></LI>\n"  if $MAIN;
	$BOTLINKS .= '<LI><A HREF="$TIDXFNAME$#$MSGNUM$">' .
		     "<STRONG>Thread</STRONG></A></LI>\n"  if $THREAD;
    }
    $BOTLINKS .= "</UL>\n</LI>\n</UL>\n";
    $IsDefault{'BOTLINKS'} = 1;
}

## Follow-up and References resources
unless ($FOLUPBEGIN) {
    $FOLUPBEGIN =<<'EndOfVar';
<UL><LI><STRONG>Follow-Ups</STRONG>:
<UL>
EndOfVar
    $IsDefault{'FOLUPBEGIN'} = 1;
}
unless ($FOLUPLITXT) {
    $FOLUPLITXT =<<'EndOfVar';
<LI><STRONG>$SUBJECT$</STRONG>
<UL><LI><EM>From:</EM> $FROM$</LI></UL></LI>
EndOfVar
    $IsDefault{'FOLUPLITXT'} = 1;
}
unless ($FOLUPEND) {
    $FOLUPEND =<<'EndOfVar';
</UL></LI></UL>
EndOfVar
    $IsDefault{'FOLUPEND'} = 1;
}

unless ($REFSBEGIN) {
    $REFSBEGIN =<<'EndOfVar';
<UL><LI><STRONG>References</STRONG>:
<UL>
EndOfVar
    $IsDefault{'REFSBEGIN'} = 1;
}
unless ($REFSLITXT) {
    $REFSLITXT =<<'EndOfVar';
<LI><STRONG>$SUBJECT$</STRONG>
<UL><LI><EM>From:</EM> $FROM$</LI></UL></LI>
EndOfVar
    $IsDefault{'REFSLITXT'} = 1;
}
unless ($REFSEND) {
    $REFSEND =<<'EndOfVar';
</UL></LI></UL>
EndOfVar
    $IsDefault{'REFSEND'} = 1;
}

##--------------------------------------------##
## Next/previous main/thread index page links ##
##--------------------------------------------##

$NEXTPGLINK  = '[<A HREF="$PG(NEXT)$">Next Page</A>]',
    $IsDefault{'NEXTPGLINK'} = 1	unless $NEXTPGLINK;
$PREVPGLINK  = '[<A HREF="$PG(PREV)$">Prev Page</A>]',
    $IsDefault{'PREVPGLINK'} = 1	unless $PREVPGLINK;
$TNEXTPGLINK = '[<A HREF="$PG(TNEXT)$">Next Page</A>]',
    $IsDefault{'TNEXTPGLINK'} = 1	unless $TNEXTPGLINK;
$TPREVPGLINK = '[<A HREF="$PG(TPREV)$">Prev Page</A>]',
    $IsDefault{'TPREVPGLINK'} = 1	unless $TPREVPGLINK;

$NEXTPGLINKIA  = '[Next Page]',
    $IsDefault{'NEXTPGLINKIA'} = 1	unless $NEXTPGLINKIA;
$PREVPGLINKIA  = '[Prev Page]',
    $IsDefault{'PREVPGLINKIA'} = 1	unless $PREVPGLINKIA;
$TNEXTPGLINKIA = '[Next Page]',
    $IsDefault{'TNEXTPGLINKIA'} = 1	unless $TNEXTPGLINKIA;
$TPREVPGLINKIA = '[Prev Page]',
    $IsDefault{'TPREVPGLINKIA'} = 1	unless $TPREVPGLINKIA;

##---------------##
## Miscellaneous ##
##---------------##

$MSGIDLINK = '<A $A_HREF$>$MSGID$</A>',
     $IsDefault{'MSGIDLINK'} = 1	unless $MSGIDLINK;

$NOTE	    = '$NOTETEXT$',
     $IsDefault{'NOTE'} = 1		unless $NOTE;
$NOTEIA	    = '',
     $IsDefault{'NOTEIA'} = 1		unless $NOTEIA;
$NOTEICON   = '',
     $IsDefault{'NOTEICON'} = 1		unless $NOTEICON;
$NOTEICONIA = '',
     $IsDefault{'NOTEICONIA'} = 1	unless $NOTEICONIA;

##	Set unknown icon
$Icons{'unknown'} = $Icons{'text/plain'}  unless $Icons{'unknown'};

}

##---------------------------------------------------------------------------##
1;
