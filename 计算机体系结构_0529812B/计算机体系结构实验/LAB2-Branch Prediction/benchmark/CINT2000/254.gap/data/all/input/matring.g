#############################################################################
##
#A  matring.g                   GAP library                  Martin Schoenert
##
#A  @(#)$Id: matring.g,v 3.2 1994/05/24 14:21:53 sam Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains  those  functions that mainly deal with matrix  rings.
##
#H  $Log: matring.g,v $
#H  Revision 3.2  1994/05/24  14:21:53  sam
#H  fixed bug in 'IsUnit'
#H
#H  Revision 3.1  1992/04/05  15:11:03  martin
#H  added 'MatrixRingOps.Quotient'
#H
#H  Revision 3.0  1991/11/08  15:17:00  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
#F  IsMatrixRing(<obj>) . . . . . . . . .  test if an object is a matrix ring
##
IsMatrixRing := function ( obj )
    return IsRec( obj )
       and IsBound( obj.isMatrixRing )  and obj.isMatrixRing;
end;


#############################################################################
##
#F  MatricesOps.Ring(<gens>)  . . . . . . . . . . . . .  create a matrix ring
##
MatricesOps.Ring := function ( gens )
    local   R;

    # make the ring record
    R := rec(
        isDomain                := true,
        isRing                  := true,
        isMatrixRing            := true,

        generators              := gens,
        one                     := gens[1]^0,
        zero                    := gens[1] - gens[1],

        dimension               := Length( gens[1] ),
        field                   := Field( Flat( gens ) ),

        operations              := MatrixRingOps
    );

    # return the ring record
    return R;
end;


#############################################################################
##
#F  MatricesOps.DefaultRing(<gens>) . . . . .  create the default matrix ring
##
MatricesOps.DefaultRing := MatricesOps.Ring;


#############################################################################
##
#V  MatrixRingOps . . . . . . . . . operation record for matrix ring category
##
##  'MatrixRingOps' is the  operation record for  matrix  rings.  It contains
##  the domain functions,  e.g., 'Size'  and   'Intersection', and the   ring
##  functions, e.g., 'IsUnit' and 'Factors'.
##
##  'MatrixRingOps' is initially a copy  of 'RingOps', and thus inherits  the
##  default ring  functions.    Currently  we  overlay   very few   of  those
##  functions.
##
MatrixRingOps := Copy( RingOps );


#############################################################################
##
#F  MatrixRingOps.IsFinite(<R>) . . . . . . . test if a matrix ring is finite
##
MatrixRingOps.IsFinite := function ( R )
    if IsFinite( R.field )  then
        return true;
    else
        return RingOps.IsFinite( R );
    fi;
end;


#############################################################################
##
#F  MatrixRingOps.IsUnit(<R>,<m>) . . . . . . . .  test if a matrix is a unit
##
MatrixRingOps.IsUnit := function ( R, m )
    return DeterminantMat( m ) <> R.field.zero
       and m^-1 in R;
end;


#############################################################################
##
#F  MatrixRingOps.Quotient := function ( R, m, n )
##
MatrixRingOps.Quotient := function ( R, m, n )
    if IsFinite( R )  then
        if RankMat( n ) = Length( n )  then
            return m / n;
        else
            Error("<n> must be invertable");
        fi;
    else
        Error("sorry, cannot compute the quotient of <m> and <n>");
    fi;
end;


#############################################################################
##
#E  Emacs . . . . . . . . . . . . . . . . . . . . . . . local emacs variables
##
##  Local Variables:
##  mode:               outline
##  outline-regexp:     "#F\\|#V\\|#E"
##  fill-column:        73
##  fill-prefix:        "##  "
##  eval:               (hide-body)
##  End:
##



