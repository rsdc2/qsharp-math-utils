namespace Matrices.Inverse {
    import Std.Diagnostics.*;
    import Std.Arrays.*;
    import Categories.Monoid.*;
    import Matrices.Properties.*;
    import Matrices.Multiply.*;

    /// Return the determinant of a 2x2 matrix of type Double
    function Determinant2x2D(A : Double[][]) : Double {
        Fact(Shape(A) == (2, 2), "Must be a 2x2 matrix");
        A[0][0] * A[1][1] - A[0][1] * A[1][0]
    }
    
    /// Return true if it is possible to invert the Double-valued matrix.
    /// At the moment only handles 2x2 matrices.
    function IsInvertibleD(A : Double[][]) : Bool {
        Fact(Shape(A) == (2, 2), "Must be a 2x2 matrix");
        Determinant2x2D(A) != 0.
    }

    /// Invert a 2x2 matrix of double
    function Inverted2x2D(A : Double[][]) : Double[][] {
        Fact(IsInvertibleD(A), "Matrix must be invertible");
        let (a, b, c, d) = (A[0][0], A[0][1], A[1][0], A[1][1]);
        let adj = [[d, -b], [-c, a]];
        let determinant = Determinant2x2D(A);
        MatMulScalarT(1./determinant, adj, (x, y) -> x * y)     
    }
    
    export Determinant2x2D, IsInvertibleD, Inverted2x2D;
}