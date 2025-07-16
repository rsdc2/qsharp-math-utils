namespace Matrices.Complex.Unitary {
    import Matrices.Complex.Comparison.MatricesEqualC;
    import Std.Diagnostics.*;
    import Std.Math.*;
    import Matrices.Complex.AdjointM.*;
    import Matrices.Complex.Inverse.*;
    import Matrices.Complex.Comparison.*;

    /// Return true if the matrix is unitary, i.e. 
    /// it is 1. invertible and 2. its inverse is equal
    /// to its adjoint
    function IsUnitary(A : Complex[][]) : Bool {
        if not IsInvertibleC(A) { 
            return false 
        }
        
        let adj = GetAdjoint(A);
        let inverse = Inverted2x2C(A);
        MatricesApproxEqualC(adj, inverse, 2)
    }

}