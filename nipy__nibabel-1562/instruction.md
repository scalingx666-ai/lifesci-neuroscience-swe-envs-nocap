# Issue

**Title:** Validate affine shape in Nifti1Header.set_sform

## Description

## Summary

`Nifti1Header.set_qform` validates that the input affine is 4x4 and raises a clear `TypeError('Need 4x4 affine as input')` otherwise. The sibling method `Nifti1Header.set_sform` has no equivalent check — it only does:

```python
hdr['srow_x'][:] = affine[0, :]
hdr['srow_y'][:] = affine[1, :]
hdr['srow_z'][:] = affine[2, :]
```

so any array with exactly 4 columns but a different number of rows (e.g. shape `(6, 4)`) is silently accepted: the first three rows are used as if they were a 4x4 affine, and the rest are silently discarded with no error.

```pycon
>>> hdr = nib.Nifti1Header()
>>> hdr.set_sform(np.zeros((6, 4)))  # no error raised, header silently populated
```

## Fix

Add the same shape check already used in `set_qform`:

```python
affine = np.asarray(affine)
if not affine.shape == (4, 4):
    raise TypeError('Need 4x4 affine as input')
```

## Test plan

- Added regression tests to `test_sform` in `nibabel/tests/test_nifti1.py` covering both a non-square `(5, 5)` affine and the "same number of columns, wrong number of rows" `(6, 4)` case that previously slipped through silently.
- Also added a matching check to `test_qform` (that path already raised, but wasn't covered by a test).
- Ran `nibabel/tests/test_nifti1.py`, `test_nifti2.py`, `test_analyze.py`, `test_spm99analyze.py`, `test_spm2analyze.py` locally: 1723 passed, 3 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6a0ba005644`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.