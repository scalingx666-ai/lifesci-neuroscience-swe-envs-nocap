# Issue

**Title:** BF: Remove all matching arrays in GiftiImage.remove_gifti_data_array_by_intent

## Description

`GiftiImage.remove_gifti_data_array_by_intent()` removes items from `self.darrays` while it loops over that same list, so the loop skips the array right after each one it removes. When matching arrays are next to each other, every second one is left behind, and no error is raised. For example, the test file `task.func.gii` holds 10 time-series arrays:

```python
import nibabel as nib
from nibabel.testing import get_test_data

img = nib.load(get_test_data('gifti', 'task.func.gii'))
img.remove_gifti_data_array_by_intent('time series')
img.numDA  # 5 on master; 0 with this change
```

This rebuilds the list in place with a filter, like the one in `get_arrays_from_intent()`. Every matching array is removed, the other arrays keep their order, and `img.darrays` is still the same list object, as before.

The new test, `test_remove_gifti_data_array_by_intent`, uses the file above and a small image where matching arrays sit next to each other and between arrays with other intents. The existing removal test in `test_gifti_image` only removes a single array, so it did not catch this.

Tested in Docker (`python:3.12-slim`; Python 3.12.15, NumPy 2.5.4, pytest 9.2.0):

- The new test passes with this change, and fails with `assert 5 == 0` when `gifti.py` is taken from master.
- `python -m pytest --doctest-modules --doctest-plus nibabel/gifti`: 84 passed.
- `ruff check` and `ruff format --check` (ruff 0.17.4) and `codespell` (2.4.3) on the two changed files: clean.

The full test suite was not run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e02b38422d55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.