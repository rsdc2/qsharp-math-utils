# Q# Utilties

This is a utility library I am writing as I learn Q# and quantum programming. It comprises functions I have found helpful that do not currently appear (as far as I can see) in the standard library. Functions cover the following areas:

- Complex numbers: `Complex.qs`, namespace `Utilities.Complex`
- Vectors: `Vectors.qs`, namespace `Utilities.Vectors`
- Matrices: `Matrices.qs` and the `Matrices` folder, namespace `Utilities.Matrices`
- Higher order functions: `HigherOrderFunctions.qs`

Q# Maths Utilities is under development.

## Running

### With VSCode and the QDK

The Q# part of the program can be run in VSCode provided that the [Azure Quantum Development Kit (QDK)](https://learn.microsoft.com/en-us/azure/quantum/install-overview-qdk) is installed. 

### Calling Q# from Python

## Testing
The tests are written in Python and run with [`pytest`](https://docs.pytest.org/en/stable/). To install Python with its dependencies (`qsharp`, `numpy` and `pytest`) (and a currently-empty package `qsharp-utilitiies`):

1. Clone or download the repository.

2. Navigate into the cloned / downloaded repository.

### In a virtual environment (recommended)

3. Make sure the virtual environment has been activated, e.g. on Linux:

    ```bash
    source env/bin/activate
    ```

4. Install with `pip`:

    ```bash
    pip install .
    ```

### At the user level

3. Alternatively, from within the cloned repository, install at the ```user``` level with:

    ```bash
    pip install . --user
    ```

### With dev dependencies (in a virtual environment)

3. If you wish to install `mypy` for type checking (in addition to the other dependencies), run:

    ```bash
    pip install .[dev]
    ```

## Using this library as a dependency in your project

You can use this library as a dependency in your own project. To do this, your `qsharp.json` file should (minimally) contain the following information:

```json
{
    "author": "your-name-here",
    "dependencies": {
        "QsUtils": {
            "path": "path/to/dependency"
        }
    }
}
```

To import from this library, prefix the module path you wish to import with the name for your dependency, in this case `QsUtils`, e.g.:

```Q#

import Std.Math.*;
import QsUtils.Utilities.Complex.*;

@EntryPoint()
function Main() : Complex {
    ToC(1.)
}

```

Full instructions on project structure and using dependencies can be found in the [Microsoft Docs](https://learn.microsoft.com/en-us/azure/quantum/how-to-work-with-qsharp-projects?tabs=tabid-qsharp%2Ctabid-qsharp-run).

## Functions

### Complex numbers

#### `Conjugate(complex : Complex) : Complex`

Produces the complex conjugate of input parameter `complex`.

#### `EqualC(x : Complex, y : Complex) : Bool`

Complex numbers cannot be directly compared. Thus the following expression produces a type error, since the Complex struct does not support equality:

```Q#
Complex(1., 1.) == Complex(1., 1.)
```

The `EqualC` function performs this comparison:

```Q#
EqualC(Complex(1., 1.), Complex(1., 1.)); // Evaluates to true
```

### Higher order functions

#### Curry2<'T, 'U, 'V>(f : ('T, 'U) -> 'V) : ('T -> 'U -> 'V)

Takes a function with a pair of parameters, and returns a curried version of it, i.e. two functions taking a single parameter each. For example, whereas `EqualC` has the type signature:

```Q#
(Complex, Complex) -> Bool
```

in the following:

```Q#
let equalC = Curry2(EqualC);
```

`equalC` has the type signature:

```Q#
Complex -> Complex -> Bool
```

## Dependencies and licenses

Q# itself is licensed under [MIT](https://github.com/microsoft/qsharp?tab=MIT-1-ov-file#readme).

Python dependencies are the following:

- [mypy](https://mypy.readthedocs.io/en/stable/) ([MIT](https://github.com/python/mypy/blob/master/LICENSE)) 
- [pytest](https://docs.pytest.org/en/7.4.x/) ([MIT](https://github.com/pytest-dev/pytest/blob/main/LICENSE)). 
- [qsharp](https://pypi.org/project/qsharp/) ([MIT](https://github.com/microsoft/qsharp?tab=MIT-1-ov-file#readme))
- [numpy](https://numpy.org/doc/) ([BSD-3 style](https://github.com/numpy/numpy?tab=License-1-ov-file#readme))

Licenses for these dependencies are included in the `LICENSES` directory.