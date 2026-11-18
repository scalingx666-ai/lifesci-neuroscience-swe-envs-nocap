# Issue

**Title:** Fix pickle rehydration for core objects

## Description

## Summary

Fixes backward compatibility for saved nelpy objects whose pickled state is missing runtime-only helper attributes. Core objects now restore their saved state and reattach transient slicers/indexers during unpickle via `__setstate__`.

## Root Cause

Persistence uses raw dill/pickle, but unpickling bypasses constructors and did not call the existing `__renew__()` methods. Older or stale saved objects could therefore load without helpers such as `loc`, `iloc`, or analog interval slicers, causing indexing/access to fail until users manually repaired the object.

## Changes

- Added object-level `__setstate__` hooks for event arrays, regularly sampled analog arrays, value-event arrays, and interval arrays.
- Backfilled lightweight metadata defaults for old pickles that may be missing newer fields.
- Added regression tests that simulate stale pickles by removing transient attrs before serialization and verifying loaded objects work without manual `__renew__()` calls.

## Validation

- `.conda\python.exe -m pytest tests\test_pickle_compat.py`
- `.conda\python.exe -m pytest tests\test_EventArray.py::TestEventArray::test_copy tests\test_EventArray.py::TestBinnedEventArray::test_copy tests\test_EventArray.py::TestSpikeTrainArray::test_indexing tests\test_AnalogSignalArray.py::TestRegularlySampledAnalogSignalArray::test_copy tests\test_ValueEventArray.py::test_valueeventarray_indexing`
- `.conda\Scripts\ruff.exe check nelpy\core\_eventarray.py nelpy\core\_analogsignalarray.py nelpy\core\_valeventarray.py nelpy\core\_intervalarray.py tests\test_pickle_compat.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ddfee58bfdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.