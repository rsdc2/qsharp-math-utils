import qsharp # type: ignore
import numpy as np
import pytest

qsharp.init(project_root = "./QSharpUtilities")

def matrix_dot_product_code(m1: list[list[float]], m2: list[list[float]]) -> str:
    return (f"import Utilities.Matrices.*;"
              "import Utilities.Matrices.Multiply.*;"
              f"DotProdMat({m1}, {m2});")

@pytest.mark.parametrize(("m1", "m2"), [
    ([[1., 2.], 
      [3., 4.]], 
     [[5., 6.], 
      [7., 8.]]),

    ([[2., 4.], 
      [5., 3.]], 
     [[3., 6.], 
      [-1., 9.]]),

    ([[2.],
      [5.]],
      [[3., 6.]])
    ])
def test_matrix_dot_product_happy(m1: list[list[float]], m2: list[list[float]]):
    A = np.array(m1)
    B = np.array(m2)
    qscode = matrix_dot_product_code(m1, m2)
    R = np.array(qsharp.eval(qscode))
    assert np.array_equal(R, A @ B)
    
    # Resulting matrix has the number of rows of the first matrix 
    # and the number of columns of the second
    assert R.shape == (A.shape[0], B.shape[1])

@pytest.mark.parametrize(("m1", "m2"), [
    ([[2.], 
      [5.]],
     [[3., 6.],
      [-1., 9.]])
])
def test_matrix_dot_product_sad(m1: list[list[float]], m2: list[list[float]]):
    qscode = matrix_dot_product_code(m1, m2)

    with pytest.raises(qsharp.QSharpError):
        qsharp.eval(qscode)