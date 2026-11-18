# Issue

**Title:** BF: Accept NumPy integer indices for CIFTI-2 axes

## Description

NumPy integer scalars currently fail when indexing any of the five CIFTI-2 axis types, even though the equivalent Python `int` works. For example:

```python
import numpy as np
from nibabel.cifti2.cifti2_axes import ScalarAxis

axis = ScalarAxis(['a', 'b'])
axis[0]              # works
axis[np.int64(0)]    # ValueError: Input name has incorrect shape (())
```

This accepts any `numbers.Integral` (which includes NumPy integer scalars) in the existing scalar-index branches. `SeriesAxis` also converts the index to Python `int` before computing the time point, so a narrow index dtype does not overflow when the start or step is larger.

The regression test covers all five axis types, Python `int`, `np.uint8` and `np.int32`, negative indices, and out-of-range errors. It gives **26 failures and 13 passes before the fix**, and **39 passes afterward**.

### Validation

On Python 3.14.7 / NumPy 2.5.3:

- `python -m pytest nibabel/cifti2/tests/test_axes.py -k integer_index -q`: 39 passed.
- `python -m pytest nibabel/cifti2/tests -q`: 154 passed with the CIFTI-2 data submodule initialized (`TestCifti2ImageAPI` deselected, as I don't have `pytest-httpserver` here).
- `ruff check nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`
- `ruff format --check nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`
- `codespell nibabel/cifti2/cifti2_axes.py nibabel/cifti2/tests/test_axes.py`
- `git diff --check`

The figure summarizes 540 valid NumPy-integer index comparisons against Python `int`, using synthetic axis fixtures. All 90 Python-int controls pass in both versions. [Measurements and probe](https://github.com/Don-Yin/nibabel/tree/271e250ad8b151421e354a3457a6b9f2c7fc995d).

![CIFTI-2 NumPy-integer indexing: every axis changes from 0% to 100% agreement with Python int](https://raw.githubusercontent.com/Don-Yin/nibabel/271e250ad8b151421e354a3457a6b9f2c7fc995d/indexing-evidence.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e78b7249bfea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.