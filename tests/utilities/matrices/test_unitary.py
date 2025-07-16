import qsharp 
import pytest
from math import sqrt
from setup import init_qsharp

init_qsharp()

@pytest.mark.parametrize("m", [
    ("MatMulCScalarD(1./Sqrt(2.), [[Complex(1., 0.), Complex(1., 0.)], [Complex(0., 1.), Complex(0., -1.)]])")
])
def test_unitary_happy(m: str):
    # Arrange
    qscode = (  "import Std.Math.*;"
                "import Matrices.Complex.Multiply.*;"
                "import Matrices.Complex.Unitary.*;"
                f"IsUnitary({m})")

    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == True
