namespace Vectors {
    import Std.Math.*;
    import Std.Arrays.*;
    import Std.Diagnostics.*;
    import Complex.*;
    import HigherOrderFunctions.*;
    import Matrices.Properties.*;


    /// Find the conjugate of the values of a complex vector
    function ConjugateVector(A : Complex[]) : Complex[] {
        Mapped(Conjugate, A)
    }

    /// Multiply all the values of a vector of type 'T by a scalar of type 'T
    function VecMulScalarT<'T>(x : 'T, vec : 'T[], mul : ('T, 'T) -> 'T) : 'T[] {
        Mapped(y -> mul(x, y), vec)
    }

    /// Multiply a complex vector by a scalar complex
    function VecMulScalarC(x : Complex, A : Complex[]) : Complex[] {
        Mapped(y -> TimesC(x, y), A)
    }

    function MappedPartial<'T, 'U, 'V>(A : 'T[], f : 'T -> 'U -> 'V) : ('U -> 'V)[] {
        Mapped(f, A)
    }

    /// Create an empty vector of length `n` of type `'T`
    function EmptyVecT<'T>(n : Int, empty: 'T) : 'T[] {
        mutable ts : 'T[] = [];
        for i in 1 .. n {
            ts += [empty];
        }
        ts
    }

    /// Returns true if all the values are equal and in the same order in two vectors
    function VectorsEqualT<'T>(pred : 'T -> 'T -> Bool, A : 'T[], B : 'T[]) : Bool {
        if (Length(A) != Length(B)) {
            return false
        } 
        let partiallyApplied = Mapped(pred, A);
        let applied = Zipped(partiallyApplied, B);
        All((f, x) -> f(x), applied)
    }

    /// Returns true if all the values are equal and in the same order in two complex vectors
    function VectorsEqualC(A : Complex[], B: Complex[]) : Bool {
        let equal = Curry2(EqualC);
        VectorsEqualT(equal, A, B)
    } 

    /// Returns true if all the values are equal to n decimal places and in the same order in two complex vectors
    function VectorsApproxEqualC(A : Complex[], B: Complex[], n : Int) : Bool {
        let equal = Curry2(ApproxEqualC(_, _, n));
        VectorsEqualT(equal, A, B)
    } 

    /// Convert a Double vector to a Complex vector
    function ToVecC(A : Double[]) : Complex[] {
        Mapped(ToC, A)
    }

    /// Take the real components of an array of complex numbers and return as an array
    function ToVecReal(A : Complex[]) : Double[] {
        Mapped(Real, A)
    }

    /// Return the dot product of two vectors of type 'T
    function VecMulT<'T>(A : 'T[], B : 'T[], empty : 'T, mul : ('T, 'T) -> 'T, add : ('T, 'T) -> 'T) : 'T {
        Fact(Length(A) == Length(B), "Vectors must be of equal length");
        let zipped = Zipped(A, B);
        let multiplied = Mapped((x, y) -> mul(x, y), zipped);
        let summed = Fold((x, y) -> add(x, y), empty, multiplied);
        summed
    }

    /// Return the dot product of two vectors of type Double
    function VecMulD(A : Double[], B : Double[]) : Double {
        VecMulT(A, B, 0., (x, y) -> x * y, (x, y) -> x + y)
    }

    function DotProdVecC(A : Complex[], B : Complex[]) : Complex {
        VecMulT(A, B, ToC(0.), (x, y) -> TimesC(x, y), (x, y) -> PlusC(x, y))
    }

    function DotProdVecMatT<'T>(A : 'T[][], B : 'T[], empty : 'T, mul : ('T, 'T) -> 'T, add : ('T, 'T) -> 'T) : 'T[] {
        Fact(ColCount(A) == Length(B), "Number of columns of A must be the same as the length of B.");
        Mapped(VecMulT(B, _, empty, mul, add), A)
    }

    function DotProdVecMat(A : Double[][], B : Double[]) : Double[] {
        Fact(ColCount(A) == Length(B), "Number of columns of A must be the same as the length of B.");
        Mapped(VecMulD(B, _), A)
    }

    function DotProdVecMatC(A : Complex[][], B : Complex[]) : Complex[] {
        Fact(ColCount(A) == Length(B), "Number of columns of A must be the same as the length of B.");
        Mapped(DotProdVecC(B, _), A)
    }
}