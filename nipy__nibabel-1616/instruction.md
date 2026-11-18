# Issue

**Title:** ENH: Improve error message for short zoom list in MGHHeader.set_zooms

## Description

### Problem

`MGHHeader.set_zooms` stores exactly 3 spatial zooms (plus an optional 4th TR value) in the fixed-size `delta` header field:

```python
def set_zooms(self, zooms):
    hdr = self._structarr
    zooms = np.asarray(zooms)
    ndims = self._ndims()
    if len(zooms) > ndims:
        raise HeaderDataError(f'Expecting {ndims} zoom values')
    if np.any(zooms[:3] <= 0):
        raise HeaderDataError(...)
    hdr['delta'] = zooms[:3]
    ...
```

It only validates the *upper* bound on the length of `zooms` (`len(zooms) > ndims`). Its siblings, `AnalyzeHeader.set_zooms` and `SpatialHeader.set_zooms`, both validate the zoom sequence length exactly against the header dimensionality and raise a clear `HeaderDataError` on any mismatch. `MGHHeader.set_zooms` has no lower-bound check, so passing fewer than 3 values falls through to `hdr['delta'] = zooms[:3]`, which raises a bare, confusing numpy `ValueError` instead of the expected `HeaderDataError`:

```pycon
>>> import numpy as np
>>> from nibabel.freesurfer.mghformat import MGHHeader
>>> hdr = MGHHeader()
>>> hdr.set_data_shape((2, 3, 4))
>>> hdr.set_zooms((2, 3))
Traceback (most recent call last):
  ...
  File "nibabel/freesurfer/mghformat.py", line 294, in set_zooms
    hdr['delta'] = zooms[:3]
ValueError: could not broadcast input array from shape (2,) into shape (3,)
```

Compare with `AnalyzeHeader.set_zooms`, which raises the expected, documented error type for the same kind of mistake:

```pycon
>>> from nibabel.analyze import AnalyzeHeader
>>> h2 = AnalyzeHeader()
>>> h2.set_data_shape((2, 3, 4))
>>> h2.set_zooms((2, 3))
Traceback (most recent call last):
  ...
nibabel.spatialimages.HeaderDataError: Expecting 3 zoom values for ndim 3
```

This is the same class of sibling-inconsistency as #1596 (which added the missing zero/negative-zoom validation to `AnalyzeHeader`/`SpatialHeader`), but for a different header implementation (`MGHHeader`) and a different gap (missing *length* validation rather than missing *sign* validation).

### Fix

Add the missing lower-bound check, so `MGHHeader.set_zooms` rejects a too-short `zooms` sequence with the same `HeaderDataError` the other header classes raise, instead of leaking an internal numpy broadcast error.

### Test

Added a regression case to `test_set_zooms` in `nibabel/freesurfer/tests/test_mghformat.py` (a 2-element zooms tuple, which previously raised `ValueError` and now raises `HeaderDataError` as expected).

- Before the fix: `test_set_zooms` fails with `ValueError: could not broadcast input array from shape (2,) into shape (3,)` instead of raising `HeaderDataError`.
- After the fix: `test_set_zooms` passes.
- Full `nibabel/freesurfer/` test module: 45 passed, 5 skipped (run against the state of this branch), no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `044885766a63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.