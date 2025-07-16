import qsharp # type: ignore
from setup import init_qsharp

init_qsharp()

def test_vectors_equal():

    # Arrange
    qscode = ("import Complex.*;"
              "import Vectors.*;"
              "let vector = [ToC(1.), ToC(2.)];"
              "VecMulScalarC(ToC(2.), vector);")
    # Act
    result = qsharp.eval(qscode)

    # Assert
    assert result == [(2., 0.), (4., 0.)]