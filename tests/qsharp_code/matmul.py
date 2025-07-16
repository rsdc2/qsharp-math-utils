import qsharp # type: ignore
import numpy as np
import pytest

from setup import init_qsharp

init_qsharp()

def matrix_dot_product(m1: list[list[float]], m2: list[list[float]]) -> str:
    """
    Use Q# code to multiply two matrices
    """
    return (f"import Matrices.*;"
              "import Matrices.Multiply.*;"
              f"MatMulD({m1}, {m2});")