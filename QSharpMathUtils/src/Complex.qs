namespace Complex {
    import Std.Math.*;
    import Categories.Monoid.*;
    import Doubles.*;

    /// Return the conjugate of a complex number
    function Conjugate(complex : Complex) : Complex {
        if complex.Imag == 0. { 
            return complex 
        };
        complex w/ Imag <- -complex.Imag
    }

    /// Return true if two complex numbers are equal
    function EqualC(x : Complex, y : Complex) : Bool {
        x.Imag == y.Imag and x.Real == y.Real
    }

    /// Return true if two complex numbers are equal to a n decimal places
    function ApproxEqualC(x : Complex, y : Complex, n : Int) : Bool {
        Rnd(x.Real, n) == Rnd(y.Real, n) and Rnd(y.Imag, n) == Rnd(y.Imag, n) 
    }

    /// Return a monoid instance of Complex under addition
    function MonoidAddC() : ((Complex, Complex) -> Complex, Complex) {
        (PlusC, Complex(0., 0.))
    }

    /// Return a monoid instance of Complex under multiplication
    function MonoidMulC() : ((Complex, Complex) -> Complex, Complex) {
        (TimesC, Complex(1., 0.))
    }
    
    /// Negate a complex number
    function NegC(x : Complex) : Complex {
        NegationC(x)
    }

    /// Return the Real part of a Complex
    function Real(x : Complex) : Double {
        x.Real
    }

    /// Convert a Double to a Complex
    function ToC(x : Double) : Complex {
        Complex(x, 0.)
    }

    export Conjugate, 
        EqualC,
        MonoidAddC,
        MonoidMulC,
        NegC,
        ToC,
        Real;

}