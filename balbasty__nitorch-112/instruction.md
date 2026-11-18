# Issue

**Title:** FIX(register): slicewise / concurrent patch size in the loss pyramid

## Description

## Summary
Unit handling for the `patch` option already existed on master. `pairwise_pyramid.compute_patch_size` converts vox / mm (RAS-aware, using the per-level affine) / pct, with pct as the default unit. So master's help text `[10] and unit: vox, mm, [pct]` was correct, and my earlier claim that it was wrong was a mistake. The first two commits of this PR duplicated that conversion and could convert twice. They are reverted here; history is not rewritten.

What remains are fixes to the pyramid path:
- **slicewise (sequential and concurrent):** the converted patch was a list with one entry per dimension, but the slice loss runs with dim-1 dimensions. `local_mean`'s `pad_list_float` keeps the *first* dim-1 entries, which is wrong for any axis other than the last when voxels are anisotropic. The slice-axis entry is now dropped (`_drop_slice_axis`).
- **concurrent_pyramid:**
  - `copy.copy` is shallow, so `new_loss.loss.patch = ...` converted the shared loss object in place, level after level. The loss is now copied before the conversion.
  - `SliceWiseLoss` was not converted at all.
  - It recursed into anything with `__len__`. A bare `Similarity` has `__len__` but no `__setitem__`, so it raised a `TypeError`. The `except Exception` swallowed it, which **silently returned an empty pyramid**. It now recurses only into `SumSimilarity`, and the list is copied first.
- **objects.py:** `Similarity.__truediv__` computed `factor / self.factor`, and `SumSimilarity.__truediv__` computed `factor / loss`. Both divided the wrong way round. These came up because `concurrent_pyramid` divides by the number of levels.
- Help text: added what the patch means (gauss kernel: FWHM; square kernel: full width). This may conflict trivially with #107.

## Tests
`nitorch/tests/test_register_patch_units.py` exercises the pyramid path on 1×2×4 mm voxels over 3 levels, for both sequential and concurrent pyramids:
- per-level patch values for vox, mm (isotropic and per-dimension) and pct (the default unit);
- the user's loss object is not mutated;
- slicewise with axis 0, 1 and -1;
- the loss and gradient of slicewise lcc with an mm patch equal those of the in-plane patch converted by hand.

Results: 33/33 pass with this PR. On master, 29 fail and 4 pass; the 4 that pass are the sequential, non-slicewise per-level tests. The `slicewise[sequential, axis=-1]` failures on master only check the list length; the values are functionally correct there. `test_register_parser` and `test_register_mi` still pass.

## Found, not fixed here
- `concurrent_pyramid` divides by `level + 1` after its loop, which is (number of levels + 1); the number of levels was probably intended.
- `mi` lists `-p/--patch` as a sub-option, but `make_loss` drops it.
- #105 also touches `concurrent_pyramid`; expect a small conflict.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dacdf7a03060`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.