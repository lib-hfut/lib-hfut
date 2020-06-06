##---------------------------------------------------------------------------##
##	@(#)  mhtxtsetext.pl 2.1 98/03/02 @(#)
## Library to convert text/setext to HTML.  Adapted for use in MHonArc
## by ehood@medusa.acs.uci.edu, Sept 1994.
## Filter routine can be registered with the following:
##		<MIMEFILTERS>
##		text/setext:m2h_text_setext'filter:mhtxtsetext.pl
##		text/x-setext:m2h_text_setext'filter:mhtxtsetext.pl
##		</MIMEFILTERS>
##---------------------------------------------------------------------------##
# setext -> HTML converter
#
# $Id: mhtxtsetext.pl 1393 2005-06-14 15:55:21Z cloyce $
#
# Tony Sanders <sanders@earth.com>, June 1993
#
# Status of typotags:
#     header-tt         passed untouched (XXX: use Subject: in next release)
#     title-tt          <H1>...</H1> (and <TITLE> if needed)
#     subhead-tt        <H2>...</H2> (and <TITLE> if needed)
#     indent-tt         reflows paragraphs
#
#     bold-tt           <B>...</B>
#     italic-tt         <I>...</I>
#     underline-tt      <I>...</I>
#     hot-tt            <A HREF="...">...</A>           (see also href-tt)
#
#     quote-tt          <BLOCKQUOTE>...</BLOCKQUOTE>
# NIY bullet-tt         <UL>...</UL>
#
#     twobuck-tt        ignored
#     suppress-tt       suppressed in output
#     twodot-tt         ignored
#
# Additional typotags supported for HTML:
#     href-tt           .. _text HREF
#     isindex-tt        .. <isindex>
#
# setext'html -- converts setext (.etx files) to HTML
# setext'title -- utility routine to convert setext titles and subheads to HTML
#

# TODO:XXX
# I need to figure out how to allow HTML markup in the text while at the
# same time suppresing "unintentional" markup.  For now < & > are HTML'ized.

# Define the translations supported
# $trans{'text/setext'}            = "text/html:setext'html";

package m2h_text_setext;

# parser states
$FMT = 0;       # in free flow text (normal HTML mode)
$PRE = 1;       # in preformated text <PRE>...</PRE>
$QUOTE = 2;     # in blockquote <BLOCKQUOTE>...</BLOCKQUOTE>

sub filter {
    local($header, *fields, *body) = @_;
    local(@data) = split(/\n/,$body);

    $ret = '';
    # first pass, process <HEAD> items and hypertext link information
    for ($i = 0; $i <= $#data; $i++) {
        $_ = $data[$i];                 # $_ is default for m//

        # <ISINDEX> must be inside <HEAD>...</HEAD>
        /^\.\.\s+<isindex>/i &&
            do { $data[$i] = ".."; next; };

        # locate HREF's:  .. _href URL
        /^\.\.\s+_([^\s]*)\s+(.*)\s*/ && do { $href{$1} = $2; next; };

        # first title-tt or subhead-tt gets <TITLE>...</TITLE>
        # &title also adds the <H#>...</H#> to the appropriate line
        /^===/ && do { &title("H1", $i); next; };
        /^---/ && do { &title("H2", $i); next; };
    }

    # second pass, handle remaining typotags
    $curstate = $FMT;
    foreach (@data) {
        # process title information
        /^\.\.\s+(<H.>)(.*)(<\/H.>)/i && do {
            &to_fmt; $ret .= $1. &htmlize($2). $3. "\n"; next; };
        next if /^\.\./;

        # handle line breaks
        if ($curstate == $FMT && /^\s*$/) {
            $ret .= "<P>\n" unless $fold++; next; }
        $fold = 0;

        # state transitions
        if (/^>\s/) { &to_quote; }
        elsif (/^  [^ ]/) { &to_fmt; }
        else { &to_pre; }

        s/^>\s*//;                                              # fix quote-tt
        s/^  ([^ ])/$1/;                                        # fix indent-tt

        # bold-tt
            s#\*\*([^\*]*)\*\*#\376B\377$1\376/B\377#;
        # italic-tt
            s#~([^~]*)~#\376I\377$1\376/I\377#;
        # hot-tt
            s#\b([^\s]*)_\b#
                $h = $href{$1}; ($a = $1) =~ s,_, ,g;
                $h ? qq'\376A HREF="$h"\377$a\376/A\377' : "\376I\377$a\376/I\377"; #e;
        # underline-tt
            s#_([^\s]*)_#
                ($a = $1) =~ s,_, ,g; "\376I\377$a\376/I\377"; #e;
        $ret .= &htmlize($_). "\n";
    }
    &to_fmt;
    ($ret);
}

sub to_fmt {
    return if $curstate == $FMT;
    $ret .= "</PRE>\n" if $curstate == $PRE;
    $ret .= "</PRE></BLOCKQUOTE>\n" if $curstate == $QUOTE;       #XXX
    $curstate = $FMT;
}
sub to_pre {
    return if $curstate == $PRE;
    $ret .= "<PRE>\n" if $curstate == $FMT;
    $ret .= "</PRE></BLOCKQUOTE><PRE>\n" if $curstate == $QUOTE;  #XXX
    $curstate = $PRE;
}
sub to_quote {
    return if $curstate == $QUOTE;
    $ret .= "<BLOCKQUOTE><PRE>\n" if $curstate == $FMT;           #XXX
    $ret .= "</PRE><BLOCKQUOTE><PRE>\n" if $curstate == $PRE;     #XXX
    $curstate = $QUOTE;
}
sub htmlize {
    local($_) = @_;
    s/\&/\&\#38\;/g; s/\</\&\#60\;/g; s/\>/\&\#62\;/g;
    s/\376/</g; s/\377/>/g;                                     # convert back
    $_;
}
sub title {
    local($head, $i) = @_;
    $data[$i--] = ".."; $data[$i] =~ s/^\s*//;
    # $ret .= "<TITLE>$data[$i]</TITLE>\n" unless $title++;
    $data[$i] = ".. <$head>" . $data[$i] . "</$head>";
}

1;
