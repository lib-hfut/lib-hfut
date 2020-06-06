#############################################################################
##
#A  combinat.g                  GAP library                  Martin Schoenert
##
#A  @(#)$Id: combinat.g,v 3.21 1992/07/07 13:30:02 goetz Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  the functions that mainly  deal  with  combinatorics.
##
#H  $Log: combinat.g,v $
#H  Revision 3.21  1992/07/07  13:30:02  goetz
#H  made 'PowerPartition' faster.
#H
#H  Revision 3.20  1992/06/01  15:13:21  goetz
#H  a more readable version of 'PartitionTuples' which accepts 0.
#H
#H  Revision 3.19  1992/03/13  13:19:49  goetz
#H  added 'PartitionTuples' from 'ctsymmet.g'.
#H
#H  Revision 3.18  1992/03/13  13:13:20  goetz
#H  added 'SignPartition', 'AssociatedPartition' and
#H  'PowerPartition' from 'ctsymmet.g'.
#H
#H  Revision 3.17  1991/10/08  16:10:50  martin
#H  'Position' now returns 'false'
#H
#H  Revision 3.16  1991/08/08  16:12:33  martin
#H  fixed functions that used 'Size' instead of 'Length' for multisets
#H
#H  Revision 3.15  1991/07/30  15:13:58  martin
#H  improved 'NrPartitions' to use Eulers theorem
#H
#H  Revision 3.14  1991/07/22  17:40:24  martin
#H  added 'RestrictedPartitions'
#H
#H  Revision 3.13  1991/07/21  17:56:24  martin
#H  added lots of comments
#H
#H  Revision 3.12  1991/07/21  13:04:14  martin
#H  removed avoidable 'return'-s
#H
#H  Revision 3.11  1991/07/21  12:00:56  martin
#H  changed 'Partitions' to return partitions in standard form
#H
#H  Revision 3.10  1991/07/21  11:39:38  martin
#H  fixed 'Partitions' for 0
#H
#H  Revision 3.9  1991/07/10  12:00:00  martin
#H  fixed 'PartitionsSet' for the empty set
#H
#H  Revision 3.8  1991/07/09  12:00:00  martin
#H  fixed 'OrderedPartitions' for the empty set
#H
#H  Revision 3.7  1991/07/05  12:00:00  martin
#H  fixed 'NrArrangements' for the empty set
#H
#H  Revision 3.6  1991/07/01  13:00:00  martin
#H  added 'Bell'
#H
#H  Revision 3.5  1991/07/01  12:00:00  martin
#H  fixed 'NrDerangements' for the empty set
#H
#H  Revision 3.4  1990/11/20  13:00:00  martin
#H  added 'Bernoulli'
#H
#H  Revision 3.3  1990/11/20  12:00:00  martin
#H  moved functions from numtheor to combinatorics package
#H
#H  Revision 3.2  1990/11/16  12:00:00  martin
#H  moved functions from integer to combinatorics package
#H
#H  Revision 3.1  1990/11/11  12:00:00  martin
#H  added 'Permanent'
#H
#H  Revision 3.0  1990/11/09  12:00:00  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  Factorial( <n> )  . . . . . . . . . . . . . . . . factorial of an integer
##
Factorial := function ( n )
    if n < 0  then Error("<n> must be nonnegative");  fi;
    return Product( [1..n] );
end;


#############################################################################
##
#F  Binomial( <n>, <k> )  . . . . . . . . .  binomial coefficient of integers
##
Binomial := function ( n, k )
    local   bin, i, j;
    if   k < 0  then
        bin := 0;
    elif k = 0  then
        bin := 1;
    elif n < 0  then
        bin := (-1)^k * Binomial( -n+k-1, k );
    elif n < k  then
        bin := 0;
    elif n = k  then
        bin := 1;
    elif n-k < k  then
        bin := Binomial( n, n-k );
    else
        bin := 1;  j := 1;
        for i  in [n-k+1..n]  do
            bin := bin * i;
            while j <= k  and bin mod j = 0  do
                bin := bin / j;
                j := j + 1;
            od;
        od;
    fi;
    return bin;
end;


#############################################################################
##
#F  Bell( <n> ) . . . . . . . . . . . . . . . . .  value of the Bell sequence
##
Bell := function ( n )
    local   bell, k, i;
    bell := [ 1 ];
    for i  in [1..n-1]  do
        bell[i+1] := bell[1];
        for k  in [0..i-1]  do
            bell[i-k] := bell[i-k] + bell[i-k+1];
        od;
    od;
    return bell[1];
end;


#############################################################################
##
#F  Stirling1( <n>, <k> ) . . . . . . . . . Stirling number of the first kind
##
Stirling1 := function ( n, k )
    local   sti, i, j;
    if   n < k  then
        sti := 0;
    elif n = k  then
        sti := 1;
    elif n < 0 and k < 0  then
        sti := Stirling2( -k, -n );
    elif k <= 0  then
        sti := 0;
    else
        sti := [ 1 ];
        for j  in [2..n-k+1]  do
            sti[j] := 0;
        od;
        for i  in [1..k]  do
            sti[1] := 1;
            for j  in [2..n-k+1]  do
                sti[j] := (i+j-2) * sti[j-1] + sti[j];
            od;
        od;
        sti := sti[n-k+1];
    fi;
    return sti;
end;


#############################################################################
##
#F  Stirling2( <n>, <k> ) . . . . . . . .  Stirling number of the second kind
##
##  Uses $S_2(n,k) = (-1)^k \sum_{i=1}^{k}{(-1)^i {k \choose i} i^k} / k!$.
##
Stirling2 := function ( n, k )
    local   sti, bin, fib, i;
    if   n < k  then
        sti := 0;
    elif n = k  then
        sti := 1;
    elif n < 0 and k < 0  then
        sti := Stirling1( -k, -n );
    elif k <= 0  then
        sti := 0;
    else
        bin := 1;                       # (k 0)
        sti := 0;                       # (-1)^0 (k 0) 0^k
        fib := 1;                       # 0!
        for i  in [1..k]  do
            bin := (k-i+1)/i * bin;     # (k i) = (k-(i-1))/i (k i-1)
            sti := bin * i^n - sti;     # (-1)^i sum (-1)^j (k j) j^k
            fib := fib * i;             # i!
        od;
        sti := sti / fib;
    fi;
    return sti;
end;


