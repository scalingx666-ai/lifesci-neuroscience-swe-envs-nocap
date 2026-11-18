# Issue

**Title:** Fix xarray FutureWarnings for merge() Parameters

## Description

## Summary

This PR fixes `FutureWarning` messages from xarray by explicitly setting the `join` and `compat` parameters in `xr.merge()` calls. These warnings indicate that xarray will change default behaviors in future versions, which could break existing code.

## Problem

When running pytest, 18 FutureWarnings were displayed:

```
FutureWarning: In a future version of xarray the default value for join will change 
from join='outer' to join='exact'. This change will result in the following ValueError: 
cannot be aligned with join='exact' because index/labels/sizes are not equal along these 
coordinates (dimensions): 'keypoints' ('keypoints',)
```

```
FutureWarning: In a future version of xarray the default value for compat will change 
from compat='no_conflicts' to compat='override'. This is likely to lead to different 
results when combining overlapping variables with the same name.
```

## Solution

Explicitly set `join='outer'` and `compat='no_conflicts'` in all `xr.merge()` calls to:
1. Maintain current behavior
2. Silence FutureWarnings
3. Prevent breaking changes when xarray updates default values

## Changes Made

### 1. `movement/io/load_poses.py` (Line 991)

**Function**: `_ds_from_nwb_object()`

```diff
-    return xr.merge(single_keypoint_datasets)
+    return xr.merge(
+        single_keypoint_datasets,
+        join='outer',
+        compat='no_conflicts'
+    )
```

### 2. `tests/test_integration/test_io.py` (Line 118)

**Function**: `test_save_and_load_to_nwb_file()`

```diff
-    ds = xr.merge(ds_singles)
+    ds = xr.merge(
+        ds_singles,
+        join='outer',
+        compat='no_conflicts'
+    )
```
### 3. `examples/load_freemocap_data.py` (Line 143)

Function: 
read_freemocap_as_ds()
```diff
- ds_all_keypoints = xr.merge(list_datasets)
+ ds_all_keypoints = xr.merge(
+     list_datasets,
+     join='outer',
+     compat='no_conflicts'
+ )
```
This change ensures users don't encounter FutureWarnings when running the FreeMoCap example tutorial.


## Testing

**Before**:
- 18 xarray FutureWarnings during test suite
- Tests pass: 1039 passed, 2 xfailed

**After**:
- 0 xarray FutureWarnings for `join`/`compat` parameters
- Tests pass: 1039 passed, 2 xfailed
- Coverage remains 100%
- No new errors introduced

**Verification Command**:
```bash
pytest tests/test_unit/test_io/test_load_poses.py::test_load_from_nwb_file -v -W default::FutureWarning
```

## Impact

- **User Impact**: None - behavior remains identical
- **Code Quality**: Improved - warnings resolved, future-proofed
- **Performance**: No change
- **Breaking Changes**: None

## References

- xarray merge documentation: https://docs.xarray.dev/en/stable/generated/xarray.merge.html
- Related issue: Preparing for upcoming xarray default parameter changes

## Checklist

- [x] Code changes tested
- [x] All tests pass
- [x] No new warnings introduced
- [x] Coverage maintained at 100%
- [x] Changes are backwards compatible

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5750b4cec0d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.