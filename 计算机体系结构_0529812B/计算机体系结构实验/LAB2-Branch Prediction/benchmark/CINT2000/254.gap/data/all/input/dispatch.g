#############################################################################
##
#A  dispatch.g                  GAP library                     Thomas Breuer
##
#A  @(#)$Id: dispatch.g,v 3.5.1.2 1995/12/05 10:31:27 sam Rel $
##
#Y  Copyright 1990-2900,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains dispatchers of the following two types.
##
##  The first expect exactly one argument, a record, and return
##  the corresponding record component.
##  If necessary this component is computed using the
##  corresponding function in the operations record of the argument, and
##  stored in the argument.  They perform no additional checks.
##
##  The second expect either a matrix or a record.
##  In case of a record the same holds as for the dispatchers of first type,
##  in case of a matrix the function with name extension 'Mat' is called.
##  
##  This file was partially produced using the following function.
##
##  PrintDispatcher := function( name )
##  
##      local alp,
##            ALP,
##            pos,
##            nname,
##            i;
##  
##      alp:= "abcdefghijklmnopqrstuvwxyz";
##      ALP:= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
##  
##      pos:= Position( ALP, name[1] );
##      if pos = false then
##        Error( "<name> must begin with a capital letter" );
##      fi;
##      nname:= Copy( name );
##      nname[1]:= alp[ pos ];
##  
##      for i in [ 1 .. 78 ] do Print( "#" ); od;
##      Print(
##        "##\n",
##        "#F  ", name, "( <struct> )\n",
##        "##\n",
##        name, " := function( struct )\n",
##        "    if not IsRec( struct ) then\n",
##        "      Error( \"<struct> must be a record\" );\n",
##        "    fi;\n",
##        "    if not IsBound( struct.", nname, " ) then\n",
##        "      if not IsBound( struct.operations ) then\n",
##        "        Error( \"<struct> must have 'operations' entry\" );\n",
##        "      fi;\n",
##        "      struct.", nname, ":=\n",
##        "          struct.operations.", name, "( struct );\n",
##        "    fi;\n",
##        "    return struct.", nname, ";\n",
##        "    end;\n",
##        "\n" );
##      end;
##
#H  $Log: dispatch.g,v $
#H  Revision 3.5.1.2  1995/12/05  10:31:27  sam
#H  'SylowSystem' does no longer store its result in the group record
#H
#H  Revision 3.5.1.1  1994/10/26  16:18:25  ahulpke
#H  Added 'AutomorphismGroup'
#H
#H  Revision 3.5  1994/06/18  13:02:48  sam
#H  added bad hack in 'Base'
#H
#H  Revision 3.4  1994/06/17  11:12:14  sam
#H  fixed 'Centralizer'
#H
#H  Revision 3.3  1994/06/15  12:49:59  sam
#H  fixed 'Components'
#H
#H  Revision 3.2  1994/06/15  12:35:23  sam
#H  added 'Components'
#H
#H  Revision 3.1  1994/05/19  13:12:28  sam
#H  added several dispatchers
#H
#H  Revision 3.0  1993/12/09  11:05:31  sam
#H  Initial revision under RCS
#H
##

##############################################################################
##
#F  AbelianInvariants( <struct> )
##
AbelianInvariants := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.abelianInvariants ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.abelianInvariants:=
          struct.operations.AbelianInvariants( struct );
    fi;
    return struct.abelianInvariants;
    end;

##############################################################################
##
#F  AbsoluteIrreducibilityTest( <struct> )
##
AbsoluteIrreducibilityTest := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.absoluteIrreducibilityTest ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.absoluteIrreducibilityTest:=
          struct.operations.AbsoluteIrreducibilityTest( struct );
    fi;
    return struct.absoluteIrreducibilityTest;
    end;

##############################################################################
##
#F  AsRing( <struct> )
##
AsRing := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.asRing ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.asRing:=
          struct.operations.AsRing( struct );
    fi;
    return struct.asRing;
    end;

#############################################################################
##
#F  AutomorphismGroup( <struct> )
##
AutomorphismGroup := function ( struct )
local d;
    if not IsRec( struct ) then
      d:=Domain([struct]);
      if IsBound(d.operations.AutomorphismGroup) then
        return d.operations.AutomorphismGroup(struct);
      else
	Error("sorry, don't know how to compute the automorphism group");
      fi;
    fi;
    if not IsBound(struct.automorphismGroup)  then
        if not IsBound(struct.operations)  then
            Error( "<struct> must have 'operations' entry" );
        elif IsBound(struct.operations.AutomorphismGroup)  then
            struct.automorphismGroup :=
	           struct.operations.AutomorphismGroup(struct);
        else
	  Error("sorry, don't know how to compute the automorphism group");
        fi;
    fi;
    return struct.automorphismGroup;

