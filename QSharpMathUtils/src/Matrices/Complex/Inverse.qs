namespace Matrices.Complex.Inverse {

    import Std.Diagnostics.*;
    import Std.Arrays.*;
    import Std.Math.*;
    import Complex.*;
    import Matrices.Properties.*;
    import Matrices.Complex.Multiply.*;
    import Matrices.Complex.Types.*;

    /// Return the determinant of a 2x2 Complex-valued matrix
    function Determinant2x2C(A : Complex[][]) : Complex {
        Fact(Shape(A) == (2, 2), "Must be a 2x2 matrix");
        MinusC(TimesC(A[0][0], A[1][1]), TimesC(A[0][1], A[1][0]))
    }

    /// Return true if it is possible to invert the Complex-valued matrix.
    /// At the moment this only handles 2x2 matrices.
    /// Uses the property that a matrix is invertible if and only if its 
    /// determinant is not equal to zero.
    function IsInvertibleC(A : Complex[][]) : Bool {
        Fact(Shape(A) == (2, 2), "Must be a 2x2 matrix");
        not EqualC(Determinant2x2C(A), ToC(0.))
    }

    /// Invert a 2x2 matrix
    function Inverted2x2C(A : Complex[][]) : Complex[][] {
        Fact(IsInvertibleC(A), "Matrix must be invertible.");

        let a = A[0][0];
        let b = A[0][1];
        let c = A[1][0];
        let d = A[1][1];

        let detdiv = DividedByC(Complex(1., 0.), Determinant2x2C(A));
        let B = [[d, NegC(b)],
                 [NegC(c), a]];
        MatMulCScalarC(detdiv, B)
    }

    function Inverted2x2MatrixC(A : MatrixC) : MatrixC {
        MatrixC(A.scalar, Inverted2x2C(A.matrix))
    }

    export Determinant2x2C, Inverted2x2C;
}