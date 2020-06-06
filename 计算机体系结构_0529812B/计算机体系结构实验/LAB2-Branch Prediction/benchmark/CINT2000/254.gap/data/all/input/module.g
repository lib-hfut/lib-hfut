#############################################################################
##
#A  module.g                    GAP library                     Thomas Breuer
##
#A  @(#)$Id: module.g,v 3.0.1.1 1995/11/22 08:52:14 sam Rel $
##
#Y  Copyright 1990-1993,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##
##  This file contains functions for modules.
##
#H  $Log: module.g,v $
#H  Revision 3.0.1.1  1995/11/22  08:52:14  sam
#H  added 'SpinUpStandard'
#H
#H  Revision 3.0  1994/05/19  13:13:15  sam
#H  Initial Revision under RCS
#H
##

#############################################################################
##
#F  InfoModule( ... )
##
    if not IsBound( InfoModule ) then InfoModule := Ignore; fi;

#############################################################################
##
#F  IsModule( <obj> ) . . . . . . . . . . . . . test if an object is a module
##
IsModule := function( obj )
    return     IsRec( obj )
           and IsBound( obj.isModule )
           and obj.isModule;
    end;

#############################################################################
##
#F  IsFactorModule( <obj> ) . . . . . .  test if an object is a factor module
##
#T IsQuotientSpace ?
##
IsFactorModule := function( obj )
    return IsRec( obj ) and IsBound( obj.isFactorModule )
                        and obj.isFactorModule;
    end;

#############################################################################
##
#V  ModuleOps . . . . . . . . . . . . . . . . . operations record for modules
##
ModuleOps := OperationsRecord( "ModuleOps", RowSpaceOps );

#############################################################################
##
#F  ModuleOps.Print( <obj> )  . . . . . . . . . . . . . . . .  print a module
##
ModuleOps.Print := function( M )
    if IsBound( M.name ) then
        Print( M.name );
    elif IsBound( M.parent ) then
      Print( "Submodule( ", M.parent, ", ", M.generators, " )" );
    elif Dimensions( M.generators )[1] <> 0 then
      Print( "Module( ", M.ring, ", ", M.generators, " )" );
    else
      Print( "Module( ", M.ring, ", ", Zero( M ), " )" );
    fi;
    end;

#############################################################################
##
#F  ModuleOps.Zero( <M> )  . . . . . . . . . . . . . zero element of a module
##
ModuleOps.Zero := function( M )
    if Dimensions( M.generators )[1] = 0 then
      Error( "panic, module with empty generators list and without zero" );
    fi;
    return 0 * M.generators[1];
    end;

#############################################################################
##
#F  Module( <R>, <gens> ) . . . . . . . . . . . . . . . . . . create a module
#F  Module( <R>, <gens>, <zero> )
#F  Module( <R>, <gens>, "basis" )
##
##  This function creates a module as {\GAP} object with ring <R> acting
##  from the right.
##
Module := function( arg )

    local R,     # ring acting on the module
          gens,  # module generators
          zero;  # zero element of the module

    if   Length( arg ) < 2 or not IsRec( arg[1] )
       or not IsBound( arg[1].operations )
       or not IsBound( arg[1].operations.Module ) then

      Error( "usage: Module(<R>,<gens>[,<zero>]) ",
             " or Module(<R>,<gens>,\"basis\")" );

    elif Length( arg ) = 2 then

      # No zero element.
      R:=    arg[1];
      gens:= arg[2];
      return R.operations.Module( R, gens, R );

    elif Length( arg ) = 3 then

      # Zero element given explicitly.
      R    := arg[1];
      gens := arg[2];
      zero := arg[3];
      return R.operations.Module( R, gens, zero );

    fi;
    end;

##############################################################################
##
#F  NaturalModule( <struct> )
##
NaturalModule := function( struct )
    if not IsRec( struct ) then
      Error( "<struct> must be a record" );
    fi;
    if not IsBound( struct.naturalModule ) then
      if not IsBound( struct.operations ) then
        Error( "<struct> must have 'operations' entry" );
      fi;
      struct.naturalModule:=
          struct.operations.NaturalModule( struct );
    fi;
    return struct.naturalModule;
    end;

##############################################################################
##
#F  IsNaturalModule( <struct> )
##
IsNaturalModule := function( struct )
    return IsRec( struct ) and IsBound( struct.isNaturalModule )
                           and struct.isNaturalModule;
    end;

#############################################################################
##
#F  ModuleOps.\+( <M1>, <M2> )  . . . . . . . . . . . . . . .  sum of modules
##
ModuleOps.\+ := function ( M1, M2 )

    local S;          # sum of <M1> and <M2>, result

    if   IsModule( M1 ) and IsModule( M2 ) then

      # sum of two modules
      Parent( M1, M2 );

      if   Dimension( M1 ) = 0 then
        S:= M2;
      elif Dimension( M2 ) = 0 then
        S:= M2;
      else
        S:= Submodule( Parent( M1 ),
                    SumIntersectionMat( M1.generators, M2.generators )[1] );
      fi;

    elif IsModule( M1 ) and M2 in Parent( M1 )  then
      S:= ModuleCoset( M1, M2 );
    elif IsModule( M2 ) and M1 in Parent( M2 )  then
      S:= ModuleCoset( M2, M1 );
    elif IsModule( M1 ) then
      S:= List( Elements( M1 ), x -> x + M2 );
    elif IsModule( M2 ) then
      S:= List( Elements( M2 ), x -> M1 + x );
    else
      Error( "panic, neither <M1> nor <M2> is a module" );
    fi;
    return S;
    end;