end;

##############################################################################
##
#F  AsVectorSpace( <struct> )
##
AsVectorSpace := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.asVectorSpace ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.asVectorSpace:=
          struct.operations.AsVectorSpace( struct );
    fi;
    return struct.asVectorSpace;
    end;

##############################################################################
##
#F  CanonicalBasis( <struct> )
##
CanonicalBasis := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.canonicalBasis ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.canonicalBasis:=
          struct.operations.CanonicalBasis( struct );
    fi;
    return struct.canonicalBasis;
    end;

##############################################################################
##
#F  CanonicalRepresentative( <struct> )
##
CanonicalRepresentative := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.canonicalRepresentative ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.canonicalRepresentative:=
          struct.operations.CanonicalRepresentative( struct );
    fi;
    return struct.canonicalRepresentative;
    end;

##############################################################################
##
#F  Centre( <struct> )
##
Centre := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.centre ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.centre:=
          struct.operations.Centre( struct );
    fi;
    return struct.centre;
    end;

##############################################################################
##
#F  CharacterDegrees( <struct> )
##
CharacterDegrees := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.characterDegrees ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.characterDegrees:=
          struct.operations.CharacterDegrees( struct );
    fi;
    return struct.characterDegrees;
    end;

##############################################################################
##
#F  ChiefSeries( <struct> )
##
ChiefSeries := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.chiefSeries ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.chiefSeries:=
          struct.operations.ChiefSeries( struct );
    fi;
    return struct.chiefSeries;
    end;

##############################################################################
##
#F  CommutatorFactorGroup( <struct> )
##
CommutatorFactorGroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.commutatorFactorGroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.commutatorFactorGroup:=
          struct.operations.CommutatorFactorGroup( struct );
    fi;
    return struct.commutatorFactorGroup;
    end;

##############################################################################
##
#F  CompositionFactors( <struct> )
##
CompositionFactors := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.compositionFactors ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.compositionFactors:=
          struct.operations.CompositionFactors( struct );
    fi;
    return struct.compositionFactors;
    end;

##############################################################################
##
#F  CompositionSeries( <struct> )
##
CompositionSeries := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.compositionSeries ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.compositionSeries:=
          struct.operations.CompositionSeries( struct );
    fi;
    return struct.compositionSeries;
    end;

##############################################################################
##
#F  ConjugacyClasses( <struct> )
##
ConjugacyClasses := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.conjugacyClasses ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.conjugacyClasses:=
          struct.operations.ConjugacyClasses( struct );
    fi;
    return struct.conjugacyClasses;
    end;

##############################################################################
##
#F  ConjugacyClassesPerfectSubgroups( <struct> )
##
ConjugacyClassesPerfectSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.conjugacyClassesPerfectSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.conjugacyClassesPerfectSubgroups:=
          struct.operations.ConjugacyClassesPerfectSubgroups( struct );
    fi;
    return struct.conjugacyClassesPerfectSubgroups;
    end;

##############################################################################
##
#F  ConjugacyClassesSubgroups( <struct> )
##
ConjugacyClassesSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.conjugacyClassesSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.conjugacyClassesSubgroups:=
          struct.operations.ConjugacyClassesSubgroups( struct );
    fi;
    return struct.conjugacyClassesSubgroups;
    end;

##############################################################################
##
#F  Constituents( <struct> )
##
Constituents := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.constituents ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.constituents:=
          struct.operations.Constituents( struct );
    fi;
    return struct.constituents;
    end;

##############################################################################
##
#F  DerivedSeries( <struct> )
##
DerivedSeries := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.derivedSeries ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.derivedSeries:=
          struct.operations.DerivedSeries( struct );
    fi;
    return struct.derivedSeries;
    end;

##############################################################################
##
#F  DerivedSubgroup( <struct> )
##
DerivedSubgroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.derivedSubgroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.derivedSubgroup:=
          struct.operations.DerivedSubgroup( struct );
    fi;
    return struct.derivedSubgroup;
    end;

##############################################################################
##
#F  Dimension( <struct> )
##
Dimension := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.dimension ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.dimension:=
          struct.operations.Dimension( struct );
    fi;
    return struct.dimension;
    end;

