#############################################################################
##
#A  lattperf.g                  GAP library                    J\"urgen Mnich
##
#A  @(#)$Id: lattperf.g,v 3.5 1993/01/20 17:29:56 felsch Rel $
##
#Y  Copyright 1990-1992,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the catalogue of perfect groups.  It is taken from the
##  Cayley routine 'percat' by Guenter Sandloebes and Volkmar Felsch.
##  Special thanks to Goetz Pfeiffer, who entered some of the following group
##  descriptions.
##
#H  $Log: lattperf.g,v $
#H  Revision 3.5  1993/01/20  17:29:56  felsch
#H  removed overlong lines
#H
#H  Revision 3.4  1992/12/04  16:05:34  fceller
#H  completed the catalogue to contain all PERCAT
#H
#H  Revision 3.3  1992/03/17  12:31:20  jmnich
#H  minor style changes, more bug fixes
#H
#H  Revision 3.2  1992/02/29  13:25:11  jmnich
#H  general library review, some bug fixes
#H
#H  Revision 3.1  1992/02/12  15:37:22  martin
#H  initial revision under RCS
#H
##


#############################################################################
##
## Abstract generators used in the catalogue.
##
## Warning: These objects are global variables which is O.K. for this file.
##          However if they are used and bounded their previous values would
##          be lost if the following procedure is removed.
##

if IsBound( PerfCat_a ) then Unbind( PerfCat_a ); fi;
if IsBound( PerfCat_b ) then Unbind( PerfCat_b ); fi;

if IsBound( a ) then
    PerfCat_a := a;
    a := AbstractGenerator( "a" );
else
    a := AbstractGenerator( "a" );
fi;
if IsBound( b ) then
    PerfCat_b := b;
    b := AbstractGenerator( "b" );
else
    b := AbstractGenerator( "b" );
fi;


#############################################################################
##
## The catalogue
##
##
## An entry in the catalogue of perfect groups has the following structure:
##
## rec(
## )
##