#############################################################################
##
#F  ModuleOps.Intersection( <M1>, <M2> ) . . . .  intersection of two modules
##
##  or intersection of space and module
##
ModuleOps.Intersection := function( M1, M2 )

    local inters;

    inters:= SumIntersectionMat( Generators( M1 ), Generators( M1 ) )[2];
    if    not IsBound( Parent( M1 ).ring )
       or not IsBound( Parent( M2 ).ring )
       or Parent( M1 ).ring <> Parent( M2 ).ring then

      # Return the intersection as a space.
      if Length( inters ) > 0 then
        return RowSpace( M1.field, inters );
      else
        return RowSpace( M1.field, [], Zero( M1 ) );
      fi;

    elif Parent( M1 ) = Parent( M2 ) then

      # Return the intersection as a submodule.
      return Submodule( Parent( M1 ), inters );
#T store a basis, since the generators form one!

    else

      # Return a parent module.
      if Length( inters ) > 0 then
        return Module( M1.field, inters );
      else
        return Module( M1.field, [ Zero( M1 ) ] );
      fi;
#T store a basis, since the generators form one!
      
    fi;
    end;

#############################################################################
##
#F  Submodule( <M>, <obj> )
##
Submodule := function( M, obj )
    if IsRec( M ) and IsBound( M.operations.Submodule ) then
      return M.operations.Submodule( M, obj );
    else
      Error( "sorry, can't compute submodules for <M>" );
    fi;
    end;

#############################################################################
##
#F  ModuleOps.Submodule( <M>, <gens> ) 
##
ModuleOps.Submodule := function( M, gens )

    local S;

#T check whether the generators lie in the parent of M!

    S:= rec( isDomain   := true,
             isModule   := true,
             isRowSpace := true,

             parent     := Parent( M ),

             generators := gens,
             field      := M.field,

             operations := ModuleOps );

    return S;
    end;

#############################################################################
##
#F  AsModule( <M> )
##
AsModule := function( M )
    if IsRec( M ) and IsBound( M.operations.AsModule ) then
      return M.operations.AsModule( M );
    else
      Error( "sorry, can't regard <M> as a module" );
    fi;
    end;

#############################################################################
##
#F  AsSubmodule( <M>, <U> )
##
AsSubmodule := function( M, U )
    if IsRec( M ) and IsBound( M.operations.AsSubmodule ) then
      return M.operations.AsSubmodule( M, U );
    else
      Error( "sorry, can't regard <U> as submodule of <M>" );
    fi;
    end;

#############################################################################
##
#F  ModuleOps.AsModule( <M> )
##
ModuleOps.AsModule := function( M )
    if Length( Generators( M ) ) > 0 then
      return Module( Parent( M ).ring, Generators( M ) );
    else
      return Module( Parent( M ).ring, [], Zero( M ) );
    fi;
    end;

#############################################################################
##
#F  ModuleOps.AsSubmodule( <M>, <U> )
##
ModuleOps.AsSubmodule := function( M, U )
    local gens;
    gens:= Generators( U );
    if ForAny( gens, x -> not x in M ) then
      Error( "<U> is not contained in <M>" );
    fi;
    return Submodule( Parent( M ), gens );
    end;

#############################################################################
##
#F  ModuleOps.AsSpace( <M> )
##
ModuleOps.AsSpace := function( M )
    if Length( Basis( M ).vectors ) > 0 then
      return RowSpace( Parent( M ).ring.field, Basis( M ).vectors, "basis" );
    else
      return RowSpace( Parent( M ).ring.field, [], Zero( M ) );
    fi;
    end;

#############################################################################
##
#F  IsAbsolutelyIrreducible( <obj> )  . . . . . . . . .  test if an object is
#F                                                     absolutely irreducible
##
IsAbsolutelyIrreducible := function( obj )
    if not IsBound( obj.isAbsolutelyIrreducible ) then
      obj.isAbsolutelyIrreducible:=
                           obj.operations.IsAbsolutelyIrreducible( obj );
    fi;
    return obj.isAbsolutelyIrreducible;
    end;

#############################################################################
##
#F  ModuleOps.Generators( <M> ) . . . . . . . . . .  generators of module <M>
##
ModuleOps.Generators := function( M )

    if IsBound( M.isNaturalModule ) and M.isNaturalModule then

#T in NaturalModuleOps!
      # return the identity matrix
      return One( M.ring )^0;
    else
      Error( "sorry, don't know how to compute generators for module <M>" );
    fi;
    end;

#############################################################################
##
#V  StandardBasisModuleOps
##
##  Delegate the work to the known semi-echelonized basis.
##
StandardBasisModuleOps := OperationsRecord( "StandardBasisModuleOps",
                                            BasisRowSpaceOps );

