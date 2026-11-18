# Issue

**Title:** Insert numpy scalars as plain numbers when substituting values

## Description

Substituting a name with a numpy scalar fails with numpy 2:

```python
import numpy as np
from brian2 import *

k = np.exp(-1.0)  # np.float64
Equations("dv/dt = -k*v/ms : 1", k=k)
# SyntaxError: Brian equations/expressions do not support the 'Call' syntax.
Expression("g + k*w", k=k)        # same error
Statements("g += k*w", k=k)       # Statements('g += (np.float64(0.36787944117144233))*w')
```

All three substitution mechanisms insert `"(" + repr(value) + ")"` into the code, and since numpy 2 the repr of a numpy scalar is `np.float64(0.37)` instead of `0.37`. Brian requires numpy >= 2.3, so this happens for any value that comes out of numpy: `np.exp(...)`, `params[0]`, `arr.mean()`, `rng.uniform()`, and so on. For `Statements` the bad code is only caught later, when the group is created or run. Quantities were not affected because `Quantity.__repr__` already prints a plain number (`np.float64(10)*ms` works).

The change adds a small `value_to_code` helper in `brian2/equations/codestrings.py` that turns numpy scalars into Python scalars with `.item()` before taking the repr, and uses it in `Equations._substitute`, `Statements._substitute` and `Expression._substitute`. That is the same conversion Brian already does in `VariableView.set_item` for string indices and in `CPPStandaloneDevice.fill_with_array`. Arrays are left alone, so `Equations(..., tau=np.arange(5))` still raises a `SyntaxError` as tested in `test_wrong_replacements`.

### Tests

- `test_codestrings.py::test_expr_substitutions`: `np.float64` and `np.int64` values
- `test_statements.py::test_statements_numpy_scalar_substitution`: `np.float64`, `np.float32`, `np.int64` and `np.bool_` (exact string comparison, since the existing `in` checks would also match `(np.float64(0.3))`)
- `test_equations.py::test_correct_replacements`: a numpy scalar, and a quantity built from a numpy scalar

Without the change in `codestrings.py` and `equations.py`, the new cases fail with the errors above; with it they pass.

Local runs on macOS arm64, Python 3.13, numpy 2.5.4, through `brian2.test(["numpy"], test_codegen_independent=True)`: doctests 57 passed, codegen-independent 457 passed and 4 skipped, numpy target 305 passed and 15 skipped. `ruff check` and `ruff format --check` (v0.14.2, as in the pre-commit config) pass on the changed files. The change only touches code strings before code generation, so I did not run the Cython or standalone targets locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc858d2fee5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.