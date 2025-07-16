import qsharp # type: ignore
from setup import init_qsharp

init_qsharp()

def test_compose2_normal():
    # Arrange
    qscode = ("import Std.Math.*;"
             "import HigherOrderFunctions.*;"
             "let add1 : Int -> Int = x -> x + 1;"
             "let mul3 : Int -> Int = x -> x * 3;"
             "Composed2(add1, mul3)(1)")

    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == 4


def test_compose2_partial():
    # Arrange
    qscode = ("import Std.Math.*;"
             "import HigherOrderFunctions.*;"
             "let add : (Int, Int) -> Int = (x, y) -> x + y;"
             "let mul3 : Int -> Int = x -> x * 3;"
             "Composed2(add(1, _), mul3)(1)")

    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == 4


def test_compose3_normal():
    # Arrange
    qscode = ("import Std.Math.*;"
             "import HigherOrderFunctions.*;"
             "let add1 : Int -> Int = x -> x + 1;"
             "let mul3 : Int -> Int = x -> x * 3;"
             "let minus1 : Int -> Int = x -> x - 1;"
             "Composed3(minus1, add1, mul3)(1)")

    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == 3


def test_complex_equal_sad():
    # Arrange
    qscode = ("import Std.Math.*;"
             "import Complex.*;"
             "EqualC(Complex(1., 0.), Complex(1., 1.));")

    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == False


def test_to_complex():
    # Arrange
    qscode = ("import Complex.*;"
              "ToC(1.3)")
    
    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == (1.3, 0.0)