#############################################################################
##
#F  StandardBasisModuleOps.Print( <obj> )
##
StandardBasisModuleOps.Print := function( obj )
    if   IsBound( obj.name ) then
      Print( obj.name );
    elif     IsBound( obj.structure.generators )
         and obj.seed = obj.structure.generators then
      Print( "StandardBasis( ", obj.structure, " )" );
    else
      Print( "StandardBasis( ", obj.structure, ", ", obj.vectors, " )" );
    fi;
    end;

#############################################################################
##
#F  ModuleOps.SemiEchelonBasis( <M> )
##
ModuleOps.SemiEchelonBasis := function( M )
    return StandardBasis( M ).semiEchelonBasis;
    end;

#############################################################################
##
#F  SpinUpStandard( <seed>, <gens> )
##
SpinUpStandard := function( seed, gens )

    local base,      # standard base
          ech,       # corresponding base in echelon form
          heads,     # info about leading columns
          zero,      # zero of the field
          dim,       # length of vectors
          ishead,    # 'true' at position 'i' if 'heads[i]' is bound
          i,         # loop over 'seed'
          j,         # loop over ...	
          seeddim,   # list of dimensions of modules generated by seed vectors
          localseed, # list of vectors to be processed for actual seed vector
          v,         # actual vector (reduced)
          orig,      # actual vector (not reduced)
          gen,       # one generator of 'M.ring'
          imv,       # image of the actual vector under a generator
          k;         # loop over 'ech'

    zero    := 0 * seed[1][1];
    dim     := Length( seed[1] );
    ishead  := BlistList( [ 1 .. dim ], [] );
    seeddim := [];
    base    := [];
    ech     := [];
    heads   := [];

    # Loop over the seed vectors.
    for i in [ 1 .. Length( seed ) ] do

      # Spin up the space generated by the seed vector.
      localseed:= [ seed[i] ];

      for v in localseed do

        v    := ShallowCopy( v );
        orig := ShallowCopy( v );

        # Reduce the vector with the basis vectors.
        for j in [ 1 .. dim ] do
          if ishead[j] then
            v:= v - v[j] * ech[ heads[j] ];
          fi;
        od;

        j:= DepthVector( v );
        if j <= dim then

          # We found a new basis vector.
          Add( base, orig );
          Add( ech, v / v[j] );
          ishead[j]:= true;
          heads[j]:= Length( ech );

          # Store the images under the generators in 'localseed'.
          for gen in gens do
            Add( localseed, orig * gen );
          od;

        fi;
      od;

      seeddim[i]:= Length( ech );
  
    od;
   
    # Return the description of the standard basis.
    return rec( vectors          := base,
                seed             := seed,
                seedDimensions   := seeddim,
                semiEchelonBasis := rec( vectors := ech,
                                         heads   := heads,
                                         ishead  := ishead ) );
    end;

#############################################################################
##
#F  ModuleOps.StandardBasis( <M> [, <seedvectors>] )
##
##  returns the standard basis of the module <M>.
##  When the vector <v> is processed, the generators of '<M>.ring' are
##  applied to <v> in turn, and if the image is linear independent of the
##  basis vectors found up to this time, it is added to the basis.
##
##  If no list <seedvectors> is given, '<M>.generators' is taken instead.
##  The function computes also a basis in semi-echelon form.
##
ModuleOps.StandardBasis := function( arg )

    local M,         # the module
          seed,      # list of seed vectors
          gens,      # generators of the acting ring
          stb;       # standard basis record, result

    # Check and get the arguments
    if Length( arg ) < 1 or Length( arg ) > 2 or not IsModule( arg[1] ) then
      Error( "usage: StandardBasis(<M>) resp. StandardBasis(<M>,<seedvecs>)" );
    fi;

    M:= arg[1];

    if Length( arg ) = 2 then
      seed:= arg[2];
      if Length( seed ) = 0 then
        Error( "need at least one seed vector" );
      fi;
    else
      if not IsBound( M.generators ) then
        Error( "no generators present" );
      fi;
      seed:= M.generators;
    fi;

    if Length( seed ) > 0 then

      gens:= Parent( M ).ring.generators;
      stb:= SpinUpStandard( seed, gens );
      stb.isBasis                          := true;
      stb.isStandardBasis                  := true;
      stb.structure                        := M;
      stb.operations                       := StandardBasisModuleOps;
      stb.semiEchelonBasis.isBasis         := true;
      stb.semiEchelonBasis.isStandardBasis := true;
      stb.semiEchelonBasis.structure       := M;
      stb.semiEchelonBasis.operations      := SemiEchelonBasisRowSpaceOps;

    else

      stb:= rec( vectors          := [],
                 seed             := seed,
                 seedDimensions   := [],
                 isBasis          := true,
                 isStandardBasis  := true,
                 structure        := M,
                 semiEchelonBasis := rec(
                         vectors            := [],
                         heads              := [],
                         ishead             := [],
                         isBasis            := true,
                         isSemiEchelonBasis := true,
                         structure          := M,
                         operations         := SemiEchelonBasisRowSpaceOps ),
                  operations       := StandardBasisModuleOps );

    fi;

    # Return the standard basis record.
    return stb;
    end;

