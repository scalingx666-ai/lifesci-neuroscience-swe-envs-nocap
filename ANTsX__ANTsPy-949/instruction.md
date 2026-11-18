# Issue

**Title:** BUG: verbose=True discards the NIfTI sform

## Description

With `verbose=True`, `get_nifti_spatial_transform_from_metadata` drops a valid sform.

The verbose print reads `info_s['spacing']`, but `get_nifti_sform_spatial_info` returns `transform_spacing`, not `spacing`. The `KeyError` is caught by the `except Exception` around the sform branch, so the function falls back to the qform. If there is no qform, it returns `None`.

Example: the MNI header with its sform flipped in x.

```
verbose=False: source=sform origin=[90.0, 126.0, -72.0]
[sform] failed: 'spacing'
verbose=True:  source=qform origin=[-90.0, 126.0, -72.0]
```

With `qform_code` set to 0, `verbose=False` uses the sform, but `verbose=True` returns `None`. `set_nifti_spatial_transform_from_metadata(..., verbose=True)` passes `verbose` through. So it sets the qform's origin and direction, or raises "No usable spatial transform found" for a sform-only header.

The fix is the key name in the print. `spacing` was renamed to `transform_spacing` in f98cbce, and d0700db updated the other uses but missed this one.

Tests:
- The existing test for this function was named `get_nifti_spatial_transform_from_metadata`, without the `test_` prefix, so it never ran. I renamed it.
- Once it ran, one expectation was wrong. With the MNI `srow_x` of `-1 -0 0 90`, setting `srow_x[1]` to `-0.0001` gives a shear cosine of `+0.0001`, not `-0.0001`. That is the same convention as `test_get_nifti_sform_shear`, where `+0.0001` in `srow_x[2]` gives `-0.0001`. I fixed the sign. The rest of the test passes unchanged.
- I added `test_get_nifti_spatial_transform_from_metadata_verbose`. It covers both cases above, fails on `main` and passes with this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6c5ab1d19d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.