#############################################################################
##
#F  Combinations( <mset>, <k> ) . . . .  set of sorted sublists of a multiset
##
##  'CombinationsA( <mset>, <m>,  <n>, <comb>, <i> )' returns  the set of all
##  combinations of the multiset <mset>, which has size  <n>, that begin with
##  '<comb>[[1..<i>-1]]'.  To do  this it finds  all elements of <mset>  that
##  can go at '<comb>[<i>]' and calls itself  recursively for each candidate.
##  <m>-1 is the position of '<comb>[<i>-1]' in <mset>, so the candidates for
##  '<comb>[<i>]' are exactely the elements 'Set( <mset>[[<m>..<n>]] )'.
##
##  'CombinationsK( <mset>, <m>, <n>, <k>, <comb>, <i>  )' returns the set of
##  all combinations  of the multiset <mset>,  which has size  <n>, that have
##  length '<i>+<k>-1', and that begin with '<comb>[[1..<i>-1]]'.  To do this
##  it finds  all elements of  <mset> that can go  at '<comb>[<i>]' and calls
##  itself recursively  for   each candidate.    <m>-1 is   the  position  of
##  '<comb>[<i>-1]'  in <mset>,  so  the  candidates  for '<comb>[<i>]'   are
##  exactely the elements 'Set( <mset>[<m>..<n>-<k>+1] )'.
##
##  'Combinations' only calls 'CombinationsA' or 'CombinationsK' with initial
##  arguments.
##
CombinationsA := function ( mset, m, n, comb, i )
    local   combs, l;
    if m = n+1  then
        comb  := ShallowCopy(comb);
        combs := [ comb ];
    else
        comb  := ShallowCopy(comb);
        combs := [ ShallowCopy(comb) ];
        for l  in [m..n]  do
            if l = m or mset[l] <> mset[l-1]  then
                comb[i] := mset[l];
                Append( combs, CombinationsA(mset,l+1,n,comb,i+1) );
            fi;
        od;
    fi;
    return combs;
end;

CombinationsK := function ( mset, m, n, k, comb, i )
    local   combs, l;
    if k = 0  then
        comb  := ShallowCopy(comb);
        combs := [ comb ];
    else
        combs := [];
        for l  in [m..n-k+1]  do
            if l = m or mset[l] <> mset[l-1]  then
                comb[i] := mset[l];
                Append( combs, CombinationsK(mset,l+1,n,k-1,comb,i+1) );
            fi;
        od;
    fi;
    return combs;
end;

Combinations := function ( arg )
    local   combs, mset;
    if Length(arg) = 1  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        combs := CombinationsA( mset, 1, Length(mset), [], 1 );
    elif Length(arg) = 2  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        combs := CombinationsK( mset, 1, Length(mset), arg[2], [], 1 );
    else
        Error("usage: Combinations( <mset> [, <k>] )");
    fi;
    return combs;
end;


#############################################################################
##
#F  NrCombinations( <mset>, <k> ) . . number of sorted sublists of a multiset
##
##  'NrCombinations' uses well known identities if <mset> is a proper set, or
##  if no <k> is given.  For a multiset it uses 'NrCombinationsK' which works
##  just like 'CombinationsK'.
##
#N  26-Oct-90 martin there should be a better way to do this for multisets
##
NrCombinationsK := function ( mset, m, n, k )
    local   combs, l;
    if k = 0  then
        combs := 1;
    else
        combs := 0;
        for l  in [m..n-k+1]  do
            if l = m  or mset[l] <> mset[l-1]  then
                combs := combs + NrCombinationsK( mset, l+1, n, k-1 );
            fi;
        od;
    fi;
    return combs;
end;

NrCombinations := function ( arg )
    local   nr, mset, i, j;
    if Length(arg) = 1  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        if IsSet(mset)  then
            nr := 2^Size(mset);
        else
            nr := Product( Set(mset), i->Number(mset,j->i=j)+1 );
        fi;
    elif Length(arg) = 2  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        if IsSet(mset)  then
            nr := Binomial( Size(mset), arg[2] );
        else
            nr := NrCombinationsK( mset, 1, Length(mset), arg[2] );
        fi;
    else
        Error("usage: NrCombinations( <mset> [, <k>] )");
    fi;
    return nr;
end;


#############################################################################
##
#F  Arrangements( <mset> )  . . . . set of ordered combinations of a multiset
##
##  'ArrangementsA( <mset>,  <m>, <n>, <comb>, <i>  )' returns the set of all
##  arrangements of the multiset <mset>, which has  size <n>, that begin with
##  '<comb>[[1..<i>-1]]'.   To do this it  finds all  elements of <mset> that
##  can go at '<comb>[<i>]' and calls itself  recursively for each candidate.
##  <m> is a boolean list of size <n> that contains  'true' for every element
##  of <mset> that we have not yet taken, so the candidates for '<comb>[<i>]'
##  are exactely the elements '<mset>[<l>]' such that '<m>[<l>]'  is  'true'.
##  Some care must be taken to take a candidate only once if it appears  more
##  than once in <mset>.
##
##  'ArrangementsK( <mset>, <m>, <n>, <k>, <comb>, <i> )'  returns the set of
##  all arrangements  of the multiset <mset>,  which has size  <n>, that have
##  length '<i>+<k>-1', and that begin with '<comb>[[1..<i>-1]]'.  To do this
##  it finds  all elements of  <mset> that can  go at '<comb>[<i>]' and calls
##  itself recursively for each candidate.  <m> is a boolean list of size <n>
##  that contains 'true' for every element  of <mset>  that we  have  not yet
##  taken,  so  the candidates for   '<comb>[<i>]' are  exactely the elements
##  '<mset>[<l>]' such that '<m>[<l>]' is 'true'.  Some care must be taken to
##  take a candidate only once if it appears more than once in <mset>.
##
##  'Arrangements' only calls 'ArrangementsA' or 'ArrangementsK' with initial
##  arguments.
##
ArrangementsA := function ( mset, m, n, comb, i )
    local   combs, l;
    if i = n+1  then
        comb  := ShallowCopy(comb);
        combs := [ comb ];
    else
        comb  := ShallowCopy(comb);
        combs := [ ShallowCopy(comb) ];
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])  then
                comb[i] := mset[l];
                m[l] := false;
                Append( combs, ArrangementsA( mset, m, n, comb, i+1 ) );
                m[l] := true;
            fi;
        od;
    fi;
    return combs;
end;

ArrangementsK := function ( mset, m, n, k, comb, i )
    local   combs, l;
    if k = 0  then
        comb := ShallowCopy(comb);
        combs := [ comb ];
    else
        combs := [];
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])  then
                comb[i] := mset[l];
                m[l] := false;
                Append( combs, ArrangementsK( mset, m, n, k-1, comb, i+1 ) );
                m[l] := true;
            fi;
        od;
    fi;
    return combs;
