import qsharp # type: ignore
import numpy as np
import pytest

from setup import init_qsharp
from qsharp_code.matmul import matrix_dot_product

init_qsharp()


@pytest.mark.parametrize(("m1", "m2"), [
    ([[1., 2.], 
      [3., 5.]], 
     [[5., 6.], 
      [3., 8.]]),

    ([[3., 7.], 
      [5., 3.]], 
     [[3., 10.], 
      [-2., 11.]]),

    ([[2.],
      [5.]],
      [[3., 6.]])
    ])
def test_matrix_dot_product_happy(m1: list[list[float]], m2: list[list[float]]):
    # Arrange
    A = np.array(m1)
    B = np.array(m2)

    # Act
    qscode = matrix_dot_product(m1, m2)
    R = np.array(qsharp.eval(qscode))

    # Assert
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
    qscode = matrix_dot_product(m1, m2)

    with pytest.raises(qsharp.QSharpError):
        qsharp.eval(qscode)