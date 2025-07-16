import qsharp 
import pytest

from qsharp_code.matmul import matrix_dot_product
from setup import init_qsharp

init_qsharp()

id2x2 = [[1., 0.],
         [0., 1.]]


def test_2x2_identity():
    qscode = ("import Matrices.Identity.*;"
              "Id2x2()")

    result = qsharp.eval(qscode)

    assert result == id2x2
    

def test_create_identity():
    qscode = ("import Matrices.Identity.*;"
              "IdentityMatrix(2)")
    
    result = qsharp.eval(qscode)

    assert result == id2x2

@pytest.mark.parametrize("matrix", [
    [[1., 0.],
     [0., 1.]],

    [[2., 1.],
     [3., 4.]],
    
    [[2., 1.],
     [3., 4.],
     [5., 6.]] 
])
def test_apply_2x2_identity_happy(matrix: list[list[float]]):
    """
    Test that multiplying a matrix by the identity matrix returns
    the same matrix unchanged.
    """
    
    qscode = matrix_dot_product(matrix, id2x2)

    result = qsharp.eval(qscode)

    assert result == matrix


@pytest.mark.parametrize("matrix", [
    [[1., 0.],
     [0., 1.]],
    
    [[2., 1.],
     [3., 4.]],
    
    [[2., 3., 5.],
      [1., 4., 6.]]
])
def test_apply_2x2_identity_switched_happy(matrix: list[list[float]]):
    """
    Test that multiplying a matrix by the identity matrix returns
    the same matrix unchanged.
    Same as previous test, but with the operands switched
    """
    qscode = matrix_dot_product(id2x2, matrix)

    result = qsharp.eval(qscode)

    assert result == matrix


@pytest.mark.parametrize("matrix", [
    [[1.]]
])
def test_apply_2x2_identity_sad(matrix: list[list[float]]):
    """
    
    """

    qscode = matrix_dot_product(matrix, id2x2)

    with pytest.raises(qsharp.QSharpError):
        qsharp.eval(qscode)
