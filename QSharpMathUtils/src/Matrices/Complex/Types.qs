namespace Matrices.Complex.Types {
    import Std.Math.*;
    import Std.Arrays.*;
    import Std.Diagnostics.*;
    import Matrices.Complex.Multiply.*;

    /// A structure representing a Complex-valued matrix 
    /// with a scalar component
    struct MatrixC {scalar : Complex, matrix : Complex[][]}

    /// Constructor function for MatrixC type, checking that the array
    /// is a rectangular array
    function ToMatrixC(scalar : Complex, A : Complex[][]) : MatrixC {
        Fact(IsRectangularArray(A), "Must be rectangular array");
        MatrixC(scalar, A)
    }

}