#############################################################################
##
#F  ModuleOps.Base( <M> ) . . . . . . . . . . . vector space base of a module
##
#T Schnittstelle: wo werden generators benutzt (da unterscheide Modules
#T und spaces), wo kann ich einfach erben lassen?
##
#T n"otig?
#T rowsp. haben hier 'CanonicalBasis' ...
##
ModuleOps.Base := function( M )
    return Basis( M ).vectors;
    end;   

#############################################################################
##
#F  ModuleOps.Closure( <M>, <w> )
##
ModuleOps.Closure := function( M, w )

    local C,    # intermediate closure
          g,    # one generator of module 'w'
          v;    # sifted vector of 'w'

    if   IsParent( M ) then
      return M;

    elif IsModule( w ) then

      if IsBound( w.factorNum ) then
#T geh"ort in FactorModuleOps.Closure !

        if not IsBound( M.factorNum ) or w.factorNum <> M.factorNum then
          Error( "incompatible modules" );
        fi;
        C:= M.factorNum;
        for g in w.factorNum.generators do
          C:= Closure( C, g );
        od;
        M:= C / M.factorDen;

      else

        for g in w.generators do
          M:= Closure( M, g );
        od;

      fi;

    elif w in Parent( M ) and not w in M.generators then

      v:= SiftedVector( Basis( M ), w );
      if v <> Zero( M ) then

        # Construct the closure.
        M:= Submodule( Parent( M ), Concatenation( M.generators, [ w ] ) );

      fi;

    fi;
    return M;
    end;

#############################################################################
##
#F  OperationModule( <opalg> )
##
##  Let $A$ be an algebra acting on the module $M$, and <opalg> the matrix
##  algebra that describes the action, as can be computed using "Operation"
##  'Operation'.  Then 'OperationModule' returns the module for <opalg>
##  that is equivalent to $M$.
##  
OperationModule := function( opalg )

    local opmod;   # operation module, result

    # Construct the module for the image algebra.
    opmod:= NaturalModule( opalg );
    opmod.operation:= opalg.operation.moduleinfo;
    opmod.operation.structure:= opalg.operation.domain;

    # The source is a (quotient of a) free module.
    if not IsBound( opmod.operation.basisImage ) then
      opmod.operation.basisImage:= CanonicalBasis( opmod  );
      opmod.operation.alghom:=
          OperationHomomorphism( opalg.operation.structure, opalg );
    fi;

    # Return the operation module.
    return opmod;
    end;

#############################################################################
##
#V  OperationHomomorphismModuleOps
##
##  Computing *images* under a module homomorphism $\psi$ from $M_1$ to
##  $M_2$ requires either the knowledge of a vector space basis of $M_1$ and
##  of images under $\psi$, or $M_1$ must be a (quotient of a) free module,
##  and we have access to the algebra homomorphism.
##
##  In the first case we have the components 'basisSource' and
##  'imagesBasis'.
##  In the second case we have the components 'genimages' and 'alghom'.
##
##  Computing *preimages* under a module homomorphism $\psi$ from $M_1$ to
##  $M_2$ requires the knowledge of a vector space basis of $M_2$ and of
##  preimages under $\psi$.
##  
##  We have the components 'basisImage' and 'preimagesBasis'.
##
OperationHomomorphismModuleOps := OperationsRecord(
                                     "OperationHomomorphismModuleOps" ); #,
#T                                     ModuleHomomorphismOps );

#############################################################################
##
#F  OperationHomomorphismModuleOps.ImageElm( <hom>, <elm> )
##
##  Computing *images* under a module homomorphism $\psi$ from $M_1$ to
##  $M_2$ requires either the knowledge of a vector space basis of $M_1$ and
##  of images under $\psi$, or $M_1$ must be a (quotient of a) free module.
##
##  In the first case we need the components 'basisSource' and
##  'imagesBasis'.
##
OperationHomomorphismModuleOps.ImageElm := function( hom, elm )

    local coeff, im, i;

    im:= Zero( hom.range );

    if IsBound( hom.basisSource ) then

      coeff:= Coefficients( hom.basisSource, elm );
      for i in [ 1 .. Length( coeff ) ] do
        im:= im + coeff[i] * hom.imagesBasis[i];
      od;

    else

      # The source must be a quotient of a free module.
      if IsBound( hom.source.factorNum ) then
        elm:= elm.representative;
      fi;
      for i in [ 1 .. Length( elm ) ] do
        im:= im + hom.genimages[i] * Image( hom.alghom, elm[i] );
      od;

    fi;

    return im;
    end;

#############################################################################
##
#F  OperationHomomorphismModuleOps.ImagesElm( <hom>, <elm> )
##
OperationHomomorphismModuleOps.ImagesElm := function( hom, elm )
    return [ OperationHomomorphismModuleOps.ImageElm( hom, elm ) ];
    end;

#############################################################################
##
#F  OperationHomomorphismModuleOps.ImagesRepresentative( <hom>, <elm> )
##
OperationHomomorphismModuleOps.ImagesRepresentative :=
                              OperationHomomorphismModuleOps.ImageElm;