##############################################################################
##
#F  Exponent( <struct> )
##
Exponent := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.exponent ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.exponent:=
          struct.operations.Exponent( struct );
    fi;
    return struct.exponent;
    end;

##############################################################################
##
#F  FittingSubgroup( <struct> )
##
FittingSubgroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.fittingSubgroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.fittingSubgroup:=
          struct.operations.FittingSubgroup( struct );
    fi;
    return struct.fittingSubgroup;
    end;

##############################################################################
##
#F  FpGroup( <struct> )
##
FpGroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.fpGroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.fpGroup:=
          struct.operations.FpGroup( struct );
    fi;
    return struct.fpGroup;
    end;

##############################################################################
##
#F  FrattiniSubgroup( <struct> )
##
FrattiniSubgroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.frattiniSubgroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.frattiniSubgroup:=
          struct.operations.FrattiniSubgroup( struct );
    fi;
    return struct.frattiniSubgroup;
    end;

##############################################################################
##
#F  GaloisGroup( <struct> )
##
GaloisGroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.galoisGroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.galoisGroup:=
          struct.operations.GaloisGroup( struct );
    fi;
    return struct.galoisGroup;
    end;

##############################################################################
##
#F  Generators( <struct> )
##
Generators := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.generators ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.generators:=
          struct.operations.Generators( struct );
    fi;
    return struct.generators;
    end;

##############################################################################
##
#F  IdentityMapping( <struct> )
##
IdentityMapping := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.identityMapping ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.identityMapping:=
          struct.operations.IdentityMapping( struct );
    fi;
    return struct.identityMapping;
    end;

##############################################################################
##
#F  InvariantSubspace( <struct> )
##
InvariantSubspace := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.invariantSubspace ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.invariantSubspace:=
          struct.operations.InvariantSubspace( struct );
    fi;
    return struct.invariantSubspace;
    end;

##############################################################################
##
#F  InverseMapping( <struct> )
##
InverseMapping := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.inverseMapping ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.inverseMapping:=
          struct.operations.InverseMapping( struct );
    fi;
    return struct.inverseMapping;
    end;

##############################################################################
##
#F  IrreducibilityTest( <struct> )
##
IrreducibilityTest := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.irreducibilityTest ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.irreducibilityTest:=
          struct.operations.IrreducibilityTest( struct );
    fi;
    return struct.irreducibilityTest;
    end;

##############################################################################
##
#F  IsAbelian( <struct> )
##
IsAbelian := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isAbelian ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isAbelian:=
          struct.operations.IsAbelian( struct );
    fi;
    return struct.isAbelian;
    end;

##############################################################################
##
#F  IsAutomorphism( <struct> )
##
IsAutomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isAutomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isAutomorphism:=
          struct.operations.IsAutomorphism( struct );
    fi;
    return struct.isAutomorphism;
    end;

##############################################################################
##
#F  IsBijection( <struct> )
##
IsBijection := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isBijection ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isBijection:=
          struct.operations.IsBijection( struct );
    fi;
    return struct.isBijection;
    end;

##############################################################################
##
#F  IsBijective( <struct> )
##
IsBijective := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isBijective ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isBijective:=
          struct.operations.IsBijective( struct );
    fi;
    return struct.isBijective;
    end;

##############################################################################
##
#F  IsCyclic( <struct> )
##
IsCyclic := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isCyclic ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isCyclic:=
          struct.operations.IsCyclic( struct );
    fi;
    return struct.isCyclic;
    end;

##############################################################################
##
#F  IsElementaryAbelian( <struct> )
##
IsElementaryAbelian := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isElementaryAbelian ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isElementaryAbelian:=
          struct.operations.IsElementaryAbelian( struct );
    fi;
    return struct.isElementaryAbelian;
    end;

##############################################################################
##
#F  IsEndomorphism( <struct> )
##
IsEndomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isEndomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isEndomorphism:=
          struct.operations.IsEndomorphism( struct );
    fi;
    return struct.isEndomorphism;
    end;

##############################################################################
##
#F  IsEpimorphism( <struct> )
##
IsEpimorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isEpimorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isEpimorphism:=
          struct.operations.IsEpimorphism( struct );
    fi;
    return struct.isEpimorphism;
    end;

##############################################################################
##
#F  IsFaithful( <struct> )
##
IsFaithful := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isFaithful ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isFaithful:=
          struct.operations.IsFaithful( struct );
    fi;
    return struct.isFaithful;
    end;

