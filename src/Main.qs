import Std.Core;
import Std.Math.*;
import Std.Arrays.*;
import Std.Diagnostics.*;
open Utilities.Complex;
open Utilities.Matrices.Conjugate;
open Utilities.Vectors;
import Utilities.Testing.Assertions.*;

@EntryPoint()
function Main() : Unit {
    Fact(1 == 2, "1 should be equal to 1")
    // Assert(Complex(1., 1.), Complex(1., 1.))

    // let arrC1 = [[Complex(1., 2.), Complex(3., 4.)],
    //              [Complex(1., 2.), Complex(3., 4.)]];
    // let arrC2 = [[Complex(1., 2.), Complex(3., 4.)],
    //              [Complex(1., 2.), Complex(3., 5.)]];
    // EqualMatricesC(arrC1, arrC2)
    // let mat = [[Complex(1., 0.), Complex(0., 1.)],
    //             [Complex(0., -1.), Complex(2., 0.)]];
    // IsHermitian(mat)
    // 2. * Complex(1., 2.);
}


    // TODO: Write your Q# code here.
    // let x = ComplexPolar(9.309, 1.925);
    // let y = ComplexPolar(7.197, 1.764);
    // let result = ComplexPolarMult(x, y);
    // return result;