#############################################################################
##
#F  OperationHomomorphismModuleOps.PreImagesRepresentative( <hom>, <elm> )
##
OperationHomomorphismModuleOps.PreImagesRepresentative := function( hom, elm )

    local coeff, preim, i;

    coeff:= Coefficients( hom.basisImage, elm );
    preim:= 0 * hom.preimagesBasis[1];
    for i in [ 1 .. Length( coeff ) ] do
      preim:= preim + coeff[i] * hom.preimagesBasis[i];
    od;

    if IsBound( hom.source.factorNum ) then
      preim:= preim + hom.source.factorDen;
    fi;

    return preim;
    end;

#############################################################################
##
#F  OperationHomomorphismModuleOps.Print( <hom> )
##
OperationHomomorphismModuleOps.Print := function( hom )
    Print( "OperationHomomorphism( ", hom.source, ", ", hom.range, " )" );
    end;

#############################################################################
##
#F  ModuleOps.OperationHomomorphism( <M1>, <M2> )
##
ModuleOps.OperationHomomorphism := function( M1, M2 )

    local hom;     # operation homomorphism of <M1> into <M2>, result

    # make the homomorphism
    hom := rec( isGeneralMapping := true,
                domain           := Mappings,

                # identifying stuff
                source           := M1,
                range            := M2,

                # information
                isMapping        := true,
                isHomomorphism   := true,
                preImage         := M1,

                # used for computing images and preimages
#T hom. from a submodule of the original source not allowed?
                basisImage       := CanonicalBasis( M2 ),
                preimagesBasis   := M2.operation.preimagesBasis,

                # enter the operations record
                operations       := OperationHomomorphismModuleOps );

    # Add the stuff that is different for row modules and free modules.
#T distinguish two types of module homomorphisms!
    if IsFreeModule( hom.source ) or
       ( IsBound( hom.source.factorNum )
         and IsFreeModule( hom.source.factorNum ) ) then

      # We have images of the generators, and the algebra homomorphism
      hom.genimages := M2.operation.genimages;
      hom.alghom    := M2.operation.alghom;

    else

      # 'hom' is a homomorphism of row modules, we have a basis of the
      # source and images of its vectors.
      hom.basisSource:= M2.operation.basisSource;
      hom.imagesBasis:= CanonicalBasis( M2 ).vectors;

    fi;

    # return the homomorphism
    return hom;
    end;

#############################################################################
##
#V  FactorModuleOps
##
FactorModuleOps := OperationsRecord( "FactorModuleOps", QuotientRowSpaceOps);

#############################################################################
##
#F  FactorModule( <M>, <U> )
##
FactorModule := function( M, U )
    return M.operations.\/( M, U );
    end;

#############################################################################
##
#F  ModuleOps.\/( <M>, <U> )
##
ModuleOps.\/ := function( M, U )
    local F;

    if IsModule( U ) then

      # Check that the modules have the same parent.
      Parent( U, M );

    elif IsList( U ) then

      U:= Submodule( M, U );

    else
      Error( "<U> must be a submodule or a list of submodule generators" );
    fi;

    # Construct the factor module record.
    F := rec( isDomain       := true,
             isModule        := true,
             isFactorModule  := true,
             isQuotientSpace := true,
 
             field           := M.field,
             ring            := Parent( M ).ring,

             factorNum       := M,
             factorDen       := U,

             operations      := FactorModuleOps );

    # Assign the parent if necessary.
#T ???
    if not IsParent( M ) then
      F.parent:= Parent( M ) / U;
    fi;

    # Return the result.
    return F;
    end;

#############################################################################
##
#F  FactorModuleOps.Submodule( <M>, <gens> ) 
##
FactorModuleOps.Submodule := function( M, gens )

    local generators,   # generators in case of explicit cosets
          S;            # the submodule, result

    if Length( gens ) > 0 and IsModuleCoset( gens[1] ) then
      generators:= gens;
      gens:= List( gens, Representative );
    fi;

    S:= rec( isDomain        := true,
#T ??
             isModule        := true,
             isFactorModule  := true,
             isQuotientSpace := true,
 
             factorNum       := Submodule( M.factorNum, gens ),
             factorDen       := M.factorDen,

             parent          := Parent( M ),

             field           := M.field,

             operations      := FactorModuleOps );

    # Assign the generating cosets if known.
    if IsBound( generators ) then
      S.generators:= generators;
    fi;

    # Return the submodule.
    return S;
    end;

#############################################################################
##
#F  FactorModuleOps.AsSubmodule( <M>, <U> )
##
FactorModuleOps.AsSubmodule := function( M, U )
    local gens;
    gens:= Generators( U.factorNum );
    if ForAny( gens, x -> not x in M.factorNum ) then
      Error( "<U> is not contained in <M>" );
    fi;
    return Submodule( Parent( M ), gens );
    end;

#############################################################################
##
#F  FactorModuleOps.AsSpace( <M> )
##
FactorModuleOps.AsSpace := function( M )
    local V;
    V:= AsSpace( M.factorNum );
    return V / AsSubspace( V, AsSpace( M.factorDen ) );
    end;

#############################################################################
##
#F  FactorModuleOps.OperationHomomorphism( <M>, <U> )
##
FactorModuleOps.OperationHomomorphism := ModuleOps.OperationHomomorphism;

#############################################################################
##
#F  FactorModuleOps.\/( <M>, <U> )
##
FactorModuleOps.\/ := ModuleOps.\/;