end;

Arrangements := function ( arg )
    local   combs, mset, m, i;
    if Length(arg) = 1  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        m := List( mset, i->true );
        combs := ArrangementsA( mset, m, Length(mset), [], 1 );
    elif Length(arg) = 2  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        m := List( mset, i->true );
        combs := ArrangementsK( mset, m, Length(mset), arg[2], [], 1 );
    else
        Error("usage: Arrangements( <mset> [, <k>] )");
    fi;
    return combs;
end;


#############################################################################
##
#F  NrArrangements( <mset> )  .  number of ordered combinations of a multiset
##
##  'NrArrangements' uses well known identities if <mset>  is a  proper  set.
##  If <mset> is a multiset  it uses 'NrArrangementsA' and 'NrArrangementsK',
##  which work just like 'ArrangementsA' and 'ArrangementsK'.
##
#N  26-Oct-90 martin there should be a better way to do this for multisets
##
NrArrangementsA := function ( mset, m, n, i )
    local   combs, l;
    if i = n+1  then
        combs := 1;
    else
        combs := 1;
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])  then
                m[l] := false;
                combs := combs + NrArrangementsA( mset, m, n, i+1 );
                m[l] := true;
            fi;
        od;
    fi;
    return combs;
end;

NrArrangementsK := function ( mset, m, n, k )
    local   combs, l;
    if k = 0  then
        combs := 1;
    else
        combs := 0;
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])  then
                m[l] := false;
                combs := combs + NrArrangementsK( mset, m, n, k-1 );
                m[l] := true;
            fi;
        od;
    fi;
    return combs;
end;

NrArrangements := function ( arg )
    local   nr, i, mset, m;
    if Length(arg) = 1  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        if IsSet( mset )  then
            nr := 0;
            for i  in [0..Size(mset)]  do
                nr := nr + Factorial(Size(mset)) / Factorial(Size(mset)-i);
            od;
        else
            m := List( mset, i->true );
            nr := NrArrangementsA( mset, m, Length(mset), 1 );
        fi;
    elif Length(arg) = 2  then
        mset := ShallowCopy(arg[1]);  Sort( mset );
        if IsSet( mset )  then
            if arg[2] <= Size(mset)  then
                nr := Factorial(Size(mset)) / Factorial(Size(mset)-arg[2]);
            else
                nr := 0;
            fi;
        else
            m := List( mset, i->true );
            nr := NrArrangementsK( mset, m, Length(mset), arg[2] );
        fi;
    else
        Error("usage: NrArrangements( <mset> [, <k>] )");
    fi;
    return nr;
end;


#############################################################################
##
#F  UnorderedTuples( <set>, <k> ) . . . .  set of unordered tuples from a set
##
##  'UnorderedTuplesK( <set>, <n>, <m>, <k>, <tup>, <i> )' returns the set of
##  all unordered tuples of  the  set <set>,  which  has size <n>, that  have
##  length '<i>+<k>-1', and that begin with  '<tup>[[1..<i>-1]]'.  To do this
##  it  finds all elements  of <set>  that  can go  at '<tup>[<i>]' and calls
##  itself   recursively  for   each  candidate.  <m>  is    the  position of
##  '<tup>[<i>-1]' in <set>, so the  candidates for '<tup>[<i>]' are exactely
##  the elements '<set>[[<m>..<n>]]',  since we require that unordered tuples
##  be sorted.
##
##  'UnorderedTuples' only calls 'UnorderedTuplesK' with initial arguments.
##
UnorderedTuplesK := function ( set, n, m, k, tup, i )
    local   tups, l;
    if k = 0  then
        tup := ShallowCopy(tup);
        tups := [ tup ];
    else
        tups := [];
        for l  in [m..n]  do
            tup[i] := set[l];
            Append( tups, UnorderedTuplesK( set, n, l, k-1, tup, i+1 ) );
        od;
    fi;
    return tups;
end;

UnorderedTuples := function ( set, k )
    set := Set(set);
    return UnorderedTuplesK( set, Size(set), 1, k, [], 1 );
end;


#############################################################################
##
#F  NrUnorderedTuples( <set>, <k> ) . . number unordered of tuples from a set
##
NrUnorderedTuples := function ( set, k )
    return Binomial( Size(Set(set))+k-1, k );
end;


#############################################################################
##
#F  Tuples( <set>, <k> )  . . . . . . . . .  set of ordered tuples from a set
##
##  'TuplesK( <set>, <k>, <tup>, <i> )' returns the set  of all tuples of the
##  set   <set>   that have   length     '<i>+<k>-1',  and  that  begin  with
##  '<tup>[[1..<i>-1]]'.  To do this  it loops  over  all elements of  <set>,
##  puts them at '<tup>[<i>]' and calls itself recursively.
##
##  'Tuples' only calls 'TuplesK' with initial arguments.
##
TuplesK := function ( set, k, tup, i )
    local   tups, l;
    if k = 0  then
        tup := ShallowCopy(tup);
        tups := [ tup ];
    else
        tups := [];
        for l  in set  do
            tup[i] := l;
            Append( tups, TuplesK( set, k-1, tup, i+1 ) );
        od;
    fi;
    return tups;
end;

Tuples := function ( set, k )
    set := Set(set);
    return TuplesK( set, k, [], 1 );
end;


#############################################################################
##
#F  NrTuples( <set>, <k> )  . . . . . . . number of ordered tuples from a set
##
NrTuples := function ( set, k )
    return Size(Set(set)) ^ k;
end;


#############################################################################
##
#F  PermutationsList( <mset> )  . . . . . . set of permutations of a multiset
##
##  'PermutationsListK( <mset>, <m>, <n>, <k>, <perm>, <i> )' returns the set
##  of all  permutations  of the multiset  <mset>, which  has  size <n>, that
##  begin  with '<perm>[[1..<i>-1]]'.  To do   this it finds all elements  of
##  <mset> that can go at '<perm>[<i>]' and calls itself recursively for each
##  candidate.  <m> is a  boolean  list of size  <n> that contains 'true' for
##  every element of <mset> that we have not yet taken, so the candidates for
##  '<perm>[<i>]'  are    exactely the   elements   '<mset>[<l>]' such   that
##  '<m>[<l>]' is 'true'.  Some care must be taken to take a  candidate  only
##  once if it apears more than once in <mset>.
##
##  'Permutations' only calls 'PermutationsListK' with initial arguments.
##
PermutationsListK := function ( mset, m, n, k, perm, i )
    local   perms, l;
    if k = 0  then
        perm := ShallowCopy(perm);
        perms := [ perm ];
    else
        perms := [];
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])  then
                perm[i] := mset[l];
                m[l] := false;
                Append( perms, PermutationsListK(mset,m,n,k-1,perm,i+1) );
                m[l] := true;
            fi;
        od;
    fi;
    return perms;
