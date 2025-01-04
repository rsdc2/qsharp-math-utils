namespace Utilities.Vectors {
    import Std.Math.*;
    import Std.Arrays.*;
    import Utilities.Complex.*;
    import Utilities.Functions.*;

    /// Multiply a complex vector by a scalar complex
    function ScalarMulVecC(x : Complex, A : Complex[]) : Complex[] {
        Mapped(y -> TimesC(x, y), A)
    }

    function MappedPartial<'T, 'U, 'V>(A : 'T[], f : 'T -> 'U -> 'V) : ('U -> 'V)[] {
        Mapped(f, A)
    }

    function EqualV<'T>(pred : 'T -> 'T -> Bool, A : 'T[], B : 'T[]) : Bool {
        let partiallyApplied = Mapped(pred, A);
        let applied = Zipped(partiallyApplied, B);
        All((f, x) -> f(x), applied)
    }

    function EqualVectorsC(A : Complex[], B: Complex[]) : Bool {
        let equal = Curry2(EqualC);
        EqualV(equal, A, B)
    } 

    /// Convert a Double vector to a Complex vector
    function ToCVec(A : Double[]) : Complex[] {
        Mapped(ToC, A)
    }

    // function DotProdVec(A)
}