%
%
%   Copyright (C) 2014, The University of Texas at Austin
%
%   This file is part of libflame and is available under the 3-Clause
%   BSD license, which can be found in the LICENSE file at the top-level
%   directory, or at http://opensource.org/licenses/BSD-3-Clause
%
%
    [ B0, ...
      B1, ...
      B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                    BB, ...
                                    b, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    [ T1T, ...
      T2B ] = FLA_Part_2x1( T1,  b, 'FLA_TOP' );

    W1 = B1;
     
    U11 = trilu( A11 );
    U21 = A21;
     
    W1 = inv( triu( T1T ) )' * ( U11' * B1 + U21' * B2 );
    
    B1 = B1 - U11 * W1;
    B2 = B2 - U21 * W1;

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00, A01, A02, ...
                                             A10, A11, A12, ...
                                             A20, A21, A22, ...
                                             'FLA_TL' );

    [ TL, TR ] = FLA_Cont_with_1x3_to_1x2( T0, T1, T2, ...
                                           'FLA_LEFT' );
    
    [ BT, ...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                       B1, ...
                                       B2, ...
                                       'FLA_TOP' );


  end

  B_out = [ BT,
            BB ];

return
