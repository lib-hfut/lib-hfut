# j.henning 7-May-1998 SPEC CPU2000 test input derived from perl
# installation 't' directory (TEST)

use English;
$OUTPUT_AUTOFLUSH = 1;

@scripts = qw (
append
arith
array
auto
chop
cmdopt
cmp
cond
decl
delete
do
each
elsif
eval
exp
for
goto
gv
if
inc
index
int
join
lex
list
local
method
mod
my
oct
ord
package
pat
print
push
quotemeta
rand
range
recurse
redef
ref
repeat
script
sleep
sort
split
sprintf
study
subst
substr
subval
switch
symbol
term
time
undef
unshift
vec
while
);

foreach $s (@scripts) {
   print "\n$s\n";
   $cmd = "$EXECUTABLE_NAME $s.t > $s.out";
   system $cmd;
}