end;

PermutationsList := function ( mset )
    local   m, i;
    mset := ShallowCopy(mset);  Sort( mset );
    m := List( mset, i->true );
    return PermutationsListK(mset,m,Length(mset),Length(mset),[],1);
end;


#############################################################################
##
#F  NrPermutationsList( <mset> )  . . .  number of permutations of a multiset
##
##  'NrPermutationsList' uses the well known multinomial coefficient formula.
##
NrPermutationsList := function ( mset )
    local   nr, m, i;
    nr := Factorial( Length(mset) );
    for m  in Set(mset)  do
        nr := nr / Factorial( Number( mset, i->i = m ) );
    od;
    return nr;
end;


#############################################################################
##
#F  Derangements( <list> ) . . . . set of fixpointfree permutations of a list
##
##  'DerangementsK( <mset>, <m>, <n>, <list>, <k>, <perm>, <i> )' returns the
##  set of all permutations of the multiset <mset>, which  has size <n>, that
##  have no element  at the  same position  as <list>,  and that begin   with
##  '<perm>[[1..<i>-1]]'.   To do this it finds  all elements  of <mset> that
##  can go at '<perm>[<i>]' and calls itself  recursively for each candidate.
##  <m> is a boolean list of size <n> that contains  'true' for every element
##  that we have not  yet taken, so the  candidates for '<perm>[<i>]' are the
##  elements '<mset>[<l>]' such that '<m>[<l>]' is 'true'.  Some care must be
##  taken  to  take a candidate   only once if  it  append more  than once in
##  <mset>.
##
DerangementsK := function ( mset, m, n, list, k, perm, i )
    local   perms, l;
    if k = 0  then
        perm := ShallowCopy(perm);
        perms := [ perm ];
    else
        perms := [];
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])
              and mset[l] <> list[i]  then
                perm[i] := mset[l];
                m[l] := false;
                Append( perms, DerangementsK(mset,m,n,list,k-1,perm,i+1) );
                m[l] := true;
            fi;
        od;
    fi;
    return perms;
end;

Derangements := function ( list )
    local   mset, m, i;
    mset := ShallowCopy(list);  Sort( mset );
    m := List( mset, i->true );
    return DerangementsK(mset,m,Length(mset),list,Length(mset),[],1);
end;


#############################################################################
##
#F  NrDerangements( <list> ) .  number of fixpointfree permutations of a list
##
##  'NrDerangements' uses well known  identities if <mset>  is a proper  set.
##  If <mset> is a multiset it  uses 'NrDerangementsK', which works just like
##  'DerangementsK'.
##
NrDerangementsK := function ( mset, m, n, list, k, i )
    local   perms, l;
    if k = 0  then
        perms := 1;
    else
        perms := 0;
        for l  in [1..n]  do
            if m[l] and (l=1 or m[l-1]=false or mset[l]<>mset[l-1])
              and mset[l] <> list[i]  then
                m[l] := false;
                perms := perms + NrDerangementsK(mset,m,n,list,k-1,i+1);
                m[l] := true;
            fi;
        od;
    fi;
    return perms;
end;

NrDerangements := function ( list )
    local   nr, mset, m, i;
    mset := ShallowCopy(list);  Sort( mset );
    if IsSet(mset)  then
        if Size(mset) = 0  then
            nr := 1;
        elif Size(mset) = 1  then
            nr := 0;
        else
            m := - Factorial(Size(mset));
            nr := 0;
            for i  in [2..Size(mset)]  do
                m := - m / i;
                nr := nr + m;
            od;
        fi;
    else
        m := List( mset, i->true );
        nr := NrDerangementsK(mset,m,Length(mset),list,Length(mset),1);
    fi;
    return nr;
end;


#############################################################################
##
#F  Permanent( <mat> )  . . . . . . . . . . . . . . . . permanent of a matrix
##
Permanent2 := function ( mat, n, i, sum )
    local   p,  k;
    if i = n+1  then
        p := 1;
        for k  in sum  do p := p * k;  od;
    else
        p := Permanent2( mat, n, i+1, sum )
           - Permanent2( mat, n, i+1, sum+mat[i] );
    fi;
    return p;
end;

Permanent := function ( mat )
    return (-1)^Length(mat) * Permanent2( mat, Length(mat), 1, 0*mat[1] );
end;


#############################################################################
##
#F  PartitionsSet( <set> )  . . . . . . . . . . .  set of partitions of a set
##
##  'PartitionsSetA( <set>,  <n>, <m>, <o>, <part>,  <i>, <j> )'  returns the
##  set  of all partitions of  the set <set>, which  has size <n>, that begin
##  with  '<part>[[1..<i>-1]]'  and   where the    <i>-th   set begins   with
##  '<part>[<i>][[1..<j>]]'.    To do so  it  does two things.   It finds all
##  elements of  <mset> that can  go at '<part>[<i>][<j>+1]' and calls itself
##  recursively for  each candidate.  And it  considers the set '<part>[<i>]'
##  to be complete  and starts a  new  set '<part>[<i>+1]', which must  start
##  with the smallest element of <mset> not yet taken, because we require the
##  returned partitions to be  sorted lexicographically.  <mset> is a boolean
##  list that contains 'true' for every element of <mset> not yet taken.  <o>
##  is the position  of '<part>[<i>][<j>]' in  <mset>, so the candidates  for
##  '<part>[<i>][<j>+1]' are  those elements '<mset>[<l>]'  for  which '<o> <
##  <l>' and '<m>[<l>]' is 'true'.
##
##  'PartitionsSetK( <set>, <n>,  <m>, <o>, <k>,  <part>, <i>, <j> )' returns
##  the set of all partitions of the set <set>, which has size <n>, that have
##  '<k>+<i>-1' subsets, and  that begin with '<part>[[1..<i>-1]]'  and where
##  the <i>-th set begins with '<part>[<i>][[1..<j>]]'.  To do so it does two
##  things.  It   finds    all  elements   of   <mset>    that  can   go   at
##  '<part>[<i>][<j>+1]'  and calls  itself  recursively for  each candidate.
##  And,  if <k> is  larger than 1, it considers  the set '<part>[<i>]' to be
##  complete and starts a new set '<part>[<i>+1]',  which must start with the
##  smallest element of <mset> not yet taken, because we require the returned
##  partitions to be sorted lexicographically.  <mset> is a boolean list that
##  contains 'true' for every element  of <mset> not yet  taken.  <o> is  the
##  position    of '<part>[<i>][<j>]'  in    <mset>,  so  the  candidates for
##  '<part>[<i>][<j>+1]' are those elements  '<mset>[<l>]'  for which '<o>  <
##  <l>' and '<m>[<l>]' is 'true'.
##
##  'PartitionsSet' only  calls   'PartitionsSetA' or  'PartitionsSetK'  with
##  initial arguments.
##
PartitionsSetA := function ( set, n, m, o, part, i, j )
    local   parts, npart, l;
    l := Position(m,true);
    if l = false  then
        part := List(part,ShallowCopy);
        parts := [ part ];
    else
        npart := ShallowCopy(part);
        m[l] := false;
        npart[i+1] := [ set[l] ];
        parts := PartitionsSetA(set,n,m,l+1,npart,i+1,1);
        m[l] := true;
        part := ShallowCopy(part);
        part[i] := ShallowCopy(part[i]);
        for l  in [o..n]  do
            if m[l]   then
                m[l] := false;
                part[i][j+1] := set[l];
                Append( parts, PartitionsSetA(set,n,m,l+1,part,i,j+1));
                m[l] := true;
            fi;
        od;
    fi;
    return parts;