PerfectGroupsCatalogue := [

    #########################################################################
    ##
    ## A_5 = PSL( 2, 4 ) = PSL( 2, 5 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 60,
        grouptype     := [],
        generatortype := [ [ 2, 15, 1, 15, 15, 0 ],
                           [ 3,  4, 1, 20, 20, 0 ] ],
        relations     := [ a^2, b^3, (a*b)^5 ],
        antirelations := [],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## SL( 2, 5 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 120,
        grouptype     := [],
        generatortype := [ [ 4, 30, 1, 30, 30, 0 ],
                           [ 3,  2, 2, 20, 20, 0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, a^2*b/(b*a^2) ],
        antirelations := [ a^2 ],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## PSL( 2, 7 ) = PSL( 3, 2 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 168,
        grouptype     := [],
        generatortype := [ [ 2, 21, 1, 21, 21, 0 ],
                           [ 3,  8, 2, 56, 56, 0 ] ],
        relations     := [ a^2, b^3, (a*b)^7, (a*b^2*a*b)^4 ],
        antirelations := [],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## SL( 2, 7 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 336,
        grouptype     := [],
        generatortype := [ [ 4, 42, 1, 42, 42, 0 ],
                           [ 3,  4, 2, 56, 56, 0 ] ],
        relations     := [ a^4, b^3, (a*b)^7, (a^2*b)/(b*a^2),
                          (a^3*b^2*a*b)^4/a^2 ],
        antirelations := [ a^2 ],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## A_6 = PSL( 2, 9 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 360,
        grouptype     := [],
        generatortype := [ [ 3, 40, 1, 40, 80, 0 ],
                           [ 4,  9, 2, 90, 90, 0 ] ],
        relations     := [ a^3, b^4, (a*b)^5, ((b*a)^4*a*b)^2 ],
        antirelations := [],
        subgroups     := [
            rec(
                generators := [ b^2, a*b^3*a*b ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ b^2, (a*b)^2*a ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## PSL( 2, 8 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 504,
        grouptype     := [],
        generatortype := [ [ 7, 72, 3, 72, 216, 0 ],
                           [ 2,  7, 1, 63,  63, 0 ] ],
        relations     := [ a^7, b^2, (a*b)^3, (a^3*b*a^5*b*a^3*b)^2 ],
        antirelations := [],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## PSL( 2, 11 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 660,
        grouptype     := [],
        generatortype := [ [ 11, 60, 2, 60, 120, 0 ],
                           [  2, 11, 1, 55,  55, 0 ] ],
        relations     := [ a^11, b^2, (a*b)^3, (a^4*b*a^6*b)^2 ],
        antirelations := [],
        subgroups     := [
            rec(
                generators := [ b, a^9*b*a ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ b, a^8*b*a^2 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## SL( 2, 9 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 720,
        grouptype     := [],
        generatortype := [ [ 3, 40, 1, 40,  80, 0 ],
                           [ 8,  9, 4, 90, 180, 0 ] ],
        relations     := [ a^3, b^8, (a*b)^5, (a*b^4)/(b^4*a),
                           ((b*a)^4*a*b)^2/b^4 ],
        antirelations := [ b^4 ],
        subgroups     := [
            rec(
                generators := [ a*(a*b^6)^2*b*a, b^5*a ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a*b*(a*b^6)*a^2, (a*b^6)*b*a*(a*b^6)^2*b ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 960.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 960,
        grouptype     := [ [ 1, 3, 320 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 4,   3, 2,  60, 180, 0 ] ],
        relations     := [ a^3, b^4, (b*a)^5, (b^2*a)^3, (b^3*a)^5,
                             (b*a*b^3*a*(b*a)^2*a)^2 ],
        antirelations := [ b^2 ],
        subgroups     := [
            rec(
                generators := [ b*a^2*b^3*a*b^3*a^2*b^3*a^2, a^2 ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ b*a^2*b^3*a*b^3*a^2*b^3*a^2, a*b^2*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ b*a^2*b^3*a*b^3*a^2*b^3*a^2,
                                a^2*b^3*a^2*b*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ b*a^2*b^3*a*b^3*a^2*b^3*a^2,
                                b^3*a*b*a*b^3*a^2 ],
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 960.2
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 960,
        grouptype     := [ [ 1, 3, 80 ] ],
        generatortype := [ [ 4, 120, 1, 120, 120, 60 ],
                           [ 3,   8, 2,  80,  80,  0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, ((b*a)^2*a*b)^2, (a^3*b)^5 ],
        antirelations := [ a^2 ],
        subgroups     := [
            rec(
                generators := [ b*a^2*b^2*a, b^2 ],
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 1080.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1080,
        grouptype     := [],
        generatortype := [ [  3, 120, 1, 120, 240, 2 ],
                           [ 12,   3, 4,  90, 180, 0 ] ],
        relations     := [ a^3, b^12, (a*b)^5, a*b^4/(b^4*a),
                             ((b*a)^4*a*b)^2/(b^4) ],
        antirelations := [ b^4 ],
        subgroups     := [
            rec(
                generators := [ b^6, a^2*b^11*a^2*b*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ b^6, b*a^2*b^11*a^2*b ],
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## PSL( 2, 13 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1092,
        grouptype     := [],
        generatortype := [ [ 7, 156, 3, 156, 468, 0 ],
                           [ 2,   7, 1,  91,  91, 0 ] ],
        relations     := [ a^7, b^2, (a^2*b)^3, (a*b)^6 ],
        antirelations := [],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## SL( 2, 11 )
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1320,
        grouptype     := [],
        generatortype := [ [ 11, 60, 2,  60, 120, 0 ],
                           [  4, 11, 2, 110, 110, 0 ] ],
        relations     := [ a^11, b^4, (a*b)^3, a*b^2/(b^2*a),
                             (a^4*b*a^6*b)^2/(b^2) ],
        antirelations := [ b^2 ],
        subgroups     := [
            rec(
                generators := [ b*a*b*a^9*b*a^2*b*a^10, (b*a^3)^2*a*b^3*a ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a*b*a^2, b*a^2*b*a^7*b*a*b^3 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 2^3 se PSL( 2, 7 )  1344.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1344,
        grouptype     := [ [ 1, 4, 420 ] ],
        generatortype := [ [ 3, 224, 1, 224, 224, 0 ],
                           [ 4,   6, 1,  84,  84, 0 ] ],
        relations     := [ a^3, b^4, (b*a^2)^7, (b*a^2*b^2*a)^2/(b^2),
                             (b^2*a^2*b*a)^2,
                             (a*b*a^2*b)^2/(b*a*b*a^2*b*a*b*a^2*b^2) ],
        antirelations := [ b^2 ],
        subgroups     := [
            rec(
                generators := [ b^2*a^2*b*a, a^2 ],
                isPerfect  := true,
                size       := 168
            ),
            rec(
                generators := [ (b*a*b*a^2)^2, a^2 ],
                isPerfect  := true,
                size       := 168
            )
        ]
    ),

    #########################################################################
    ##
    ## 2^3 nse PSL( 2, 7 )  1344.2
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1344,
        grouptype     := [ [ 1, 4, 84 ] ],
        generatortype := [ [ 3, 224, 1, 224, 224, 0 ],
                           [ 2,   6, 1,  84,  84, 7 ] ],
        relations     := [ a^3, b^2, (a*b)^7, ((b*a)^2*a)^8,
			   a^2*b*(a^2*b*a*b*a*b)^2*a^2*b*a
			   /(b*a^2*b*(a^2*b*a*b*a*b)^2*a^2*b*a*b) ],
        antirelations := [ ((b*a)^2*a)^4 ],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## 1920.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 31 ],
                           [ 2, 2, 15, 0 ] ],
        generatortype := [ [ 4, 120, 2, 120, 480, 0 ],
                           [ 3,   8, 2,  80,  80, 0 ] ],
        relations     := [ a^4, b^3, (a^3*b)^5, (a*b)^10,
                             ((b*a)^2*a*b)^2/(a*b)^5, a*(a*b)^5/((a*b)^5*a),
                             b*(a*b)^5/((a*b)^5*b) ],
        antirelations := [ (a^2*b^2*a*b)^2, a*b*a^2*b^2*a ],
        subgroups     := [
            rec(
                generators := [ a*b^2*a^2*b^2*a*b^2, b*a*b^2*a^2*b^2*a*b ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 1920.2
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 31 ],
                           [ 2, 2, 15, 2 ],
                           [ 3, 4, 60, 0 ] ],
        generatortype := [ [ 4, 120, 1, 120, 480, 0 ],
                           [ 3,   8, 2, 320, 320, 0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, (a^2*b)^3/(a^3*b)^5,
                           (a^3*b)^10, (a*b*a^3*b*a*b*a*b^2)^2/(a^3*b)^5,
                           a*(a^3*b)^5/((a^3*b)^5*a),
                           b*(a^3*b)^5/((a^3*b)^5*b) ],
        antirelations := [ (a^3*b)^5, a^2*(a^3*b)^5 ],
        subgroups     := [
            rec(
                generators := [ (b*a^3*b*a*b*a)^9, (a^3*b*a*b*a*b)^9 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ b*a^3*b*a, (a*b*a^3*b)^8*a^3*b ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ (a^2*b*a*(a^3*b)^9*b)^9,
                                b^2*(a^3*b)^2*b*a*b*a^3 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a^2*b*a*(a^3*b)^9*b^2*a^3*b,
                                (a^3*b)^9*b^2*a^3*b*a*b*a*(a^3*b)^9 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 1920.3
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 31 ],
                           [ 2, 2, 15, 2 ],
                           [ 3, 4, 60, 4 ] ],
        generatortype := [ [ 4, 120, 1, 120, 240, 240 ],
                           [ 3,   8, 2, 320, 320, 0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, (a^2*b)^3, (b*a^3)^5 ],
	antirelations := [ (b*a*b*a^3*b*a*b^2*a)^2 ],
        subgroups     := [
	    rec(
		generators := [ b^2*a*b*a^3*b*a*b*a*b^2*a,
				b*a*b*a^3*b*a*b*a*b^2*a*b ],
                isPerfect  := true,
		size       := 120
            ),
	    rec(
		generators := [ (a*b)^2*b*a^3*b^2*a*b^2*a*b*a*b^2,
				a*b^2*a*b*a*b*a^3*b*a^3*b^2 ],
                isPerfect  := true,
		size       := 120
            ),
	    rec(
		generators := [ (a*b*a^3*b)^2*b*a^3*b^2,
				b*b*a^3*b*a^3*b^2*a*b*a^3 ],
                isPerfect  := true,
		size       := 120
            ),
	    rec(
		generators := [ a*b*a*b*a^3*b*a^3*b*b*a^3*b^2,
				a^2*b^2*a*b*a^3*b^2*a*b*a^3 ],
                isPerfect  := true,
		size       := 120
            )
	]
    ),

    #########################################################################
    ##
    ## 1920.4
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 151 ] ],
        generatortype := [ [ 4, 120, 1, 120, 240, 120 ],
                           [ 3,   8, 2, 320, 320,   0 ] ],
        relations     := [ a^4, b^3, (a*b)^10, (a^2*b)^3, (a^3*b)^5,
			   ((a*b)^2*a^3*b*a*b*b)^2 ],
        antirelations := [ (a*b)^5 ],
        subgroups     := [
            rec(
                generators := [ (a*b)^2*a^3*b*a*b*b, b*a*a*b ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (a*b)^2*a^3*b*a*b*b, (b*a*b)^4*a*b ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^2*b*a^3*b*b*a^3*b*b*a*b^2*a, b^2 ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^2*b*a^3*b*b*a^3*b*b*a*b^2*a,
				a^2*b^2*a^3*b^2*a*b*a^2 ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 1920.5
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 31 ],
			   [ 2, 2, 15, 1] ],
        generatortype := [ [ 4, 120, 2, 120, 480, 0 ],
                           [ 3,  16, 2, 320, 320, 0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, (b^2*a^2*b*a)^2*a^2 ],
        antirelations := [ (a^2*b)^2*b ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## 1920.6
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 11 ] ],
        generatortype := [ [ 8, 120, 1, 240, 240, 0 ],
                           [ 3,   4, 2,  80,  80, 0 ] ],
        relations     := [ a^8, b^3, (a*b)^5/a^4, (a^3*b)^5/a^4,
			   ((b*a)^2*a*b)^2/a^4, Comm(b,a^4) ],
        antirelations := [ a^4 ],
        subgroups     := [
            rec(
                generators := [ a*b*a^7*b*a^2*b, b*a*b*a^7*b*a^2 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 1920.7
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 1920,
        grouptype     := [ [ 1, 2, 131 ] ],
        generatortype := [ [ 8, 240, 1, 240, 240, 0 ],
                           [ 3,   4, 2,  80,  80, 0 ] ],
        relations     := [ a^8, b^3, (a*b)^5, ((b*a)^2*a*b)^2,
			   (a^3*b)^5/a^4, b*a^4/(a^4*b) ],
        antirelations := [ a^4 ],
        subgroups     := [
            rec(
                generators := [ (b*a)^2*a*b, a^2*b^2*a^6 ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 2160
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2160,
        grouptype     := [ ],
        generatortype := [ [  3, 120, 1, 120, 240, 2 ],
                           [ 24,   3, 8,  90, 360, 0 ] ],
        relations     := [ a^3, b^24, (a*b)^5, a*b^4/(b^4*a),
			   ((b*a)^4*a*b)^2/b^4 ],
        antirelations := [ b^8, (a*b*a*b^23)^3 ],
        subgroups     := [
            rec(
                generators := [ a*b*b*a^2*b*b*a^2*b^23*a,
			        b^2*a*b*a^2*b^23*a*b ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ b^23*a*b*a^2*b^2*a*b*a, a*b*a^2*b^69*a ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## SL( 2, 13 )  2184
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2184,
        grouptype     := [  ],
        generatortype := [ [ 7, 156, 3, 156, 468, 0 ],
                           [ 4,   7, 2, 182, 182, 0 ] ],
        relations     := [ a^7, b^4, (a^2*b)^3, a*b^2/(b^2*a),
			   (a*b)^6/b^2 ],
        antirelations := [ b^2 ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## PSL( 2, 17 )  2448
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
	isSimple      := true,
        size          := 2448,
        grouptype     := [  ],
        generatortype := [ [ 9, 272, 3, 272, 816, 0 ],
                           [ 2,   9, 1, 153, 153, 0 ] ],
        relations     := [ a^9, b^2, (a^2*b)^3, (a*b)^4 ],
        antirelations := [  ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## A_7
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2520,
        grouptype     := [],
        generatortype := [ [ 4, 630, 1, 630, 630, 0 ],
                           [ 2,   4, 1, 105, 105, 0 ] ],
        relations     := [ a^4, b^2, (b*a)^7, (b*a^3*b*a)^5, (b*a^2)^6,
                             ((b*a)^2*a)^4, ((b*a)^2*a*b*a^3)^3 ],
        antirelations := [],
        subgroups     := [
            rec(
                generators := [ a^2, (b*a^3)^2*b*a*b*a^3*b*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^2, b*a^3*b*a*b*a^3*b*a^3*b ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^2, (a*b*a^3*b)^2*a^2*b*a ],
                isPerfect  := true,
                size       := 168
            ),
            rec(
                generators := [ a^2, (b*a*b*a^3*b*a^3)^3*a ],
                isPerfect  := true,
                size       := 168
            ),
            rec(
                generators := [ (b*a^3*b*a)^2*b*a^3,
                                a*(b*a^3)^3*(b*a)^2*b*a^3 ],
                isPerfect  := true,
                size       := 360
            )
        ]
    ),

    #########################################################################
    ##
    ## 2 nse 1344.1  2688.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2688,
        grouptype     := [ [ 1, 2, 15 ],
			   [ 4, 2,  8, 1 ] ],
        generatortype := [ [ 4, 168, 1, 168, 168, 168 ],
                           [ 3,   8, 2, 224, 224,   0 ] ],
        relations     := [ a^4, b^3, (a*b^2*a*a*b)^2/a^2,
		           (a*a*b^2*a*b)^2/(a*b^2)^7,
			   (b*a*b^2*a)^2/(a*b*a*b^2*a*b*a*b^2*a*a),
		           (a*b^2)^14, a*(a*b^2)^7/((a*b^2)^7*a),
	 		   b*(a*b^2)^7/((a*b^2)^7*b) ],
        antirelations := [ (a*b^2)^7, a^2*(a*b^2)^7 ],
        subgroups     := [
            rec(
                generators := [ b*(a*b^2*a)*b*(a*b^2*a)^5*b*a*b^2*a*b,
				((b*a*b^2*a)^2*a*b^2*a^3*b^2*a)^7 ],
                isPerfect  := true,
                size       := 336
            ),
            rec(
                generators := [ ((b*a)^2*a^2*b)^7, b*a*b^2*a^3 ],
                isPerfect  := true,
                size       := 336
            )
        ]
    ),

    #########################################################################
    ##
    ## 2 nse 1344.2  2688.2
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2688,
        grouptype     := [ [ 1, 2, 15 ],
                           [ 4, 2,  8, 7 ] ],
        generatortype := [ [ 4, 168, 1, 168, 168, 168 ],
                           [ 3,   8, 2, 224, 224,   0 ] ],
        relations     := [ a^4, b^3, (b*a)^7/a^2, ((a*b)^2*b)^8,
			   b*a^2/(a^2*b), b^2*a*(b^2*a*b*a*b*a)^2*b^2*a*b/
			   (a*b^2*a*(b^2*a*b*a*b*a)^2*b^2*a*b*a) ],
        antirelations := [ a^2, (b*a*b^2*a)^4*a^2 ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## 2^4 se PSL( 2, 7 )  2688.3
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 2688,
        grouptype     := [ [ 1, 2, 99 ] ],
        generatortype := [ [ 3, 224, 1, 224, 224,  0 ],
                           [ 4,   6, 2, 168, 168, 84 ] ],
        relations     := [ a^3, b^4, (b*a^2)^7, (b*b*a^2*b*a)^2,
			   (a*b*a^2*b)^2/
			   (b*a*b*a^2*b*a*b*a^2*b*b*(b*a^2*b*b*a)^2*b^2),
			   ((b*a^2*b*b*a)^2*b^2)^2, a*(b*a^2*b*b*a)^2*b^2/
		           ((b*a^2*b*b*a)^2*b^2*a), b*(b*a^2*b*b*a)^2*b^2/
       		  	   ((b*a^2*b*b*a)^2*b^2*b) ],
        antirelations := [ (b*a^2*b*b*a)^2*b^2 ],
        subgroups     := [
            rec(
                generators := [ b*b*a^2*b*a, a*b^3*a*b*a^2*b*a*b*a^2*b*a*b ],
                isSimple   := true,
                isPerfect  := true,
                size       := 168
            ),
            rec(
                generators := [ a*a*b*a^2*b^3*a^2, a*b*a^2*b^3 ],
                isPerfect  := true,
                size       := 336
            )
        ]
    ),

    ########################################################################
    ##
    ## ASL(2,5) 3000
    ##
    rec(
        generators     := [ a, b ],
        isPerfect      := true,
        size	      := 3000,
        grouptype      := [],
        generatortype  := [ [ 5, 120, 4, 120, 480, 144 ],
	 		    [ 3,  25, 2, 500, 500,   0 ] ],
        relations      := [ a^5, b^3, (a*b^2)^4,
			    (a^2*b^2)^2*a*b/(a*b^2*a*b*a*b^2*a^2) ],
        antirelations  := [ (a*b^2)^2*b ],
        subgroups      := [
	    rec(
	        generators := [ (a*b^2)^3, a*(a*b^2)^3*b*a*b*(a*b^2)^3*b*a ],
	        isPerfect  := true,
	        size       := 120
	    )
        ]
    ),

    #########################################################################
    ##
    ## PSL( 2, 19 )  3420
    ##
    rec(
        generators    := [ a, b ],
	isSimple      := true,
        isPerfect     := true,
        size          := 3420,
        grouptype     := [  ],
        generatortype := [ [ 9, 380, 3, 380, 1140, 0 ],
                           [ 2,   9, 1, 171,  171, 0 ] ],
        relations     := [ a^9, b^2, (a*b)^5, (a^8*b*a*b)^2 ],
        antirelations := [  ],
        subgroups     := [
            rec(
                generators := [ b, (b*a^3)^3*a^4 ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ b, (a^3*b*a)^2*a^6*b ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## A5xA5 3600
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3600,
        grouptype     := [],
        generatortype := [ [ 6, 300, 1, 300, 600, 0 ],
                           [ 6,  12, 1, 300, 600, 0 ] ],
        relations     := [ a^6, b^6, Comm(a^2,b^2), (b*a)^5,
                           b^3*a^5*b^2*a^4*b*a^3, (b*a^5)^5,
                           (b*a)^3*a^2/(b^3*(b*a^5)^3) ],
        antirelations := [ a^2, a^3 ],
        subgroups     := [
            rec(
                generators := [ a^3, b^4 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ b^3, a^4 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ a*b*a^2*b^2, a^2*b^2 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ a*b*a^2*b^2, a^2*b*a*(b*a^5)^3*a^5 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.1
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 63 ],
                           [ 3, 4, 60, 0 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 4,   3, 2, 120, 960, 0 ] ],
        relations     := [ a^3, b^4, (b*a)^5, (a*b^3)^5/(b^2*a)^3,
                           (b^2*a)^6, Comm(a,(b^2*a)^3), Comm(b,(b^2*a)^3) ],
        antirelations := [ (b^2*a)^3, (a*b*a*b^3*a*b*a^2*b)^2,
                           (a*b*a*b^3*a*b*a^2*b)^2/(b^2*a)^3 ],
        subgroups     := [
            rec(
                generators := [ b^2*a^2*b*a*b, a*b^2*a^2*b^3*a*b^3*a^2 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ b^3*a^2*b^3*a*b^2,
 			        (a*b)^2*(a^2*b*a^2*b^3)^2*a ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a^2*b*a^2*b^3*a*b*a*b^3*a*b*a,
				b*a^2*b^3*a*b*a*b^3*a*b ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ b*a*b*a^2*b^3*(a^2*b)^2,
			        a^2*b^3*a*b*a*b^3*a*b*a ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.2
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 303 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 4,   3, 2, 120, 720, 0 ] ],
        relations     := [ a^3, b^4, (b*a)^10, (b*b*a)^6,
                           a*(b*b*a)^3/((b*b*a)^3*a),
                           b*(b*b*a)^3/((b*b*a)^3*b), (b^3*a)^5,
                           ((b*a)^2*b^2*(b*a)^2*a)^2 ],
        antirelations := [ (b*a)^5, (b*b*a)^3, (b*b*a)^3/(b*a)^5 ],
        subgroups     := [
            rec(
                generators := [ (b*a)^2*b^2*(b*a)^2*a, (a*b*a)^4*b*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (b^2*a^2*b)^2*b^2*a*b*a, (a*b*a)^4*b*a ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (a^2*b)^2*b*a*b^3*a*b, a^2 ],
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (a*b)^2*a*(a*b)^2*b^2, a^2 ],
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.3
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 63 ],
                           [ 3, 4, 60, 4 ] ],
        generatortype := [ [ 4, 120, 2, 120, 720, 240 ],
                           [ 3,   8, 2, 320, 320,   0 ] ],
        relations     := [ a^4, b^3, (a*b)^5, (a^2*b)^3, (b*a^3)^10,
                           Comm(a,(b*a^3)^5), Comm(b,(b*a^3)^5) ],
        antirelations := [ (b*a^3)^5, (a*b*a*b*a^3*b*a*b^2)^2,
                           (a*b*a*b*a^3*b*a*b^2)^2/(b*a^3)^5 ],
        subgroups     := [
            rec(
                generators := [ a^3*b^2*a*b^2*a^3*b^2*a*b*a^3*b^2*a^3*b^2,
                                a*b^2*a*b*a^3*b*a*b*a ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ b*a*b*a*b^2*a^3*b*a*b*a^3*b*a,
                                a*b*a*b*a^3*b*a*b*a*b^2*a ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a^3*b*a*b*a^3*b*a*b^2*a^3,
                                b*a^3*b*a*b*a^3*b*a*b^2*a^3*b^2 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a^2*(b*a^3)^3*b^2,
                                b*a*b*a^3*b*(b*a^3*b^2*a*b)^2 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.4
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 31 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 8,   6, 4, 120, 960, 0 ] ],
        relations     := [ a^3, b^8, (b*a)^5, (a^2*b^2*a*b)^2*b^2,
                           b^4*a/(a*b^4) ],
        antirelations := [ b^4 ],
        subgroups     := []
    ),

    #########################################################################
    ##
    ## 3840.5
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 23 ] ],
        generatortype := [ [ 8, 240, 2, 240, 480, 0 ],
                           [ 3,   4, 2,  80,  80, 0 ] ],
        relations     := [ a^8, b^3, (a*b)^10, a*(a*b)^5/((a*b)^5*a),
                           b*(a*b)^5/((a*b)^5*b), b*a^4/(a^4*b),
                           (a^3*b)^5/a^4, ((b*a)^2*a*b)^2/(a*b)^5 ],
        antirelations := [ (a*b)^5, a^4, (a*b)^5/a^4 ],
        subgroups     := [
            rec(
                generators := [ (b*a*b)^4*(a*b)^5, b*a^7*b*a*b*a^7*b^2 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.6
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 151 ],
                           [ 3, 4, 60, 4 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 8,   3, 4, 240, 480, 0 ] ],
        relations     := [ a^3, b^8, b^4/(b*a)^10, Comm(a,(b*a)^10),
                           (b*b*a)^3, (b^3*a)^5, ((b*a)^2*b^3*a*b*a^2)^2 ],
        antirelations := [ (b*a)^10 ],
        subgroups     := [
            rec(
                generators := [ (b*a)^2*b^3*a*b*a^2, b^2*a ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (b*a)^2*b^3*a*b*a^2,
				 b^2*a^2*(b*a)^2*b^2*(b*a)^10 ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (b*a)^4*a*b^3, (a*b)^2*b*(b*a)^10 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ (b*a)^17*a*(b*a)^10, b^2*a^2*b*a^2*b^2*a ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## 3840.7
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 3840,
        grouptype     := [ [ 1, 2, 151 ],
                           [ 3, 4, 60, 0 ] ],
        generatortype := [ [ 3, 320, 1, 320, 320, 0 ],
                           [ 8,   3, 4, 240, 480, 0 ] ],
        relations     := [ a^3, b^8, Comm(a,(b*a)^10), b^4/(b*a)^10,
                           (b^2*a)^3/(b*a)^10, (b^3*a)^5,
                           ((b*a)^2*b^3*a*b*a^2)^2/(b*a)^10 ],
        antirelations := [ (b*a)^10 ],
        subgroups     := [
            rec(
                generators := [ (b*a)^2*((b*a)^10*b^3*a*a)^2*b,
                                 b^4*a*((b*a)^10*b^3*a*a)^2 ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ (b*a)^2*((b*a)^10*b^3*a*a)^2*b,
                                a*b*a^2*(b*a)^10*b^3*a*a ],
		isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^2*b*a^2*(b*a)^10*b^3*a^2*b*a*b^2,
                                a*b*a^2*((b*a)^10*b^3*a*a)^2 ],
                isPerfect  := true,
                size       := 120
            ),
            rec(
                generators := [ a^2*b*b*a^2*((b*a)^10*b^3*a*a)^3,
                                a^2*b*b*a^2*(b*a)^10*b^3*a^4 ],
                isPerfect  := true,
                size       := 120
            )
        ]
    ),

    #########################################################################
    ##
    ## PSL( 2, 16 )  4080
    ##
    rec(
        generators    := [ a, b ],
	isSimple      := true,
        isPerfect     := true,
        size          := 4080,
        grouptype     := [  ],
        generatortype := [ [ 15, 272, 4, 272, 1088, 0 ],
                           [  3,  15, 2, 272,  272, 0 ] ],
        relations     := [ a^15, b^3, (a^7*b)^2, (a^11*(a*b)^2)^2,
		  	   (a^7*(a*b)^9)^2 ],
        antirelations := [  ],
        subgroups     := [
            rec(
                generators := [ a^5*b*a^2*(a*b)^16*b, (a^4*b*a^2*b)^2 ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 3^4 se A_5  4860
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 4860,
        grouptype     := [ [ 1, 3, 620 ] ],
        generatortype := [ [ 6, 270, 2, 270, 810, 270 ],
                           [ 3,  18, 2, 180, 540,  80 ] ],
        relations     := [ a^6, b^3, (a*b)^5, (a*b^2)^5, b*a^2*b*b*a^2/
		           ((a^2*b)^2*b), a^2*b*a*a^4*b*a*b^2*a^4*b*a/
			   (b*a*b) ],
        antirelations := [ a^2 ],
        subgroups     := [
            rec(
                generators := [ a^3, b^2 ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            ),
            rec(
                generators := [ a^3, (b*a)^3*a^2*b ],
	        isSimple   := true,
                isPerfect  := true,
                size       := 60
            )
        ]
    ),

    #########################################################################
    ##
    ## 3^4 nse A_5  4860
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 4860,
        grouptype     := [ [ 1, 3, 80 ] ],
        generatortype := [ [ 9, 180, 6, 180, 1620, 0 ],
                           [ 2,  27, 1, 135,  135, 0 ] ],
        relations     := [ a^9, b^2, (a*b)^5, (a*a*b)^5, (a^2*a*b)^2/
	    	  	   (b*a^3)^2, (a^4*b*(a*b)^2*a*a*b)^2/a^6 ],
        antirelations := [ a^3 ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## SL( 2, 17 )  4896
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        size          := 4896,
        grouptype     := [  ],
        generatortype := [ [ 9, 272, 3, 272, 816, 0 ],
                           [ 4,   9, 2, 306, 306, 0 ] ],
        relations     := [ a^9, b^4, (a^2*b)^3, Comm(a,b^2), (a*b)^4/b^2 ],
        antirelations := [ b^2 ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## PSL( 3, 3 )  5616
    ##
    rec(
        generators    := [ a, b ],
	isSimple      := true,
        isPerfect     := true,
        size          := 5616,
        grouptype     := [  ],
        generatortype := [ [ 6, 936, 1, 936, 936,   0 ],
                           [ 3,   6, 2, 624, 624, 104 ] ],
        relations     := [ a^6, b^3, (a*b)^4, (a^2*b)^4, (a^3*b)^3,
			   Comm((b*a^2*b)^2,a^2) ],
        antirelations := [  ],
        subgroups     := [  ]
    ),

    #########################################################################
    ##
    ## M_11  7920
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 7920,
        grouptype     := [],
        generatortype := [ [ 11, 720, 2, 720, 1440, 0 ],
                           [  4,  11, 2, 990,  990, 0 ] ],
        relations     := [ a^11, b^4, (a*b)^3,
                           (b^2*a^5*b^2*a^4*b^2*a^5)^5,
                           (a*(b^2*a^5*b^2*a^4*b^2*a^5))
                            /((b^2*a^5*b^2*a^4*b^2*a^5)*a^4),
                           ((b^2*a^5*b^2*a^4*b^2*a^5)*b)
                            /(b*(b^2*a^5*b^2*a^4*b^2*a^5)^2) ],
        antirelations := [],
        subgroups     := [
            rec(
                generators := [ b^2, a^5*b^2*a^3 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ b^2, a^2*(b^2*a^5*b^2*a^4*b^2*a^5)*b^2*a*
				(b^2*a^5*b^2*a^4*b^2*a^5)*a^2 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ (b^2*a^5*b^2*a^4*b^2*a^5)^2,
                                b*a^2*(b^2*a^5*b^2*a^4*b^2*a^5)^2*b*a*
				(b^2*a^5*b^2*a^4*b^2*a^5)*a ],
                isPerfect  := true,
                isSimple   := true,
                size       := 360
            ),
            rec(
                generators := [ a, b^2 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 660
            )
        ]
    ),

    #########################################################################
    ##
    ## A_8
    ##
    rec(
        generators    := [ a, b ],
        isPerfect     := true,
        isSimple      := true,
        size          := 20160,
        grouptype     := [],
        generatortype := [ [ 6, 3360, 1, 3360, 3360, 1680 ],
                           [ 3,    6, 2,  112,  112,    0 ] ],
        relations     := [ a^6, b^3, (a*b)^7, (b^2*(a^5)*b*a)^2,
                           (b*(a^5)^2*b*a^2)^2, (b^2*(a^3)*b*(a^3))^2 ],
        antirelations := [],
        subgroups     := [
            rec(
                generators := [ b*a^2*b*(a^3)*b*a,
				(a^3)*a^2*b*(a^3)*b*(a^3)*b^2*a*b ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ (b^2*a^2*b*a)^2*b,
				 a*b*a^2*b^2*a^2*b*a^2*b*a*b^2 ],
                isPerfect  := true,
                isSimple   := true,
                size       := 60
            ),
            rec(
                generators := [ b*(a^3)*b*(a^3)*b*a*b*a*b*a^2,
				b*(a^3)*a^2*b*a*b*(a^3)*b^2*a*b ],
                isPerfect  := true,	
                isSimple   := true,
                size       := 168
            ),
            rec(
                generators := [ (a^3)*a^2*b*a*b*(a^3)*b*a*b*a*b,
				 a*b*a^2*b^2*a*b*a*b*a^2*b ],
                isPerfect  := true,
                isSimple   := true,
                size       := 168
            ),
            rec(
                generators := [ b^2*(a^3)*b*a*b*a*b*a^2,
				a^2*b*a*b*(a^3)*b*a^2*b*a ],
                isPerfect  := true,
                isSimple   := true,
                size       := 168
            ),
            rec(
                generators := [ a*b*a*b^2*a*b*a^2*b*a^2*b^2*a*b,
				(a^2*b)^3*(a^3)*b*(a^3) ],
                isPerfect  := true,
                isSimple   := true,
                size       := 360
            ),
            rec(
                generators := [ b*a*b^2*a*b*a*b*a^2*b,
				b*(a^3)*a^2*b*a*b*a*b^2*a^2 ],
                isPerfect  := true,
                size       := 1344
            ),
            rec(
                generators := [ b*(a^3)*a*b*a*b*(a^3)*b*a^2,
				(a*b)^3*a^2*b^2*a*b*(a^3)*a*b,
                                b*a*b*a*b^2*a*b*a^2*b^2 ],
                isPerfect  := true,
                size       := 1344
            ),
            rec(
                generators := [ a*b*a*b*(a^3)*a^2*b, b ],
                isPerfect  := true,
                isSimple   := true,
                size       := 2520
            )
        ]
    )
];


#############################################################################
##
## ReBind the old values of a and b
##

if IsBound( PerfCat_a ) then  a := PerfCat_a;  else  Unbind( a );  fi;
if IsBound( PerfCat_b ) then  b := PerfCat_b;  else  Unbind( b );  fi;


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
