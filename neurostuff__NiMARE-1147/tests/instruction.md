# Issue

**Title:** Fix ALE histogram binning to use nearest bin instead of floor

## Description

Closes # .

## Changes proposed in this pull request:

- **Refactored binning logic**: Extracted the binning calculation into a new `_nearest_bin()` function in `nimare/meta/cbma/null_utils.py` that uses rounding instead of floor to assign values to the nearest bin centre, with proper clipping for out-of-bounds values.

- **Fixed tie-breaking behavior**: Changed from floor-based binning (which was inconsistent with the reference implementations) to round-based binning that matches NumPy's and Python's banker's rounding (ties go to even bins). This ensures consistency across the codebase.

- **Updated reference implementations**: Modified test reference functions (`_nearest_bin_reference`, `_dense_ale_reference`, `_study_ma_histogram_reference`, `_update_ale_histogram_reference`) to use the new rounding-based binning approach instead of floor-based binning.

- **Replaced histogram calls**: Changed from `np.histogram()` with bin edges to `np.bincount()` with the new `_nearest_bin_reference()` function in the dense ALE reference implementation, which is more accurate for the fixed grid approach.

- **Added comprehensive test**: New test `test_ALE_nearest_bin_ties_match_the_reference_rule()` validates that the implementation and reference implementations break ties identically and handle edge cases correctly.

- **Updated test documentation**: Clarified test docstrings to reflect the new nearest-bin-centre behavior rather than legacy floor-based behavior.

## Rationale:

The previous floor-based binning was inconsistent with how values should map to bin centres on a fixed grid. Using rounding ensures each value goes to its nearest bin centre, which is the mathematically correct approach for histogram binning on a fixed grid. This fix improves the accuracy of ALE null distribution calculations.

## Test Plan:

All existing regression tests pass with the updated reference implementations. New unit test `test_ALE_nearest_bin_ties_match_the_reference_rule()` validates the tie-breaking behavior and edge cases. Existing tests `test_ALE_study_ma_histogram_edge_bins()` and `test_ALE_update_histogram_edge_bins()` continue to pass with the corrected binning logic.

https://claude.ai/code/session_01Vny4zniWqaEqEAwQzPnWx8

## Summary by Sourcery

Fix ALE null histogram binning to assign values consistently to the nearest grid centre.

Bug Fixes:
- Correct ALE approximate-null histogram binning so values are assigned to their nearest bin centres with consistent boundary handling and clipping.

Enhancements:
- Centralize nearest-bin calculation and align dense reference implementations with the production binning rule.
- Update performance expectations for ALE analyses using KDA kernels to reflect consistent null-method behavior.

Tests:
- Add coverage for nearest-bin behavior, tie handling, floating-point boundary cases, and out-of-range values.
- Update ALE histogram reference and edge-case tests for nearest-centre binning.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `966ee7dedbd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.