end;

PartitionsSetK := function ( set, n, m, o, k, part, i, j )
    local   parts, npart, l;
    l := Position(m,true);
    parts := [];
    if k = 1  then
        part := List(part,ShallowCopy);
        for l  in [k..n]  do
            if m[l]  then
                Add( part[i], set[l] );
            fi;
        od;
        parts := [ part ];
    elif l <> false  then
        npart := ShallowCopy(part);
        m[l] := false;
        npart[i+1] := [ set[l] ];
        parts := PartitionsSetK(set,n,m,l+1,k-1,npart,i+1,1);
        m[l] := true;
        part := ShallowCopy(part);
        part[i] := ShallowCopy(part[i]);
        for l  in [o..n]  do
            if m[l]  then
                m[l] := false;
                part[i][j+1] := set[l];
                Append( parts, PartitionsSetK(set,n,m,l+1,k,part,i,j+1));
                m[l] := true;
            fi;
        od;
    fi;
    return parts;
end;

PartitionsSet := function ( arg )
    local   parts, set, m, i;
    if Length(arg) = 1  then
        set := arg[1];
        if not IsSet(arg[1])  then
            Error("PartitionsSet: <set> must be a set");
        fi;
        if set = []  then
            parts := [ [  ] ];
        else
            m := List( set, i->true );
            m[1] := false;
            parts := PartitionsSetA(set,Length(set),m,2,[[set[1]]],1,1);
        fi;
    elif Length(arg) = 2  then
        set := arg[1];
        if not IsSet(set)  then
            Error("PartitionsSet: <set> must be a set");
        fi;
        if set = []  then
            if arg[2] = 0  then
                parts := [ [ ] ];
            else
                parts := [ ];
            fi;
        else
            m := List( set, i->true );
            m[1] := false;
            parts := PartitionsSetK(
                        set, Length(set), m, 2, arg[2], [[set[1]]], 1, 1 );
        fi;
    else
        Error("usage: PartitionsSet( <n> [, <k>] )");
    fi;
    return parts;
end;


#############################################################################
##
#F  NrPartitionsSet( <set> )  . . . . . . . . . number of partitions of a set
##
NrPartitionsSet := function ( arg )
    local   nr, set, k;
    if Length(arg) = 1  then
        set := arg[1];
        if not IsSet(arg[1])  then
            Error("NrPartitionsSet: <set> must be a set");
        fi;
        nr := Bell( Size(set) );
    elif Length(arg) = 2  then
        set := arg[1];
        if not IsSet(set)  then
            Error("NrPartitionsSet: <set> must be a set");
        fi;
        nr := Stirling2( Size(set), arg[2] );
    else
        Error("usage: NrPartitionsSet( <n> [, <k>] )");
    fi;
    return nr;
end;


#############################################################################
##
#F  Partitions( <n> ) . . . . . . . . . . . . set of partitions of an integer
##
##  'PartitionsA( <n>, <m>, <part>, <i> )' returns the  set of all partitions
##  of '<n> +  Sum(<part>[[1..<i>-1]])' that begin with '<part>[[1..<i>-1]]'.
##  To do so  it finds  all values that  can go  at  '<part>[<i>]' and  calls
##  itself recursively for each   candidate.  <m> is '<part>[<i>-1]', so  the
##  candidates  for   '<part>[<i>]'  are '[1..Minimum(<m>,<n>)]',   since  we
##  require that partitions are nonincreasing.
##
##  There is one hack  that needs some comments.   Each call to 'PartitionsA'
##  contributes one  partition  without   going into recursion,    namely the
##  'Concatenation(  <part>[[1..<i>-1]], [1,1,...,1]  )'.  Of all  partitions
##  returned by 'PartitionsA'  this  is the smallest,  i.e.,  it will be  the
##  first  one in the result  set.   Therefor it is  put  into the result set
##  before anything else is done.  However it  is not immediately padded with
##  1, this is  the last  thing  'PartitionsA' does befor  returning.  In the
##  meantime the  list is  used as a   temporary that is passed  to recursive
##  invocations.  Note that the fact that each call contributes one partition
##  without going into recursion means that  the number of recursive calls to
##  'PartitionsA'  (and the number  of  calls to  'ShallowCopy') is equal  to
##  'NrPartitions(<n>)'.
##
##  'PartitionsK( <n>,  <m>,  <k>, <part>,  <i>  )' returns  the  set of  all
##  partitions    of  '<n>  +   Sum(<part>[[1..<i>-1]])'  that    have length
##  '<k>+<i>-1' and that begin with '<part>[[1..<i>-1]]'.   To do so it finds
##  all values that can go at '<part>[<i>]' and  calls itself recursively for
##  each  candidate.    <m>  is  '<part>[<i>-1]',   so  the   candidates  for
##  '<part>[<i>]' must be  less than or  equal to <m>,  since we require that
##  partitions    are  nonincreasing.   Also    '<part>[<i>]' must    be  \<=
##  '<n>+1-<k>', since  we need at   least  <k>-1  ones  to  fill the   <k>-1
##  positions of <part> remaining after  filling '<part>[<i>]'.  On the other
##  hand '<part>[<i>]'  must be  >=  '<n>/<k>', because otherwise we  can not
##  fill the <k>-1 remaining positions nonincreasingly.   It is not difficult
##  to show  that for  each  candidate satisfying these properties   there is
##  indeed a partition, i.e., we never run into a dead end.
##
##  'Partitions'  only  calls  'PartitionsA'  or  'PartitionsK'  with initial
##  arguments.
##
PartitionsA := function ( n, m, part, i )
    local   parts, l;
    if n = 0  then
        part := ShallowCopy(part);
        parts := [ part ];
    elif n <= m  then
        part := ShallowCopy(part);
        parts := [ part ];
        for l  in [2..n]  do
            part[i] := l;
            Append( parts, PartitionsA( n-l, l, part, i+1 ) );
        od;
        for l  in [i..i+n-1]  do
            part[l] := 1;
        od;
    else
        part := ShallowCopy(part);
        parts := [ part ];
        for l  in [2..m]  do
            part[i] := l;
            Append( parts, PartitionsA( n-l, l, part, i+1 ) );
        od;
        for l  in [i..i+n-1]  do
            part[l] := 1;
        od;
    fi;
    return parts;