#############################################################################
##
#V  FreeModuleOps
##
FreeModuleOps := OperationsRecord( "FreeModuleOps", ModuleOps );

#############################################################################
##
#F  FreeModuleOps.\in( <m> ,<M> )
##
FreeModuleOps.\in := function( m, M )
    return ForAll( m, x -> x in M.ring ) and Length( m ) = Length( Zero(M) );
    end;

#T ???
FreeModuleOps.Coefficients := function( M, v )
    return ShallowCopy( v );
    end;

#############################################################################
##
#F  IsFreeModule( <M> )
##
IsFreeModule := function( M )
    return IsRec( M ) and IsBound( M.isFreeModule ) and M.isFreeModule;
    end;

#############################################################################
##
#F  FreeModule( <A>, <n> )
##
FreeModule := function( A, n )

    local M,    # the module, result
          zero, # zero list
          gens, # generators list
          i;    # loop over 'gens'

    Zero( A );
    zero:= List( [ 1 .. n ], x -> Zero( A ) );
    gens:= [];
    for i in [ 1 .. n ] do
      gens[i]:= ShallowCopy( zero );
      gens[i][i]:= One( A );
#T necessary?
    od;
    M:= Module( A, gens );
    M.operations   := FreeModuleOps;
    M.isFreeModule := true;

    # Return the free module.
    return M;
    end;
    
#############################################################################
##
#V  ModuleCosetOps
##
ModuleCosetOps := OperationsRecord( "ModuleCosetOps",
                                    SpaceCosetRowSpaceOps );
    
#############################################################################
##
#F  ModuleCosetOps.\*( <C1>, <C2> )
##
ModuleCosetOps.\* := function( C1, C2 )
    if   IsInt( C1 ) and IsModuleCoset( C2 ) then
      return ModuleCoset( C2.factorDen, C1 * C2.representative );
    elif IsInt( C2 ) and IsModuleCoset( C1 ) then
      return ModuleCoset( C1.factorDen, C1.representative * C2 );
    elif IsMatrix( C2 ) and IsModuleCoset( C1 ) then
      if C2 in Parent( C1.factorDen ).ring then
#T I should not TEST this!
#T (It is cheaper to test whether the matrix is a generator, or if it
#T fixes the space...)
        return ModuleCoset( C1.factorDen, C1.representative * C2 );
      else
        Error( "matrix does not fix the subspace" );
      fi;
    elif IsMatrix( C1 ) and IsModuleCoset( C2 ) then
      # transposed case
#T This does NOT define an operation from the left,
#T for that one should transpose the matrix, and multiply from the right.
      if Transposed( C2 ) in Parent( C1.factorDen ).ring then
        return ModuleCoset( C2.factorDen, C2.representative * C1 );
      else
        Error( "matrix does not fix the subspace" );
      fi;
    else
      Error( "cannot compute product of <C1> and <C2>" );
    fi;
    end;

#############################################################################
##
#F  ModuleCoset( <M>, <m> )
##
ModuleCoset := function( M, m )
    local C;
    C:= SpaceCoset( M, m );
    C.operations:= ModuleCosetOps;
    return C;
    end;
    
#############################################################################
##
#F  IsModuleCoset( <obj> )
##
IsModuleCoset := function( obj )
    return     IsRec( obj )
           and IsBound( obj.isModuleCoset )
           and obj.isModuleCoset;
    end;

#############################################################################
##
#F  FixedSubmodule( <M> ) . . . . . . . . .  submodule of fixed points in <M>
##
FixedSubmodule := function( M )
    if not IsBound( M.fixedSubmodule ) then
      M.fixedSubmodule:= M.operations.FixedSubmodule( M );
    fi;
    return M.fixedSubmodule;
    end;

#############################################################################
##
#F  ModuleOps.FixedSubmodule( <M> ) . . . .  submodule of fixed points in <M>
##
ModuleOps.FixedSubmodule := function( M )

    local R,           # ring acting on 'M'
          i,           # loops over generators
          mat,         # one generator minus identity
          fixed,       # basis of fixed space
          S;           # the submodule, result

    R:= Parent( M ).ring;
    mat:= R.generators[1] - One( R );
    fixed:= BaseNullspace( mat );

    if not IsNaturalModule( M ) then
      fixed:= SumIntersectionMat( fixed, Basis( M ).vectors );
    fi;

    i:= 2;
    while     i <= Length( R.generators )
          and Dimensions( fixed )[1] > 0 do

      mat   := R.generators[i] - One( R );
      fixed := SumIntersectionMat( fixed, BaseNullspace( mat ) )[2];
      i     := i+1;
    od;
    S:= Submodule( Parent( M ), fixed );
    S.basis:= Basis( S, fixed );
    return S;
    end;

#############################################################################
##
#F  ModuleOps.IsIrreducible( <M> )
##
ModuleOps.IsIrreducible := function( M )
    return ModuleOps.TestIrreducible( M ).isIrreducible;
    end;

