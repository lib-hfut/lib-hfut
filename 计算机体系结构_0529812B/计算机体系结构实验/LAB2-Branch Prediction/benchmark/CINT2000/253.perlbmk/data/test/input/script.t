
# $RCSfile: script.t,v $$Revision: 4.1 $$Date: 92/08/07 18:27:23 $
# jh minor mods for SPEC 7-May-1998 - expect executable to not be named perl

print "1..3\n";

if (open(BIN, "$^X")) {
  $PERL = $^X;
  close BIN;
  }
elsif (open(BIN, "$^X.exe")) {
  $PERL = "$^X.exe";
  close BIN;
  }
else { die "Can't open perlbmk : $!\n"; }

$x = `$PERL -le "print 'ok';"`;
if ($x =~ /DCL-W-NOCOMD/) { $x = `\$ mcr sys\$disk:[]perl. -e "print ""ok\n""";`; }

if ($x eq "ok\n") {print "ok 1\n";} else {print "not ok 1\n";}

open(try,">Comp.script") || (die "Can't open temp file.");
print try 'print "ok\n";'; print try "\n";
close try;

$x = `$PERL Comp.script`;
if ($x =~ /DCL-W-NOCOMD/) { $x = `\$ mcr sys\$disk:[]perl. Comp.script`; }

if ($x eq "ok\n") {print "ok 2\n";} else {print "not ok 2\n";}

$x = `$PERL <Comp.script`;
if ($x =~ /DCL-W-NOCOMD/) { $x = `\$ mcr sys\$disk:[]perl. <Comp.script`; }

if ($x eq "ok\n") {print "ok 3\n";} else {print "not ok 3\n";}

unlink 'Comp.script';#|| `/bin/rm -f Comp.script`; # (if unlink fails, it's ok)