##############################################################################
##
#F  IsHomomorphism( <struct> )
##
IsHomomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isHomomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isHomomorphism:=
          struct.operations.IsHomomorphism( struct );
    fi;
    return struct.isHomomorphism;
    end;

##############################################################################
##
#F  IsInjective( <struct> )
##
IsInjective := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isInjective ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isInjective:=
          struct.operations.IsInjective( struct );
    fi;
    return struct.isInjective;
    end;

##############################################################################
##
#F  IsIsomorphism( <struct> )
##
IsIsomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isIsomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isIsomorphism:=
          struct.operations.IsIsomorphism( struct );
    fi;
    return struct.isIsomorphism;
    end;

##############################################################################
##
#F  IsMonomorphism( <struct> )
##
IsMonomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isMonomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isMonomorphism:=
          struct.operations.IsMonomorphism( struct );
    fi;
    return struct.isMonomorphism;
    end;

##############################################################################
##
#F  IsNilpotent( <struct> )
##
IsNilpotent := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isNilpotent ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isNilpotent:=
          struct.operations.IsNilpotent( struct );
    fi;
    return struct.isNilpotent;
    end;

##############################################################################
##
#F  IsNormalized( <struct> )
##
IsNormalized := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isNormalized ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isNormalized:=
          struct.operations.IsNormalized( struct );
    fi;
    return struct.isNormalized;
    end;

##############################################################################
##
#F  IsParent( <struct> )
##
IsParent := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isParent ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isParent:=
          struct.operations.IsParent( struct );
    fi;
    return struct.isParent;
    end;

##############################################################################
##
#F  IsPerfect( <struct> )
##
IsPerfect := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isPerfect ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isPerfect:=
          struct.operations.IsPerfect( struct );
    fi;
    return struct.isPerfect;
    end;

##############################################################################
##
#F  IsSimple( <struct> )
##
IsSimple := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isSimple ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isSimple:=
          struct.operations.IsSimple( struct );
    fi;
    return struct.isSimple;
    end;

##############################################################################
##
#F  IsSolvable( <struct> )
##
IsSolvable := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isSolvable ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isSolvable:=
          struct.operations.IsSolvable( struct );
    fi;
    return struct.isSolvable;
    end;

##############################################################################
##
#F  IsSurjective( <struct> )
##
IsSurjective := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isSurjective ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isSurjective:=
          struct.operations.IsSurjective( struct );
    fi;
    return struct.isSurjective;
    end;

##############################################################################
##
#F  IsTrivial( <struct> )
##
IsTrivial := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.isTrivial ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.isTrivial:=
          struct.operations.IsTrivial( struct );
    fi;
    return struct.isTrivial;
    end;

##############################################################################
##
#F  KernelGroupHomomorphism( <struct> )
##
KernelGroupHomomorphism := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.kernelGroupHomomorphism ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.kernelGroupHomomorphism:=
          struct.operations.KernelGroupHomomorphism( struct );
    fi;
    return struct.kernelGroupHomomorphism;
    end;

##############################################################################
##
#F  Lattice( <struct> )
##
Lattice := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.lattice ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.lattice:=
          struct.operations.Lattice( struct );
    fi;
    return struct.lattice;
    end;

##############################################################################
##
#F  LatticeSubgroups( <struct> )
##
LatticeSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.latticeSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.latticeSubgroups:=
          struct.operations.LatticeSubgroups( struct );
    fi;
    return struct.latticeSubgroups;
    end;

##############################################################################
##
#F  LowerCentralSeries( <struct> )
##
LowerCentralSeries := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.lowerCentralSeries ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.lowerCentralSeries:=
          struct.operations.LowerCentralSeries( struct );
    fi;
    return struct.lowerCentralSeries;
    end;

##############################################################################
##
#F  MaximalNormalSubgroups( <struct> )
##
MaximalNormalSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.maximalNormalSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.maximalNormalSubgroups:=
          struct.operations.MaximalNormalSubgroups( struct );
    fi;
    return struct.maximalNormalSubgroups;
    end;

##############################################################################
##
#F  MaximalElement( <struct> )
##
MaximalElement := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.maximalElement ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.maximalElement:=
          struct.operations.MaximalElement( struct );
    fi;
    return struct.maximalElement;
    end;

##############################################################################
##
#F  MinimalGeneratingSet( <struct> )
##
MinimalGeneratingSet := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.minimalGeneratingSet ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.minimalGeneratingSet:=
          struct.operations.MinimalGeneratingSet( struct );
    fi;
    return struct.minimalGeneratingSet;
    end;