#############################################################################
##
#F  ModuleOps.TestIrreducible( <M> )
##
##  <M> is an 'A'-module
##
ModuleOps.TestIrreducible := function( M )

    local n,
          A,   # ring acting on 'N'
          N,   # natural module isomorphic to 'M'
          fp,
          r,
          w,
          ns,
          upper,
          nr,
          v,
          V;

    # The zero module is *not* irreducible,
    # and every one-dimensional module is irreducible.
    if   Dimension( M ) = 0 then
      return rec( isIrreducible := false );
    elif Dimension( M ) = 1 then
      return rec( isIrreducible := true );
    fi;

    # Replace 'M' by a natural module if necessary.
    A:= Parent( M ).ring;
    if    IsFactorModule( M )
       or Dimension( M ) < Length( M.generators[1] ) then
      A:= Operation( A, M );
      N:= NaturalModule( A );
    else
      N:= M;
    fi;
    n:= Dimension( N );

    # Compute the standard fingerprint.
    fp:= Fingerprint( A );
    if 1 in fp then

      nr:= - Position( fp, 1 );
      w:= ElementAlgebra( A, - Position( fp, 1 ) );
      ns:= NullspaceMat( w );

    else

      # Compute words in the algebra, and increase slowly the
      # maximal allowed nullity.
      upper:= 1;
      nr:= 0;
      repeat
        nr:= nr + 1;
        w:= ElementAlgebra( A, nr );
        if nr mod 10 = 0 and upper < n - 1 then
          upper:= upper + 1;
        fi;
        ns:= NullspaceMat( w );
      until Length( ns ) > 0 and Length( ns ) <= upper;

    fi;
    
    InfoModule( "#I  TestIrreducible: choosing word no. ", nr,
                ", with nullity ", Length( ns ), "\n" );

    # Check that all nonzero vectors in the kernel spin the whole space.
    for v in NormedVectors( RowSpace( A.field, ns ) ) do
      V:= Module( A, [ v ] );
      if Dimension( V ) < n then
        return rec( isIrreducible := false,
                    submodule:= V );
      fi;
    od;
    InfoModule( "#I  TestIrreducible: kernel checked\n" );

    # Check that one vector of the kernel of the transposed matrix
    # spins up to the whole space.
    w:= TransposedMat( w );
    ns:= NullspaceMat( w );
    V:= Module( UnitalAlgebra( A.field, List( A.generators, TransposedMat ) ),
                ns );
    if Dimension( V ) < n then

      # Compute the invariant submodule.
#T missing ...
      return rec( isIrreducible := false );
    fi;

    # The module is irreducible.
    return rec( isIrreducible := true );
    end;

