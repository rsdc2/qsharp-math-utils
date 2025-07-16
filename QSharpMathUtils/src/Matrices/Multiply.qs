namespace Matrices.Multiply {
    import Std.Arrays.Transposed;
    import Std.Arrays.*;
    import Std.Math.*;
    import Std.Diagnostics.*;
    import Vectors.*;
    import Complex.*;
    import Matrices.Properties.*;

    function MatMulScalarT<'T>(x : 'T, A : 'T[][], mul : ('T, 'T) -> 'T) : 'T[][] {
        Mapped(vec -> VecMulScalarT(x, vec, mul), A)
    }

    function MatMulT<'T>(A : 'T[][], B : 'T[][], empty : 'T, mul : ('T, 'T) -> 'T, add : ('T, 'T) -> 'T) : 'T[][] {
        Fact(ColCount(A) == RowCount(B), "Number of columns of matrix A must be equal to number of rows in matrix B");
        Transposed(Mapped(DotProdVecMatT(A, _, empty, mul, add), Columns(B)))
    }

    function MatMulD(A : Double[][], B : Double[][]) : Double[][] {
        MatMulT(A, B, 0., (x, y) -> x * y, (x, y) -> x + y)
    }

    export MatMulScalarT, MatMulT, MatMulD;
}