##############################################################################
##
#F  NormalSubgroups( <struct> )
##
NormalSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.normalSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.normalSubgroups:=
          struct.operations.NormalSubgroups( struct );
    fi;
    return struct.normalSubgroups;
    end;

##############################################################################
##
#F  Normalized( <struct> )
##
Normalized := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.normalized ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.normalized:=
          struct.operations.Normalized( struct );
    fi;
    return struct.normalized;
    end;

##############################################################################
##
#F  Omega( <struct> )
##
Omega := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.omega ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.omega:=
          struct.operations.Omega( struct );
    fi;
    return struct.omega;
    end;

##############################################################################
##
#F  One( <struct> )
##
One := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.one ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.one:=
          struct.operations.One( struct );
    fi;
    return struct.one;
    end;

##############################################################################
##
#F  Radical( <struct> )
##
Radical := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.radical ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.radical:=
          struct.operations.Radical( struct );
    fi;
    return struct.radical;
    end;

##############################################################################
##
#F  RationalClasses( <struct> )
##
RationalClasses := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.rationalClasses ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.rationalClasses:=
          struct.operations.RationalClasses( struct );
    fi;
    return struct.rationalClasses;
    end;

##############################################################################
##
#F  Representative( <struct> )
##
Representative := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.representative ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.representative:=
          struct.operations.Representative( struct );
    fi;
    return struct.representative;
    end;

##############################################################################
##
#F  RepresentativesPerfectSubgroups( <struct> )
##
RepresentativesPerfectSubgroups := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.representativesPerfectSubgroups ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.representativesPerfectSubgroups:=
          struct.operations.RepresentativesPerfectSubgroups( struct );
    fi;
    return struct.representativesPerfectSubgroups;
    end;

##############################################################################
##
#F  SizesConjugacyClasses( <struct> )
##
SizesConjugacyClasses := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.sizesConjugacyClasses ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.sizesConjugacyClasses:=
          struct.operations.SizesConjugacyClasses( struct );
    fi;
    return struct.sizesConjugacyClasses;
    end;

##############################################################################
##
#F  SmallestGenerators( <struct> )
##
SmallestGenerators := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.smallestGenerators ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.smallestGenerators:=
          struct.operations.SmallestGenerators( struct );
    fi;
    return struct.smallestGenerators;
    end;

##############################################################################
##
#F  SupersolvableResiduum( <struct> )
##
SupersolvableResiduum := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.supersolvableResiduum ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.supersolvableResiduum:=
          struct.operations.SupersolvableResiduum( struct );
    fi;
    return struct.supersolvableResiduum;
    end;

##############################################################################
##
#F  SylowComplements( <struct> )
##
SylowComplements := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.sylowComplements ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.sylowComplements:=
          struct.operations.SylowComplements( struct );
    fi;
    return struct.sylowComplements;
    end;

##############################################################################
##
#F  SylowSystem( <struct> )
##
SylowSystem := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.operations ) then
      Error( "<struct> must have 'operations' entry" );
    fi;
    return struct.operations.SylowSystem( struct );
    end;

##############################################################################
##
#F  TrivialSubgroup( <struct> )
##
TrivialSubgroup := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.trivialSubgroup ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.trivialSubgroup:=
          struct.operations.TrivialSubgroup( struct );
    fi;
    return struct.trivialSubgroup;
    end;

##############################################################################
##
#F  UpperCentralSeries( <struct> )
##
UpperCentralSeries := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.upperCentralSeries ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.upperCentralSeries:=
          struct.operations.UpperCentralSeries( struct );
    fi;
    return struct.upperCentralSeries;
    end;

##############################################################################
##
#F  Zero( <struct> )
##
Zero := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.zero ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.zero:=
          struct.operations.Zero( struct );
    fi;
    return struct.zero;
    end;


##############################################################################
##
##  From here on the functions are dispatchers of the second type.
##

