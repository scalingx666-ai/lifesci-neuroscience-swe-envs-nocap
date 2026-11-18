# Issue

**Title:** Interpolate over failing voxels' T2*/S0 values

## Description

.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-  New function `utils.interpolate_masked_values(data, failures, img, mask)` — replaces T2*/S0 values for curvefit-failing voxels with nearest-neighbor interpolated values from non-failing voxels, using `scipy.spatial.KDTree` in physical (mm) space. Handles both static (M,) and time-series (M, T) arrays.
- New CLI flag `--interpolate-failing-voxels` (default: off) added to both tedana and t2smap workflows. Emits a warning if used with `fittype='loglin'`.
- Tests: 5 unit tests for interpolate_masked_values + 1 workflow smoke test in `test_t2smap.py`. 41 tests passing total.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4786b36b692`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.