end;

PartitionsK := function ( n, m, k, part, i )
    local   parts, l;
    if k = 1  then
        part := ShallowCopy(part);
        part[i] := n;
        parts := [ part ];
    elif n+1-k < m  then
        parts := [];
        for l  in [QuoInt(n+k-1,k)..n+1-k]  do
            part[i] := l;
            Append( parts, PartitionsK( n-l, l, k-1, part, i+1 ) );
        od;
    else
        parts := [];
        for l  in [QuoInt(n+k-1,k)..m]  do
            part[i] := l;
            Append( parts, PartitionsK( n-l, l, k-1, part, i+1 ) );
        od;
    fi;
    return parts;
end;

Partitions := function ( arg )
    local   parts;
    if Length(arg) = 1  then
        parts := PartitionsA( arg[1], arg[1], [], 1 );
    elif Length(arg) = 2  then
        if arg[1] = 0  then
            if arg[2] = 0  then
                parts := [ [  ] ];
            else
                parts := [  ];
            fi;
        else
            if arg[2] = 0  then
                parts := [  ];
            else
                parts := PartitionsK( arg[1], arg[1], arg[2], [], 1 );
            fi;
        fi;
    else
        Error("usage: Partitions( <n> [, <k>] )");
    fi;
    return parts;
end;


#############################################################################
##
#F  NrPartitions( <n> ) . . . . . . . . .  number of partitions of an integer
##
##  To compute $p(n) = NrPartitions(n)$ we use Euler\'s theorem, that asserts
##  $p(n) = \sum_{k>0}{ (-1)^{k+1} (p(n-(3m^2-m)/2) + p(n-(3m^2+m)/2)) }$.
##
##  To compute $p(n,k)$ we use $p(m,1) = p(m,m) = 1$, $p(m,l) = 0$ if $m\<l$,
##  and the recurrence  $p(m,l) = p(m-1,l-1) + p(m-l,l)$  if $1 \<   l \< m$.
##  This recurrence can be proved by spliting the number of ways to write $m$
##  as a  sum of $l$  summands in two subsets,  those  sums that have  1 as a
##  summand and those that do not.  The number of ways  to write $m$ as a sum
##  of $l$ summands that have 1 as a  summand is $p(m-1,l-1)$, because we can
##  take away  the  1 and obtain  a new sums with   $l-1$ summands  and value
##  $m-1$.  The number of ways to  write  $m$  as a sum  of $l$ summands such
##  that no summand is 1 is $P(m-l,l)$, because we  can  subtract 1 from each
##  summand and obtain new sums that still have $l$ summands but value $m-l$.
##
NrPartitions := function ( arg )
    local   s, n, m, p, k, l;

    if Length(arg) = 1  then
        n := arg[1];
        s := 1;                             # p(0) = 1
        p := [ s ];
        for m  in [1..n]  do
            s := 0;
            k := 1;
            l := 1;                         # k*(3*k-1)/2
            while 0 <= m-(l+k)  do
                s := s - (-1)^k * (p[m-l+1] + p[m-(l+k)+1]);
                k := k + 1;
                l := l + 3*k - 2;
            od;
            if 0 <= m-l  then
                s := s - (-1)^k * p[m-l+1];
            fi;
            p[m+1] := s;
        od;

    elif Length(arg) = 2  then
        if arg[1] = arg[2]  then
            s := 1;
        elif arg[1] < arg[2]  or arg[2] = 0  then
            s := 0;
        else
            n := arg[1];  k := arg[2];
            p := [];
            for m  in [1..n]  do
                p[m] := 1;                  # p(m,1) = 1
            od;
            for l  in [2..k]  do
                for m  in [l+1..n-l+1]  do
                    p[m] := p[m] + p[m-l];  # p(m,l) = p(m,l-1) + p(m-l,l)
                od;
            od;
            s := p[n-k+1];
        fi;

    else
        Error("usage: NrPartitions( <n> [, <k>] )");
    fi;

    return s;
end;


#############################################################################
##
#F  OrderedPartitions( <n> ) . . . .  set of ordered partitions of an integer
##
##  'OrderedPartitionsA( <n>,  <part>, <i> )' returns  the set of all ordered
##  partitions  of  '<n>  +    Sum(<part>[[1..<i>-1]])'   that  begin    with
##  '<part>[[1..<i>-1]]'.   To do    so   it puts   all  possible  values  at
##  '<part>[<i>]', which are of course exactely the elements of '[1..n]', and
##  calls itself recursively.
##
##  'OrderedPartitionsK(  <n>,  <k>, <part>,  <i>  )' returns the set  of all
##  ordered partitions of   '<n> + Sum(<part>[[1..<i>-1]])'  that have length
##  '<k>+<i>-1', and that begin with '<part>[[1..<i>-1]]'.  To  do so it puts
##  all possible  values at '<part>[<i>]', which are   of course exactely the
##  elements of '[1..<n>-<k>+1]', and calls itself recursively.
##
##  'OrderedPartitions'      only       calls     'OrderedPartitionsA'     or
##  'OrderedPartitionsK' with initial arguments.
##
OrderedPartitionsA := function ( n, part, i )
    local   parts, l;
    if n = 0  then
        part := ShallowCopy(part);
        parts := [ part ];
    else
        part := ShallowCopy(part);
        parts := [];
        for l  in [1..n-1]  do
            part[i] := l;
            Append( parts, OrderedPartitionsA( n-l, part, i+1 ) );
        od;
        part[i] := n;
        Add( parts, part );
    fi;
    return parts;
