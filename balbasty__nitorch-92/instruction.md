# Issue

**Title:** FIX(io): nibabel compatibility layer, unpin nibabel

## Description

## Summary

Replaces the `nibabel<=4` pin (which cannot be satisfied alongside numpy >= 2) with a compatibility layer, `nitorch/io/volumes/babel/_compat.py`, that gathers everything depending on the nibabel version or on private nibabel API.

### Version-dependent behaviour handled by `_compat`
- **`disk_header(image)`**: `ArrayProxy._header` was removed in nibabel 4.0. On nibabel >= 4, `set_metadata` and writes into compressed files (`.nii.gz`, `.mgz`) raised `AttributeError`. `image.header` cannot be used as-is because nibabel resets its slope/intercept on load, so the proxy's scaling is restored.
- **Scaling in `metadata()` / `save(..., like=)` / `savef(..., like=)`**: includes f5e2d0a from #90, cherry-picked unchanged so both PRs merge cleanly. Without it, on nibabel >= 4, `savef(x, out, like=scaled_int16)` wrote slope 1, so values were rounded to integers. This affects autoreg, reslice and `meanspace -r` outputs.
- **`mgh_dtypes()`**: nibabel 5 reordered (and extended) the private `_dtdefs` table, so `nitorch convert` promoted int16 data to int32 when writing MGH.
- **`set_quaternion_tolerance()`**: the sign convention of `Nifti1Header.quaternion_threshold` changed in nibabel 5.
- **Private helpers** (`_is_compressed_fobj`, `_NullLock`, `_positive_slice`) are imported in one place, with local fallbacks. `reduce`/`operator` now come from the standard library instead of `nibabel.fileslice`.
- **`nitorch.io.optionals`**: nibabel < 5.2 raises `AttributeError` (not `ImportError`) at import with numpy >= 2, which made `import nitorch` fail. Now it warns (naming the versions and the fix) and only disables nibabel-based formats.

### Bugs found while testing (independent of the nibabel version)
- **Partial writes into uncompressed volumes** (`writeslice`): the block read from disk was wrapped in immutable `bytes`, which raised "assignment destination is read-only". It was also serialized in C order while NIfTI/MGH data are stored in Fortran order, which scrambled voxels.
- **MGH voxel size reset**: `MGHHeader.set_data_shape` always resets `delta` to 1. It was called whenever the header of an existing file was rewritten, which silently removed the voxel size from the affine of `.mgz` files. Now the shape is only set when it changes.

## Tests
New `nitorch/io/tests/test_babel_compat.py`: 26 tests, all using locally generated files.

| | nibabel 3.2.2 | nibabel 4.0.2 | nibabel 5.4.2 (numpy 2.4) |
|---|---|---|---|
| master | 10 failed | — | 22 failed |
| this PR | 26 passed | 26 passed | 26 passed |

I also checked:
- `nitorch/tests` (non-gradcheck tests) passes on nibabel 3.2 and 5.4.
- With numpy 2 + nibabel 5.0, `nitorch --help` works and a clear warning is shown.
- `nitorch convert` int16/uint8/float32 → `.mgz` keeps the dtype and voxel size on nibabel 3.2 and 5.4.

The existing `test_babel.py` also needs its MGH test data replaced (the Bitbucket host is gone). That is done in #97, which is stacked on this PR.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaSE7XNeP7n5m7KZsaM

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a355cc7e2eae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.