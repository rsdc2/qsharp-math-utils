import qsharp # type: ignore
import pytest
from setup import init_qsharp

init_qsharp()

@pytest.mark.parametrize(("m", "shape"), [
    ([[1., 2.], 
      [1., 2.]], (2, 2)),
    ([[1., 2., 3.], 
      [1., 2., 3.]], (2, 3))
])
def test_shape(m: list[list[float]], shape: tuple[int, int]):
    qscode = ("import Matrices.Properties.*;"
              f"Shape({m})")

    result = qsharp.eval(qscode)

    assert result == shape