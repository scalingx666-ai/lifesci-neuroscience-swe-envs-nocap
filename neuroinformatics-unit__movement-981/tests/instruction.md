# Issue

**Title:** Add compute_path_sinuosity to path metrics

## Description

Opening this as a draft to get early eyes on the core logic and math implementation (Benhamou 2004). 

Key implementation details:
* Added min_step_length to propagate down to compute_turning_angle for noise filtering.
* Reused internal _slice_and_validate and _warn_about_nan_proportion.
* Added NaN safety for stationary paths to prevent division-by-zero.

I will start adding the pytest suite for this once the core mathematical approach looks good.


# EDITED 2026-07-23 by @niksirbi 

Adds `compute_path_sinuosity` (Benhamou 2004's corrected sinuosity index) to `movement.kinematics.path`.

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Sinuosity is a standard measure of path tortuosity. Unlike the straightness index $D/L$, it does not depend on the number of steps in the path, so it can be compared across trajectories of different durations. It complements the path metrics already available in `movement`. .

**What does this PR do?**

- Adds `compute_path_sinuosity(data, nan_warn_threshold=0.2)`, implementing Eq. 8 of Benhamou (2004):

  $$S = 2\left[\bar{p}\left(\frac{1+\bar{c}}{1-\bar{c}} + b^{2}\right)\right]^{-1/2}$$

  where $\bar{p}$ is the mean step length, $\bar{c}$ the mean cosine of the turning angles, and $b$ the coefficient of variation of step length. A perfectly straight path gives $S = 0$; higher values mean more tortuous movement.
- Reuses the existing `_segment_lengths`, `compute_turning_angle` and `_warn_about_nan_proportion` helpers rather than recomputing anything.
- Generalises the private `_validate_time_points` helper with a `min_points` argument (default `2`, so existing callers are unaffected). Sinuosity passes `min_points=3`, since at least one turning angle is required.
- Deliberately does **not** expose `min_step_length` (per #957 and the 2026-06-12 community call) or a `nan_policy`. NaN positions propagate to NaN steps and turning angles, and the summary statistics are computed over the remaining valid samples. Time windows are selected with `data.sel(time=slice(start, stop))` rather than dedicated arguments.
- Exports the function from `movement.kinematics`.

## References

- 
- Related to #406
- Sibling metric PR #1032 (`compute_maximum_expected_displacement`), which shares the same turning-angle machinery.


Benhamou, S. (2004). How to reliably estimate the tortuosity of an animal's path: straightness, sinuosity, or fractal dimension? *Journal of Theoretical Biology*, 229(2), 209-220. https://doi.org/10.1016/j.jtbi.2004.03.016

## How has this PR been tested?

New tests in `tests/test_unit/test_kinematics/test_path.py`, all passing locally alongside the existing suite:

- **Known closed-form values**: straight path → `0.0`; stationary path → `NaN`; a unit-step 90° zigzag → `2.0`.
- **Units**: the same zigzag scaled by 4 → `1.0`, confirming that sinuosity scales as $1/\sqrt{\text{length}}$.
- **Missing data**: a zigzag with one missing position still returns `2.0`, verifying that statistics are computed over the remaining valid samples; a fully missing track warns and returns `NaN`.
- **Validation**: `ValueError` for fewer than 3 time points and for 3D input.
- **Output contract**: `time` and `space` are dropped while other dimensions are preserved; `name` and `long_name` are set.
- **Robustness**: realistic direction reversals with variable stride, and a large tracking outlier, both return finite positive values.
- Sinuosity was also added to the shared `test_path_metrics_across_time_ranges` parametrisation, so it is exercised across the same pre-sliced time ranges as the other path metrics. The shared error matcher was relaxed to be metric-agnostic, since the required minimum differs per metric.

Existing functionality is unchanged: `_validate_time_points` keeps its previous behaviour for all current callers via the default `min_points=2`.

## Is this a breaking change?

No. Only additions, plus a new keyword argument with a backwards-compatible default on a private helper.

## Does this PR require an update to the documentation?

No manual changes needed. The function has a full numpydoc docstring (maths, notes on NaN handling and units, references, examples), and the API reference page is generated automatically from the `movement.kinematics` exports.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42adc97b37aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.