# Issue

**Title:** Fix point matrix transpose

## Description

The `is.numeric` for matrix rotation will come up true for numeric matrices.  You can ask `is.vector` or similarly check if `NULL` dim below, but the current code is silently not rotating.

## Related
- No existing issue. Introduced by d8c2e60a.
- #448's time-varying `fitTransformToPairedPoints` test is skipped until this is merged, and `extractImagePatchCoordinates(physicalCoordinates = TRUE)` depends on it.

## Summary
Commit d8c2e60a replaced `class(x)[1] == "numeric"` with `is.numeric(x)` in the code that turns a single point vector into a 1 x d matrix. `is.numeric()` is also `TRUE` for numeric matrices, so every N x d point matrix was transposed before reaching ANTsRCore, which expects one point per row.

Effects:
- `antsTransformIndexToPhysicalPoint()` / `antsTransformPhysicalPointToIndex()`: an N x d matrix with N != d errors with "Index matrix must be of size N x d". With N == d the result is silently wrong; for example, `rbind(c(1,1), c(2,2))` gives `(0,1), (0,1)`.
- `applyAntsrTransformToPoint()` / `applyAntsrTransformToVector()`: matrices are transposed and the "is matrix" flag is lost. Non-square inputs read out of bounds in C++ and return garbage or NaN; square inputs are silently wrong.
- `applyAntsrTransform()`: a non-square matrix could crash the R session. Otherwise the values were right but came back as a flat vector.
- Downstream callers are affected too: `labelImageCentroids(physical = TRUE)`, `extractImagePatchCoordinates(physicalCoordinates = TRUE)`, `cropImageFromCenterPoint()` with a 1 x d matrix, and the matrix calls in `fitTransformToPairedPoints()` (diffeo/syn/tv).

## Fix
Only inputs without a `dim` (plain vectors) are converted to 1 x d, using `is.null(dim(x))`; matrices pass through unchanged.
- `applyAntsrTransform*`: a vector input returns a vector, and a matrix input returns an N x d matrix.
- The index functions keep returning a 1 x d matrix for a vector input, as they did before d8c2e60a.

## Tests
Adds `tests/testthat/test-point_transforms.R` (61 expectations):
- Index <-> physical round trips for 2D and 3D images with non-trivial spacing, origin and direction. Inputs are a vector, 1 x d, N == d and N != d, checked against `origin + direction %*% (spacing * (index - 1))`.
- `applyAntsrTransform*` with a translation transform, on a vector and on 1x3, 2x3, 3x3 and 4x3 matrices.
- `labelImageCentroids(physical = TRUE)` with 3 and 4 labels, against a manual computation.

All pass. On current master the same file fails and then segfaults.

Separately, and not changed here: d8c2e60a also made the spacing check in `R/ants_set_get.R` `inherits(spacing, "numeric") && inherits(spacing, "array")`. That is effectively never true, so the validation no longer runs.

## Checked against ANTsPy
Following  I compared these functions numerically with ANTsPy (antspyx 0.6.3), allowing for ANTsPy's 0-based indices against ANTsR's 1-based ones:
- `antsTransformIndexToPhysicalPoint` / `antsTransformPhysicalPointToIndex` match `ants.transform_index_to_physical_point` / `ants.transform_physical_point_to_index` (`ants/core/ants_transform.py`). On a 3D image with an origin, non-unit spacing and a rotated direction, the max difference is about 2e-7, including an off-grid point.
- `applyAntsrTransformToPoint` / `applyAntsrTransformToVector` match `apply_to_point` / `apply_to_vector` exactly for a centred 3D affine read from the same `.mat` file. Each row of an N x d input gives the same result as the single-point call.

Changes made from that comparison:
- **Single points now return a vector, as in ANTsPy.** A single index or point given as a vector returns a d-vector, not a 1 x d matrix; an N x d matrix still returns N x d. ANTsPy only accepts one point at a time. ⚠️ Code that does `pt[1, ]` on a single-point result needs to drop the `[1, ]`. All internal callers work either way: `makePowersPointsImage`, `composeTransformsToField`, `cropImageFromCenterPoint`, `getTemplateCoordinates`, `labelImageCentroids`.
- **`preprocessRestingBOLD`** built a 3 x 1 point matrix and relied on the old transpose. It now passes a 1 x 3 point. Without this, it would fail with "Index matrix must be of size N x 3" once the transpose is fixed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `059f86fcc168`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.