# Issue

**Title:** FIX: Set `patient_birth_date` dtype in ecat header to signed int32 (gh-1434)

## Description

## Summary

.

`nibabel/ecat.py` types `patient_birth_date` in the main header as `np.uint32`. The field is a `time_t` (seconds since the Unix epoch), which is signed — negative for dates before 1970. With the unsigned type, any pre-1970 birth date is reinterpreted as a far-future date:

```python
# 19 Dec 1915  ->  ts = -1704153600
uint32(int32(ts)) -> 2590813696  -> 2052-02-06   # bug
int32(ts)         -> -1704153600 -> 1915          # correct
```

The issue reporter confirmed against 100+ ECAT v7.0 and v7.3 files that unsigned is never correct for their data, and other tools (e.g. Vinci) read the field as signed. There is a single `main_header_dtd` (no version-specific variants), so the change applies uniformly.

## Changes

- `nibabel/ecat.py`: `patient_birth_date` dtype `np.uint32` -> `np.int32`, with a comment noting the `time_t` semantics.
- `nibabel/tests/test_ecat.py`: add `test_patient_birth_date_signed` — asserts the field dtype is signed and that a pre-1970 timestamp round-trips through the header unchanged.

## Testing

```
$ pytest nibabel/tests/test_ecat.py -q
32 passed
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97e788008ea8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.