#############################################################################
##
#F  ModuleOps.IsEquivalent( <M1>, <M2> )
##
ModuleOps.IsEquivalent := function( M1, M2 )

    local A1,          # ring acting on 'M1'
          A2,          # ring acting on 'M2'
          dim,         # dimensions of the modules
          N1,          # natural module isomorphic to 'M1'
          N2,          # natural module isomorphic to 'M2'
          gens1,       # generators of 'A1'
          gens2,       # generators of 'A2'
          fp1,         # fingerprint for 'A1'
          fp2,         # fingerprint for 'A2'
          nullity,     # minimal nullity found up to now
          i,           # loop over 'fp1'
          nrword,      # number of the word with nullity 'nullity'
          nr,          # search from this word on
          upper,       # upper bound for nullity
          word1,       # word of nullity 'nullity' in 'A1'
          word2,       # word of nullity 'nullity' in 'A2'
          ns1,         # nullspace of 'word1'
          ns2,         # nullspace of 'word2'
          sb1,         # standard basis for 'M1'
          sb2,         # standard basis for 'M2'
          mat,         # candidate for the base change matrix
          test,        # normed vectors in the nullspace
          v;           # loop over 'test'

    A1:= Parent( M1 ).ring;
    A2:= Parent( M2 ).ring;

    if Length( A1.generators ) <> Length( A2.generators ) then
      Error("sorry, cannot check equivalence for incompatible acting rings");
    fi;

    # Check that the dimensions are the same.
    if Dimension( M1 ) <> Dimension( M2 ) then
      return false;
    fi;

    # Replace the modules by isomorphic natural modules if necessary.
    dim:= Dimensions( A1.generators[1] )[1];
    if   IsFactorModule( M1 ) then
      A1:= Operation( A1, M1 );
      N1:= NaturalModule( A1 );
    elif dim > Dimension( M1 ) then
      A1:= Operation( A1, M1 );
      N1:= NaturalModule( A1 );
    else
      N1:= M1;
    fi;
    dim:= Dimensions( A2.generators[1] )[1];
    if   IsFactorModule( M2 ) then
      A2:= Operation( A2, M2 );
      N2:= NaturalModule( A2 );
    elif dim > Dimension( M2 ) then
      A2:= Operation( A2, M2 );
      N2:= NaturalModule( A2 );
    else
      N2:= M2;
    fi;
    dim:= Dimension( N1 );
    gens1:= A1.generators;
    gens2:= A2.generators;

    # One-dimensional modules are equivalent if and only if
    # the acting matrices are equal.
    if dim = 1 then
      return A1.generators = A2.generators;
    fi;

    # Check whether the fingerprints are the same.
    InfoModule( "#I  IsEquivalent:  check fingerprints\n" );
    fp1:= Fingerprint( A1 );
    fp2:= Fingerprint( A2 );
    if fp1 <> fp2 then
      InfoModule( "#I  IsEquivalent:  fingerprints differ\n" );
      return false;
    fi;

    # Find a word of small nonzero nullity,
    # first by using the standard fingerprint.
    InfoModule( "#I  IsEquivalent:  standard fingerprints are ", fp1, "\n" );
    nullity:= dim;
    nrword:= 0;
    for i in [ 1 .. Length( fp1 ) ] do
      if fp1[i] <> 0 and fp1[i] < nullity then
        nullity:= fp1[i];
        nrword:= -i;
      fi;
    od;

    if nrword = 0 or nullity > 1 then

      # All standard words are invertible or have nullity greater than 1.
      # Run through the elements of the algebra.
      nr:= 1;
      upper:= 0;
      repeat
        fp1:= Fingerprint( A1, [ nr .. nr+9 ] );
        fp2:= Fingerprint( A2, [ nr .. nr+9 ] );
        if fp1 <> fp2 then
          InfoModule( "#I  IsEquivalent:  fingerprints differ\n" );
          return false;
        fi;
        if upper < dim-1 then
          upper:= upper + 1;
        fi;
        for i in [ 1 .. Length( fp1 ) ] do
          if fp1[i] > 0 and fp1[i] < nullity then
            nullity:= fp1[i];
            nrword:= nr + i - 1;
          fi;
        od;
        nr:= nr + 10;
      until nullity > 0 and nullity <= upper;

    fi;

    # We choose the word number 'nrword'.
    InfoModule( "#I  IsEquivalent:  choosing word ", nrword,
                " of nullity ", nullity, "\n" );
    word1:= ElementAlgebra( A1, nrword );
    word2:= ElementAlgebra( A2, nrword );
        
    # Compute the standard bases,
    # and check whether the basechange works.
    ns1:= NullspaceMat( word1 );
    ns2:= NullspaceMat( word2 );
    sb1:= StandardBasis( N1, ns1 );
    if nullity = 1 then

      sb2:= StandardBasis( N2, ns2 );
      if Length( sb1.vectors ) < dim then

        if Length( sb2.vectors ) = dim then

          # 'N1' is reducible, 'N2' is irreducible.
          InfoModule( "#I  IsEquivalent:  <M1> reducible,",
                                        " <M2> irreducible\n" );
          return false;
        else

          # Both 'N1' and 'N2' are reducible.
          Error( "sorry, cannot check equivalence of reducible modules" );
        fi;

      elif Length( sb2.vectors ) < dim then

        # 'N2' is reducible, 'N1' is irreducible.
        InfoModule( "#I  IsEquivalent:  <M1> irreducible,",
                                      " <M2> reducible\n" );
        return false;

      else

        # We really have to check equivalence.
        InfoModule( "#I  IsEquivalent:  check equivalence",
                    " of cyclic modules\n" );
        mat:= sb1.vectors ^ -1 * sb2.vectors;
        for i in [ 1 .. Length( gens1 ) ] do
          if gens1[i] * mat <> mat * gens2[i] then
            return false;
          fi;
        od;
        return true;

      fi;

    else

      # We had at least two seed vectors for the standard basis of 'N1'.
      if sb1.seedDimensions[1] = dim then

        # The first seed vector generates 'N1', we loop over all
        # normed vectors in the kernel of 'word2'.
        InfoModule( "#I  IsEquivalent:  check equivalence",
                    " of cyclic modules\n" );
        sb1:= sb1.vectors ^ -1;
        test:= NormedVectors( RowSpace( A1.field, ns2 ) );
        for v in test do
          sb2:= StandardBasis( N2, [ v ] );
          if Length( sb2.vectors ) = dim then
 
            # Check equivalence.
            mat:= sb1 * sb2.vectors;
            if ForAll( [ 1 .. Length( gens1 ) ],
                       i -> gens1[i] * mat = mat * gens2[i] ) then
              return true;
            fi;

          fi;
        od;
        return false;

      else

        # 'N1' is reducible.
        # Check one vector for 'N2'.
        sb2:= StandardBasis( N2, [ ns2[1] ] );
        if Length( sb2.vectors ) < dim then

          # 'N2' is reducible, too.
          Error( "sorry, cannot check equivalence of reducible modules" );

        else

          # 'N2' is cyclic, try to find an equivalence from 'N2' to 'N1'.
          test:= NormedVectors( RowSpace( A1.field, ns1 ) );
#T works for finite fields only!

          for v in test do
            sb1:= StandardBasis( N1, [ v ] );      
            if Length( sb1.vectors ) = dim then

              # Check equivalence.
              mat:= sb1.vectors ^ -1 * sb2.vectors;
              if ForAll( [ 1 .. Length( gens1 ) ],
                         i -> gens1[i] * mat = mat * gens2[i] ) then
                return true;
              fi;
          
            fi;
          od;
          return false;

        fi;

      fi;
    
    fi;
    end;

#############################################################################
##
#F  FactorModuleOps.IsIrreducible( <M> )
##
#T change: delegate to numerator and denominator
##
FactorModuleOps.IsIrreducible := ModuleOps.IsIrreducible;

#############################################################################
##
#F  FactorModuleOps.IsEquivalent( <M1>, <M2> )
##
FactorModuleOps.IsEquivalent := ModuleOps.IsEquivalent;

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