##############################################################################
##
#F  Determinant( <struct> )
##
Determinant := function( struct )
    if   IsMat( struct ) then
      return DeterminantMat( struct );
    elif IsRec( struct ) then
      if not IsBound( struct.determinant ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.determinant:=
            struct.operations.Determinant( struct );
      fi;
      return struct.determinant;
    else
      Error( "<struct> must be a matrix or a record" );
    fi;
    end;

##############################################################################
##
#F  Dimensions( <struct> )
##
Dimensions := function( struct )
    if   IsRec( struct ) then
      if not IsBound( struct.dimensions ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.dimensions:=
            struct.operations.Dimensions( struct );
      fi;
      return struct.dimensions;
    elif struct = [] then
      return [ 0, 0 ];
    elif     IsList( struct )
         and IsBound( struct[1] )
         and IsList( struct[1] ) then

      # Allow not only matrices but also lists of lists of matrices ...
      return [ Length( struct ), Length( struct[1] ) ];
    else
      Error( "<struct> must be a list of lists or a record" );
    fi;
    end;

##############################################################################
##
#F  Rank( <struct> )
##
Rank := function( struct )
    if   IsMat( struct ) then
      return RankMat( struct );
    elif IsRec( struct ) then
      if not IsBound( struct.rank ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.rank:=
            struct.operations.Rank( struct );
      fi;
      return struct.rank;
    else
      Error( "<struct> must be a matrix or a record" );
    fi;
    end;

##############################################################################
##
#F  Transposed( <struct> )
##
Transposed := function( struct )
    if   IsMat( struct ) then
      return TransposedMat( struct );
    elif IsRec( struct ) then
      if not IsBound( struct.transposed ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.transposed:=
            struct.operations.Transposed( struct );
      fi;
      return struct.transposed;
    else
      Error( "<struct> must be a matrix or a record" );
    fi;
    end;

##############################################################################
##
#F  IsMonomial( <struct> )
##
IsMonomial := function( struct )
    if IsRec( struct ) then
      if not IsBound( struct.isMonomial ) then
        if not IsBound( struct.operations ) then
          Error( "<struct> must have 'operations' entry" );
        fi;
        struct.isMonomial:=
            struct.operations.IsMonomial( struct );
      fi;
      return struct.isMonomial;
    else
      return Domain( [ struct ] ).operations.IsMonomial( struct );
    fi;
    end;

##############################################################################
##
##  From here on the functions are individual dispatchers.
##

##############################################################################
##
#F  Components( <struct> )
##
Components := function( arg )
    if not IsRec(arg[1])  then
        Error( "<struct> must be a record" );
    fi;
    if 1 = Length(arg)  then
        if not IsBound(arg[1].components)  then
    	    if not IsBound(arg[1].operations)  then
                Error( "<struct> must have 'operations' entry" );
            fi;
            arg[1].components := arg[1].operations.Components(arg[1]);
        fi;
        return arg[1].components;
    else
        if not IsBound(arg[1].operations)  then
            Error( "<struct> must have 'operations' entry" );
        fi;
        return ApplyFunc( arg[1].operations.Components, arg );
    fi;
end;

##############################################################################
##
#F  Basis( <struct> )
#F  Basis( <struct>, <vectors> )
##
Basis := function( arg )
    local struct;

    if Length( arg ) < 1 or Length( arg ) > 2 or not IsRec( arg[1] ) then
      Error( "usage: Basis( <struct> [, <vectors>] )" );
    fi;

    struct:= arg[1];
    if   Length( arg ) = 1 then
      if not IsBound( struct.basis ) then
        if not IsBound( struct.operations ) then
          Error( "first argument must have 'operations' entry" );
        fi;
        struct.basis:=
            struct.operations.Basis( struct );
      fi;
      return struct.basis;
    elif Length( arg ) = 2 then
      if not IsBound( struct.operations ) then
        Error( "first argument must have 'operations' entry" );
      fi;
      return struct.operations.Basis( struct, arg[2] );
    fi;
    end;

##############################################################################
##
#F  StandardBasis( <struct> )
#F  StandardBasis( <struct>, <seed> )
##
StandardBasis := function( arg )
    local struct;

    if Length( arg ) < 1 or Length( arg ) > 2 or not IsRec( arg[1] ) then
      Error( "usage: StandardBasis( <struct> [, <seed>] )" );
    fi;

    struct:= arg[1];
    if   Length( arg ) = 1 then
      if not IsBound( struct.standardBasis ) then
        if not IsBound( struct.operations ) then
          Error( "first argument must have 'operations' entry" );
        fi;
        struct.standardBasis:=
            struct.operations.StandardBasis( struct );
      fi;
      return struct.standardBasis;
    elif Length( arg ) = 2 then
      if not IsBound( struct.operations ) then
        Error( "first argument must have 'operations' entry" );
      fi;
      return struct.operations.StandardBasis( struct, arg[2] );
    fi;
    end;

##############################################################################
##
#F  Display( <obj> [,<arec>] )
##
Display := function( arg )

    if Length( arg ) = 1 then

      if not IsRec( arg[1] ) or not IsBound( arg[1].operations ) then
        Error( "<obj> must be a record with 'operations' entry" );
      fi;
      arg[1].operations.Display( arg[1], rec() );

    elif Length( arg ) = 2 then

      if not IsRec( arg[1] ) or not IsBound( arg[1].operations ) then
        Error( "<obj> must be a record with 'operations' entry" );
      fi;
      arg[1].operations.Display( arg[1], arg[2] );

    else
      Error( "usage: Display( <obj> [, <record>] )" );
    fi;
    end;

#############################################################################
##
#F  IsIrreducible( <obj> )
#F  IsIrreducible( [<R>,] <elm> )
##
##  irreducibility of characters, modules, representations,
##  irreducibility of ring elements
##
IsIrreducible := function( arg )
    local R, r;

    # get and check the arguments
    if   Length( arg ) = 1 then
      if IsRec( arg[1] ) then
        if not IsBound( arg[1].isIrreducible ) then
          if not IsBound( arg[1].operations ) then
            Error( "<struct> must have 'operations' entry" );
          fi;
          arg[1].isIrreducible:=
            arg[1].operations.IsIrreducible( arg[1] );
        fi;
        return arg[1].isIrreducible;
      else
        R:= DefaultRing( arg[1] );
        r:= arg[1];
      fi;
    elif Length(arg) = 2 then
      R:= arg[1];
      if not IsRing( R )  then
        Error( "<R> must be a ring" );
      fi;
      r:= arg[2];
      if not r in R then
        Error( "<r> must be an element of <R>" );
      fi;
    else
      Error( "usage: IsIrreducible( <struct> )",
             " resp. IsIrreducible( [<R>,] <r> )" );
    fi;

    # permform the test
    return R.operations.IsIrreducible( R, r );
    end;

#############################################################################
##
#F  IsEquivalent( <obj1>, <obj2> )
##
IsEquivalent := function( obj1, obj2 )
    return IsIdentical( obj1, obj2 ) or
           obj1.operations.IsEquivalent( obj1, obj2 );
    end;

#############################################################################
##
#F  Kernel( <obj> ) . . . . . . . kernel of a homomorphism, character, fusion
##
##  very preliminary .... (hopefully)
##
Kernel := function( obj )
    if not IsBound( obj.kernel )  then
      if IsBound( obj.operations.Kernel ) then
        obj.kernel:= obj.operations.Kernel( obj );
      else
        obj.kernel:= obj.source.operations.Kernel( obj );
      fi;
    fi;
    return obj.kernel;
    end;

#############################################################################
##
#F  FusionConjugacyClasses( <S>, <R> )
##
FusionConjugacyClasses := function( S, R )
    return S.operations.FusionConjugacyClasses( S, R );
    end;

#############################################################################
##
#F  KroneckerProduct(<obj1>,<obj2>) . . . .  Kronecker product of two objects
##
KroneckerProduct := function ( obj1, obj2 )
    local D;
    if IsMat( obj1 ) then
      if IsMat( obj2 ) then
        return MatricesOps.KroneckerProduct( obj1, obj2 );
      else
        return obj2.operations.KroneckerProduct( obj1, obj2 );
      fi;
    else
      return obj2.operations.KroneckerProduct( obj1, obj2 );
    fi;
    end;

#############################################################################
##
#F  Closure(<G>,<obj>)  . closure of struct with another struct or an element
##
#T  maybe the 'IsRec' calls should be replaced.
##
Closure := function ( G, obj )
    local   C;          # closure of <G> with <obj>, result

    # check the arguments
    if not IsRec( G )  then
      Error( "<G> must be a record" );
    elif not IsRec( obj ) and not obj in Parent( G )  then
      Error( "<obj> must be an element of the parent of <G>" );
    elif IsRec( obj ) and not obj in Parent( G )
                      and Parent( obj ) <> Parent( G ) then
      Error( "<obj> must be a substructure of the parent of <G>" );
    fi;

    # compute the closure
    C := G.operations.Closure( G, obj );

    # return the closure
    return C;
    end;

#############################################################################
##
#F  Centralizer( <G>, <obj> ) . . centralizer of a substructure or an element
##
Centralizer := function ( G, obj )
    local   C;          # centralizer of <obj> in <G>, result

    # check the arguments
    if not IsRec( G )  then
      Error( "<G> must be at least a record" );

#T What shall I do with this hack (invented by Alexander)?

    elif IsGroup( G ) and not IsGroup( obj ) and not obj in Parent( G )  then

	# centralizer for elements in not defined inifinite supergroup
	if IsBound(Domain([obj]).operations.Group)  # test for possible
	                                            # group object
	   and obj^0 in Parent(G) then
          C:=Stabilizer(G,obj,function(e,g) return e^g;end);
	  return C;
	else
	  Error( "<obj> must be an element of the parent of <G>" );
	fi;
    elif IsGroup( G ) and IsGroup( obj ) and Parent( obj ) <> Parent( G )  then
      if obj.identity=G.identity then
	# centralizer for subgroup of not defined inifinite supergroup
	return Intersection(List(obj.generators,i->Centralizer(G,i)));
      else
        Error( "<obj> must be a subgroup of the parent of <G>" );
      fi;
    fi;

#T end of the hack ...

    # compute the centralizer
    if IsGroup( obj ) and G = Parent( obj ) then
      if not IsBound( obj.centralizer ) then
        obj.centralizer:= G.operations.Centralizer( G, obj );
      fi;
      C:= obj.centralizer;
    else
      C:= G.operations.Centralizer( G, obj );
    fi;

    # return the centralizer
    return C;
    end;

#############################################################################
##
#F  IsCentral( <G>, <U> ) . . . test if a structure is centralized by another
##
IsCentral := function ( G, U )
    local   isCen;      # 'true' if <U> is central in <G>, result

    # check that the arguments are groups with a common parent
    if not IsRec( G )  then
        Error( "<G> must be a group" );
    elif not IsRec( U )  then
        Error( "<U> must be a group" );
    fi;

    # <U> and <G> must have a common parent
    Parent( G, U );

    # if <G> is the parent, use the entry '<U>.isCentral'
    if IsParent( G )  then
        if not IsBound( U.isCentral )  then
            U.isCentral := G.operations.IsCentral( G, U );
        fi;
        isCen := U.isCentral;

    # otherwise
    else
        if IsBound( U.isCentral ) and U.isCentral  then
            isCen := true;
        else
            isCen := G.operations.IsCentral( G, U );
        fi;
    fi;

    # return the result
    return isCen;
    end;

#############################################################################
##
#F  Base( <object> )  . . . . . . . . . . . . . . . . . . . base of an object
##
##  Determines  a base of an object by either returning a corresponding entry
##  in  the  domain record  or  by  calculating it, using the function in the
##  operations  record.  In the latter case the record field 'isComputedBase'
##  is set to (possibly) indicate special properties of the base.
##
Base := function( obj )
    local   base;

#T remove this bad hack as soon as 'Base' is for permutation groups only!
    if   IsPermGroup( obj ) then
      base:= obj.operations.Base( obj );
    elif IsRec( obj ) then
      if   IsBound( obj.base ) then
        base:= obj.base;
      elif IsBound( obj.operations.Base ) then
        obj.base:= obj.operations.Base( obj );
        obj.isComputedBase:= true;
        base:= obj.base;
      else
        Error( "sorry, can't compute a base for <object>" );
      fi;
    else
      base:= Domain( [ obj ] ).operations.Base( obj );
    fi;
    return base;
    end;

##############################################################################
##
#F  IsZero( <struct>, <obj> ) . . . . . . .  is an object the zero of a domain
##
IsZero := function( struct, obj )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if   IsBound( struct.zero ) then
      return obj = struct.zero;
    elif IsBound( struct.operations ) then
      return struct.operations.IsZero( struct, obj );
    else
      Error( "<struct> must have 'operations' entry" );
    fi;
    end;

##############################################################################
##
#F  Eigenvalues( <mat> )
#F  Eigenvalues( <classfun>, <class> )
#F  Eigenvalues( <tbl>, <charvals>, <class> )
#F  Eigenvalues( ... )
##
Eigenvalues := function( arg )
    if   Length( arg ) = 0 then
      Error( "need at least one argument" );
    elif Length( arg ) = 1 and IsMat( arg[1] ) then
      return Domain( arg ).operations.Eigenvalues( arg[1] );
    elif IsRec( arg[1] ) and Length( arg ) = 2 then
      return arg[1].operations.Eigenvalues( arg[1], arg[2] );
    elif IsRec( arg[1] ) and Length( arg ) = 3 then
      return arg[1].operations.Eigenvalues( arg[1], arg[2], arg[3] );
    else
      Error( "first argument must be matrix or record" );
    fi;
    end;

