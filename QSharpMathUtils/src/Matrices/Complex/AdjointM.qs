namespace Matrices.Complex.AdjointM {
    import Std.Math.*;
    import Matrices.Complex.Conjugate.*;
    import Matrices.Complex.Comparison.*;

    /// Obtain the adjoint of a Complex-valued matrix
    function GetAdjoint(A : Complex[][]) : Complex[][] {
        ConjugateTranspose(A)
    }

    /// Return true if a Complex-valued matrix is Hermitian, i.e. 
    function IsHermitian(A : Complex[][]) : Bool {
        MatricesEqualC(A, ConjugateTranspose(A))
    }

    // function IsUnitary(A : Complex[][]) : Bool {

    // }
    
    export GetAdjoint, 
            MatricesEqualC, 
            IsHermitian;
}