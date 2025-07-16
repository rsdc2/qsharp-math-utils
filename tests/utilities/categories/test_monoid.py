from functools import reduce
import operator

import numpy as np
import pytest
import qsharp   # type: ignore

from setup import init_qsharp

init_qsharp()

def monoid_reduce_matrix_code(matrices: list[list[list[float]]]) -> str:
    return (f"import Matrices.Constructors.*;"
            f"import Matrices.Identity.*;"
              f"MonoidReduceMatMulD(2, {matrices});")


@pytest.mark.parametrize("matrices", [
    ([[[1., 2.], 
      [3., 5.]], 
     [[5., 6.], 
      [3., 8.]]]),
    ])
def test_monoid_reduce_matrix(matrices: list[list[list[float]]]):

    # Arrange
    qscode = monoid_reduce_matrix_code(matrices)
    arrays = map(np.array, matrices)
    identity = np.array([[1., 0.], [0., 1.]])
    expected = reduce(operator.matmul, arrays, identity)

    # Act
    result = np.array(qsharp.eval(qscode))

    # Assert
    assert np.array_equal(expected, result)