end;

OrderedPartitionsK := function ( n, k, part, i )
    local   parts, l;
    if k = 1  then
        part := ShallowCopy(part);
        part[i] := n;
        parts := [ part ];
    else
        parts := [];
        for l  in [1..n-k+1]  do
            part[i] := l;
            Append( parts, OrderedPartitionsK( n-l, k-1, part, i+1 ) );
        od;
    fi;
    return parts;
end;

OrderedPartitions := function ( arg )
    local   parts;
    if Length(arg) = 1  then
        parts := OrderedPartitionsA( arg[1], [], 1 );
    elif Length(arg) = 2  then
        if arg[1] = 0  then
            if arg[2] = 0  then
                parts := [ [  ] ];
            else
                parts := [  ];
            fi;
        else
            if arg[2] = 0  then
                parts := [  ];
            else
                parts := OrderedPartitionsK( arg[1], arg[2], [], 1 );
            fi;
        fi;
    else
        Error("usage: OrderedPartitions( <n> [, <k>] )");
    fi;
    return parts;
end;


#############################################################################
##
#F  NrOrderedPartitions( <n> ) . . number of ordered partitions of an integer
##
##  'NrOrderedPartitions' uses well known identities to compute the number of
##  ordered partitions of <n>.
##
NrOrderedPartitions := function ( arg )
    local   nr;
    if Length(arg) = 1  then
        if arg[1] = 0  then
            nr := 1;
        else
            nr := 2^(arg[1]-1);
        fi;
    elif Length(arg) = 2  then
        if arg[1] = 0  then
            if arg[2] = 0  then
                nr := 1;
            else
                nr := 0;
            fi;
        else
            nr := Binomial(arg[1]-1,arg[2]-1);
        fi;
    else
        Error("usage: NrOrderedPartitions( <n> [, <k>] )");
    fi;
    return nr;
end;


#############################################################################
##
#F  RestrictedPartitions( <n>, <set> )  . restricted partitions of an integer
##
##  'RestrictedPartitionsA( <n>, <set>, <m>,  <part>, <i> )' returns the  set
##  of  all partitions of  '<n> +  Sum(<part>[[1..<i>-1]])' that contain only
##  elements of <set> and that begin with '<part>[[1..<i>-1]]'.   To do so it
##  finds all elements of <set> that can go at '<part>[<i>]' and calls itself
##  recursively for each candidate.  <m>  is the position of  '<part>[<i>-1]'
##  in   <set>,  so the   candidates for  '<part>[<i>]'  are  the elements of
##  '<set>[[1..<m>]]' that  are less    than  <n>,  since we   require   that
##  partitions are nonincreasing.
##
##  'RestrictedPartitionsK( <n>, <set>, <m>, <k>,  <part>, <i> )' returns the
##  set  of all  partitions of  '<n>  + Sum(<part>[[1..<i>-1]])' that contain
##  only elements of <set>, that have length '<k>+<i>-1', and that begin with
##  '<part>[[1..<i>-1]]'.   To do so it finds  all elements fo <set> that can
##  go at '<part>[<i>]' and calls itself recursively for each candidate.  <m>
##  is  the  position  of '<part>[<i>-1]'   in  <set>, so the  candidates for
##  '<part>[<i>]' are the elements  of '<set>[[1..<m>]]'  that are less  than
##  <n>, since we require that partitions are nonincreasing.
##
RestrictedPartitionsA := function ( n, set, m, part, i )
    local   parts, l;
    if n = 0  then
        part := ShallowCopy(part);
        parts := [ part ];
    else
        part := ShallowCopy(part);
        if n mod set[1] = 0  then
            parts := [ part ];
        else
            parts := [ ];
        fi;
        for l  in [2..m]  do
            if set[l] <= n  then
                part[i] := set[l];
                Append(parts,RestrictedPartitionsA(n-set[l],set,l,part,i+1));
            fi;
        od;
        if n mod set[1] = 0  then
            for l  in [i..i+n/set[1]-1]  do
                part[l] := set[1];
            od;
        fi;
    fi;
    return parts;
end;

RestrictedPartitionsK := function ( n, set, m, k, part, i )
    local   parts, l;
    if k = 1  then
        if n in set  then
            part := ShallowCopy(part);
            part[i] := n;
            parts := [ part ];
        else
            parts := [];
        fi;
    else
        part := ShallowCopy(part);
        parts := [ ];
        for l  in [1..m]  do
            if set[l]+(k-1)*set[1] <= n  and n <= k*set[l]  then
                part[i] := set[l];
                Append(parts,
                       RestrictedPartitionsK(n-set[l],set,l,k-1,part,i+1) );
            fi;
        od;
    fi;
    return parts;
end;

RestrictedPartitions := function ( arg )
    local   parts;
    if Length(arg) = 2  then
        parts := RestrictedPartitionsA(arg[1],arg[2],Length(arg[2]),[],1);
    elif Length(arg) = 3  then
        if arg[1] = 0  then
            if arg[3] = 0  then
                parts := [ [  ] ];
            else
                parts := [  ];
            fi;
        else
            if arg[2] = 0  then
                parts := [  ];
            else
                parts := RestrictedPartitionsK(
                             arg[1], arg[2], Length(arg[2]), arg[3], [], 1 );
            fi;
        fi;
    else
        Error("usage: RestrictedPartitions( <n>, <set> [, <k>] )");
    fi;
    return parts;
end;


#############################################################################
##
#F  NrRestrictedPartitions(<n>,<set>) . . . . number of restricted partitions
##
#N  22-Jul-91 martin there should be a better way to do this for given <k>
##
NrRestrictedPartitionsK := function ( n, set, m, k, part, i )
    local   parts, l;
    if k = 1  then
        if n in set  then
            parts := 1;
        else
            parts := 0;
        fi;
    else
        part := ShallowCopy(part);
        parts := 0;
        for l  in [1..m]  do
            if set[l]+(k-1)*set[1] <= n  and n <= k*set[l]  then
                part[i] := set[l];
                parts := parts +
                        NrRestrictedPartitionsK(n-set[l],set,l,k-1,part,i+1);
            fi;
        od;
    fi;
    return parts;
end;

