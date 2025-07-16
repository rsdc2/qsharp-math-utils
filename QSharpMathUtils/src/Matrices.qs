namespace Matrices {
    import Std.Math.*;
    import Std.Arrays.*;

    import Vectors.*;

    import Matrices.Complex.Conjugate.*;
    import Matrices.Identity.*;
    import Matrices.Inverse.*;
    import Matrices.Multiply.*;
    
    /// Convert a Double-valued matrix to its Complex-valued counterpart 
    function ToCMat(A : Double[][]) : Complex[][] {
        Mapped(ToVecC, A)
    }   

    /// Convert a Complex-valued matrix into a real matrix
    /// by taking only the real components of all
    /// the complex numbers
    function ToRealMat(A : Complex[][]) : Double[][] {
        Mapped(ToVecReal, A)
    }

    export ToCMat, ToRealMat;
}