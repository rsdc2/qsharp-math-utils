namespace Matrices.Invert {
    import Std.Diagnostics.*;
    import Std.Arrays.*;
    import Matrices.Properties.*;
    import Categories.Monoid.*;
    import Matrices.Multiply.*;

    function Determinant2x2D(matrix : Double[][]) : Double {
        Fact(Shape(matrix) == (2, 2), "Must be a 2x2 matrix.");

        let diag1 = [matrix[0][0], matrix[1][1]];
        let diag2 = [matrix[0][1], matrix[1][0]];

        let monoidProd = Monoid((x, y) -> x * y, 1.);
        let product = MonoidReduce(monoidProd, _);
        let determinant = 1. / (product(diag1) - product(diag2));
        determinant
    }

    function Invert2x2D(matrix : Double[][]) : Double[][] {
        let determinant = Determinant2x2D(matrix);
        Fact(determinant != 0., "Determinant must be 0");
        let (a, b, c, d) = (matrix[0][0], matrix[0][1], matrix[1][0], matrix[1][1]);
        let adj = [[d, -b], [-c, a]];

        MatMulScalarT(determinant, adj, (x, y) -> x * y)     
    }

    export Determinant2x2D, Invert2x2D;
}