NrRestrictedPartitions := function ( arg )
    local  s, n, set, m, p, k, l;

    if Length(arg) = 2  then
        n := arg[1];
        set := arg[2];
        p := [];
        for m  in [1..n+1]  do
            if (m-1) mod set[1] = 0  then
                p[m] := 1;
            else
                p[m] := 0;
            fi;
        od;
        for l  in Sublist( set, [2..Length(set)] )  do
            for m  in [l+1..n+1]  do
                p[m] := p[m] + p[m-l];
            od;
        od;
        s := p[n+1];

    elif Length(arg) = 3  then
        if arg[1] = 0  and arg[3] = 0  then
            s := 1;
        elif arg[1] < arg[3]  or arg[3] = 0  then
            s := 0;
        else
            s := NrRestrictedPartitionsK(
                        arg[1], arg[2], Length(arg[2]), arg[3], [], 1 );
        fi;

    else
        Error("usage: NrRestrictedPartitions( <n>, <set> [, <k>] )");
    fi;

    return s;
end;


#############################################################################
##
#F  SignPartition( <pi> ) . . . . . . . . . . . . .  signum of partition <pi>
##
SignPartition := function(pi)
   
   return (-1)^(Sum(pi) - Length(pi));

end;


#############################################################################
##
#F  AssociatedPartition( <pi> ) . . . . . .  the associated partition of <pi>
##
##  'AssociatedPartition'  returns the associated partition  of the partition
##  <pi> which is obtained by transposing the corresponding Young diagram.
##
AssociatedPartition := function(pi)

   local i, j, mu;

   mu:= List([1..pi[1]], x->0);
   for i in pi do
      for j in [1..i] do
	 mu[j]:= mu[j]+1;
      od;
   od;

   return(mu);

end;


#############################################################################
##
#F  PowerPartition( <pi>, <k> ) . . . . . . . . . . . .  power of a partition
##
##  'PowerPartition'  returns the partition corresponding to the <k>-th power
##  of a permutation with cycle structure <pi>.
##
PowerPartition := function(pi, k)

   local res, i, d, part;

   res:= [];
   for part in pi do
      d:= GcdInt(part, k);
      for i in [1..d] do
         Add(res, part/d);
      od;
   od;
   Sort(res);

   return Reversed(res);

end;


#############################################################################
##
#F  PartitionTuples( <n>, <r> ) . . . . . . . . . <r> partitions with sum <n>
##
##  'PartitionTuples'  returns the list of all <r>-tuples of partitions which
##  together form a partition of <n>.
##
PartitionTuples := function(n, r)

   local m, k, pm, i, t, t1, s, res, empty;

   empty:= rec(tup:= List([1..r], x->[]), pos:= List([1..n-1], x-> 1));

   if n = 0 then
      return [empty.tup];
   fi;

   pm:= List([1..n-1], x->[]);
   for m in [1..QuoInt(n,2)] do 

      # the m-cycle in all possible places.
      for i in [1..r] do
         s:= Copy(empty);
         s.tup[i]:= [m];
         s.pos[m]:= i;
         Add(pm[m], s);
      od;

      # add the m-cycle to everything you know.
      for k in [m+1..n-m] do
         for t in pm[k-m] do
            for i in [t.pos[m]..r] do
               t1:= Copy(t);
               s:= [m];
               Append(s, t.tup[i]);
               t1.tup[i]:= s;
               t1.pos[m]:= i;
               Add(pm[k], t1);
            od;
         od;
      od;
   od;

   #  collect.
   res:= [];
   for k in [1..n-1] do
      for t in pm[n-k] do
         for i in [t.pos[k]..r] do 
            t1:= Copy(t.tup);
            s:= [k];
            Append(s, t.tup[i]);
            t1[i]:= s;
            Add(res, t1);
         od;
      od;
   od;
   for i in [1..r] do
      s:= Copy(empty.tup);
      s[i]:= [n];
      Add(res, s);
   od;

   return res;

end;


#############################################################################
##
#F  Lucas(<P>,<Q>,<k>)  . . . . . . . . . . . . . . value of a lucas sequence
##
##  'Lucas' uses the following relations to compute the result in $O(log(k))$
##  $U_{2k} = U_k V_k,        U_{2k+1} = (P U_{2k} + V_{2k}) / 2$ and
##  $V_{2k} = V_k^2 - 2 Q^k,  V_{2k+1} = ((P^2-4Q) U_{2k} + P V_{2k}) / 2$.
##
Lucas := function ( P, Q, k )
    local   l;
    if k = 0  then
        l := [ 0, 2, 1 ];
    elif k < 0  then
        l := Lucas( P, Q, -k );
        l := [ -l[1]/l[3], l[2]/l[3], 1/l[3] ];
    elif k mod 2 = 0  then
        l := Lucas( P, Q, k/2 );
        l := [ l[1]*l[2], l[2]^2-2*l[3], l[3]^2 ];
    else
        l := Lucas( P, Q, k-1 );
        l := [ (P*l[1]+l[2])/2, ((P^2-4*Q)*l[1]+P*l[2])/2, Q*l[3] ];
    fi;
    return l;
end;


#############################################################################
##
#F  Fibonacci( <n> )  . . . . . . . . . . . . value of the Fibonacci sequence
##
##  A recursive  Fibonacci needs $O( Fibonacci(n) ) = O(2^n)$ bit operations.
##  An iterative version performs $n$ additions, the <i>th involving integers
##  with $i$ bits,  so  we  need $\sum_{i=1}^{n}{i} = O(n^2)$ bit operations.
##  The binary recursion of 'Lucas' reduces the number of calls to $log2(n)$.
##  The number of bit operations now is $O(n)$, i.e., the size of the result.
##
Fibonacci := function ( n )
    return Lucas( 1, -1, n )[ 1 ];
end;


#############################################################################
##
#F  Bernoulli( <n> )  . . . . . . . . . . . . value of the Bernoulli sequence
##
Bernoulli2 := [-1/2,1/6,0,-1/30,0,1/42,0,-1/30,0,5/66,0,-691/2730,0,7/6];

Bernoulli := function ( n )
    local   brn, bin, i, j;
    if   n < 0  then
        Error("Bernoulli: <n> must be nonnegative");
    elif n = 0  then
        brn := 1;
    elif n = 1  then
        brn := -1/2;
    elif n mod 2 = 1  then
        brn := 0;
    elif n <= Length(Bernoulli2)  then
        brn := Bernoulli2[n];
    else
        for i  in [Length(Bernoulli2)+1..n]  do
            if i mod 2 = 1  then
                Bernoulli2[i] := 0;
            else
                bin := 1;
                brn := 1;
                for j  in [1..i-1]  do
                    bin := (i+2-j)/j * bin;
                    brn := brn + bin * Bernoulli2[j];
                od;
                Bernoulli2[i] := - brn / (i+1);
            fi;
        od;
        brn := Bernoulli2[n];
    fi;
    return brn;
end;



