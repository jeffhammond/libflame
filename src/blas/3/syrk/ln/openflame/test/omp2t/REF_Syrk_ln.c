
#include "FLAME.h"

FLA_Error REF_Syrk_ln( FLA_Obj alpha, FLA_Obj A, FLA_Obj beta, FLA_Obj C )
{

  FLA_Syrk_external( FLA_LOWER_TRIANGULAR, FLA_NO_TRANSPOSE, alpha, A, beta, C );
  
  return 0;
}
