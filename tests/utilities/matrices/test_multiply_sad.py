import qsharp # type: ignore
import numpy as np
import pytest

from setup import init_qsharp
from qsharp_code.matmul import matrix_dot_product

init_qsharp()


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